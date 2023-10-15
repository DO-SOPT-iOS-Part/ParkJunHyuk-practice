//
//  TextFieldExtension.swift
//  ParkJunHyuk-practice
//
//  Created by ParkJunHyuk on 2023/10/10.
//

import Foundation
import UIKit

extension UITextField {
    /// TextField 내의 Text 와 테두리의 좌, 우 간격 생성
    func addHorizontalPadding(_ padding: CGFloat = 16) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height)) // 자기 자신의 높이와 동일한 빈 공간 생성
        
        self.leftView = paddingView // 좌측에 간격 생성
        self.rightView = paddingView // 우측에 간격 생성
        
        self.leftViewMode = .always // 어떤 상황에서도 간격을 생성
        self.rightViewMode = .always // 어떤 상황에서도 간격을 생성
    }
}
