//
//  todoList.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/05.
//

import Foundation

//할일 구조체
struct Todo {
    //순서?
    var id: Int
    var title: String
    var isCompleted: Bool
    var dodate: String
}

//리스트 구조?
struct TodoList {
    //그냥 리스트?
    static var justList: [Todo] = [
        Todo(id: 0, title: "뭐 하기", isCompleted: true, dodate: ""),
        Todo(id: 1, title: "뭐", isCompleted: true, dodate: "")
    ]
    
    //완료처리?
    static func completed(todo: Todo, iscompleted: Bool) {
        for index in 0 ..< justList.count {
            if justList[index].id == todo.id {
                justList[index].isCompleted = iscompleted
            }
        }
    }
    
    //완료 리스트?
    static func completList() -> [Todo] {
        return justList.filter{ $0.isCompleted == true }
    }
    
    //수정?
    
    
    //삭제?
    
}
