//
//  ViewController.swift
//  Homework 4
//
//  Created by ios02 on 27.01.18.
//  Copyright © 2018 ios02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var weightLebel: UILabel!
    @IBOutlet weak var eatingTypeLebel: UILabel!
    @IBOutlet weak var doingCardioLebel: UILabel!
    @IBOutlet weak var eatTextField: UITextField!
    @IBOutlet weak var eatButtonLebel: UIButton!
    @IBOutlet weak var loseWeightButtonLebel: UIButton!
    @IBOutlet weak var checkBodyTypeButtonLebel: UIButton!
    @IBOutlet weak var bodyTypeLebel: UILabel!
    @IBOutlet weak var weightLossView: UIImageView!
    
    
    let bodyBuilder = Musclehead.init(gender: .woman, weight: 72, doingCardio: true, eat: .healthy)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightLossView.image = UIImage.init(named: "weightloss")
        
        eatTextField.keyboardType = .decimalPad
        
        reboot()
    }

    func reboot() {
        genderLabel.text = "\(bodyBuilder.gender)"
        weightLebel.text = "\(bodyBuilder.weight)"
        eatingTypeLebel.text = "\(bodyBuilder.eat)"
        doingCardioLebel.text = "\(bodyBuilder.doingCardio)"
        bodyTypeLebel.text = "\(bodyBuilder.bodyType)"
    }
    
    @IBAction func eatButton(_ sender: UIButton) {
        let gramsOfFood = eatTextField.text
        if let gramsDouble = gramsOfFood {
            if let gramsOfFood = Double(gramsDouble) {
                bodyBuilder.eat(foodMass: gramsOfFood)
                reboot()
            } else {
                print("The entered text is not a number")
            }
        }
    }

    @IBAction func loseWeightButton(_ sender: UIButton) {
        bodyBuilder.weightChange()
        reboot()
    }
    
    @IBAction func checkBodyBotton(_ sender: UIButton) {
        bodyBuilder.checkBody()
        reboot()
    }
    
}


