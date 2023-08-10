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
    @IBOutlet weak var CompletionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetialTitleLabel.text = todo?.title
        completion()
        print("------>   \(String(describing: todo?.isCompleted))")
    }
    
    //완료여부에 따라 출력
    func completion() {
        guard let todo else { return }
        if todo.isCompleted == true {
            CompletionLabel.text = "완료함"
        } else {
            CompletionLabel.text = "완료전"
        }
    }
    
    //타이틀 수정하기
    @IBAction func editClicked(_ sender: Any) {
        let editAlert = UIAlertController(title: "할 일 수정하기", message: nil, preferredStyle: .alert)
        
        //얼럿의 취소버튼
        let editCancelBtn = UIAlertAction(title: "취소", style: .cancel)
        //얼럿의 수정버튼
        let editAddBtn = UIAlertAction(title: "수정", style: .default) {[weak self] _ in
            guard let self, let todo else { return }
            if let title = editAlert.textFields?.first?.text,
                !title.isEmpty {
                TodoList.editTodo(todo: todo, title: title)
                self.DetialTitleLabel.text = title
            }
        }
        
        //버튼 노출
        editAlert.addAction(editCancelBtn)
        editAlert.addAction(editAddBtn)
        
        //얼럿 노출, 에니메이션 여부
        self.present(editAlert, animated: true)
        
        //TextField 추가
        editAlert.addTextField() { (tf) in
            tf.placeholder = "할일을 입력하고 추가하세요."
        }
    }
    
    //삭제하기
    @IBAction func removeClicked(_ sender: Any) {
        let removeAlert = UIAlertController(title: "정말로 삭제하시겠습니까?", message: nil, preferredStyle: .alert)
        
        //얼럿의 취소버튼
        let removeCancelBtn = UIAlertAction(title: "취소", style: .cancel)
        //얼럿의 확인버튼
        let removeOKBtn = UIAlertAction(title: "삭제", style: .default) {[weak self] _ in
            guard let self, let todo else { return }
            TodoList.removeTodo(todo: todo)
            self.navigationController?.popViewController(animated: true)
        }
        //버튼 노출
        removeAlert.addAction(removeCancelBtn)
        removeAlert.addAction(removeOKBtn)
        
        //얼럿 노출, 에니메이션 여부
        self.present(removeAlert, animated: true)
    }
}
