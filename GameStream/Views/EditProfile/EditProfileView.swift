//
//  EditProfileView.swift
//  GameStream
//
//  Created by user239477 on 5/20/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var profilePhotoManager: ProfilePhotoManager
    
    @ObservedObject var editProfileViewModel = EditProfileViewModel()
    
    @State var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    
                    Button {
                        
                        dismiss()
                        
                    } label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 0))
                    
                    HStack(spacing: 0) {
                        
                        Image("appLogoController")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 23)
                            .padding(.trailing, 10.0)
                        
                        Image("appLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 170, height: 23)
                        
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 35))
                    .frame(maxWidth: .infinity)
                    .alignmentGuide(.leading) { d in d[HorizontalAlignment.center] }
                }
                
                if editProfileViewModel.successfulUpdateDataView {
                    
                    VStack(spacing: 0) {
                        
                        Image(systemName: "checkmark.seal.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("dark-cian"))
                            .padding(.bottom, 20)
                        
                        Text("MODIFICACIÓN EXITOSA")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        Text("Felicitaciones, tus datos han sido actualizados de manera exitosa.")
                            .font(.title2)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 60)
                        
                        Button {
                            
                            dismiss()
                            
                            editProfileViewModel.successfulUpdateDataView = false
                            editProfileViewModel.email = ""
                            editProfileViewModel.password = ""
                            editProfileViewModel.userName = ""
                            
                        } label: {
                            
                            Text("CONTINUAR")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.title2)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
                        }
                        
                        Spacer()

                        
                    }
                    .padding(.horizontal, 20)
                    
                } else {
                    
                    Text("Editar perfil")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title3)
                        .padding(.bottom, 40)
                        
                    ZStack {
                        
                        if let selectedPhotoData = selectedPhotoData,
                                        let image = UIImage(data: selectedPhotoData) {
                            
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                            
                                    } else if let savedProfilePhotoData = profilePhotoManager.photoData,
                                        let savedProfilePhoto = UIImage(data: savedProfilePhotoData) {
                                        
                                        Image(uiImage: savedProfilePhoto)
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
                    .padding(.bottom, 40)
                    
                    
                    ScrollView {
                        
                        VStack(spacing: 0) {
                            
                            ModuleEdit(selectedPhotoData: $selectedPhotoData, email: $editProfileViewModel.email, password: $editProfileViewModel.password, userName: $editProfileViewModel.userName, editProfileViewModel: editProfileViewModel)
                            
                        }
                        .padding(.horizontal, 20)
                        
                    }
                    
                }
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden()
        
        
    }
    
}

struct ModuleEdit: View {
    
    @EnvironmentObject var profilePhotoManager: ProfilePhotoManager
    
    @Binding var selectedPhotoData: Data?
    @Binding var email: String
    @Binding var password: String
    @Binding var userName: String
    
    var editProfileViewModel: EditProfileViewModel
    
    
    var body: some View {
        
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
            
        }
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Contraseña")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
            
            CustomSecureField(password: $password)
            
            Divider()
                .frame(height: 1)
                .background(.white)
                .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Nombre")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                
                TextField(text: $userName) {
                    
                    Text(verbatim: "Escribe tu nombre de usuario")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                }
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .frame(height: 20)
                .padding(.bottom, 8)
                .foregroundColor(.white)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled(true)
                
                Divider()
                    .frame(height: 1)
                    .background(.white)
                    .padding(.bottom, 30)
                
            }
        }
        
        Spacer(minLength: 40)
        
        Button{
            
            editProfileViewModel.updateData(email: email, password: password, userName: userName, selectedPhotoData: selectedPhotoData, profilePhotoManager: profilePhotoManager)
            
        } label: {
            
            Text("ACTUALIZAR DATOS")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title2)
                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
                .alert(item: Binding(
                    
                    get: { self.editProfileViewModel.activeAlert },
                    set: { self.editProfileViewModel.activeAlert = $0 }
                    
                )) { alertType in
                    switch alertType {
                        
                    case .incorrectEmailFormat:
                        return Alert(title: Text("Error"), message: Text("El formato del email no es correcto."), dismissButton: .default(Text("Entendido")))
                        
                    case .incorrectPasswordFormat:
                        return Alert(title: Text("Error"), message: Text("El formato de la contraseña no es correcto. La contraseña debe contener al menos 8 caracteres, una mayúscula, una minúscula y un número."), dismissButton: .default(Text("Entendido")))
                        
                    case .credentialsSameAsCurrent:
                        return Alert(title: Text("Error"), message: Text("Las credenciales no pueden ser las mismas que las actuales."), dismissButton: .default(Text("Entendido")))
                        
                    case .emptyUserName:
                        return Alert(title: Text("Error"), message: Text("El nombre de usuario no puede estar vacío."), dismissButton: .default(Text("Entendido")))
                    }
                }
        }
        
        
    }
}


struct EditProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EditProfileView()
            .environmentObject(ProfilePhotoManager())
        
    }
}
