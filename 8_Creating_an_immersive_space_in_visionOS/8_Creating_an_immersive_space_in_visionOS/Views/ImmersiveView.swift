//
//  ImmersiveView.swift
//  8_Creating_an_immersive_space_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/12.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    /// 人間の平均身長（メートル）
    let avgHeight: Float = 1.70
    /// 岩石が公転する運動速度
    let speed: TimeInterval = 0.03
    // `RealityView`を起動して、人の周りを回る岩の輪を作成
    var body: some View {
        RealityView { content in
            /// モデルを格納するエンティティ
            let rootEntity = Entity()
            // Y軸の位置を人間の平均身長に設定
            rootEntity.position.y += avgHeight
            // ハローエフェクトを作成
            rootEntity.addHalo()
            // 岩石の回転速度を設定
            rootEntity.components.set(TurnTableComponent(speed: speed))
            // 回転ロジックを処理するために `TurnTableSystem` を登録
            TurnTableSystem.registerSystem()
            // エンティティをビューに追加
            content.add(rootEntity)
        }
    }
}
