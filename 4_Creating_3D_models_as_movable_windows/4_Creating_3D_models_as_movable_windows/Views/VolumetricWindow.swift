//
//  VolumetricWindow.swift
//  4_Creating_3D_models_as_movable_windows
//
//  Created by eiji.shirakazu on 2024/12/04.
//

import SwiftUI
import RealityKit

/// 3Dモデルを読み込み、ボリュームウィンドウの寸法をモデルと同じサイズに設定するView
struct VolumetricWindow: View {
    /// 立方体の体積ウィンドウの各辺のデフォルトの長さをメートル単位で指定
    static let defaultSize: CGFloat = 0.5
    /// 読み込む3Dモデルのファイル名
    let modelName: String = "cup_saucer_set"
        
    var body: some View {
        // GeometryReader3Dで高さ、横幅、奥行きの情報を取得する
        GeometryReader3D { geometry in
            RealityView { content in
                // ファイル名をソースとして使用するエンティティのロードを試みる
                guard let model = try? await ModelEntity(named: modelName) else {
                    return
                }
                
                // 3Dモデルを`RealityView`に追加する。
                content.add(model)
            } update: { content in
                // リサイズするロードされたエンティティを取得
                guard let model = content.entities.first(where: { $0.name == modelName }) else {
                    return
                }
                // ローカル座標でのボリュームの寸法
                let viewBounds = content.convert(
                    geometry.frame(in: .local),
                    from: .local,
                    to: .scene
                )
                // モデルの位置をビジュアルバウンディングボックスの一番下に設定
                model.position.y -= model.visualBounds(relativeTo: nil).min.y
                // モデルのY軸上の位置を調整し、ビュー境界に合わせる
                model.position.y += viewBounds.min.y
                
                /// 縮尺が1の場合のモデルの基本サイズ
                let baseExtents = model.visualBounds(relativeTo: nil).extents / model.scale
                /// モデルがボリューメトリックウィンドウの境界にフィットするために必要なスケール
                let scale = Float(viewBounds.extents.x) / baseExtents.x
                // モデルにスケールを適用して、ウィンドウの全サイズを埋める
                model.scale = SIMD3<Float>(repeating: scale)
            }
        }
    }
}

#Preview (windowStyle: .volumetric) {
    VolumetricWindow()
}
