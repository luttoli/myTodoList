//
//  TodoDetailViewController.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/04.
//

import UIKit

class TodoDetailViewController: UIViewController {
    
    var todo: Todo?
    
    @IBOutlet weak var DetialTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetialTitleLabel.text = todo?.title
    }
}
