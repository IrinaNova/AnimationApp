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
    
    static func getAnimation() -> Animation {
        let animationPresets = AnimationPreset.allCases
        let animationCurves = AnimationCurve.allCases
    
        let animation = Animation(
            preset: animationPresets.randomElement() ?? .pop,
            curve: animationCurves.randomElement() ?? .easeIn)
        
        return animation
        
    }
}
