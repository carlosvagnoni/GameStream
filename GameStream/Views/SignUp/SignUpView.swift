//
//  SignUpView.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI
import PhotosUI

struct SignUpView: View {
    
    @EnvironmentObject var profilePhotoManager: ProfilePhotoManager
    @ObservedObject var signUpViewModel = SignUpViewModel()
    
    @Binding var loginType: Bool
    
    @State var selectedItem: PhotosPickerItem?
    @State var email = ""
    @State var password = ""
    @State var confirmedPassword = ""
    
    @State private var selectedPhotoData: Data?
    
    var body: some View {
        
        if signUpViewModel.successfulSignUpView {
            
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
                        signUpViewModel.successfulSignUpView = false
                        email = ""
                        password = ""
                        confirmedPassword = ""
                        
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
                        
                        ZStack {
                            
                            if let selectedPhotoData = selectedPhotoData,
                               let image = UIImage(data: selectedPhotoData) {
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                
                            } else {
                                
                                Image("exampleProfilePhoto")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                
                            }
                            
                            
                            
                            PhotosPicker(selection: $selectedItem,
                                         matching: .images) {
                                
                                Image(systemName: "camera")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                            }
                                         .onChange(of: selectedItem) { newItem in
                                             Task {
                                                 
                                                 if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                                     
                                                     selectedPhotoData = data
                                                     
                                                 }
                                             }
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
                        
                        signUpViewModel.signUp(email: email, password: password, confirmedPassword: confirmedPassword, selectedPhotoData: selectedPhotoData, profilePhotoManager: profilePhotoManager)
                        
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
                    .alert(item: $signUpViewModel.activeAlert) { alertType in
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
                            
                            Button(action: signUpViewModel.facebookSignUp) {
                                
                                Text("Facebook")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.headline)
                                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                    .background(Color("blue-gray"))
                                    .cornerRadius(6.0)
                                
                            }
                            
                            Button(action: signUpViewModel.twitterSignUp) {
                                
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

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            
            Spacer()
            
            Color("marine")
                .ignoresSafeArea()
            
            SignUpView(loginType: .constant(false))
                .environmentObject(ProfilePhotoManager())
        }
    }
}
