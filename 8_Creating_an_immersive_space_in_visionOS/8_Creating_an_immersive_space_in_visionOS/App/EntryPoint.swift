//
//  EntryPoint.swift
//  8_Creating_an_immersive_space_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/12.
//

import SwiftUI

@main
struct EntryPoint: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        // シーンの一部として没入空間を定義
        ImmersiveSpace(id: "ImmersiveScene") {
            ImmersiveView()
        }
    }
}
