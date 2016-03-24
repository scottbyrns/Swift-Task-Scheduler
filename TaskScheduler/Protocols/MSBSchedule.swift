//
//  MSBSchedule.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol MSBSchedule {
    
    var scheduleHandler : (task: MSBTask) -> () {get set}
    var temporalMap : [Int64 : (task : MSBTask, nextInterval: Int64)] {get set}
    
    func start ()
    func stop ()
    
    func scheduleTask(task: MSBTask, atTime time : NSDate)
    func scheduleTask(task: MSBTask, toRepeatAtIntervalOf interval : Int64)
    
}