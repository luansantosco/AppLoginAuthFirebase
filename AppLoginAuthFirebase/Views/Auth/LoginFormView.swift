//
//  LoginFormView.swift
//  AppLoginAuthFirebase
//
//  Created by Luan Rodrigues on 30/09/24.
//

import SwiftUI

struct LoginFormView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                AuthInputFieldView(text: $viewModel.email, title: "Email", isSecure: false, isClearError: {field in
                    viewModel.clearErrors(for: field)
                },  errorMessage: viewModel.emailError)
                
            }
            
            VStack(alignment: .leading) {
                AuthInputFieldView(text: $viewModel.password, title: "Password", isSecure: true, isClearError: { field in
                    viewModel.clearErrors(for: field)
                }, errorMessage: viewModel.passwordError)
            }
            
            AuthSubmitButtonView(label: "Enviar", action: viewModel.validateAndSubmit)
            
            HStack {
                Text("Don't have on account?")
                    .foregroundStyle(Color.secondaryText)
                Text("Sing up")
                    .underline()
                    .foregroundStyle(Color.primaryButton)
            }
            
            
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Erro de Autenticação"), message: Text(viewModel.authError ?? "Ocorreu um erro."), dismissButton: .default(Text("OK")))
        }
    }
    
}

#Preview {
    LoginFormView()
}
