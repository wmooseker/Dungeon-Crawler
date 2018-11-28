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
    
    // constants
    let charMaxSpeed: CGFloat = 1000

    let targetThreshold:CGFloat = 100
    
    var maxSpeed: CGFloat = 0
    var acceleration: CGFloat = 0

    var targetLocation: CGPoint = .zero
    var playerCharacter: SKSpriteNode!
    var platform: SKTileMapNode!

    //let roomRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200) )
    
    
    func loadSceneNodes() {
        guard let playerCharacter = childNode(withName: "playerCharacter") as? SKSpriteNode else{
            fatalError("error with loading player node")
        }
        self.playerCharacter = playerCharacter
    }
    
    override func didMove(to view: SKView) {
        loadSceneNodes()
        maxSpeed = charMaxSpeed
//        playerCharacter.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
//        for node in self.children {
//            if (node.name == "platform") {
//                if let someTileMap: SKTileMapNode = node as? SKTileMapNode {
//                    giveTileMapPhysicsBody(map: someTileMap)
//                    someTileMap.removeFromParent()
//                }
//                break
//            }
//        }
    }
    
//    func giveTileMapPhysicsBody(){
//    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        targetLocation = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        targetLocation = touch.location(in: self)
    }
    
    override func didSimulatePhysics() {
        
        let offset = CGPoint(x: targetLocation.x - playerCharacter.position.x,
                             y: targetLocation.y - playerCharacter.position.y)
        let distance = sqrt(offset.x * offset.x + offset.y * offset.y)
        let charDirection = CGPoint(x:offset.x / distance,
                                   y:offset.y / distance)
        let charVelocity = CGPoint(x: charDirection.x * acceleration,
                                  y: charDirection.y * acceleration)
        
        playerCharacter.physicsBody?.velocity = CGVector(dx: charVelocity.x, dy: charVelocity.y)
        
        if acceleration > 5 {
            playerCharacter.zRotation = atan2(charVelocity.y, charVelocity.x)
        }
        
        if distance < targetThreshold {
            let delta = targetThreshold - distance
            acceleration = acceleration * ((targetThreshold - delta)/targetThreshold)
            if acceleration < 2 {
                acceleration = 0
            }
        } else {
            if acceleration > maxSpeed {
                acceleration -= min(acceleration - maxSpeed, 80)
            }
            if acceleration < maxSpeed {
                acceleration += min(maxSpeed - acceleration, 40)
            }
        }
        
    }
}
