//
//  GameScene.swift
//  Dungeon-Crawler
//
//  Created by Mooseker, William Parker on 11/18/18.
//  Copyright © 2018 Mooseker, William Parker. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
   
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
    }
    

    override func update(_ currentTime: TimeInterval) {
        
    }
}
