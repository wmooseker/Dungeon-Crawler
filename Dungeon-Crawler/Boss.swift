//
//  Boss.swift
//  dungeonClass
//
//  Created by Elliott, Jared Padilla on 11/18/18.
//  Copyright © 2018 Jared Elliott. All rights reserved.
//

import Foundation

class Boss: DungeonCharacter {
    
    init(level: Int) {
        super.init(hitPoints: (200 * level), weapon: Weapon(type: .dagger))     // never uses equipped weapon, instead has functions to make arena dangerous for hero
    }
}
