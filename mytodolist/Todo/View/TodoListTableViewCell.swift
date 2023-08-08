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
            TodoList.completed(todo: todo, iscompleted: true)
        } else {
            todoTitleLabel?.attributedText = nil
            todoTitleLabel?.text = todo.title
            TodoList.completed(todo: todo, iscompleted: false)
        }
        print("--------------------")
        print(TodoList.justList)
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

//취소선 & 폰트컬러 회색
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

extension Date {
    func date() {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
    }
}
