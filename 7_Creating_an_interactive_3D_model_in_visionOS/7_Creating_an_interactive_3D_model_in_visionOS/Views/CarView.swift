//
//  CarView.swift
//  7_Creating_an_interactive_3D_model_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/10.
//

import SwiftUI
import RealityKit

struct CarView: View {
    /// エンティティの初期位置
    @State var initialPosition: SIMD3<Float>? = nil
    /// エンティティの初期スケール
    @State var initialScale: SIMD3<Float>? = nil
    /// ジェスチャーはルート・コンポーネントの有無をチェックし、エンティティの位置を調整
    var translationGesture: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                /// ドラッグジェスチャがターゲットとするエンティティ
                let rootEntity = value.entity
                // `nil` の場合は `initialPosition` にエンティティの初期位置を設定
                if initialPosition == nil {
                    initialPosition = rootEntity.position
                }
                /// グローバルワールド空間をエンティティのシーンワールド空間に変換する動き
                let movement = value.convert(value.translation3D, from: .global, to: .scene)
                // ドラッグジェスチャに合わせてエンティティの位置を適用し、地面レベルにとどまるように動きを設定
                rootEntity.position = (initialPosition ?? .zero) + movement.grounded
            }
            .onEnded { _ in
                initialPosition = nil
            }
    }
    /// ジェスチャーは、ルート・コンポーネントがあるかどうかをチェックし、エンティティのスケールを調整
    var scaleGesture: some Gesture {
        MagnifyGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                /// 拡大ジェスチャの対象となるエンティティ
                let rootEntity = value.entity
                // `nil` の場合は `initialScale` にエンティティの初期スケールを設定
                if initialScale == nil {
                    initialScale = rootEntity.scale
                }
                /// モデルの拡大縮小率
                let scaleRate: Float = 1.0
                // ジェスチャーの相対的な倍率によって、エンティティを滑らかに拡大
                rootEntity.scale = (initialScale ?? .init(repeating: scaleRate) * Float(value.gestureValue.magnification))
            }
            .onEnded { _ in
                initialScale = nil
            }
    }
    
    var body: some View {
        RealityView { content in
            /// モデルのファイル名
            let fileName: String = "Huracan-EVO-RWD-Spyder-opt-22"
            /// ファイル名から非同期にロードされるモデル
            guard let car = try? await ModelEntity(named: fileName) else {
                assertionFailure("Failed to load model: \(fileName)")
                return
            }
            /// 車の視覚的な境界線
            let bounds = car.visualBounds(relativeTo: nil)
            /// モデルのサイズによるコリジョンボックスの幅
            let carWidth: Float = (car.model?.mesh.bounds.max.x)!
            /// モデルのサイズによるコリジョンボックスの高さ
            let carHeight: Float = (car.model?.mesh.bounds.max.y)!
            /// モデルのサイズによるコリジョンボックスの深さ
            let carDepth: Float = (car.model?.mesh.bounds.max.z)!
            /// 車の衝突モデルを囲むボックス
            let boxShape = ShapeResource.generateBox(
                width: carWidth,
                height: carHeight,
                depth: carDepth
            )
            // ボックス形状をコリジョンコンポーネントとして追加
            car.components.set(CollisionComponent(shapes: [boxShape]))
            // ハンドジェスチャーからの入力を有効にする
            car.components.set(InputTargetComponent())
            // 地上でのエンティティのスポーン位置を設定
            car.position.y -= bounds.min.y
            // z軸に沿ったスポーン位置を、ビジュアルバウンズの半径で設定
            car.position.z += bounds.min.z
            // x軸に沿ったスポーン位置を、ビジュアルバウンズの半径で設定
            car.position.x += bounds.min.x
            
            car.scale /= 1.5
            
            // RealityViewに車のモデルを追加
            content.add(car)
        }
        .gesture(translationGesture)
        .gesture(scaleGesture)
    }
}
