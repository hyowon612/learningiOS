//
//  UserInformation.swift
//  SignUp
//
//  Created by Hyowon on 2021/09/02.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var text: String?
    var phoneNumber: String?
    var birthDate: String?
}
