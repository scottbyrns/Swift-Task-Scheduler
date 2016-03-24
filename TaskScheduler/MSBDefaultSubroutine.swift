//
//  MSBDefaultSubroutine.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class MSBDefaultSubroutine : MSBSubroutine {
    
    
    var subroutineName : String
    var subroutineDescription : String
    var sequence : Array<MSBInstruction>
    var reactions : Array<MSBReaction>
    
    init (subroutineName : String, subroutineDescription : String, sequence : Array<MSBInstruction>, reactions : Array<MSBReaction>) {
        
        self.subroutineName = subroutineName
        self.subroutineDescription = subroutineDescription
        self.sequence = sequence
        self.reactions = reactions
        
    }
    
    func start() {
        
        for reaction in reactions {
            
            MSBPubSubProvider.sharedInstance.providePubSub().on(reaction.channel, handleWith: { (message, payload) -> () in
                if message == reaction.message {
                    reaction.subroutine.start(withPayload: payload)
                }
            })
            
        }
        
        for instruction in sequence {
            instruction.start()
        }
        
    }
    
    func start(withPayload payload : String) {
        
        for reaction in reactions {
            
            MSBPubSubProvider.sharedInstance.providePubSub().on(reaction.channel, handleWith: { (message, payload) -> () in
                if message == reaction.message {
                    reaction.subroutine.start(withPayload: payload)
                }
            })
            
        }
        
        for instruction in sequence {
            instruction.start(withPayload: payload)
        }

    }
    
}