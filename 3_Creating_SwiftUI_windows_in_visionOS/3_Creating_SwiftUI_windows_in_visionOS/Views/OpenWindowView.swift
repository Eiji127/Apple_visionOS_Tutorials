//
//  OpenWindowView.swift
//  3_Creating_SwiftUI_windows_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/04.
//

import SwiftUI

struct OpenWindowView: View {
    /// SwiftUI ウィンドウを識別するためにメインビューが使う `id` 値
    @State var nextWindowID = NewWindowID(id: 1)
    
    /// OpenWindowActionインスタンスを取得するための環境値
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        Button {
            // 指定されたIDで新しいウィンドウを開く
            openWindow(value: nextWindowID.id)
            // nextWindowID`の`id`値を1だけインクリメントする
            nextWindowID.id += 1
        } label: {
            Text("Open a new window")
        }
    }
}

/// 各ウィンドウに一意のIDを与える構造体
struct NewWindowID: Identifiable {
    /// ウィンドウの一意な識別子
    var id: Int
}
