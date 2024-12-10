//
//  EntryPoint.swift
//  7_Creating_an_interactive_3D_model_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/10.
//

import SwiftUI

@main
struct EntryPoint: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        ImmersiveSpace(id: "CarView") {
            CarView()
        }
    }
}
