//
//  ContentView.swift
//  6_Adding_a_depth_effect_to_text_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/06.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
