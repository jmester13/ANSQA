//
//  AuthService.swift
//  DevChat
//
//  Created by Douglas Spencer on 10/21/16.
//  Copyright © 2016 Douglas Spencer. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    private static let _instance = AuthService()
    
    typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void
    
    static var instance: AuthService {
        return _instance
    }
    
    
    func login(email: String, password: String, onComplete: @escaping Completion) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print((error?._code)!)
                if let errorCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                    if errorCode == FIRAuthErrorCode.errorCodeUserNotFound {
                        self.FireBaseErrorHandler(error: error as! NSError, onComplete: onComplete)
                    }
                } else { // all other erros
                    self.FireBaseErrorHandler(error: error as! NSError, onComplete: onComplete)
                }
            } else {
                onComplete(nil, user)
            }
        })
    }
    
    func FireBaseErrorHandler(error: NSError, onComplete: Completion?) {
        if  let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            switch errorCode {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid Email Address", nil)
                break;
            case .errorCodeWrongPassword:
                onComplete?("Incorrect Password", nil)
                break;
            case .errorCodeEmailAlreadyInUse:
                onComplete?("Email Already In Use", nil)
                break;
            case .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Email Already In Use", nil)
                break;
            default:
                onComplete?("General Error", nil)
            }
        }
    }
}
