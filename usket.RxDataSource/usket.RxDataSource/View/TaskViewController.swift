//
//  ViewController.swift
//  usket.RxDataSource
//
//  Created by 이경후 on 2023/09/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TaskViewController: UIViewController {
    
    private let tableView = UITableView()
    private let viewModel: TaskViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setUI()
        setConstraint()
        bind()
    }
    
    private func setConfig() {
        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        tableView.backgroundColor = .black
        tableView.rowHeight = 64
    }
    
    private func setUI() {
        view.addSubview(tableView)
    }
    
    private func setConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bind() {
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<AnimatableSectionModel<TaskCategory, Task>>(
            configureCell: { dataSource, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
                cell.configure(task: item)
                return cell
            },
            titleForHeaderInSection: { dataSource, index in
                return dataSource.sectionModels[index].model.rawValue
            }
        )
        
        dataSource.animationConfiguration = AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
        
        viewModel.fetchTasks()
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
    }
}
