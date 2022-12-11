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
    
    var animation = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation(with: animation)
        setLabel()
    }
    
    // MARK: - IBAction
    @IBAction func startAnimation(_ sender: UIButton) {
        setAnimation(with: animation)
        setLabel()
        animationView.animate()
        animation = Animation.getAnimation()
        sender.setTitle("Next \(animation.preset.rawValue)", for: .normal)
    }
    // MARK: - Private Methods
    private func setAnimation(with animation: Animation) {
        animationView.animation = animation.preset.rawValue
        animationView.curve = animation.curve.rawValue
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
    }

    private func setLabel() {
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
