//
//  NUIFileMonitor.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIFileMonitor: NSObject {
    
    static func watch(_ path: String, withCallback callback: @escaping () -> Void) {
        
        let globalQueue = DispatchQueue.global(qos: .default)
        let c = path.cString(using: String.Encoding.utf8)!
        let fileDescriptor = open(c, O_EVTONLY)
        let source = DispatchSource.makeFileSystemObjectSource(fileDescriptor: fileDescriptor,
                                                               eventMask: [.delete, .write, .extend],
                                                               queue: globalQueue)
        
        source.setEventHandler {
            
            let flags = source.data
            if !flags.isEmpty {
                source.cancel()
                callback()
                watch(path, withCallback: callback)
            }
        }
        
        source.setCancelHandler { 
            close(fileDescriptor)
        }
        
        source.resume()
    }
}
