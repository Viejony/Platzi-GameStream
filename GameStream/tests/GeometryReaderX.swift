//
//  GeometryReaderX.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 16/06/22.
//

import SwiftUI

struct GeometryReaderX: View {
    var body: some View {
        GeometryReader{geometry in
            VStack{
                Image("perfilEjemplo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct GeometryReaderX_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderX()
    }
}
