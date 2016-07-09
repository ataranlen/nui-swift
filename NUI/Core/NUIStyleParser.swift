//
//  NUIStyleParser.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/08/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import NUIParse

class NUIStyleParser: NSObject {
    
    func getStylesFromFile(fileName: String) -> [String : [String : String]] {
        
        let path: String! = NSBundle.mainBundle().pathForResource(fileName, ofType: "nss")
        assert(path != nil, "File \(fileName).nss doesn't exist.")
        return getStylesFromPath(path)
    }
    
    func getStylesFromPath(path: String) -> [String : [String : String]] {
        let content = try! String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        let stylesheet = parse(content)
        return consolidateRuleSets(stylesheet!)
    }
    
    func consolidateRuleSets(styleSheet: NUIStyleSheet) -> [String : [String : String]] {
        
        NUIRenderer.setRerenderOnOrientationChange(false)
        
        var consolidatedRuleSets = [String : [String : String]]()
        var definitions = [String : String]()
        
        for definition in (styleSheet.definitions as! [NUIDefinition])
            where mediaOptionsSatisified((definition.mediaOptions as? [String : String])) {
            
            definitions[definition.variable] = definition.value
        }
        
        for ruleSet in (styleSheet.ruleSets as! [NUIRuleSet])
            where mediaOptionsSatisified((ruleSet.mediaOptions as? [String : String])) {
            
            for selector in (ruleSet.selectors as! [String]) {
                
                if consolidatedRuleSets[selector] == nil {
                    consolidatedRuleSets[selector] = [String : String]()
                }
                
                consolidatedRuleSets[selector] = mergeRuleSetIntoConsolidatedRuleSet(ruleSet,
                                                    consolidatedRuleSet: consolidatedRuleSets[selector]!,
                                                    definitions: definitions)
            }
        }
        
        return consolidatedRuleSets
    }
    
    func mergeRuleSetIntoConsolidatedRuleSet(ruleSet: NUIRuleSet,
                                             consolidatedRuleSet: [String : String],
                                             definitions: [String : String]) -> [String : String] {
        
        var consolidatedRuleSet = consolidatedRuleSet
        
        for (property, var value) in (ruleSet.declarations as! [String : String]) {
            
            if value.hasPrefix("@") {
                
                let variable = value
                
                if definitions[variable] == nil {
                    NSException.raise("Undefined variable",
                                      format: "Variable %@ is not defined",
                                      arguments: getVaList([value]))
                }
                value = definitions[variable]!
            }
            
            consolidatedRuleSet[property] = value
        }
        return consolidatedRuleSet
    }
    
    func mediaOptionsSatisified(mediaOptions: [String : String]?) -> Bool {
        
        guard let mediaOptions = mediaOptions else { return true }
        
        struct DeviceHolder {
            static var device: String?
        }
        
        if let mediaDevice = mediaOptions["device"] {
            
            if DeviceHolder.device == nil {
                DeviceHolder.device = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) ? "ipad" : "iphone"
            }
            
            if mediaDevice != DeviceHolder.device {
                return false
            }
        }
        
        if let mediaOrientation = mediaOptions["orientation"] {
            
            NUIRenderer.setRerenderOnOrientationChange(true)
            
            if mediaOrientation != NUISettings.stylesheetOrientation() {
                return false
            }
        }
        
        return false
    }
    
    func parse(styles: String) -> NUIStyleSheet? {
        
        let tokenizer = NUIPTokeniser()
        
        let idCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyz" +
                                                              "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
                                                              "0123456789" +
                                                              "-_\\/.")
        
        let initialIdCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyz" +
                                                                     "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
                                                                     "0123456789" +
                                                                     "#@-_\\.")
        
        let recognizers: [NUIPTokenRecogniser] = [
            
            NUIPWhiteSpaceRecogniser.whiteSpaceRecogniser() as! NUIPWhiteSpaceRecogniser,
            NUIPQuotedRecogniser.quotedRecogniserWithStartQuote("/*",
                endQuote: "*/", name: "Comment") as! NUIPQuotedRecogniser,
            NUIPKeywordRecogniser(keyword: "@media"),
            NUIPKeywordRecogniser(keyword: "and"),
            NUIPIdentifierRecogniser(initialCharacters: initialIdCharacters, identifierCharacters: idCharacters),
            NUIPKeywordRecogniser(keyword: ":"),
            NUIPKeywordRecogniser(keyword: "{"),
            NUIPKeywordRecogniser(keyword: "}"),
            NUIPKeywordRecogniser(keyword: "("),
            NUIPKeywordRecogniser(keyword: ")"),
            NUIPKeywordRecogniser(keyword: ","),
            NUIPKeywordRecogniser(keyword: ";"),
        ]
        
        for recognizer in recognizers {
            tokenizer.addTokenRecogniser(recognizer)
        }
        
        let tokenizerDelegate = NUITokeniserDelegate()
        tokenizer.delegate = tokenizerDelegate
        
        let expressionGrammar =
        "NUIStyleSheet            ::= items@<NUIStyleSheetItem>*;\n" +
        "NUIStyleSheetItem        ::= ruleSet@<NUIRuleSet> | mediaBlock@<NUIMediaBlock> | definition@<NUIDefinition>;\n" +
        "NUIMediaBlock            ::= '@media' mediaOptions@<NUIMediaOptionSet> '{' items@<NUIMediaBlockItem>* '}';\n" +
        "NUIMediaBlockItem        ::= ruleSet@<NUIRuleSet> | definition@<NUIDefinition>;\n" +
        "NUIMediaOptionSet        ::= firstMediaOption@<NUIMediaOption> otherMediaOptions@<NUIDelimitedMediaOption>*;\n" +
        "NUIMediaOption           ::= '(' property@'Identifier' ':' value@'Identifier' ')';\n" +
        "NUIDelimitedMediaOption  ::= 'and' mediaOption@<NUIMediaOption>;\n" +
        "NUIRuleSet               ::= selectors@<NUISelectorSet> '{' declarations@<NUIDeclaration>* '}';\n" +
        "NUISelectorSet           ::= firstSelector@<NUISelector> otherSelectors@<NUIDelimitedSelector>*;\n" +
        "NUISelector              ::= name@'Identifier';\n" +
        "NUIDelimitedSelector     ::= ',' selector@<NUISelector>;\n" +
        "NUIDeclaration           ::= property@'Identifier' ':' value@<NUIValue> ';';\n" +
        "NUIDefinition            ::= variable@'Variable' ':' value@<NUIValue> ';';\n" +
        "NUIValue                 ::= <NUIAny>+;\n" +
        "NUIAny                   ::= 'Identifier' | 'Variable' | '(' | ')' | ',';\n"
        
        var grammar: NUIPGrammar
        do {
            grammar = try NUIPGrammar(start: "NUIStyleSheet", backusNaurForm: expressionGrammar, error: ())
        } catch {
            NSLog("Error creating grammar:%@", (error as NSError))
            return nil
        }
        
        guard let parser = NUIPLALR1Parser(grammar: grammar) else { return nil }
        
        let parserDelegate = NUIParserDelegate()
        parser.delegate = parserDelegate
        
        let tokenStream = tokenizer.tokenise(styles)
        
        return parser.parse(tokenStream) as? NUIStyleSheet
    }
}
