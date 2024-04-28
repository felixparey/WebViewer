//
//  WebViewerApp.swift
//  WebViewer
//
//  Created by Felix Parey on 15/03/24.
//

import SwiftUI

@main
struct WebViewerApp: App {
    
    @State private var appState = AppState()
    @State private var immersionStyle: ImmersionStyle = .full
    var body: some Scene {
        WindowGroup {
          StartView()
                .environment(appState)
        }
        WindowGroup(id: "Browser") {
          YoutubeBrowserView()
                .environment(appState)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(appState)
        }
        .immersionStyle(selection: $immersionStyle, in: FullImmersionStyle())
        
    }
}
