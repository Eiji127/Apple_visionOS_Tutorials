//
//  MainView.swift
//  8_Creating_an_immersive_space_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/12.
//

import SwiftUI

struct MainView: View {
    /// `OpenImmersiveSpaceAction` インスタンスを取得するための環境値
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    var body: some View {
        Text("Immersive Content Example")
            .onAppear {
                Task {
                    await openImmersiveSpace(id: "ImmersiveScene")
                }
            }
    }
}

#Preview(windowStyle: .automatic) {
    MainView()
}
