//
//  MSBDefaultSchedule.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

class MSBDefaultSchedule : MSBSchedule {
    
    var scheduleHandler : (task: MSBTask) -> ()
    var temporalMap : [Int64 : (task : MSBTask, nextInterval: Int64)]
    var timer : NSTimer?
    
    init (scheduleHandler : (task: MSBTask) -> (), temporalMap : [Int64 : (task : MSBTask, nextInterval: Int64)]) {
        self.scheduleHandler = scheduleHandler
        self.temporalMap = temporalMap
    }
    
    func start () {
        
	timer = NSTimer.scheduledTimer(1.0, repeats: true) { timer in
		self.checkInterval()
	}

        let runLoop = NSRunLoop.currentRunLoop()
        runLoop.addTimer(timer!, forMode: NSDefaultRunLoopMode)
        runLoop.runUntilDate(NSDate(timeIntervalSinceNow: NSDate().timeIntervalSince1970))
        
    }
    
    func checkInterval () {
        
        let timestamp = NSDate().timeIntervalSince1970
        
        for (time, config) in temporalMap {
            if Int64(timestamp) - time < 0 {
                
                temporalMap.removeValue(forKey: time)
                
                scheduleHandler(task: config.task)
                
                if config.nextInterval > 0 {
                    let nextTime = time + config.nextInterval
                    temporalMap[nextTime] = (config.task, config.nextInterval)
                }
            }
        }
        
    }
    
    func stop () {
        
        timer?.invalidate()
        
    }
    
    func scheduleTask(task: MSBTask, atTime time : NSDate) {
        temporalMap[Int64(time.timeIntervalSince1970)] = (task, 0)
    }
    
    func scheduleTask(task: MSBTask, toRepeatAtIntervalOf interval : Int64) {
        temporalMap[Int64(NSDate().timeIntervalSince1970)] = (task, interval)
    }

}
