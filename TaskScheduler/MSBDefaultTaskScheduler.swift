//
//  MSBDefaultTaskScheduler.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class MSBDefaultTaskScheduler : MSBTaskScheduler {
    
    var schedule : MSBSchedule
    
    init (schedule : MSBSchedule) {
        self.schedule = schedule
        let manualCallback = self.schedule.scheduleHandler
        self.schedule.scheduleHandler = { (task) -> () in
            manualCallback(task: task)
            self.whenScheduledTaskShouldBePerformed(perform: task)
        }
        self.schedule.start()
    }
    
    func whenScheduledTaskShouldBePerformed(perform task : MSBTask) {
	print("Performing task named \(task.taskName)")
        task.start()
    }
    
}
