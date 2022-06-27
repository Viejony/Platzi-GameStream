//
//  HomeScreen.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 7/06/22.
//

import SwiftUI

struct HomeScreen: View {
    @State var selectedTab: Int = 2
    var body: some View {
        TabView(selection: $selectedTab){
            
            ProfileTab()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")}.tag(0)
            GamesTab()
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")}.tag(1)
            
            StartTab()
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")}.tag(2)
            
            FavoritesTab()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")}.tag(3)
            
        }.accentColor(.white)
        
    }
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
