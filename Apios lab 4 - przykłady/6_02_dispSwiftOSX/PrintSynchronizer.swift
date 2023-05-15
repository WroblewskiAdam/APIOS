//
//  PrintSynchronizer.swift
//  dispSwift
//
//  Created by Adam Wojtasik on 13/11/14.
//  Copyright (c) 2014 Adam Wojtasik. All rights reserved.
//

import Foundation

class PrintSynchronizer{
    let printerQueue = dispatch_queue_create("printerQueue", DISPATCH_QUEUE_SERIAL);
    
    func addPrint(str: String){
       dispatch_async(printerQueue, { println(str) })
    }
}