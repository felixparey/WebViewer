//
//  ContentView.swift
//  WebViewer
//
//  Created by Felix Parey on 15/03/24.
//

import SwiftUI
import WebKit
import RealityKit
import RealityKitContent

struct ContentView: View {
    // 1
    @State private var isPresentWebView = false
    @Environment(AppState.self) private var appState
    
    
    
    var body: some View {
        
        WebView(url: URL(string: appState.uuuRL)!)
            .ignoresSafeArea()
            .navigationTitle("Sarunw")
            .navigationBarTitleDisplayMode(.inline)
            .background{
                Color.red
            }
    }
}


#Preview(windowStyle: .automatic) {
    ContentView()
}
