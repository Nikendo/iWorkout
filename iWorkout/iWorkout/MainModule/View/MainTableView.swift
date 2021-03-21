//
//  MainTableView.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import SnapKit


class MainTableView: UITableView {
    
    private var exercises: [Exercise] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        registerCells()
        delegate = self
        dataSource = self
        update(exercises: [])
    }
    
    func update(exercises: [Exercise]?) {
        self.exercises = exercises ?? []
        reloadData()
    }
}

extension MainTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = exercises[indexPath.row].name
        cell.textLabel?.textColor = .black
        return cell
    }
}

private extension MainTableView {
    func registerCells() {
        self.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}
