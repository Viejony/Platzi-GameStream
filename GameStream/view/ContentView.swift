//
//  ContentView.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 6/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    .ignoresSafeArea()
                
                VStack{
                    Image("app_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 42)
                        .padding(.top, 10)
                    
                    StartAndRegister()
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StartAndRegister: View{
    @State var initSessionType = true
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Button("INICIA SESIÓN"){
                    print("Login screen")
                    initSessionType = true
                }.foregroundColor(initSessionType ? .white : .gray)
                Spacer()
                Button("REGÍSTRATE"){
                    print("Sing in screen")
                    initSessionType = false
                }.foregroundColor(initSessionType ? .gray : .white)
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if initSessionType == true{
                StartSessionView()
            }else{
                SigninView()
            }
        }
    }
}

struct StartSessionView: View{
    @State var email: String
    @State var password = ""
    @State var isIncorrectCredentials = false
    @State var isHomeScreenActive = false
    var body: some View{
        ScrollView{
            
            // Email, password and init session button
            VStack(alignment: .leading){
                
                // Email
                
                Text("Correo electrónico")
                    .foregroundColor(Color("DarkCyan"))
                
                ZStack(alignment: .leading){
                    if email.isEmpty {
                        Text("ejemplo.com")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    TextField("", text: $email)
                        .foregroundColor(.gray)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCyan"))
                    .padding(.bottom)
                
                
                // Password
            
                Text("Contraseña")
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    if password.isEmpty {
                        Text("Escribe tu contraseña")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    SecureField("", text: $password)
                        .foregroundColor(.gray)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCyan"))
                    .padding(.bottom)
                
                HStack{
                    Spacer()
                    Text("¿Olvidaste tu contraseña?")
                        .foregroundColor(Color("DarkCyan"))
                        .font(.footnote)
                        .frame(alignment: .trailing)
                        .padding(.bottom)
                }
                
                // Button
                Button(action: initSession, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("DarkCyan"), lineWidth: 2.0)
                                .shadow(color: .white, radius: 6.0)
                        )
                }).alert(isPresented: $isIncorrectCredentials) {
                    Alert(title: Text("Error"), message: Text("Datos de usuario icorrectos"), dismissButton: .default(Text("Entendido")))
                }
                
            }.padding(.bottom, 20)
            
            // Sign in with social networks
            SigInWithsocialNetworksView()
            
            NavigationLink(destination: HomeScreen(), isActive: $isHomeScreenActive, label: {
                EmptyView()
            })
        }.frame(width: 300)
    }
    
    init(){
        let dataUser = SaveData()
        if !dataUser.getData()[0].isEmpty{  // Response data is not empty
            email = dataUser.getData()[0]
        }
        else{
            email = ""
        }
    }
    
    func initSession(){
        print("Starting session")
        
        let userData = SaveData()
        let correctCredentials = userData.validate(email: email, password: password)
        if correctCredentials{
            isHomeScreenActive = true
        }
        else{
            isIncorrectCredentials = true
        }
    }
}

struct SigninView: View{
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    var body: some View{
        ScrollView{
            VStack(alignment: .center){
                
                // Photo
                VStack{
                    Text("Elije una foto de perfil")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Puedes cambiar o elegirla más adelante")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    
                    Button(action: takePhoto) {
                        ZStack{
                            Image("perfilEjemplo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:100, height: 100)
                            Image(systemName: "camera")
                                .foregroundColor(.white)

                        }
                    }.padding(.bottom)
                }
                
                // Email, password and sing in button
                VStack(alignment: .leading){
                    
                    // Email
                    
                    Text("Correo electrónico*")
                        .foregroundColor(Color("DarkCyan"))
                    
                    ZStack(alignment: .leading){
                        if email.isEmpty {
                            Text("ejemplo.com")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        TextField("", text: $email)
                            .foregroundColor(.gray)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("DarkCyan"))
                        .padding(.bottom)
                    
                    
                    // Password
                
                    Text("Contraseña")
                        .foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        if password.isEmpty {
                            Text("Escribe tu contraseña")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        SecureField("", text: $password)
                            .foregroundColor(.gray)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("DarkCyan"))
                        .padding(.bottom)
                    
                    // Confirm Password
                
                    Text("Confirma contraseña")
                        .foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        if confirmPassword.isEmpty {
                            Text("Vuelve a escribir tu contraseña")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        SecureField("", text: $confirmPassword)
                            .foregroundColor(.gray)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("DarkCyan"))
                        .padding(.bottom)
                    
                    
                    // Button
                    Button(action: signIn, label: {
                        Text("Regístrate")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("DarkCyan"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6.0)
                            )
                    })
                    
                    
                }.padding(.bottom, 20)
                
                // Sign in with social networks
                SigInWithsocialNetworksView()
                
            }
        }.frame(width: 300)
    }
    
    func signIn(){
        print("Sign in")
        let userData = SaveData()
        let result = userData.saveData(email: email, password: password, username: "Lorem")
        print("Sign in result = \(result)")
    }
}

struct SigInWithsocialNetworksView: View{
    var body: some View{
        VStack{
            Text("Inicia sesión con redes sociales")
                .foregroundColor(.white)
            HStack{
                Button(action: signInWithFacebook){
                    ZStack{
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundColor(Color("DarkBlue"))
                        Text("Facebook")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 5)
                    }
                    
                }
                Spacer(minLength: 12)
                Button(action: signInWithTwitter){
                    ZStack{
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundColor(Color("DarkBlue"))
                        Text("Twitter")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 5)
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


func signInWithFacebook(){
    print("Sign in with Facebook")
}

func signInWithTwitter(){
    print("Sign in with Twitter")
}

func takePhoto(){
    print("Making a photo")
}
