//
//  ViewController.swift
//  ParkJunHyuk-practice
//
//  Created by ParkJunHyuk on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet Property
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Property
    
    private var idText: String = ""
    private var passwordText: String = ""
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        textFieldLayout()
    }
    
    private func setupDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction func idTextFieldEditingChanged(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func lasswrodTextFieldEditingChanged(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }

    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResultViewController()
//        presentToResultViewController()
    }
    
    // MARK: - layouts
    
    /// TextField layout 에 대한 메서드
    private func textFieldLayout() {
        // TextField 테두리 두께 설정
        [emailTextField, passwordTextField].forEach {
            $0.layer.borderWidth = 0.5
        }
        
        // TextField 테두리 색상 설정
        [emailTextField, passwordTextField].forEach {
            $0.layer.borderColor = UIColor.systemGray4.cgColor
        }
        
        // TextField 내의 좌우 간격 설정
        [emailTextField, passwordTextField].forEach {
            $0.addHorizontalPadding()
        }
    }
    
    // MARK: - methods
    
    /// push, pop NavigationController 를 이용한 화면 전환
    private func pushToResultViewController() {
        guard let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}

        resultViewController.email = idText
        resultViewController.password = passwordText
        
        /// Closure 를 통한 데이터 전달
        resultViewController.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
        
        /// delegate 를 통한 데이터 전달
        resultViewController.delegate = self
        
        /// push 를 통한 화면 전환 메서드
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    /// present 를 이용한 화면 전환
    private func presentToResultViewController() {
        guard let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        resultViewController.email = idText
        resultViewController.password = passwordText
        
        self.present(resultViewController, animated: true)
    }
}

// MARK: - Extension

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}

extension ViewController: UITextFieldDelegate {
    /// 텍스트 필드가 선택될 때
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.green.cgColor
    }

    /// 텍스트 필드의 선택이 해제될 때
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray4.cgColor
    }
}
