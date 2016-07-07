//
//  NUIFileMonitor.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 07/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

class NUIFileMonitor: NSObject {
    
    static func watch(path: String, withCallback callback: () -> Void) {
        
        let globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let c = path.cStringUsingEncoding(NSUTF8StringEncoding)!
        let fileDescriptor = open(c, O_EVTONLY)
        let source = dispatch_source_create(DISPATCH_SOURCE_TYPE_VNODE,
                                            UInt(fileDescriptor),
                                            DISPATCH_VNODE_DELETE | DISPATCH_VNODE_WRITE | DISPATCH_VNODE_EXTEND,
                                            globalQueue)
        
        dispatch_source_set_event_handler(source) {
            
            let flags = dispatch_source_get_data(source)
            if flags != 0 {
                dispatch_source_cancel(source)
                callback()
                watch(path, withCallback: callback)
            }
        }
        
        dispatch_source_set_cancel_handler(source) { 
            close(fileDescriptor)
        }
        
        dispatch_resume(source)
    }
}
