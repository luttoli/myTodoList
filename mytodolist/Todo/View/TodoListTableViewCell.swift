//
//  TodoListTableViewCell.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/02.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    var todo: Todo?
    
    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var todoSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //done switch 클릭 시
    @IBAction func doneSwitchClicked(_ sender: Any) {
        guard let todo else { return }
        if todoSwitch.isOn {
            todoTitleLabel?.text = nil
            todoTitleLabel?.attributedText = todo.title.strikeThrough()
            TodoList.completed(todo: todo, isCompleted: true, dodate: Date().dateTime())
        } else {
            todoTitleLabel?.attributedText = nil
            todoTitleLabel?.text = todo.title
            TodoList.completed(todo: todo, isCompleted: false, dodate: Date().dateTime())
        }
        
        //값 변화되는 상황 보려고
        print("--------------------")
        print(TodoList.fullList)
        print("--------------------")
        print(">>>>\(String(describing: todoTitleLabel?.text))")
        print("--------------------")
        print(">>>>\(String(describing: todoTitleLabel?.attributedText))")
    }
    
    //완료상태이면 todoTitleLabel의 텍스트 대신 attributedText에 취소선 긋고 아니면 그냥 todo.title
    func setTodo(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        if todo.isCompleted {
            todoTitleLabel?.text = nil
            todoTitleLabel?.attributedText = todo.title.strikeThrough()
        } else {
            todoTitleLabel?.attributedText = nil
            todoTitleLabel?.text = todo.title
        }
        todoSwitch.isOn = todo.isCompleted
    }
}
