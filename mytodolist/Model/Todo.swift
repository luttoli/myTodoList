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
//삭제 -
//시간?

//기기저장

//func saveTodo() {
//    let data = self.todo.map {
//        [
//            "id": $0.id,
//            "title": $0.title,
//            "isCompleted": $0.isCompleted,
//            "dodate": $0.dodate
//        ]
//    }
//    let userDefaults = UserDefaults.standard
//    userDefaults.setValue(data, forKey: "todo")
//}

//기기저장 데이터로드

//func loadTodo() {
//    let userDefaults = UserDefaults.standard
//    guard let data = userDefaults.object(forKey: "todo") as? [[String: Any]] else { return }
//    self.todo = data.compactMap {
//        guard let id = $0["id"] as? Int else { return nil }
//        guard let title = $0["title"] as? String else { return nil }
//        guard let isCompleted = $0["isCompleted"] as? Bool else { return nil }
//        guard let dodate = $0["dodate"] as? String else { return nil }
//
//        return Todo(id: id, title: title, isCompleted: isCompleted, dodate: dodate)
//    }
//}
