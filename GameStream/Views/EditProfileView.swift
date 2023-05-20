//
//  EditProfileView.swift
//  GameStream
//
//  Created by user239477 on 5/20/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 0) {
                    
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
                    .padding(.bottom, 40)
                    
                    Text("Editar perfil")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title3)
                        .padding(.bottom, 40)
                    
                    Button(action: takePhoto) {
                        
                        ZStack {
                            
                            Image("exampleProfilePhoto")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        .padding(.bottom, 40)
                    }
                    
                    ModuleEdit()
                    
                }
                .padding(.horizontal, 20)
                
            }
            
        }
        .navigationBarBackButtonHidden()
        //Ver tema de barra de navegacion
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    
                    dismiss()
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                
            }
        }
        
    }
    
}

struct ModuleEdit: View {
    
    @State var email = ""
    
    @State var userName = ""
    
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
            
            CustomSecureField()
            
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
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                
                Divider()
                    .frame(height: 1)
                    .background(.white)
                    .padding(.bottom, 30)
                
            }
        }
        
        Spacer(minLength: 40)
        
        Button(action: updateData) {
            
            Text("ACTUALIZAR DATOS")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title2)
                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: Color("dark-cian"), radius: 5))
        }
        .padding(.bottom, 60)
        
    }
}

func updateData() {
    print("Actualizar Datos")
}


struct EditProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EditProfileView()
        
    }
}
