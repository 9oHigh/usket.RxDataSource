//
//  TaskCell.swift
//  usket.RxDataSource
//
//  Created by 이경후 on 2023/09/24.
//

import UIKit

final class TaskCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConfig()
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(task: Task) {
        self.titleLabel.text = task.title
    }
    
    private func setConfig() {
        backgroundColor = .black
        
        self.titleLabel.font = .boldSystemFont(ofSize: 14)
        self.titleLabel.textColor = .white
    }
    
    private func setUI() {
        contentView.addSubview(titleLabel)
    }
    
    private func setConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

