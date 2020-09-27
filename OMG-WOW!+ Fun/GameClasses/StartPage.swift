//
//  StartPage.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/10/20.
//  Copyright © 2020 Ari Wasch. All rights reserved.
//

import Foundation
import SpriteKit

class StartPage: SKScene {
    var gameCanvas : SKSpriteNode?
    var gameCanvas2 : SKSpriteNode?
//    var gameCanvas3 : SKSpriteNode?
//    var gameCanvases : [SKSpriteNode?] = []
//    var textCanvases : [SKSpriteNode?] = []
//    var block : BlockNode = BlockNode()
//    let defaults = UserDefaults.standard

    func addPhysicsBody(onNode:SKNode)
    {
        if let spriteNode = onNode as? SKSpriteNode {

            spriteNode.physicsBody = SKPhysicsBody.init(rectangleOf: CGSize.init(width: spriteNode.size.width+3.5, height: spriteNode.size.width+3.5))
            spriteNode.physicsBody?.mass = 200
            spriteNode.physicsBody?.allowsRotation = false
            if spriteNode is BlockNode {
                spriteNode.color = colorNormal
                spriteNode.physicsBody?.isDynamic = true
                spriteNode.isUserInteractionEnabled = true
            } else {
                spriteNode.physicsBody = SKPhysicsBody.init(rectangleOf:spriteNode.size )
                spriteNode.physicsBody?.isDynamic = false
            }
        }
    }

    func addFirstLevelPhysicsBody()
    {
        for node in gameCanvas?.children ?? []
        {
            addPhysicsBody(onNode: node)
        }
    }
    func addSecondLevelPhysicsBody()
    {
        for node in gameCanvas2?.children ?? []
        {
            addPhysicsBody(onNode: node)
        }
    }
    func addThirdLevelPhysicsBody()
    {
//        for node in gameCanvas3?.children ?? []
//        {
//            addPhysicsBody(onNode: node)
//        }
    }

    func addNextPhysicsBody(index: Int)
    {
//        for node in gameCanvases[index]?.children ?? []
//        {
//            addPhysicsBody(onNode: node)
//        }
    }
    func delete(index: Int)
    {
//        if(index < gameCanvases[index]?.children.count){
//
//
//        for node in gameCanvases[index]?.children ?? []
//        {
//            removeAllActions()
////            removeAllChildren()
//        }
//        }
    }



    override func didMove(to view: SKView) {
//        gameCanvas = self.childNode(withName: "gameBlockContainer") as? SKSpriteNode
//        gameCanvas2 = self.childNode(withName: "gameBlockContainer2") as? SKSpriteNode
//        gameCanvas3 = self.childNode(withName: "gameBlockContainer3") as? SKSpriteNode
//        for i in 0...block.allStrings2.count-1{
//            if(i == 0){
//                gameCanvases.append(self.childNode(withName: "gameBlockContainer") as? SKSpriteNode)
//                textCanvases.append(self.childNode(withName: "gameTextContainer") as? SKSpriteNode)
//            }else{
//                gameCanvases.append(self.childNode(withName: "gameBlockContainer\(i+1)") as? SKSpriteNode)
//                textCanvases.append(self.childNode(withName: "gameTextContainer\(i+1)") as? SKSpriteNode)
//            }
//        }
//        print("ooo\(gameCanvases.count)")
//        defaults.set(31,forKey: "level")
//        addNextPhysicsBody(index: 0)
//        addFirstLevelPhysicsBody()
    }
}


