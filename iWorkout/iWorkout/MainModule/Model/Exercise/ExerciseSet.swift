//
//  ExerciseSet.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import Foundation


struct ExerciseSet: Hashable, Codable, Identifiable {
    var id: Int
    var count: Int
    var weight: Float
    
    static let `default` = ExerciseSet(id: 0, count: 0, weight: 0)
}
