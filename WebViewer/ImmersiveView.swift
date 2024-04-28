//
//  ImmersiveView.swift
//  WebViewer
//
//  Created by Felix Parey on 15/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView2: View {
    @State private var is16by9 = true
    @Environment(AppState.self) private var appState
    @State private var distance: Float = -13
    @State private var scale: Float = 11.5
    
    
    var body: some View {
       
        RealityView { content, attachments in
            
            let mesh = MeshResource.generatePlane(width: 16, height: 9)
            let material = SimpleMaterial(color: .black, isMetallic: false)
            let modelEntity = ModelEntity(mesh: mesh, materials: [material])
            
            if let youtubeEntity = attachments.entity(for: "Youtube"){
                youtubeEntity.position.z = distance
                youtubeEntity.position.y = appState.height
                let scale = youtubeEntity.scale
               //youtubeEntity.addChild(ModelEntity(mesh: .generateSphere(radius: 1), materials: [SimpleMaterial(color: .red, isMetallic: true)]))
                
                youtubeEntity.scale.x = scale.x * appState.scale
 
                youtubeEntity.scale.y = scale.y * appState.scale
                
                youtubeEntity.name = "youtubeEntity"
            
                let sliderEntity = attachments.entity(for: "Sliders")!
                sliderEntity.position.y = 1.5
                sliderEntity.position.z = -1
                
                content.add(sliderEntity)
                content.add(youtubeEntity)
                
            }
            
            
        }update:{ content, attachments in
            let screenEntity = content.entities.first?.findEntity(named: "youtubeEntity")
            screenEntity?.position.z = distance
            if screenEntity != nil {
                print("Updated Distance")
            }
//            content.entities.forEach { entity in
//                if entity.name == "youtubeEntity"{
//                    entity.position.y = appState.height
//                    entity.position.z = appState.distance
//                    entity.scale.x = entity.scale.x * appState.scale
//                    entity.scale.y = entity.scale.y * appState.scale
//                }
//                    
//            }
            
        }attachments: {
            Attachment(id: "Youtube"){
                if is16by9{
                    ContentView()
                        .frame(width: 1600, height: 900)
                }else{
                    ContentView()
                        .scaleEffect(1.3)
                        .frame(width: 2100, height: 900)
                        .border(Color.yellow)
                }
                
                    
            }
            
            Attachment(id: "Sliders"){
                VStack{
                    SizeSliders(appState: appState)
                    
                    Slider(value: $distance, in: -15...(-8))
                }
                .glassBackgroundEffect()
                
                
            }
        }
        .onChange(of: appState.scale) { oldValue, newValue in
            print("New Scale Value: \(newValue)")
        }


    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}

struct ImmersiveView: View {
    @State private var is16by9 = true
    @Environment(AppState.self) private var appState
    
    var body: some View {
        
        RealityView { content, attachments in
            
            guard let entity = attachments.entity(for: "Youtube") else { fatalError() }
            entity.name = "Youtube"
            entity.position.z = -13
            entity.position.y = 3.5
            entity.scale.x = entity.scale.x * 11.5
            entity.scale.y = entity.scale.y * 11.5
            screenEntity = entity
            
            guard let sliderEntity = attachments.entity(for: "Sliders") else { fatalError() }
            sliderEntity.position.y = 0
            sliderEntity.position.z = -1
            sliderGlobalEntity = sliderEntity
            
            content.add(sliderGlobalEntity!)
            content.add(screenEntity!)
            
        } update: { content, attachments in

            screenEntity?.position.z = appState.distance
            screenEntity?.position.y = appState.height
            screenEntity?.scale.x = appState.scale
            screenEntity?.scale.y = appState.scale
            
        }attachments: {
            Attachment(id: "Youtube"){
                if is16by9{
                    ContentView()
                        .frame(width: 1600, height: 900)
                }else{
                    ContentView()
                        .scaleEffect(1.3)
                        .frame(width: 2100, height: 900)
                        .border(Color.yellow)
                }
            }
            Attachment(id: "Sliders"){
                VStack{
                    SizeSliders(appState: appState)
                   
//                    Button("Dismiss"){
//                        sliderGlobalEntity?.isEnabled = false
//                    }
                }
                .frame(width: 750)
                .glassBackgroundEffect()
            }

        }
        .gesture(SpatialTapGesture()
            .targetedToAnyEntity()
            .onEnded({ _ in
#warning("Dismiss Doesn't work yet")
                print("HEEEEEELLLLLLLOOOOOOOO")
            })
        
        )
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
