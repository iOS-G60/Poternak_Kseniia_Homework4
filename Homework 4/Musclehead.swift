//
//  Musclehead.swift
//  Homework 4
//
//  Created by ios02 on 27.01.18.
//  Copyright © 2018 ios02. All rights reserved.
//

import Foundation

class Musclehead {

    let gender: GenderType
    var weight: Double
    let doingCardio: Bool
    var eat: EatType
    var bodyType: String
    
    private var useFatBurner: Bool

    init(gender: GenderType,
         weight: Double,
         doingCardio: Bool,
         eat: EatType,
         bodyType: String = "",
         useFatBurner: Bool = true) {
        
        self.gender = gender
        self.weight = weight
        self.doingCardio = doingCardio
        self.eat = eat
        self.bodyType = bodyType
        self.useFatBurner = useFatBurner
    }
    
// Определение типа телосложения.
    func checkBody() {
        let sportLevel = ["Thin", "Normal", "Plump"]
        if gender == GenderType.woman {
            if weight <= 50 {
                bodyType = sportLevel[0]
            } else if weight < 70 {
                bodyType = sportLevel[1]
            } else if weight >= 70 {
                bodyType = sportLevel[2]
            }
        } else if gender == GenderType.man {
            if weight <= 65 {
                bodyType = sportLevel[0]
            } else if weight < 90 {
                bodyType = sportLevel[1]
            } else if weight >= 90 {
                bodyType = sportLevel[2]
            }
        }
        print("The weight is \(weight)kg, so the person is \(bodyType)." )
    }
    
// Снижение веса от кардио.
    func cardio() {
        weight -= weight / 50
    }
    
// Повышение веса от еды.
    func eat(foodMass: Double) {
        let foodMass = foodMass / 1000
        if eat == EatType.healthy {
            weight += foodMass * 2
            print("\(weight)kg is the weight after eating \(foodMass)kg.")
        } else if eat == EatType.everything {
            weight += foodMass * 10
            print("\(weight)kg is the weight after eating \(foodMass)kg.")
        }
    }
    
// Снижение веса от ЖЖ.
    private func takeFatBurner() {
        weight -= weight / 100
    }
    
  // Изменения веса.
    func weightChange () {
        if doingCardio == true {
            cardio()
            takeFatBurner()
            weight = Double(round(10 * weight) / 10)
        } else {
            takeFatBurner()
            weight = Double(round(10 * weight) / 10)
        }
        print("\(weight)kg is the weight after taking pills and cardio")
    }
    
    enum EatType {
            case healthy
            case everything
            }

    enum GenderType {
        case woman
        case man
    }
    
}

