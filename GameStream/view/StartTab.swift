//
//  StartScreen.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 11/06/22.
//

import SwiftUI
import AVKit

struct StartTab: View{
    var body: some View{
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack{
                Image("app_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11.0)
                
                ScrollView(showsIndicators: false){
                    SubmoduleHome()
                }
                
                
            }.padding(.horizontal, 18)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(false)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SubmoduleHome: View{
    @State var searchText = ""
    //@State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @ObservedObject var foundGame = SearchGame()
    @State var isGameViewActive = false
    @State var isGameInfoEmpty = false
    @State var sep: CGFloat = 30
    //@State var isPlayerActive = false
    
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var calification: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = []
    @State var imgsUrl: [String] = []
    
    var device = UIDevice.current.model
    var categoriesButtonWidth: CGFloat
    var categoriesButtonHeight: CGFloat
    var categoriesButtonImageWidth: CGFloat
    var categoriesButtonImageHeight: CGFloat
    
    
    let urlVideos:[String] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        VStack{
            
            // Search bar
            HStack{
                Button(action: {
                    let name = searchText
                    watchGame(name: name)
                }){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("DarkCyan"))
                }.alert(isPresented: $isGameInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                }
                ZStack(alignment: .leading){
                    if searchText.isEmpty{
                        Text("Buscar un video")
                            .foregroundColor(Color("SearchTextColor"))
                            .font(.body)
                    }
                    TextField("", text: $searchText)
                        .foregroundColor(.white)
                        .padding(.trailing, 11.0)
                        .font(.body)
                }
            }
            .padding([.top, .leading, .bottom], 11)
            .background(Color("BlueGray"))
            .clipShape(Capsule())
            
            // Most populars
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, sep)
            
            ZStack{
                Button(action: {
                    watchGame(name: "The Witcher 3")
                }){
                    VStack(spacing: 0){
                        Image("The Witcher 3")
                            .resizable()
                            .scaledToFit()
                        Text("The Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("BlueGray"))
                            .font(.body)
                    }
                }
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
            // Sugested categories
            Text("CATEGORIAS SUGERIDAS PARA TÍ")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, sep)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {print("FPS")}){
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("BlueGray"))
                                .frame(width: categoriesButtonWidth, height: categoriesButtonHeight)
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: categoriesButtonImageWidth, height: categoriesButtonImageHeight)
                        }
                    }
                    
                    Button(action: {print("Open World")}){
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("BlueGray"))
                                .frame(width: categoriesButtonWidth, height: categoriesButtonHeight)
                            
                            Image("RPG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: categoriesButtonImageWidth, height: categoriesButtonImageHeight)
                        }
                    }
                    
                    Button(action: {print("RPG")}){
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("BlueGray"))
                                .frame(width: categoriesButtonWidth, height: categoriesButtonHeight)
                            
                            Image("OpenWorld")
                                .resizable()
                                .scaledToFit()
                                .frame(width: categoriesButtonImageWidth, height: categoriesButtonImageHeight)
                        }
                    }
                }
            }
            
            // Sugested FOR YOU
            Text("RECOMENDADOS PARA TÍ")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, sep)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {
                        watchGame(name: "Abzu")
                    }){
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        watchGame(name: "Crash Bandicoot")
                    }){
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        watchGame(name: "DEATH STRANDING")
                    }){
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
            }
            
            // Videos you can like
            Text("Videos que podrían gustarte".uppercased())
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, sep)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button(action: {
                        watchGame(name: "Grand Theft Auto V")
                    }) {
                        Image("Grand Theft Auto V")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        watchGame(name: "Hades")
                    }) {
                        Image("Hades")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        watchGame(name: "Cuphead")
                    }) {
                        Image("Cuphead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
            }
            
        }
        
        NavigationLink(
            destination: GameDetails(
                url: url,
                title: title,
                studio: studio,
                calification: calification,
                publicationYear: publicationYear,
                description: description,
                tags: tags,
                imgsUrl: imgsUrl),
            isActive: $isGameViewActive){
                EmptyView()
            }
    }
    
    init(){
        if device == "iPad"{
            categoriesButtonWidth = 300
            categoriesButtonHeight = 180
            categoriesButtonImageWidth = 80
            categoriesButtonImageHeight = 80
        }
        else{
            categoriesButtonWidth = 160
            categoriesButtonHeight = 90
            categoriesButtonImageWidth = 42
            categoriesButtonImageHeight = 42
        }
    }
    
    
    func watchGame(name: String){
        print("Search game: \(name)")
        foundGame.search(name: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("Found games: \(foundGame.gameInfo.count)")
            
            if foundGame.gameInfo.count == 0{
                isGameInfoEmpty = true
            }
            else{
                url = foundGame.gameInfo[0].videosUrls.mobile
                title = foundGame.gameInfo[0].title
                studio = foundGame.gameInfo[0].studio
                calification = foundGame.gameInfo[0].contentRaiting
                publicationYear = foundGame.gameInfo[0].publicationYear
                description = foundGame.gameInfo[0].description
                tags = foundGame.gameInfo[0].tags
                imgsUrl = foundGame.gameInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
    }
    
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartTab()
            .previewDevice("iPhone 11")
        
        StartTab()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
