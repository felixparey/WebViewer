//
//  WebViewerApp.swift
//  WebViewer
//
//  Created by Felix Parey on 15/03/24.
//

import SwiftUI

@main
struct WebViewerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
