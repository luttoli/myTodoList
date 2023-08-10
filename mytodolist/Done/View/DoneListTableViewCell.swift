//
//  DoneListTableViewCell.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/08.
//

import UIKit

class DoneListTableViewCell: UITableViewCell {
    
    var todo: Todo?

    @IBOutlet weak var doneTitleLabel: UILabel!
    @IBOutlet weak var dodateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setTodo(_ _todo: Todo) {
        todo = _todo
        guard let todo else { return }
        doneTitleLabel.text = todo.title
        dodateLabel.text = todo.dodate
    }
}
