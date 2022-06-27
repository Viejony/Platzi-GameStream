//
//  OffsetPosition.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 16/06/22.
//

import SwiftUI

struct OffsetPosition: View {
    var body: some View {
        GeometryReader{geometry in
            VStack{
                Offsets()
                Positions()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Positions: View{
    var body: some View{
        Image("perfilEjemplo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .position(x: 0, y: 0)
    }
}

struct Offsets: View{
    var body: some View{
        Image("perfilEjemplo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .offset(x: 40, y: 40)
        Text("Hello")
            .foregroundColor(.yellow)
            .font(.title)
            .fontWeight(.bold)
    }
}

struct OffsetPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetPosition()
    }
}
