//
//  Pie.swift
//  Memorize
//
//  Created by Jonas Zingler on 09.07.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)    // gets the center of the Circle
        let radius = min(rect.width, rect.height) / 2       // defines the radius of the circle with the shorter card length
        let start = CGPoint(                                // defines the upper starting point of the hole in the circle
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.x + radius * sin(CGFloat(startAngle.radians))
        )
        
        var p = Path()                                      // defines the pathe around the circle
        p.move(to: center)                                  // starting in the middle point
        p.addLine(to: start)                                // going upwards the vertical line
        p.addArc(center: center,                            // going along the radius of the circle
                 radius: radius,                            // using the previously defined variables
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: clockwise
        )
        p.addLine(to: center)
        return p
    }
}
