//
//  SignUpView.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var loginType: Bool
    
    @State var email = ""
    
    @State var password = ""
    
    @State var confirmedPassword = ""
    
    @State var successfulSignUpView = false
    
    @State private var activeAlert: SignUpAlert?
    
    var body: some View {
        
        if successfulSignUpView {
            
            ScrollView {
                
                VStack(alignment: .center, spacing: 0) {
                    
                    Image(systemName: "checkmark.seal.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color("dark-cian"))
                        .padding(.bottom, 20)
                    
                    Text("REGISTRO EXITOSO")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    Text("Felicitaciones, tu cuenta ha sido creada de manera exitosa.")
                        .font(.title2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60)
                    
                    Button {
                        
                        loginType = true
                        
                    } label: {
                        
                        Text("CONTINUAR")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title2)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
                    }
                        
                    
                }
                .padding(.horizontal, 20)
                
            }
            
        } else {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        Text("Elige una foto de perfil")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title3)
                            .padding(.bottom, 6)
                        
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
                                    .font(.title)
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
                        
                        CustomSecureField(password: $password)
                        
                        Divider()
                            .frame(height: 1)
                            .background(.white)
                            .padding(.bottom, 30)
                        
                        Text("Confirmar contraseña*")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                            .padding(.bottom)
                        
                        CustomSecureField(password: $confirmedPassword)
                        
                        Divider()
                            .frame(height: 1)
                            .background(.white)
                            .padding(.bottom, 30)
                    }
                    
                    Spacer(minLength: 40)
                    
                    Button {
                        signUp(successfulSignUpView: $successfulSignUpView, email: email, password: password, confirmedPassword: confirmedPassword, activeAlert: $activeAlert)
                    } label: {
                        
                        Text("REGÍSTRATE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title2)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
                    }
                    .padding(.bottom, 60)
                    .alert(item: $activeAlert) { alertType in
                        switch alertType {
                        case .incorrectEmailFormat:
                            return Alert(title: Text("Error"), message: Text("El formato del email no es correcto."), dismissButton: .default(Text("Entendido")))
                        case .incorrectPasswordFormat:
                            return Alert(title: Text("Error"), message: Text("El formato de la contraseña no es correcto. La contraseña debe contener al menos 8 caracteres, una mayúscula, una minúscula y un número."), dismissButton: .default(Text("Entendido")))
                        case .passwordsDoNotMatch:
                            return Alert(title: Text("Error"), message: Text("Las contraseñas deben coincidir."), dismissButton: .default(Text("Entendido")))
                        }
                    }
                    
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
}

enum SignUpAlert: Identifiable {
    case incorrectEmailFormat
    case incorrectPasswordFormat
    case passwordsDoNotMatch
    
    var id: Int {
        switch self {
        case .incorrectEmailFormat:
            return 1
        case .incorrectPasswordFormat:
            return 2
        case .passwordsDoNotMatch:
            return 3
        }
    }
}

func takePhoto() {
    print("Tomar foto")
}

func signUp(successfulSignUpView: Binding<Bool>, email: String, password: String, confirmedPassword: String, activeAlert: Binding<SignUpAlert?>) {
    
    guard isValidEmail(email) else {
        
        activeAlert.wrappedValue = .incorrectEmailFormat
        return
    }
    
    guard isValidPassword(password) else {
        
        activeAlert.wrappedValue = .incorrectPasswordFormat
        return
    }
    
    guard password == confirmedPassword else {
        
        activeAlert.wrappedValue = .passwordsDoNotMatch
        return
    }
    
    SecurityDataManager.saveData(email: email, password: password, userName: email)
    
    successfulSignUpView.wrappedValue = true
    
    
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

func isValidPassword(_ password: String) -> Bool {
    let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
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
            
            SignUpView(loginType: .constant(false))
            
        }
    }
}
