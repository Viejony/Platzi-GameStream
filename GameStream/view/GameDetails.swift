//
//  GameDetails.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 11/06/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameDetails: View {
    var url: String
    var title: String
    var studio: String
    var calification: String
    var publicationYear: String
    var description: String
    var tags: [String]
    var imgsUrl: [String]
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack{
                // Video player
                VideoOfGame(url: url)
                
                ScrollView{
                    // Text details
                    VideoInfo(
                        url: url,
                        title: title,
                        studio: studio,
                        calification: calification,
                        publicationYear: publicationYear,
                        description: description,
                        tags: tags).padding(.bottom)
                    
                    // Gallery with images of the game
                    Gallery(imgsUrl: imgsUrl)
                    
                    // Comments
                    CommentsSubmodule()
                    
                    // Similar games
                    SimilarGames()
                    
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct VideoOfGame: View{
    var url: String
    
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: 200)
    }
}

struct VideoInfo: View{
    var url: String
    var title: String
    var studio: String
    var calification: String
    var publicationYear: String
    var description: String
    var tags: [String]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("\(title)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                Text("\(calification)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                Text("\(publicationYear)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
            }
            
            Text("\(description)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                ForEach(tags, id: \.self){tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
                
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery: View{
    var imgsUrl: [String]
    let formGrid = [GridItem(.flexible())]
    var body: some View{
        VStack(alignment: .leading){
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.top, 5)
                .padding(.leading)
            ScrollView(.horizontal){
                LazyHGrid(rows: formGrid, spacing: 8){
                    ForEach(imgsUrl, id: \.self){urlImage in
                        // Load image from server using the url
                        KFImage(URL(string: urlImage))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }.frame(height: 180)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CommentsSubmodule: View{
    var comments = [Comment]()
    var body: some View{
        VStack(alignment: .leading){
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .font(.title)
                .padding(.top, 10)
                .padding(.leading)
            ForEach(comments, id: \.self){comment in

                VStack(alignment: .leading, spacing: 6){
                    HStack{
                        Image(comment.userImage)
                            .resizable()
                            //.aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 50, height: 50, alignment: .leading)
                        VStack(alignment: .leading){
                            Text(comment.userName)
                                .foregroundColor(.white)
                            Text(comment.publicationTime)
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        Spacer()
                    }
                    Text(comment.comment)
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(.top, 8)
                }
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color("BlueGray")).padding(5))
                
            }  // End of ForEach
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    init(){
        let comment1 = Comment(
            userName: "Lola",
            comment: "Este juego es una pérdida de tiempo. No debí ni siquiera ponerme a escribir sobre él. En definitiva no debo hacer este tipo de cosas y dedicarme a cosas más productivas. Mi jefe me dijo que estoy a un pelo de perder el trabajo, pero aún así, me importa un rabo. Lo más importante es saber escoger el trabajo. Pero no puse atención por estar jugando Minecraft. Debo dejar los vicios.",
            publicationTime: "Hace 5 segundos",
            userImage: "DEATH STRANDING")
        let comment2 = Comment(
            userName: "Ching Man",
            comment: "Me encanta la estética y el dilema moral entre la eleccón personal y el la imposición del destino sobre los actos fratisidas de Mario. Me inspira.",
            publicationTime: "Hace 10 días",
            userImage: "The Witcher 3")
        let comment3 = Comment(
            userName: "Alberto",
            comment: "No lo recomendo. Es muy malo.",
            publicationTime: "Hace 2 meses",
            userImage: "Hades")
        self.comments.append(comment1)
        self.comments.append(comment3)
        self.comments.append(comment2)
    }
}

struct SimilarGames: View{
    var gamePictures: [String] = []
    var body: some View{
        VStack(alignment: .leading){
            Text("Juegos similares".uppercased())
                .foregroundColor(.white)
                .font(.title)
                .padding(.top, 5)
                .padding(.leading)
            ScrollView(.horizontal){
                HStack{
                    ForEach(gamePictures, id: \.self){picture in
                        Image(picture)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 180)
                    }
                }
            }
        }
    }
    
    init(){
        gamePictures.append("Abzu")
        gamePictures.append("Crash Bandicoot")
        gamePictures.append("Cuphead")
        gamePictures.append("DEATH STRANDING")
        gamePictures.append("Grand Theft Auto V")
        gamePictures.append("Hades")
        gamePictures.append("The Witcher 3")
    }
}

struct GameDetails_Previews: PreviewProvider {
    static var previews: some View {
        GameDetails(url: "",
                    title: "Mario is dead",
                    studio: "Nintendo",
                    calification: "R",
                    publicationYear: "2666",
                    description: "The end of the legend is here...",
                    tags: ["plataformas", "mascota", "homicido involuntario"],
                    imgsUrl: [
                        "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg",
                        "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg",
                        "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
                    ])
        CommentsSubmodule()
    }
}
