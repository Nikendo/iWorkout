//
//  Excercise.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import Foundation


protocol Exercise {
    var name: String { get }
    var type: String { get }
    var sets: [ExerciseSet] { get }
    
    func addSet(set: ExerciseSet)
    func removeSet(id: Int)
}
