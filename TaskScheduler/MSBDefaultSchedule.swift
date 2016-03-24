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
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("checkInterval"), userInfo: nil, repeats: true)
        
    }
    
    func checkInterval () {
        
        let timestamp = NSDate().timeIntervalSince1970
        
        for (time, config) in temporalMap {
            if Int64(timestamp) - time < 0 {
                
                temporalMap.removeValueForKey(time)
                
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