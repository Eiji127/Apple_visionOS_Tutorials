//
//  TextView.swift
//  5_Displaying_text_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/05.
//

import SwiftUI

/// アプリのメインビューに複数のテキストスタイルを表示するビュー
struct SwiftUIText: View {
    /// 隣接するテキスト項目間のスペーシング量
    let spacing: CGFloat = 30
    
    var body: some View {
        VStack(spacing: spacing) {
            Text("This is a large title")
                .font(.largeTitle)
            
            Text("This is a subheadline text")
                .font(.subheadline)
            
            Text("This is a bold text")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Text("This is a green text")
                .foregroundStyle(.green)
        }
    }
}
