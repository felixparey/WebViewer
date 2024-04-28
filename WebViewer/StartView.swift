//
//  StartView.swift
//  WebViewer
//
//  Created by Felix Parey on 21/03/24.
//

import SwiftUI

struct StartView: View {
    @Environment(\.openImmersiveSpace) private var openSpace
    @Environment(AppState.self) private var appState
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @State private var toggleIsOn = true
    @State private var youtubeURL = ""
    var body: some View {
        Button {
            Task{
                if !appState.immersiveSpaceShown{
                    await openSpace(id: "ImmersiveSpace")
                    appState.immersiveSpaceShown = true
                }
              
            }
        } label: {
            Text("Open Space")
        }
        
        Button("Netflix"){
            Task{
                appState.uuuRL = "https://www.netflix.com/browse"
                if !appState.immersiveSpaceShown{
                    await openSpace(id: "ImmersiveSpace")
                    appState.immersiveSpaceShown = true
                }
            }
        }
        
        Button("Prime Video"){
            Task{
                appState.uuuRL = "https://www.amazon.de/Amazon-Video/b/?&node=3010075031&ref=dvm_MLP_ROWEU_DE_1"
                if !appState.immersiveSpaceShown{
                    await openSpace(id: "ImmersiveSpace")
                    appState.immersiveSpaceShown = true
                }
            }
        }
        
        Button("Paramount"){
            Task{
                appState.uuuRL = "https://www.paramountplus.com/"
                if !appState.immersiveSpaceShown{
                    await openSpace(id: "ImmersiveSpace")
                    appState.immersiveSpaceShown = true
                }
            }
        }
        
        
        
        
        TextField("URL", text: $youtubeURL)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
                 appState.uuuRL = youtubeURL
                Task{
                    await openSpace(id: "ImmersiveSpace")
                }
            }
        Button("Show/Hide Browser", action: {
            appState.toggleIsOn.toggle()
        })
        
            .onChange(of: appState.toggleIsOn) { oldValue, newValue in
                if newValue == true{
                    openWindow(id: "Browser")
                }else if newValue == false{
                    dismissWindow(id: "Browser")
                }
            }
            .onAppear{
              //  openWindow(id: "Browser")
            }
        Button("Reset Immersive Space"){
            appState.immersiveSpaceShown = false
        }
        

    }
}

#Preview {
    StartView()
}
