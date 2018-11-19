//
//  Monster.swift
//  dungeonClass
//
//  Created by Elliott, Jared Padilla on 11/18/18.
//  Copyright © 2018 Jared Elliott. All rights reserved.
//

import Foundation

class Monster: DungeonCharacter {
    var attackSpeed: Double
    
    init(hitPoints: Int, weapon: Weapon, attackSpeed: Double) {
        self.attackSpeed = attackSpeed
        super.init(hitPoints: hitPoints, weapon: weapon)
    }
}
