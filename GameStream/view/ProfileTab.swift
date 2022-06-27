//
//  ProfileTab.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 12/06/22.
//

import SwiftUI

struct ProfileTab: View {
    @State var username: String
    @State var profileImage: UIImage = UIImage(named: "perfilEjemplo")!
    
    var body: some View {
        ZStack {
            Color("Marine")
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            VStack {
                
                Text("Perfil")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Image(uiImage: profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 118, height: 118)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                
                Text("\(username)")
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .font(.body)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding()
                
                Text("Ajustes")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                
                SettingsModule()
                
                Spacer()
                
                
            }
        }
        .onAppear {
            print("Getting user data in user defaults")
            
            let userData = SaveData()
            username = userData.getData()[2]
            
            // Load image
            if getUIImage(named: "profilePhoto") != nil{
                profileImage = getUIImage(named: "profilePhoto")!
            }
            else{
                print("Profile image not found")
            }
        }
        .onDisappear{
            
        }
    }
    
    init(){
        let userData = SaveData()
        username = userData.getData()[2]
    }
    
    func getUIImage(named: String) -> UIImage?{
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}

struct SettingsModule: View{
    @State var isToggleOn = true
    @State var isEditProfileActive = false
    var body: some View{
        VStack(spacing: 3){
            
            // Account button
            Button(action: {}) {
                HStack {
                    Text("Cuenta")
                        .foregroundColor(.white)
                        .font(.body)
                    Spacer()
                    Text(">")
                        .foregroundColor(.white)
                        .font(.body)
                }.padding()
            }
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .padding(.horizontal, 1.0)
            
            // Notifications button
            Button(action: {}) {
                HStack {
                    Text("Notificaciones")
                        .foregroundColor(.white)
                        .font(.body)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding()
            }
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .padding(.horizontal, 1.0)
            
            // Edit profile button
            Button(action: {
                isEditProfileActive = true
            }) {
                HStack {
                    Text("Editar perfil")
                        .foregroundColor(.white)
                        .font(.body)
                    Spacer()
                    Text(">")
                        .foregroundColor(.white)
                        .font(.body)
                }.padding()
            }
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .padding(.horizontal, 1.0)
            
            // Calificate this app
            Button(action: {}) {
                HStack {
                    Text("Califica esta aplicación")
                        .foregroundColor(.white)
                        .font(.body)
                    Spacer()
                    Text(">")
                        .foregroundColor(.white)
                        .font(.body)
                }.padding()
            }
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .padding(.horizontal, 1.0)
            
            NavigationLink(
                destination: EditProfileScreen(),
                isActive: $isEditProfileActive) {
                    EmptyView()
                }
        }
        
    }
}

struct ProfileTab_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab()
    }
}
