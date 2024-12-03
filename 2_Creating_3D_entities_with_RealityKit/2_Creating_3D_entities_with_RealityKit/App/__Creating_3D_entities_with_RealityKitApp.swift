//
//  __Creating_3D_entities_with_RealityKitApp.swift
//  2_Creating_3D_entities_with_RealityKit
//
//  Created by eiji.shirakazu on 2024/11/28.
//

import SwiftUI

@main
struct __Creating_3D_entities_with_RealityKitApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ShapesView()
                .environment(appModel)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
