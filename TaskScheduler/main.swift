//
//  main.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

print("Hello, World!")


let scheduler = MSBDefaultTaskScheduler(schedule: MSBDefaultSchedule(scheduleHandler: { (task) -> () in
    
}, temporalMap: Dictionary<Int64, (task : MSBTask, nextInterval: Int64)>()))

