//
//  AppModel.swift
//  1_Creating_2D_shapes_with_SwiftUI
//
//  Created by eiji.shirakazu on 2024/11/27.
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
