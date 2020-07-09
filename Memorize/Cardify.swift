//
//  Cardify.swift
//  Memorize
//
//  Created by Jonas Zingler on 09.07.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content             // This hole modifier modifys <-- this Content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                
                }
            }
        }
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 4
}

extension View{
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
