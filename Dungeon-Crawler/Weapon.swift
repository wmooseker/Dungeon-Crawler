//
//  Weapon.swift
//  dungeonClass
//
//  Created by Elliott, Jared Padilla on 11/18/18.
//  Copyright © 2018 Jared Elliott. All rights reserved.
//

import Foundation

class Weapon {
    var name: String
    var damage: Int
    
    var description: String {
        return ("\(name): \(damage) attack power")
    }
    
    init(type: WeaponType){
        switch type {
        case .dagger:
            name = "Dagger"
            damage = 10
        case .sword:
            name = "Sword"
            damage = 20
        case .shortbow:
            name = "Shortbow"
            damage = 10
        case .longbow:
            name = "LongBow"
            damage = 20
        }
    }
}
