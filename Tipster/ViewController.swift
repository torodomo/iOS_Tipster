//
//  ViewController.swift
//  Tipster
//
//  Created by Toro Roan on 9/7/17.
//  Copyright © 2017 Toro Roan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var periodButton: UIButton!
    @IBOutlet weak var groupLabel: UILabel!
    
    @IBOutlet var percentageLabel: [UILabel]!
    @IBOutlet var tipLabel: [UILabel]!
    @IBOutlet var totalLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numClicked(_ sender: UIButton) {
        if let label = numberLabel.text{
            if label == "0"{
                numberLabel.text = String(sender.tag)
            }
            else{
                numberLabel.text = label + String(sender.tag)
            }
            updateValues()
        }
    }
    @IBAction func clearClicked(_ sender: UIButton) {
        numberLabel.text = "0"
        periodButton.isEnabled = true
        updateValues()
    }
    @IBAction func periodClicked(_ sender: UIButton) {
//        if let label = numberLabel.text{
            numberLabel.text! += "."
//        }
        sender.isEnabled = false
    }

    func updateValues(){
        for i in 0..<totalLabel.count{
            if let label = numberLabel.text{
                let total: Double = Double(label)!
                let tip: Double = Double(tipLabel[i].tag) / Double(100) * total
                tipLabel[i].text = String(format: "%.2f", tip / Double(groupLabel.tag))
                totalLabel[i].text = String(format: "%.2f", (total + tip) / Double(groupLabel.tag))
            }
        }
    }
    @IBAction func tipSliderChanged(_ sender: UISlider) {
        for i in 0..<totalLabel.count{
            let change: Int = Int(sender.value)
            let newPercentage: Int = totalLabel[i].tag + change
            tipLabel[i].tag = newPercentage
            percentageLabel[i].text = String(newPercentage) + "%"
        }
        updateValues()
    }

    @IBAction func groupSlideChanged(_ sender: UISlider) {
        let change:  Int = Int(sender.value)
        groupLabel.tag = change
        groupLabel.text = "Group Size: " + String(change)
        updateValues()
    }
}

