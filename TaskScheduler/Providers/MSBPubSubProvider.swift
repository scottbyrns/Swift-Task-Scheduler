//
//  MSBPubSubProvider.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class MSBPubSubProvider {
    
    static let sharedInstance = MSBPubSubProvider()
    
    func providePubSub () -> MSBPubSub {
        
        return EmptyPubSub()
        
    }
    
    class EmptyPubSub : MSBPubSub {
        
        func emit (message : String, to channel : String) {
            
        }
        
        func emit (message : String, to channel : String, withPayload payload: String) {
            
        }
        
        func on (channel : String, handleWith callback:(message: String, payload: String) -> ()) {
            
        }
        
    }
    
}