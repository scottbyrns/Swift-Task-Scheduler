//
//  SCBReaction.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol MSBReaction {
    
    var channel : String {get set}
    var message : String {get set}
    var subroutine : MSBSubroutine {get set}
    
}