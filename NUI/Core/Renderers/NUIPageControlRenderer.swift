//
//  NUIPageControlRenderer.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 06/11/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIPageControlRenderer: NSObject {
    
    static func render(pageControl: UIPageControl, withClass className: String) {
        
        // Set page indicator colors
        if NUISettings.hasProperty("current-color", withClass: className) {
            pageControl.currentPageIndicatorTintColor = NUISettings.getColor("current-color", withClass: className)
        }
        
        if NUISettings.hasProperty("color", withClass: className) {
            pageControl.pageIndicatorTintColor = NUISettings.getColor("color", withClass: className)
        }
        
        // Work around of the issue that rendering does not happen properly.
        // After setting color, you have to unset/set all pages as current.
        let currentPage = pageControl.currentPage
        
        for i in 0 ..< pageControl.numberOfPages {
            pageControl.currentPage = i
        }
        
        pageControl.currentPage = currentPage
    }
}