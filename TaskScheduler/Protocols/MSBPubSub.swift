//
//  SCBPubSub.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol MSBPubSub {
    
    func emit (message : String, to channel : String)
    func emit (message : String, to channel : String, withPayload payload: String)
    func on (channel : String, handleWith callback:(message: String, payload: String) -> ())
    
}