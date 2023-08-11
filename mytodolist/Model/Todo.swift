//
//  todoList.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/05.
//

import Foundation

//할일 구조체
struct Todo {
    //순서가 필요하겠구나..
    var id: Int
    var title: String
    var isCompleted: Bool
    var dodate: String
}

//리스트 구조?
struct TodoList {
    //전체 리스트 + 가라데이터?
    static var fullList: [Todo] = [
        Todo(id: 0, title: "과제하기", isCompleted: true, dodate: "8월 11일 (목) 12:30"),
        Todo(id: 1, title: "과제 제출하기", isCompleted: true, dodate: "8월 11일 (금) 13:55"),
        Todo(id: 2, title: "피커뷰 구현하기", isCompleted: false, dodate: ""),
        Todo(id: 3, title: "기기 저장 구현하기", isCompleted: false, dodate: ""),
        Todo(id: 4, title: "과제 제출해도 못한건 하기", isCompleted: false, dodate: "")
    ]
    
    //완료처리?
    static func completed(todo: Todo, isCompleted: Bool, dodate: String) {
        for index in 0 ..< fullList.count {
            if fullList[index].id == todo.id {
                fullList[index].isCompleted = isCompleted
                fullList[index].dodate = dodate
            }
        }
    }
    
    //완료 리스트?
    static func completList() -> [Todo] {
        return fullList.filter{ $0.isCompleted == true }
    }
    
    //타이틀 수정?
    static func editTodo(todo: Todo, title: String) {
        for index in 0 ..< fullList.count {
            if fullList[index].id == todo.id {
                fullList[index].title = title
            }
        }
    }
    
    //시간 수정?
    static func timeeditTodo(todo: Todo, dodate: String) {
        for index in 0 ..< fullList.count {
            if fullList[index].id == todo.id {
                fullList[index].dodate = dodate
            }
        }
    }
    
    //삭제?
    static func removeTodo(todo: Todo) {
        fullList.removeAll(where: { $0.id == todo.id })
    }
}
