//
//  LoginView.swift
//  AppLoginAuthFirebase
//
//  Created by Luan Rodrigues on 29/09/24.
//

import SwiftUI

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 40) {
                    Spacer()
                    LoginHeaderView()
                    LoginFormView()
                    Spacer()
                }
                .padding(.horizontal, 32.0)
                .frame(minHeight: UIScreen.main.bounds.height)
            }
            
            .ignoresSafeArea()
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                HomeView()
            }
            
        }
    }
    
}


#Preview {
    LoginView()
}
