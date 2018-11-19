//
//  Skeleton.swift
//  dungeonClass
//
//  Created by Elliott, Jared Padilla on 11/18/18.
//  Copyright © 2018 Jared Elliott. All rights reserved.
//

import Foundation

class Skeleton: Monster {
    init(){
        super.init(hitPoints: 50, weapon: Weapon(type: .sword), attackSpeed: 0.5) // 0.5 attack speed means 1 attack every 2 seconds when in range
    }
    
}
