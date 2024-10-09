//
//  AuthInputFieldView.swift
//  AppLoginAuthFirebase
//
//  Created by Luan Rodrigues on 30/09/24.
//

import SwiftUI

struct AuthInputFieldView: View {
    @Binding var text: String
    var title: String
    var isSecure: Bool
    var isClearError: (String) -> Void
    var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(title)
                Text("(required)")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(Color.secondaryText)
            }
            
            if let errorMessage = errorMessage {
                HStack {
                    Image(systemName: "nosign")
                        .foregroundColor(.red)
                    Text(errorMessage)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                
            }
            
            if isSecure {
                SecureField("", text: $text)
                    .padding()
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder((errorMessage != nil) ? Color.red : Color.gray))
                    .accessibilityLabel("\(title) Field")
                    .onChange(of: text) { oldValue, newValue in
                        isClearError("password")
                    }
                ForgotPasswordLink()
                
            } else {
                TextField("", text: $text)
                    .padding()
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder((errorMessage != nil) ? Color.red : Color.gray))
                    .accessibilityLabel("\(title) Field")
                    .onChange(of: text) { oldValue, newValue in
                        isClearError("email")
                    }
                
            }
        }
    }
    
    
}

struct ForgotPasswordLink: View {
    var body: some View {
        Text("Forgot password?")
            .underline()
            .foregroundStyle(Color.primaryButton)
            .accessibilityLabel("Forgot password")
    }
}

#Preview {
    @Previewable @State var testText: String = "Teste"
    AuthInputFieldView(text: $testText, title: "Email", isSecure: false, isClearError: {_ in
        isClearError()
    })
}

func isClearError() {
    print("Limpar")
}
