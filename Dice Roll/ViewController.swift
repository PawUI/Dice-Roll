//
//  ViewController.swift
//  Dice Roll
//
//  Created by paw on 04.12.2020.
//  Copyright © 2020 paw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func rollAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: []) { [unowned self] in
            progressView.alpha = 1
            firstDice.alpha = 0
            secondDice.alpha = 0
            rollButton.alpha = 0
            resultLabel.alpha = 1
        } completion: { [unowned self] (_) in
            progressView.setProgress(1, animated: true)
            _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [unowned self] (_) in
                let first = "\(Int.random(in: 1...6))"
                let second = "\(Int.random(in: 1...6))"
                firstDice.image = UIImage(named: first)
                secondDice.image = UIImage(named: second)

                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: []) { [unowned self] in
                    progressView.alpha = 0
                    firstDice.alpha = 1
                    secondDice.alpha = 1
                    rollButton.alpha = 1
                }
                progressView.progress = 0
                resultLabel.text = "\(Int(first)! + Int(second)!)"
                
            }
        }
        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [unowned self] (_) in
        resultLabel.text = "."
            _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [unowned self] (_) in
                resultLabel.text = ".."
                _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [unowned self](_) in
                    resultLabel.text = "..."

                })
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstDice.image = UIImage(named: "\(Int.random(in: 1...6))")
        secondDice.image = UIImage(named: "\(Int.random(in: 1...6))")
        firstDice.layer.cornerRadius = 10
        secondDice.layer.cornerRadius = 10
        resultLabel.text = "..."
        rollButton.layer.cornerRadius = 10
        progressView.progress = 0
        progressView.alpha = 0
        resultLabel.alpha = 0
    }
    

}

