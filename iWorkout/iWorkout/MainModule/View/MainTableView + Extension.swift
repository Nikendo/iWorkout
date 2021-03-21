//
//  MainTableView + Extension.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import SnapKit


extension MainTableView {
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .gray
        activityIndicatorView.hidesWhenStopped = true
        addSubview(activityIndicatorView)
//        activityIndicatorView.activateAnchors()
        activityIndicatorView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(48)
            make.center.equalTo(center)
        }
        return activityIndicatorView
    }
}
