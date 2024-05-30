//
//  Item.swift
//  ToDo
//
//  Created by Іван Джулинський on 06.05.2024.
//

import Foundation
import SwiftData

@Model
final class ToDo {
    var title: String
    var note: String
    var isDone: Bool
    var date: Date

    init(title: String = "", note: String = "", isDone: Bool = false, date: Date = Date()) {
        self.title = title
        self.note = note
        self.isDone = isDone
        self.date = date
    }
}

final class MockData {
    
    let sample = ToDo(title: "Some todo item", note: "Some note", isDone: true, date: Date())
}
