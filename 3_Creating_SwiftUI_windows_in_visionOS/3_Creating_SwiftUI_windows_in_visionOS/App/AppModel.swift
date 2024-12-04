//
//  AppModel.swift
//  3_Creating_SwiftUI_windows_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/04.
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
