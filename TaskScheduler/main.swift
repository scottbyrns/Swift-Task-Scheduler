//
//  main.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

var subroutines : Array<MSBSubroutine> = []
var instructions : Array<MSBInstruction> = []
var reactions : Array<MSBReaction> = []

instructions.append(MSBDefaultInstruction(channel : "Test Instruction", message : "Test Instruction"))

subroutines.append(MSBDefaultSubroutine(subroutineName : "Test Subroutine", subroutineDescription : "Test Subroutine", sequence : instructions, reactions : reactions))


var testTask = MSBDefaultTask(taskName : "Test Task", taskDescription : "Test Task", subroutines : subroutines)
var tasks : Dictionary<Int64, (task : MSBTask, nextInterval: Int64)> = [Int64(NSDate().timeIntervalSince1970): (task: testTask, nextInterval: 1)]


let scheduler = MSBDefaultTaskScheduler(schedule: MSBDefaultSchedule(scheduleHandler: { (task) -> () in
    print(task.taskName)
}, temporalMap: tasks))


