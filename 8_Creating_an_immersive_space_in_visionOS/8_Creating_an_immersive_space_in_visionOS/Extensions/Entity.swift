//
//  Entity.swift
//  8_Creating_an_immersive_space_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/12.
//

import RealityKit

extension Entity {
    /// 3Dモデルのリソースファイル名
    static var fileName: String = "rock"
    /// モデルコンポーネントは与えられたファイル名をロード
    static var rockModel: ModelComponent = {
        let rock = try! Entity.loadModel(named: fileName)
        return rock.model!
    }()
    
    /// 各岩石モデルに、一連のランダムな回転、平行移動、スケールを割り当てる
    func addHalo() {
        /// 生成するモデルの数
        let modelCount: Int = 50
        // 各モデルを作成し、ランダムな変換、スケール、時間間隔を適用
        for _ in 0..<modelCount {
            /// モデルの専用エンティティ
            let entity = Entity()
            /// モデルをコンポーネントとして割り当てる
            entity.components.set(Self.rockModel)
            /// Y軸に沿ったランダムな回転を含む変換
            let rotate0 = Transform(
                rotation: simd_quatf(
                    angle: .random(in: 0...(2 * .pi)),
                    axis: [0, 1, 0]
                )
            ).matrix
            /// Z軸に沿って調整するトランスフォーム
            let translate = Transform(translation: [0, 0, 1]).matrix
            /// Y軸に沿ったランダムな回転を含む変換
            let rotate1 = Transform(
                rotation: simd_quatf(
                    angle: .random(in: 0...(2 * .pi)),
                    axis: [0, 1, 0]
                )
            ).matrix
            /// X軸に沿ったランダムな回転を含む変換
            let rotate2 = Transform(
                rotation: simd_quatf(
                    angle: .random(in: (-.pi / 9)...(.pi / 9)),
                    axis: [1, 0, 0]
                )
            ).matrix
            // 回転と平行移動の各変数の行列積に基づいて、エンティティに変換を割り当てる
            entity.transform = Transform(matrix: rotate1 * rotate2 * translate * rotate0)
            // すべての軸に沿ったランダムなスケールをエンティティに割り当てる
            entity.setScale(
                SIMD3(repeating: 0.001 * .random(in: 0.5...2)),
                relativeTo: entity
            )
            // エンティティの `TurnTableComponent` に、軸に沿って回転するランダムな速度を割り当てる
            entity.components.set(
                TurnTableComponent(
                    speed: .random(in: 0.001...0.1),
                    axis: [.random(in: -1...1), .random(in: -1...1), .random(in: -1...1)]
                )
            )
            // エンティティをサブエンティティとして追加
            self.addChild(entity)
        }
    }
}
