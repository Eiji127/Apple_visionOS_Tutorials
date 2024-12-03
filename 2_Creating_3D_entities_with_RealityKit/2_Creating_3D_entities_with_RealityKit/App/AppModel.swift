//
//  AppModel.swift
//  2_Creating_3D_entities_with_RealityKit
//
//  Created by eiji.shirakazu on 2024/11/28.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
}
