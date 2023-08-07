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
    var iscompleted: Bool
}

//리스트 구조?
struct TodoList {
    //그냥 리스트?
    static var justList: [Todo] = [
        Todo(id: 0, title: "뭐 하기", iscompleted: true)
    ]
    
    //완료처리?
    static func completed(todo: Todo, iscompleted: Bool) {
        for index in 0 ..< justList.count {
            if justList[index].id == todo.id {
                justList[index].iscompleted = iscompleted
            }
        }
    }
    //완료 리스트?
    
    //수정?
    
    //삭제?
    
}
