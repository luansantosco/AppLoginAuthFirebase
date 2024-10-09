//
//  AuthSubmitButtonView.swift
//  AppLoginAuthFirebase
//
//  Created by Luan Rodrigues on 30/09/24.
//

import SwiftUI

struct AuthSubmitButtonView: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button {action()} label: {
            Text(label)
                .padding()
                .font(.title3)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 76/255, green: 100/255, blue: 216/255)))
    }
}

#Preview {
    AuthSubmitButtonView(label: "Enviar", action: teste)
}

func teste(){
    print("Enviar")
}
