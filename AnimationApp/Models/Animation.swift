//
//  Animation.swift
//  AnimationApp
//
//  Created by Irunchik on 11.12.22.
//

import SpringAnimation

struct Animation {
    let preset: AnimationPreset
    let curve: AnimationCurve
    var force: Double {
        Double.random(in: 0...5)
    }
    var duration: Double {
        Double.random(in: 0...3)
    }
    var delay: Double {
        Double.random(in: 0...2)
    }
    
    static func getAnimations() -> [Animation] {
        var animations: [Animation] = []
        let animationPresets = AnimationPreset.allCases
        let animationCurves = AnimationCurve.allCases
        for i in 0..<animationPresets.count {
            let animation = Animation(preset: animationPresets[i], curve: animationCurves.randomElement() ?? .easeIn)
            animations.append(animation)
        }
        return animations
        
    }
}
