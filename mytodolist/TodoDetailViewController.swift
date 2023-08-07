//
//  TodoDetailViewController.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/04.
//

import UIKit

class TodoDetailViewController: UIViewController {
    
    var todo: Todo?
    
    @IBOutlet weak var todoTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTitleLabel.text = todo?.title
    }
}
