//
//  ExcerciseType.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import Foundation


enum ExerciseType: String, CaseIterable, Codable {
    case deadlift = "Становая тяга"
    case benchPress = "Жим лежа"
    case squats = "Приседания со штангой"
}
