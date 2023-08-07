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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //done switch 클릭 시
    @IBAction func doneSwitchClicked(_ sender: Any) {
        guard let todo else { return }
        if todoSwitch.isOn {
            todoTitleLabel?.text = nil
            todoTitleLabel?.attributedText = todo.title.strikeThrough()
            //
        } else {
            todoTitleLabel?.attributedText = nil
            todoTitleLabel?.text = todo.title
        }
    }
    
    func setTodo(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        if todo.iscompleted {
            todoTitleLabel?.text = nil
            todoTitleLabel?.attributedText = todo.title.strikeThrough()
        } else {
            todoTitleLabel?.attributedText = nil
            todoTitleLabel?.text = todo.title
        }
        todoSwitch.isOn = todo.iscompleted
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


