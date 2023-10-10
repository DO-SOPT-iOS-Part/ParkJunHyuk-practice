//
//  ResultViewController.swift
//  ParkJunHyuk-practice
//
//  Created by ParkJunHyuk on 2023/10/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IBOutlet Property

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    // MARK: - Property
    
    var email: String = ""
    var password: String = ""
    
    var delegate: GetDataProtocol?
    
    /// 스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    var loginDataCompletion: (([String]) -> Void)? 
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
    }
    
    // MARK: - IBActions
    
    @IBAction func backButtonTap(_ sender: Any) {
        // navigationController 를 사용하고 있다면
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }

        delegate?.getLoginData(email: email, password: password)

        guard let loginDataCompletion else {return}
        loginDataCompletion([email, password])
    }
    
    // MARK: - methods
    
    /// 다른 ViewController 에서 데이터를 전달받은 값을 Binding 하기 위한 함수
    private func bindText() {
        self.emailLabel.text = "email: \(email)"
        self.passwordLabel.text = "password: \(password)"
    }
}
