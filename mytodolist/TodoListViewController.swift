//
//  TodoListViewController.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/02.
//

import UIKit

class TodoListViewController: UIViewController {
    
    //구조체 받아오기
    var todolists = [TodoList]()

    @IBOutlet weak var todoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView 불러오기
        todoTableView.dataSource = self
    }
    
    //추가 버튼 클릭 시
    @IBAction func addTodoClicked(_ sender: Any) {
        let addTodoalert = UIAlertController(title: "할일 추가", message: nil, preferredStyle: .alert)
        
        //얼럿의 취소버튼
        let cancelBtn = UIAlertAction(title: "취소", style: .cancel)
        //얼럿의 추가버튼
        let addBtn = UIAlertAction(title: "추가", style: .default, handler: { (_) in
            //addTodoalert의 textFields[0]번째부터 채워라
            guard let addTodotext = addTodoalert.textFields?[0].text else { return }
            
            //TodoList 구조체가 가진 title에 addTodotext, done에 false를
            let todolist = TodoList(title: addTodotext, done: false)
            
            //그걸 todoList 배열에 추가한다.
            self.todolists.append(todolist)
            
            //추가 버튼이 눌릴때마다 TableView를 reload한다
            self.todoTableView.reloadData()
            
            //확인할라고(나중에 지우지 뭐)
            print(addTodotext)
            print(self.todolists)
        })
        
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
        return todolists.count
    }
    
    //TableView Cell의 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell", for: indexPath) as? TodoListTableViewCell else {
            return UITableViewCell()
        }
        
        let todolist = self.todolists[indexPath.row]
        cell.todoTitleLabel.text = todolist.title
        cell.todoSwitch.isOn = todolist.done
    
        return cell
    }
}

//구조체 만들어서 title만 적용
