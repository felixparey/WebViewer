//
//  AppState.swift
//  WebViewer
//
//  Created by Felix Parey on 21/03/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
class AppState{
   var uuuRL = "https://www.netflix.com/browse"
    var urlTime = "1950"
    var toggleIsOn = true
    var distance: Float = -13
    var height: Float = 2.5
    var scale: Float = 11.5
    var immersiveSpaceShown = false
    
    func generateURLBasedOnTime(_ time: String) -> String{
        return "https://www.youtube.com/embed/vI0yaZxFb64?si=Tb7pY0_9d3uzk0gB;autoplay"
    }
}
