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
    //전체 리스트?
    static var fullList: [Todo] = [
        Todo(id: 0, title: "뭐 하기", isCompleted: false, dodate: ""),
        Todo(id: 1, title: "뭐", isCompleted: true, dodate: "")
    ]
    
    //완료처리?
    static func completed(todo: Todo, isCompleted: Bool) {
        for index in 0 ..< fullList.count {
            if fullList[index].id == todo.id {
                fullList[index].isCompleted = isCompleted
            }
        }
    }
    
    //완료 리스트?
    static func completList() -> [Todo] {
        return fullList.filter{ $0.isCompleted == true }
    }
    
    //수정?
    static func editTodo(todo: Todo, title: String) {
        for index in 0 ..< fullList.count {
            if fullList[index].id == todo.id {
                fullList[index].title = title
            }
        }
    }
    
    //삭제?
    static func removeTodo(todo: Todo) {
        fullList.removeAll(where: { $0.id == todo.id })
    }
}

//던페이지 리스트 개수 -
//기기저장
//삭제 -
//시간?
