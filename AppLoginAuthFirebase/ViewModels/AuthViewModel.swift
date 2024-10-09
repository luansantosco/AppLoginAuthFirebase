//
//  AuthViewModel.swift
//  AppLoginAuthFirebase
//
//  Created by Luan Rodrigues on 29/09/24.
//
import Foundation
import FirebaseAuth

enum AuthErrorMessage: String {
    case emailRequired = "Email is required."
    case passwordRequired = "Password is required."
    case invalidEmail = "O endereço de e-mail está mal formatado."
    case wrongPassword = "Senha incorreta."
    case userNotFound = "Nenhuma conta encontrada para este e-mail."
    case emailAlreadyInUse = "O e-mail já está em uso por outra conta."
    case invalidCredentials = "As credenciais fornecidas são inválidas ou expiraram."
    case genericError = "Ocorreu um erro inesperado."
}

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var authError: String?
    
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    
    @Published var showAlert: Bool = false
    
    func validateAndSubmit() {
        validateEmail()
        validatePassword()
        
        if emailError == nil && passwordError == nil {
            send()
        }
    }
    
    func clearErrors(for field: String) {
        if field == "email" {
            emailError = nil
        } else if field == "password" {
            passwordError = nil
        }
    }
    
    private func validateEmail() {
        if email.isEmpty {
            emailError = AuthErrorMessage.emailRequired.rawValue
        }
    }
    
    private func validatePassword() {
        if password.isEmpty {
            passwordError = AuthErrorMessage.passwordRequired.rawValue
        }
    }
    
    private func send() {
        AuthService.signIn(withEmail: email, password: password) { result in
            switch result {
            case .success:
                self.handleSuccess()
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    private func handleSuccess() {
        isLoggedIn = true
        authError = nil
    }
    
    private func handleError(_ error: Error) {
        isLoggedIn = false
        
        if let authError = error as NSError? {
            switch authError.code {
            case AuthErrorCode.invalidEmail.rawValue:
                emailError = AuthErrorMessage.invalidEmail.rawValue
            case AuthErrorCode.wrongPassword.rawValue:
                passwordError = AuthErrorMessage.wrongPassword.rawValue
            case AuthErrorCode.userNotFound.rawValue:
                emailError = AuthErrorMessage.userNotFound.rawValue
            case AuthErrorCode.emailAlreadyInUse.rawValue:
                emailError = AuthErrorMessage.emailAlreadyInUse.rawValue
            case AuthErrorCode.invalidCredential.rawValue:
                self.authError = AuthErrorMessage.invalidCredentials.rawValue
                showAlert = true
            default:
                self.authError = "\(AuthErrorMessage.genericError.rawValue): \(authError.localizedDescription)"
            }
        } else {
            authError = "\(AuthErrorMessage.genericError.rawValue): \(error.localizedDescription)"
        }
        
        print("Erro da requisição: \(error.localizedDescription)")
    }
}
