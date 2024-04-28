//
//  SizeSliders.swift
//  WebViewer
//
//  Created by Felix Parey on 11/04/24.
//

import SwiftUI

struct SizeSliders: View {
    
    @Bindable var appState: AppState
    
    var body: some View {
        VStack{
            Text("Distance")
            Slider(value: $appState.distance, in: (-20)...(-8))
            Text("Height")
            Slider(value: $appState.height, in: 0...5)
            Text("Scale")
            Slider(value: $appState.scale, in: 9...16)
            
        }
        .padding()
    }
}
