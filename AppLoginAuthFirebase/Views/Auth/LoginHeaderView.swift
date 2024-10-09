//
//  LoginHeaderView.swift
//  AppLoginAuthFirebase
//
//  Created by Luan Rodrigues on 30/09/24.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome")
                .foregroundStyle(Color.primaryText)
                .font(.largeTitle).fontWeight(.bold)
            Text("Login in to your account")
                .font(.title2)
                .foregroundStyle(Color.secondaryText)
        }
    }
}

#Preview {
    LoginHeaderView()
}
