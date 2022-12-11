//
//  ViewController.swift
//  AnimationApp
//
//  Created by Irunchik on 10.12.22.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    @IBOutlet var viewLabels: [UILabel]!
    
    let animations = Animation.getAnimations()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation()
        
    }
    
    
    @IBAction func startAnimation(_ sender: UIButton) {
        setAnimation()
        animationView.animate()
        for label in viewLabels {
            switch label.tag {
            case 0:
                label.text = "preset: \(animationView.animation)"
            case 1:
                label.text = "curve: \(animationView.curve)"
            case 2:
                label.text = "force: \(string( sender: animationView.force))"
            case 3:
                label.text = "delay: \(string(sender: animationView.delay))"
            default:
                label.text = "duration: \(string(sender: animationView.duration))"
            }
        }
        if count < animations.count-1 {
            count += 1
        } else {
            count = 0
        }
        sender.setTitle("Next \(animations[count].preset.rawValue)", for: .normal)
        
    }
    private func setAnimation() {
        animationView.animation = animations[count].preset.rawValue
        animationView.curve = animations[count].curve.rawValue
        animationView.force = animations[count].force
        animationView.duration = animations[count].duration
        animationView.delay = animations[count].delay
        for label in viewLabels {
            switch label.tag {
            case 0:
                label.text = "preset: \(animationView.animation)"
            case 1:
                label.text = "curve: \(animationView.curve)"
            case 2:
                label.text = "force: \(string( sender: animationView.force))"
            case 3:
                label.text = "delay: \(string(sender: animationView.delay))"
            default:
                label.text = "duration: \(string(sender: animationView.duration))"
            }
        }
    }
    private func string( sender: Double) -> String {
        String(format: "%.2f", sender)
    }
    
}
