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
    @IBOutlet weak var listCount: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        doneTableView.dataSource = self
        doneTableView.reloadData()
        
        //카운트 노출
        listCount.title = countList()
        
    }
    
    //???
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.doneTableView?.reloadData()
    }
    
    //카운트 노출
    func countList() -> String {
        String("\(TodoList.completList().count)개")
    }
    
    //카운트가 버튼처럼 아니게
    
    
    //Cell 클릭 시
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? DoneListTableViewCell else { return }
        if segue.identifier == "detail" {
            if let vc = segue.destination as? DoneDetailViewController {
                vc.todo = cell.todo
            }
        }
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
