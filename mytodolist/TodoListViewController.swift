//
//  TodoListViewController.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/02.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    var todoList: [String] = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView 불러오기
        todoTableView.dataSource = self
    }
    
    @IBAction func addTodo(_ sender: Any) {
        let addTodoalert = UIAlertController(title: "할일 추가", message: "", preferredStyle: .alert)
        
        //얼럿의 취소버튼
        let cancelBtn = UIAlertAction(title: "취소", style: .cancel)
        //얼럿의 추가버튼
        let addBtn = UIAlertAction(title: "추가", style: .default) { (_) in
            //addTodoalert의 textFields[0]번째부터 채워라
            guard let addTodotext = addTodoalert.textFields?[0].text else { return }
            //그걸 todoList 배열에 추가한다.
            self.todoList.append(addTodotext)
            //추가 버튼이 눌릴때마다 TableView를 reload한다
            self.todoTableView.reloadData()
            print(addTodotext)
            print(self.todoList)
        }
        
        //버튼 노출
        addTodoalert.addAction(cancelBtn)
        addTodoalert.addAction(addBtn)
        
        //얼럿 노출, 에니메이션 여부
        self.present(addTodoalert, animated: true)
        
        //TextField 추가
        addTodoalert.addTextField() { (tf) in
            tf.placeholder = "할일을 입력하고 추가하세요."
        }
    }
}

//TableView 상세적용
extension TodoListViewController: UITableViewDataSource {
    //TableView 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    //TableView Cell의 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell", for: indexPath) as? TodoListTableViewCell else {
            return UITableViewCell() }
        
        cell.todoTitleLabel.text = self.todoList[indexPath.row]
        
        return cell
    }
}
