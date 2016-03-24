//
//  SCBInstruction.swift
//  TaskScheduler
//
//  Created by Scott Byrns on 3/23/16.
//  Copyright © 2016 scottbyrns. All rights reserved.
//

import Foundation

protocol MSBInstruction {
    
    var channel : String {get set}
    var message : String {get set}
    
    func start()
    func start(withPayload payload: String)
    
}