//
//  YoutubeBrowserView.swift
//  WebViewer
//
//  Created by Felix Parey on 23/03/24.
//

import SwiftUI

struct YoutubeBrowserView: View {
    @Environment(AppState.self) private var appState
    var body: some View {
        WebView(url: URL(string: "https://www.paramountplus.com/")!)
            .ignoresSafeArea()
            .onDisappear{
                appState.toggleIsOn = false
            }
    }
}

#Preview {
    YoutubeBrowserView()
}
