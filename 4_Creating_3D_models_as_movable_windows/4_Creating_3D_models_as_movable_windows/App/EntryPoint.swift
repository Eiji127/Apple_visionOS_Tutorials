//
//  __Creating_3D_models_as_movable_windowsApp.swift
//  4_Creating_3D_models_as_movable_windows
//
//  Created by eiji.shirakazu on 2024/12/04.
//

import SwiftUI

@main
struct EntryPoint: App {
    /// ボリュメトリック・ウィンドウの高さの乗数
    let heightModifier: CGFloat = 0.25
    
    var body: some Scene {
        // ボリュームウィンドウを持つウィンドウグループを設定
        // また.defaultSizeにて。ボリューメトリック・ウィンドウのサイズに対してウィンドウ・グループのサイズをスケーリングする
        WindowGroup {
            VolumetricWindow()
        }
        .windowStyle(.volumetric)
        .defaultSize(
            width: VolumetricWindow.defaultSize,
            height: heightModifier * VolumetricWindow.defaultSize,
            depth: VolumetricWindow.defaultSize,
            in: .meters
        )
    }
}
