//
//  DoneListViewController.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/02.
//

import UIKit

class DoneListViewController: UIViewController {
    
    var todo: Todo?
    
    @IBOutlet weak var doneTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        doneTableView.dataSource = self
        doneTableView.reloadData()
    }
}

extension DoneListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TodoList.completList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "doneListCell", for: indexPath) as? DoneListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setTodo(TodoList.completList()[indexPath.row])
        
        return cell
    }
    
    
}
