//
//  TaskViewModel.swift
//  usket.RxDataSource
//
//  Created by 이경후 on 2023/09/24.
//

import RxSwift
import RxCocoa
import RxDataSources

class TaskViewModel {
    
    private let tasks = BehaviorRelay<[AnimatableSectionModel<TaskCategory, Task>]>(value: [])
    
    func fetchTasks() -> Observable<[AnimatableSectionModel<TaskCategory, Task>]> {
        let personalTasks: [Task] = [
            Task(id: 1, title: "우유 사기", category: .personal),
            Task(id: 2, title: "치즈 사기", category: .personal),
        ]

        let workTasks: [Task] = [
            Task(id: 3, title: "블로그 포스팅", category: .work),
            Task(id: 4, title: "회의 참여", category: .work),
        ]

        let shoppingTasks: [Task] = [
            Task(id: 5, title: "가방 사기", category: .shopping),
            Task(id: 6, title: "아이폰15 사기", category: .shopping),
        ]

        let sections: [AnimatableSectionModel<TaskCategory, Task>] = [
            AnimatableSectionModel(model: .personal, items: personalTasks),
            AnimatableSectionModel(model: .work, items: workTasks),
            AnimatableSectionModel(model: .shopping, items: shoppingTasks),
        ]

        tasks.accept(sections)

        return tasks.asObservable()
    }
}
