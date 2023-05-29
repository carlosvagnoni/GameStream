//
//  CustomSecureField.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI

struct CustomSecureField: View {
    
    @State var showPassword: Bool = false
    
    @Binding var password: String
    
    var body: some View {
        
        HStack {
            
            ZStack(alignment: .leading) {
                
                if password.isEmpty {
                    Text(verbatim: "Escribe tu contraseña")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.bottom, 8)
                }
                                    
                if showPassword {
                    
                    TextField(text: $password) {
                        Text(verbatim: "Escribe tu contraseña")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .frame(height: 20)
                    .padding(.bottom, 8)
                    .foregroundColor(.white)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .opacity(showPassword ? 1 : 0)
                    
                } else {
                    
                    SecureField("", text: $password)
                        .font(.subheadline)
                        .frame(height: 20)
                        .padding(.bottom, 8)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .opacity(showPassword ? 0 : 1)
                }
                
            }
            
            if !password.isEmpty {
                
                Button(action: {
                    
                                    showPassword.toggle()
                    
                                }, label: {
                                    
                                    Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill")
                                        .padding(.trailing, 5.0)
                                        .foregroundColor(.white)
                                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                        
                            })
            }
        }
        
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            
            Spacer()
            
            Color("marine")
                .ignoresSafeArea()
            
            CustomSecureField(password: .constant("prueba"))
            
        }
    }
}
