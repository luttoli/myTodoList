//
//  TodoListTableViewCell.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/02.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    var todolists = [TodoList]()
    
    
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
        if self.todoSwitch.isOn {
            todoTitleLabel.attributedText = todoTitleLabel.text?.strikeThrough()
        } else {
            todoTitleLabel.text = todoTitleLabel.text
            
        }
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


