//
//  MSBDefaultTask.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class MSBDefaultTask : MSBTask {
    
    var taskName : String
    var taskDescription : String
    var subroutines : Array<MSBSubroutine>

    init (taskName : String, taskDescription : String, subroutines : Array<MSBSubroutine>) {
        self.taskName = taskName
        self.taskDescription = taskDescription
        self.subroutines = subroutines
    }
    
    func start () {
        
        for subroutine in subroutines {
            subroutine.start()
        }
        
    }
    
}