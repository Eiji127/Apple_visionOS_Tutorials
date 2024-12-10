//
//  SIMD3.swift
//  7_Creating_an_interactive_3D_model_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/10.
//

import SwiftUI

extension SIMD3 where Scalar == Float {
    /// Y軸の値を0に固定する変数
    var grounded: SIMD3<Scalar> {
        .init(x: x, y: 0, z: z)
    }
}
