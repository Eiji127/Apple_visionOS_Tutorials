//
//  NewWindowView.swift
//  3_Creating_SwiftUI_windows_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/04.
//

import SwiftUI

struct NewWindowView: View {
    /// ウィンドウの一意な識別子
    let id: Int

    var body: some View {
        // ウィンドウの`id`値を表示するテキストビューを作成
        Text("New window number \(id)")
    }
}
