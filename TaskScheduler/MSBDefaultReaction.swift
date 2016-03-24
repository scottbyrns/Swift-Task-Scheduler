//
//  MSBDefaultReaction.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class MSBDefaultMSBReaction : MSBReaction {
    
    var channel : String
    var message : String
    var subroutine : MSBSubroutine
    
    init (channel : String, message : String, subroutine : MSBSubroutine) {
        
        self.channel = channel
        self.message = message
        self.subroutine = subroutine
        
    }
    
}