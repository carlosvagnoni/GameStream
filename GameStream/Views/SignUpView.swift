//
//  SignUpView.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .center, spacing: 0) {
                    
                    Text("Elige una foto de perfil")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    Text("Puedes cambiar o elegirla más adelante")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.subheadline)
                        .padding(.bottom, 25)
                    
                    Button(action: takePhoto) {
                        
                        ZStack {
                            
                            Image("exampleProfilePhoto")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.bottom, 60)
                
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
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Contraseña*")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                    
                    CustomSecureField()
                    
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                        .padding(.bottom, 30)
                    
                    Text("Confirmar contraseña*")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                        .padding(.bottom)
                    
                    CustomSecureField()
                    
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                        .padding(.bottom, 30)
                }
                
                Spacer(minLength: 60)
                
                Button(action: signUp) {
                    
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title2)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
                }
                .padding(.bottom, 60)
                
                VStack {
                    
                    Text("Registrate con redes sociales")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .font(.headline)
                    .padding(.bottom, 20)
                    
                    HStack {
                        
                        Button(action: facebookSignUp) {
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color("blue-gray"))
                                .cornerRadius(6.0)
                        }
                        
                        Button(action: twitterSignUp) {
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
    }
}

func takePhoto() {
    print("Tomar foto")
}

func signUp() {
    print("Registrarse")
}

func facebookSignUp() {
    print("Estoy registrandome con facebook")
}

func twitterSignUp() {
    print("Estoy registrandome con twitter")
}

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            
            Spacer()
            
            Color("marine")
                .ignoresSafeArea()
            
            SignUpView()
            
        }
    }
}
