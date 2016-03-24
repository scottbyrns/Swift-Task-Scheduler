//
//  SCBTaskScheduler.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol MSBTaskScheduler {
    
    var schedule : MSBSchedule {get set}
    func whenScheduledTaskShouldBePerformed(perform task : MSBTask)
    
}