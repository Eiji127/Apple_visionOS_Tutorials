//
//  __Creating_2D_shapes_with_SwiftUIApp.swift
//  1_Creating_2D_shapes_with_SwiftUI
//
//  Created by eiji.shirakazu on 2024/11/27.
//

import SwiftUI

@main
struct __Creating_2D_shapes_with_SwiftUIApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ShapeView()
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
