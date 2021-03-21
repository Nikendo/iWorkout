//
//  MainViewModel.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import Foundation


protocol MainViewProtocol: class {
    var viewModel: MainViewModelProtocol? { get set }
}

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)? { get set }
    func startFetch()
}


final class MainViewModel: MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)?
    
    init() {
        updateViewData?(.initial)
    }
    
    func startFetch() {
        // start loading
        updateViewData?(.loading(nil))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(
                [DeadLift()]
            ))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(nil))
        }
    }
}
