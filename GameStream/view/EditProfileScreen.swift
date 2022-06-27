//
//  EditProfileScreen.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 12/06/22.
//

import SwiftUI

struct EditProfileScreen: View {
    @State var profileImage: Image? = Image("perfilEjemplo")
    @State var isCameraActive = false
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            ScrollView{
                
                // Title
                Text("Editar perfil")
                    .foregroundColor(.white)
                    .font(.title2)
                
                // User photo
                VStack{
                    Button(action: {
                        isCameraActive = true
                    }) {
                        ZStack {
                            profileImage!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive) {
                                    SUImagePickerView(
                                        sourceType: .photoLibrary,
                                        image: self.$profileImage,
                                        isPresented: $isCameraActive)
                                }
                            Image(systemName: "camera")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .frame(width: 40)
                                
                        }
                    }
                }.padding(.bottom, 18)
                
                // Edit Module
                EditProfileModule()
            }
        }
    }
}

struct EditProfileModule: View{
    @State var email: String
    @State var password: String
    @State var username: String
    
    var body: some View{
        VStack(alignment: .leading){
            
            // Email
            Text("Correo electrónico")
                .foregroundColor(Color("DarkCyan"))
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .leading) {
                if email.isEmpty{
                    Text("ejemplo_gmail.com")
                        .foregroundColor(Color("SearchTextColor"))
                        .font(.body)
                }
                TextField("", text: $email)
                    .foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("DarkCyan"))
            
            // Password
            Text("Contraseña")
                .foregroundColor(.white)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 12)
            
            ZStack(alignment: .leading) {
                if email.isEmpty{
                    Text("Contraseña")
                        .foregroundColor(Color("SearchTextColor"))
                        .font(.body)
                }
                SecureField("", text: $password)
                    .foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("DarkCyan"))
            
            // Username
            Text("Nombre")
                .foregroundColor(.white)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 12)
            
            ZStack(alignment: .leading) {
                if email.isEmpty{
                    Text("Introduce tu nombre de usuario")
                        .foregroundColor(Color("SearchTextColor"))
                        .font(.body)
                }
                TextField("", text: $username)
                    .foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("DarkCyan"))
            
            // Update data button
            Button {
                updateProfileData()
            } label: {
                Text("Actualizar datos".uppercased())
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("DarkCyan"), lineWidth: 2.0)
                            .shadow(color: .white, radius: 6.0)
                    )
            }.padding(.top, 32)

                
        }.padding(.horizontal, 42.0)
    }
    
    init(){
        let dataSaver = SaveData()
        let userData = dataSaver.getData()
        email = userData[0]
        password = userData[1]
        username = userData[2]
        print("userdata = \(userData)")
        print("user = \(userData[2]), email = \(userData[0]), password = \(userData[1])")
        print("user = \(username), email = \(email), password = \(password)")
    }
    
    func updateProfileData(){
        let dataSaver = SaveData()
        let result = dataSaver.saveData(email: email, password: password, username: username)
        print("Updating data: result = \(result), user = \(username), email = \(email), password = \(password)")
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen()
    }
}
