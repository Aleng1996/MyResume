//
//  DotLineShape.swift
//  MyResume
//
//  Created by A Leng on 2023/6/6.
//

import SwiftUI

struct DotLineShape: Shape {
    
    enum LineStyle {case bottomHalf, full, topHalf}
    
    var lineWidth: CGFloat = 8
    var dotSize: CGFloat = 30
    var style: LineStyle = .full
    var dotYPosition: CGFloat {
        switch style {
        case .bottomHalf:
            return 0.2
        case .full:
            return 0.5
        case.topHalf:
            return 0.8
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in:  CGRect(x: rect.midX - (dotSize / 2),
                                    y:rect.maxY * dotYPosition - dotSize / 2,
                                    width: dotSize,
                                    height: dotSize))
        
        path.addRect(CGRect(x: rect.midX - (lineWidth / 2),
                            y:style == .bottomHalf ? rect.height * 0.2 : rect.minY,
                            width: lineWidth,
                            height:style == .full ? rect.height : rect.height * 0.8))
        
        return path
    }
    
   
}

struct DotLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 0){
            DotLineShape(style: .bottomHalf).background(.yellow)
            DotLineShape(style: .full).background(.blue)
            DotLineShape(style: .topHalf).background(.red)
        }
    }
}