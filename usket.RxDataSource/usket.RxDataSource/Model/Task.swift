//
//  Task.swift
//  usket.RxDataSource
//
//  Created by 이경후 on 2023/09/24.
//

import Foundation
import Differentiator

struct Task: IdentifiableType, Equatable {
    let id: Int
    let title: String
    let category: TaskCategory
    
    var identity: Int {
        return self.id
    }
}

enum TaskCategory: String, IdentifiableType {
    case personal
    case work
    case shopping
    
    var identity: String {
        return self.rawValue
    }
}
