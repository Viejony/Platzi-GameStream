//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 6/06/22.
//

import SwiftUI

@main
struct GameStreamApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            print("phase = \(phase)")
            
            if phase == .inactive{
                print("phase: is inactive. Should save the data")
            }
        }
    }
    
    init(){  // Start point of the app
        
    }
    
    
}
