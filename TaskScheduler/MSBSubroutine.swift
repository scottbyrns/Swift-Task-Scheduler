//
//  CSBSubroutine.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol MSBSubroutine {
    
    var subroutineName : String {get set}
    var subroutineDescription : String {get set}
    var sequence : Array<MSBInstruction> {get set}
    var reactions : Array<MSBReaction> {get set}
    
    func start()
    func start(withPayload payload : String)
    
}