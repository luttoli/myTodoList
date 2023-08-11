//
//  DoneDetailViewController.swift
//  mytodolist
//
//  Created by 김지훈 on 2023/08/10.
//

import UIKit

class DoneDetailViewController: UIViewController {
    
    var todo: Todo?
    
    @IBOutlet weak var DoneDetailTitleLabel: UILabel!
    @IBOutlet weak var DoneDoTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DoneDetailTitleLabel.text = todo?.title
        DoneDoTimeLabel.text = todo?.dodate
    }
    
    //완료시간 수정하기
    @IBAction func timeEditClicked(_ sender: Any) {
        let timeeditAlert = UIAlertController(title: "완료 시간 수정하기", message: nil, preferredStyle: .alert)
        
        //얼럿의 취소버튼
        let timeeditCancelBtn = UIAlertAction(title: "취소", style: .cancel)
        //얼럿의 수정버튼
        let timeeditAddBtn = UIAlertAction(title: "수정", style: .default) {[weak self] _ in
            guard let self, let todo else { return }
            if let dodate = timeeditAlert.textFields?.first?.text,
                !dodate.isEmpty {
                TodoList.timeeditTodo(todo: todo, dodate: dodate)
                self.DoneDoTimeLabel.text = dodate
            }
        }
        
        //버튼 노출
        timeeditAlert.addAction(timeeditCancelBtn)
        timeeditAlert.addAction(timeeditAddBtn)
        
        //얼럿 노출, 에니메이션 여부
        self.present(timeeditAlert, animated: true)
        
        //TextField 추가
        timeeditAlert.addTextField() { (tf) in
            tf.placeholder = self.todo?.dodate
        }
    }
    
    //피커뷰로 수정하기
    @IBAction func pickerEditClicked(_ sender: Any) {
        
    }
}
