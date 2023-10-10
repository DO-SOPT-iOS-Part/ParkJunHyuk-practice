//
//  GetDataProtocol.swift
//  ParkJunHyuk-practice
//
//  Created by ParkJunHyuk on 2023/10/07.
//

import Foundation

protocol GetDataProtocol: AnyObject {
    func getLoginData(email: String, password: String)
}
