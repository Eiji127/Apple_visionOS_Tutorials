//
//  ContentView.swift
//  1_Creating_2D_shapes_with_SwiftUI
//
//  Created by eiji.shirakazu on 2024/11/27.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ShapeView: View {
    
    var body: some View {
        /// 各図形の間隔
        let spaceBetweenShapes: CGFloat = 30.0
        /// 各図形の枠の幅と高さ
        let shapeScale: CGFloat = 100.0
        /// 各図形のすべての線の幅。
        let strokeWidth: CGFloat = 5.0
        
        /// 三角形の上辺の角
        let vertex1 = CGPoint(x: 0.0, y: 0.0)
        /// 三角形の左下の角
        let vertex2 = CGPoint(x: shapeScale, y: shapeScale)
        /// 三角形の右下の角
        let vertex3 = CGPoint(x: 0.0, y: shapeScale)
        
        /// 破線のパターン
        let strokePattern = [3 * strokeWidth, 2 * strokeWidth]
        
        HStack(spacing: spaceBetweenShapes) {
            Circle()
                .stroke(lineWidth: strokeWidth)
                .frame(width: shapeScale, height: shapeScale)
            
            Triangle(vertex1, vertex2, vertex3)
                .stroke(lineWidth: strokeWidth)
                .frame(width: shapeScale, height: shapeScale)
            
            Rectangle()
                .stroke(lineWidth: strokeWidth)
                .frame(width: shapeScale, height: shapeScale)
            
            Line(shapeScale)
                .dashed(strokeWidth, strokePattern)
                .frame(width: shapeScale, height: shapeScale)
        }
    }
}

struct Line: Shape {
    let endPoint1: CGPoint
    let endPoint2: CGPoint
    
    init(_ length: CGFloat) {
        let point = CGPoint(x: length, y: 0.0)
        self.init(point)
    }

    init(_ point1: CGPoint, _ point2: CGPoint? = nil) {
        if let point2 {
            endPoint1 = point1
            endPoint2 = point2
        } else {
            endPoint1 = CGPoint.zero
            endPoint2 = point1
        }
    }
    
    func path(in bounds: CGRect) -> Path {
        /// 三角形の描画パス
        var path = Path()
        
        // 2つの端点の間に線を引く
        path.move(to: endPoint1)
        path.addLine(to: endPoint2)
        
        return path
    }
}

extension Line {
    /// 破線を描画
    func dashed(_ width: CGFloat,
                _ dashPattern: [CGFloat]? = nil) -> some Shape {
        let pattern = dashPattern ?? [width]
        let style = StrokeStyle(lineWidth: width, dash: pattern)

        return stroke(style: style)
    }
}

struct Triangle: Shape {
    let vertex1: CGPoint
    let vertex2: CGPoint
    let vertex3: CGPoint
    
    init(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint) {
        vertex1 = point1
        vertex2 = point2
        vertex3 = point3
    }

    func path(in bounds: CGRect) -> Path {
        /// 三角形の描画パス
        var path = Path()


        // 最初の頂点をスタート
        path.move(to: vertex1)


        // 三角形の最初の2辺を描く
        path.addLine(to: vertex2)
        path.addLine(to: vertex3)
        
        // 最初の頂点に戻って三角形の3番目の辺を描く
        path.closeSubpath()


        return path
    }
}

#Preview(windowStyle: .automatic) {
    ShapeView()
        .environment(AppModel())
}

