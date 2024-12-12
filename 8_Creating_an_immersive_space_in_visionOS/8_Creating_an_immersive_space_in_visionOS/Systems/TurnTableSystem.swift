//
//  TurnTableSystem.swift
//  8_Creating_an_immersive_space_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/12.
//

import SwiftUI
import RealityKit

struct TurnTableComponent: Component {
    /// 軌道効果の持続時間
    var time: TimeInterval = 0
    /// エンティティの移動速度
    var speed: TimeInterval
    /// 物体が公転する軸
    var axis: SIMD3<Float>
    /// 速度と軸の変数を設定して、ターンテーブル・コンポーネントを初期化
    init(speed: TimeInterval = 1.0, axis: SIMD3<Float> = [0, 1, 0]) {
        self.speed = speed
        self.axis = axis
    }
}

struct TurnTableSystem: System {
    /// エンティティが必要なコンポーネントを持つかどうかをチェックする値
    static let query = EntityQuery(where: .has(TurnTableComponent.self))
    /// RealityKitのシーンでシステムを初期化
    init(scene: RealityKit.Scene) {}
    /// エンティティを更新して、時間値と方向を適用
    func update(context: SceneUpdateContext) {
        // クエリに一致し、現在レンダリング中のエンティティを反復処理
        for entity in context.entities(matching: Self.query, updatingSystemWhen: .rendering) {
            /// エンティティから `TurnTableComponent` を取得する変数
            var comp = entity.components[TurnTableComponent.self]!
            // 時間が経つにつれて増加するように時間変数を設定
            comp.time += context.deltaTime
            // エンティティ内のコンポーネントを更新
            entity.components[TurnTableComponent.self] = comp
            // オリエンテーションを調整し、角度、スピード、回転軸を更新
            entity.setOrientation(
                simd_quatf(
                    angle: Float(0.1 * comp.speed),
                    axis: comp.axis
                ),
                relativeTo: entity
            )
        }
    }
}

