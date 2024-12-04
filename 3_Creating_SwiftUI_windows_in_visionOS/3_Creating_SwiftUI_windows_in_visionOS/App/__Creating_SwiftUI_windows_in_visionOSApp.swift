//
//  __Creating_SwiftUI_windows_in_visionOSApp.swift
//  3_Creating_SwiftUI_windows_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/04.
//

import SwiftUI

@main
struct __Creating_SwiftUI_windows_in_visionOSApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            MainView()
        }

        // アプリのメインビューに新しく作成されたウィンドウの `WindowGroup`
        WindowGroup("New Window", for: NewWindowID.ID.self) { $id in
            NewWindowView(id: id ?? 1)
        }
     }
}
