//
//  Task.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol MSBTask {
    
    var taskName : String {get set}
    var taskDescription : String {get set}
    var subroutines : Array<MSBSubroutine> {get set}
    
    func start ()
    
}