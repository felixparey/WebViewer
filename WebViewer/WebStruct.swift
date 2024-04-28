//
//  WebStruct.swift
//  WebViewer
//
//  Created by Felix Parey on 15/03/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    // 1
    let url: URL
    var newUA = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.4) Gecko/20100101 Firefox/4.0"
    
    
    
    // 2
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {
        
        let request = URLRequest(url: url)
        webView.load(request)
       
    }
}
