//
//  Hero.swift
//  dungeonClass
//
//  Created by Elliott, Jared Padilla on 11/18/18.
//  Copyright © 2018 Jared Elliott. All rights reserved.
//

import Foundation

class Hero: DungeonCharacter {
    var name: String
    
    init(name: String){
        self.name = name
        super.init(hitPoints: 100, weapon: Weapon(type: .dagger))
    }
}
