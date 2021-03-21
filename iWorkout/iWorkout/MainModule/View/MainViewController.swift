//
//  MainViewController.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import SnapKit

class MainViewController: UIViewController, MainViewProtocol {
    
    var viewModel: MainViewModelProtocol?
    
    private var tableView: MainTableView!
    
    lazy var activityIndicatorView = makeActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        updateView()
        viewModel?.startFetch()
    }
    
    func setup() {
        tableView = MainTableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        tableView.setup()
    }
    
    private func updateView() {
        viewModel?.updateViewData = { [weak self] viewData in
            switch viewData {
            case .initial:
                self?.hideActivityIndicator()
                self?.tableView?.update(exercises: nil)
            case .loading(let exercises):
                self?.showActivityIndicator()
                self?.tableView?.update(exercises: exercises)
            case .success(let exercises):
                self?.hideActivityIndicator()
                self?.tableView?.update(exercises: exercises)
            case .failure(let exercises):
                self?.hideActivityIndicator()
                self?.tableView?.update(exercises: exercises)
            }
        }
    }
    
    func showActivityIndicator() {
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
    }
}


private extension MainViewController {
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .gray
        activityIndicatorView.hidesWhenStopped = true
        view.addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(48)
            make.center.equalTo(view.center)
        }
        return activityIndicatorView
    }
}
