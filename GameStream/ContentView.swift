//
//  ContentView.swift
//  GameStream
//
//  Created by user239477 on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        

        NavigationStack {
            
            ZStack {
                
                Spacer()
                
                Color("marine")
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack(spacing: 0.0) {
                        Image("appLogoController")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 23)
                            .padding(.trailing, 10.0)
                        Image("appLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(width: 170)
                    }
                    .padding(.bottom, 60)
                    
                    LoginAndSignUpView()
                    
                }
            }
            
        }
    }
}

struct LoginAndSignUpView: View {
    
    @State var loginType = true
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Button("INICIA SESIÓN") {
                    loginType = true
                }
                .foregroundColor(loginType ? .white : .gray)
                .fontWeight(loginType ? .bold : nil)
                .font(.title2)
                
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    loginType = false
                }
                .foregroundColor(loginType ? .gray : .white)
                .fontWeight(loginType ? nil : .bold)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                

            }
            .padding(.horizontal, 20)
            
            Spacer(minLength: 60)
            
            if loginType {
                LoginView()
            } else {
                SignUpView()
            }
        }
    }
}

struct LoginView: View {
    
    @State var email = ""
    @State var isHomeViewActive = false
    
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
                
                CustomSecureField()
                
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
                
                Button(action: { login(homeViewStatus: $isHomeViewActive) }, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title2)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
                })
                .padding(.bottom, 60)
                .navigationDestination(isPresented: $isHomeViewActive, destination: {
                    HomeView()
                })
                
                
                VStack {
                    Text("Inicia sesión con redes sociales")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.bottom, 20)
                    
                    HStack {
                        
                        Button(action: facebookLogin) {
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(.white.opacity(0.15))
                                .cornerRadius(6.0)
                        }
                        
                        Button(action: twitterLogin) {
                            Text("Twitter")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(.white.opacity(0.15))
                                .cornerRadius(6.0)
                        }
                        
                    }
                }
                
                
            }
            .padding(.horizontal, 20.0)
            
        }
    }
}

struct CustomSecureField: View {
    
    @State var showPassword: Bool = false
    
    @State var password = ""
    
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

func login(homeViewStatus: Binding<Bool>) {
    homeViewStatus.wrappedValue = true
}

func facebookLogin() {
    print("Estoy inciando sesión con facebook")
}

func twitterLogin() {
    print("Estoy inciando sesión con twitter")
}



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
                        
                        Button(action: facebookLogin) {
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(.white.opacity(0.15))
                                .cornerRadius(6.0)
                        }
                        
                        Button(action: twitterLogin) {
                            Text("Twitter")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.headline)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(.white.opacity(0.15))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
