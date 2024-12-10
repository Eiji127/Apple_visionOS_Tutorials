//
//  MainView.swift
//  7_Creating_an_interactive_3D_model_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/10.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MainView: View {
    /// `OpenImmersiveSpaceAction` インスタンスを取得するための環境値
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    var body: some View {
        Text("User gestures to move the car")
            .onAppear {
                Task {
                    await openImmersiveSpace(id: "CarView")
                }
            }
    }
}

#Preview(windowStyle: .automatic) {
    MainView()
}
