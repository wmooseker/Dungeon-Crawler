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
    let waterMaxSpeed: CGFloat = 200
    let landMaxSpeed: CGFloat = 4000
    
    // if within threshold range of the target, car begins slowing
    let targetThreshold:CGFloat = 200
    
    var maxSpeed: CGFloat = 0
    var acceleration: CGFloat = 0
    
    // touch location
    var targetLocation: CGPoint = .zero
    var playerCharacter: SKSpriteNode!

    //let roomRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200) )
    
    
    func loadSceneNodes() {
        guard let playerCharacter = childNode(withName: "playerCharacter") as? SKSpriteNode else{
            fatalError("error with loading player node")
        }
        self.playerCharacter = playerCharacter
    }
    
    override func didMove(to view: SKView) {
        loadSceneNodes()
        physicsBody = SKPhysicsBody(bodies: <#T##[SKPhysicsBody]#>)
        maxSpeed = landMaxSpeed
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        targetLocation = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        targetLocation = touch.location(in: self)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    override func didSimulatePhysics() {
        
        let offset = CGPoint(x: targetLocation.x - playerCharacter.position.x,
                             y: targetLocation.y - playerCharacter.position.y)
        let distance = sqrt(offset.x * offset.x + offset.y * offset.y)
        let carDirection = CGPoint(x:offset.x / distance,
                                   y:offset.y / distance)
        let carVelocity = CGPoint(x: carDirection.x * acceleration,
                                  y: carDirection.y * acceleration)
        
        playerCharacter.physicsBody?.velocity = CGVector(dx: carVelocity.x, dy: carVelocity.y)
        
        if acceleration > 5 {
            playerCharacter.zRotation = atan2(carVelocity.y, carVelocity.x)
        }
        
        // update acceleration
        // car speeds up to maximum
        // if within threshold range of the target, car begins slowing
        // if maxSpeed has reduced due to different tiles,
        // may need to decelerate slowly to the new maxSpeed
        
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
