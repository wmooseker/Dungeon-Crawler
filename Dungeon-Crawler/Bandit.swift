//
//  Bandit.swift
//  dungeonClass
//
//  Created by Elliott, Jared Padilla on 11/18/18.
//  Copyright © 2018 Jared Elliott. All rights reserved.
//

import Foundation

class Bandit: Monster {
    init(){
        super.init(hitPoints: 100, weapon: Weapon(type: .dagger), attackSpeed: 1) // 1 attack speed means 1 attack every second when in range
    }
    
}
