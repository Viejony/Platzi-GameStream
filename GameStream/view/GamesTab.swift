//
//  GamesScreen.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 10/06/22.
//

import SwiftUI
import Kingfisher

struct GamesTab: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    @State var gameviewIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var calification: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
                
            VStack{
                
                // Title
                Text("Juegos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                // Content
                ScrollView{
                    
                    LazyVGrid(columns: formGrid, spacing: 8){
                        ForEach(allVideoGames.gamesInfo, id: \.self){ game in
                            Button {
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                calification = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                             
                                tags = game.tags
                                imgsUrl = game.galleryImages
                                print("Click on game \(title)")
                                gameviewIsActive = true
                            } label: {
                                //Text("\(game.title)")
                                KFImage(URL(string: game.galleryImages[0]))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                    .padding(.bottom, 12)
                                
                            }
                        }
                    }
                }
                
            }
            .padding(.horizontal, 6)
            
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
                isActive: $gameviewIsActive)
            {
                EmptyView()
            }

        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            print("JSON is empty: \(allVideoGames.gamesInfo.isEmpty)")
            if !allVideoGames.gamesInfo.isEmpty{
                print("First element of the JSON \(allVideoGames.gamesInfo[0])")
                print("First videogame title in the JSON \(allVideoGames.gamesInfo[0].title)")
            }
        }
    }
}

/*
struct GamesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GamesScreen()
    }
}
*/
