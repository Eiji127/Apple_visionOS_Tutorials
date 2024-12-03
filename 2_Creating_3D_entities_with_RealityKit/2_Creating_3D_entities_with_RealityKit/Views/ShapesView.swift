//
//  ShapesView.swift
//  2_Creating_3D_entities_with_RealityKit
//
//  Created by eiji.shirakazu on 2024/11/28.
//

import SwiftUI
import RealityKit

struct ShapesView: View {
    var body: some View {
        RealityView { content in
            addGeometryShapes(to: content)
        }
    }
    
    /// すべての幾何学的形状を配置し、シーンに追加
    func addGeometryShapes(to content: RealityViewContent) {
        /// さまざまな形状を表すすべての 3D エンティティの配列
        let allGeometryEntities = [
            ShapesView.boxEntity,
            ShapesView.roundedBoxEntity,
            ShapesView.sphereEntity,
            ShapesView.coneEntity,
            ShapesView.cylinderEntity
        ]
        
        var xOffset: Float = -0.25
        
        // エンティティをX軸に沿って配置し、コンテンツに追加する。
        for entity in allGeometryEntities {
            entity.position.x = xOffset
            content.add(entity)
            xOffset += 0.125
        }
    }
}

#Preview(windowStyle: .automatic) {
    ShapesView()
}
