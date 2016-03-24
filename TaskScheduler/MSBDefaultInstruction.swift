//
//  MSBDefaultInstruction.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class MSBDefaultInstruction : MSBInstruction {
    
    var channel : String
    var message : String
    
    init (channel : String, message : String) {
        self.channel = channel
        self.message = message
    }
    
    func start() {
        MSBPubSubProvider.sharedInstance.providePubSub().emit(self.message, to: self.channel)
    }
    
    func start(withPayload payload: String) {
        MSBPubSubProvider.sharedInstance.providePubSub().emit(self.message, to: self.channel, withPayload: payload)
    }
    
}