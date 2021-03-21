//
//  ViewData.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import Foundation


enum ViewData {
    case initial
    case loading([Exercise]?)
    case success([Exercise])
    case failure([Exercise]?)
}
