//
//  DepthTextView.swift
//  6_Adding_a_depth_effect_to_text_in_visionOS
//
//  Created by eiji.shirakazu on 2024/12/06.
//

import SwiftUI

struct DepthTextView: View {
    /// アプリがウィンドウから伸びる3D効果を適用するテキストビュー
    let text = Text("Hello World").font(.extraLargeTitle)
    /// テキストレイヤー間のスペーシングオフセットのスケール
    @State var animationProgress = 0.0
    /// ウィンドウからZ軸方向に伸びるテキストレイヤーの数
    let layers = 5
    /// 各レイヤー間のポイント数
    let layerSpacing = 100
    
    var body: some View {
        // 同じテキストビューのスタックを、不透明度とz軸方向の位置を変えて作成し、まずぼやけた影のバージョンから始める。
        ZStack {
            textShadowView
            textMiddleViews
            textFrontView
        }
        .onAppear(perform: animateWithSpringEffect)
    }
    
    /// 完全に不透明なテキストビュー
    var textFrontView: some View {
        text.offset(z: Double(layerSpacing * layers) * animationProgress)
    }
    /// Z軸に沿った一連の半透明のテキストビュー
    var textMiddleViews: some View {
        ForEach(1..<layers, id: \.self) { layer in
            let layerPercent = Double(layer) / Double(layers)
            let maximumOffset = Double(layerSpacing * layers)
            let maximumOpacity = 1.0
            
            text
                .offset(z: maximumOffset * layerPercent * animationProgress)
                .opacity(maximumOpacity * layerPercent)
        }
    }
    /// SwiftUIのウィンドウ上で埋もれて暗い影のように動作するテキストビュー
    var textShadowView: some View {
        let blurRadius: CGFloat = 12
        let maximumOpacity = 0.6
        
        return text
            .foregroundStyle(.black)
            .blur(radius: blurRadius)
            .opacity(maximumOpacity * animationProgress)
    }
    
    /// オフセットスケールプロパティの値をスプリングアニメーションで更新
    func animateWithSpringEffect() {
        /// スプリングアニメーションの効果を表すスプリング係数で、単位はニュートン毎メートル
        let stiffness: Double = 200
        /// スプリング・アニメーションの減衰係数で、単位はニュートン・秒/メートル
        let damping: Double = 10
        
        let spring = Spring(stiffness: stiffness, damping: damping)
        let springAnimation = Animation.interpolatingSpring(spring).delay(1.0)
        
        // バネ効果でテキストがウィンドウから飛び出すアニメーション。
        withAnimation(springAnimation) {
            animationProgress = 1.0
        }
    }
}

#Preview(windowStyle: .automatic) {
    DepthTextView()
}
