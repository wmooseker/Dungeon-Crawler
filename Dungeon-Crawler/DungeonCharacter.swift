//
//  DungeonCharacter.swift
//  dungeonClass
//
//  Created by Elliott, Jared Padilla on 11/18/18.
//  Copyright © 2018 Jared Elliott. All rights reserved.
//

import Foundation

class DungeonCharacter {
    var hitPoints: Int
    var equippedWeapon: Weapon
    
    init(hitPoints: Int, weapon: Weapon){
        self.hitPoints = hitPoints
        self.equippedWeapon = weapon
    }
}
