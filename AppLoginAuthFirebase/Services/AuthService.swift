//
//  AuthService.swift
//  AppLoginAuthFirebase
//
//  Created by Luan Rodrigues on 29/09/24.
//


import Foundation
import FirebaseAuth

struct AuthService {
    static func signIn(withEmail email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(result!))
            }
        }
    }
}
