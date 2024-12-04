//
//  MainView.swift
//  3_Creating_SwiftUI_windows_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/04.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MainView: View {

    var body: some View {
        OpenWindowView()
    }
}

#Preview(windowStyle: .automatic) {
    MainView()
        .environment(AppModel())
}
