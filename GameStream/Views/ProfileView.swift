//
//  ProfileView.swift
//  GameStream
//
//  Created by user239477 on 5/20/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var userName: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
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
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0))
                    
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            
                            Text("Perfil")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.title3)
                                .padding(.bottom, 40)
                            
                            VStack(spacing: 0) {
                                
                                Image("exampleProfilePhoto")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(.bottom, 15)
                                
                                Text(userName)
                                    .padding(.bottom, 40)
                                    .foregroundColor(.white)
                                    .onAppear {
                                        
                                        userName = SecurityDataManager.retrieveData()[2]
                                        
                                        
                                        
                                    }
                                
                            }
                            
                            Text("AJUSTES")
                                .font(.title2)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        settingsModule()
                    }
                    
                    
                    
                    
                }
                
                
                
                
                
            }
            
            
        }
        
    }
}

struct settingsModule: View {
    
    @State var isToggleOn = true
    
    @State var isEditProfileViewActive = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Button {
                
                print("Ir a cuenta")
                
            } label: {
                
                HStack(spacing: 0) {
                    
                    Text("Cuenta")
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.leading, 20)
                        
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.trailing, 20)
                    
                }
                .frame(height: 85)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color("blue-gray"))
                .padding(.bottom, 5)
                
            }
            
            
            
            HStack(spacing: 0) {
                
                Text("Notificaciones")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(.leading, 20)
                
                
                Spacer()
                
                Toggle("", isOn: $isToggleOn)
                    .padding(.trailing, 20)
                    .tint(Color(.green))
                
            }
            .frame(height: 85)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color("blue-gray"))
            .padding(.bottom, 5)
            
            
            
            Button {
                
                isEditProfileViewActive = true
                
            } label: {
                
                HStack(spacing: 0) {
                    
                    Text("Editar perfil")
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.leading, 20)
                        
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.trailing, 20)
                    
                }
                .frame(height: 85)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color("blue-gray"))
                .padding(.bottom, 5)
                
            }
            
            Button {
                
                print("Ir a calificar aplicacion")
                
            } label: {
                
                HStack(spacing: 0) {
                    
                    Text("Califica esta aplicación")
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.leading, 20)
                        
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.trailing, 20)
                    
                }
                .frame(height: 85)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color("blue-gray"))
                .padding(.bottom, 5)
                
            }
            
            NavigationLink(destination: EditProfileView(), isActive: $isEditProfileViewActive) {
                EmptyView()
            }
            
        }
        


        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ProfileView()
        
    }
}
