//
//  BenchPress.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import Foundation


class BenchPress: Exercise {
    var name: String
    var type: String
    var sets: [ExerciseSet]
    
    init(_ type: ExerciseType = .benchPress, _ sets: [ExerciseSet] = []) {
        self.name = type.rawValue
        self.type = type.rawValue
        self.sets = sets
    }
    
    func addSet(set: ExerciseSet) {
        sets.append(set)
    }
    
    func removeSet(id: Int) {
        sets.removeAll(where: {$0.id == id})
    }
}
