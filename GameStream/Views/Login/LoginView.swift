//
//  LoginView.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Correo electrónico")
                    .fontWeight(.bold)
                    .foregroundColor(Color("dark-cian"))
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                
                TextField(text: $email) {
                    
                    Text(verbatim: "ejemplo@gmail.com")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                }
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .frame(height: 20)
                .padding(.bottom, 8)
                .foregroundColor(.white)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)

                
                Divider()
                    .frame(height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom, 30)
                
                Text("Contraseña")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                
                CustomSecureField(password: $password)
                
                Divider()
                    .frame(height: 1)
                    .background(.white)
                    .padding(.bottom, 10)
                
                HStack {
                    
                    Spacer()
                    
                    Button("¿Olvidaste tu contraseña?") {
                        
                        print("Ir a pantalla de recuperar contraseña")
                        
                    }
                    .font(.footnote)
                    .foregroundColor(Color("dark-cian"))
                }
                
                Spacer(minLength: 60)
                
                Button(action: { loginViewModel.login(email: email, password: password) }, label: {
                    
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title2)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
                })
                .padding(.bottom, 60)
                .alert(item: $loginViewModel.activeAlert) { alertType in
                    switch alertType {
                        
                    case .incorrectCredentials:
                        return Alert(title: Text("Error"), message: Text("Las credenciales son incorrectas."), dismissButton: .default(Text("Entendido")))
                        
                    }
                }
                
                
                VStack {
                    
                    Text("Inicia sesión con redes sociales")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.bottom, 20)
                    
                    HStack {
                        
                        Button(action: loginViewModel.facebookLogin) {
                            
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color("blue-gray"))
                                .cornerRadius(6.0)
                        }
                        
                        Button(action: loginViewModel.twitterLogin) {
                            
                            Text("Twitter")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color("blue-gray"))
                                .cornerRadius(6.0)
                        }
                        
                    }
                }
                
                
            }
            .padding(.horizontal, 20.0)
            
        }
        
        NavigationLink(destination: HomeTabView(), isActive: $loginViewModel.isHomeViewActive) {
            
            EmptyView()
            
        }
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            
            Spacer()
            
            Color("marine")
                .ignoresSafeArea()
            
            LoginView()
            
        }
    }
}
