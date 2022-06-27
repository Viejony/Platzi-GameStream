//
//  FavoritesTab.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 12/06/22.
//

import SwiftUI
import AVKit

struct FavoritesTab: View {
    @ObservedObject var allGames = ViewModel()
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack{
                Text("Favoritos".uppercased())
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(.bottom, 9.0)
                ScrollView{
                    ForEach(allGames.gamesInfo, id: \.self){game in
                        VStack(spacing: 0){
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 300)
                            Text("\(game.title)")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("BlueGray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                        
                    }
                }.padding(.bottom, 8)
            }.padding(.horizontal, 6)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoritesTab_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesTab()
    }
}
