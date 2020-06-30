//
//  BlockNode.swift
//  SampleGame
//
//  Created by Hitesh Trantor on 15/04/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import Foundation
import SpriteKit

class BlockNode : SKSpriteNode
{
    var gameCanvas : SKSpriteNode?
    var stringMade = ""
    var arrNodesSelected : [SKSpriteNode] = []
    let arrayStrings = ["GOOD","BETTER","BEST"]
    let arrayStrings2 = ["GOLF","TENNIS","BALL","ROW","PITCH"]
    let arrayStrings3 = ["NEVER","ALWAYS","EYE"]
    let arrayStrings4 = ["NOTHING","THAN","POSITIVE"]
    let arrayStrings5 = ["THOUGHT","CHANGE","SMALL","DAY"]
    let arrayStrings6 = ["SITUATION","SITUATION","TURN","INTO"]
    let allStrings = [["GOOD","BETTER","BEST"], ["GOLF","TENNIS","BALL","ROW","PITCH"], ["NEVER","ALWAYS","EYE"], ["NOTHING","THAN","POSITIVE"], ["THOUGHT","CHANGE","SMALL","DAY"], ["SITUATION","TURN","INTO"], ["RESPOND", "MORE", "LIFE", "BECOME", "YOUR"], ["EMBRACE", "PAIN", "FUEL", "JOURNEY"], ["STOP","SIGNS","GUIDELINES","THEY"],["THANKFUL","SAID","DOING","MYSELF","BECAUSE","THAT"],["BEAR","MIND","SUCCEED","THING","IMPORTANT","YOUR"], ["CHANGE","ATTITUDE","LIKE","COMPLAIN","SOMETHING"],["HAPPY","GOOD","HEALTH","DECIDED"],["THOUGHTS","WORLD","CHANGE","YOUR"],["MATTER","SLOW","LONG","STOP"],["EXCEPT","ONES","MAKE","LIFE"],["ANYTHING","LEAVE","FAR","BEHIND","AHEAD"],["LIGHT","DARK","CALM","STORM","PEACE","WAR"],["LIVE","YOUR","PRAYERS","ANSWERED"],["TRY","RAINBOW","CLOUD"]]
    let allStrings1D = ["GOOD","BETTER","BEST","GOLF","TENNIS","BALL","ROW","PITCH", "NEVER","ALWAYS","EYE", "NOTHING","THAN","POSITIVE", "THOUGHT","CHANGE","SMALL","DAY","SITUATION","TURN","INTO","RESPOND", "MORE", "LIFE", "BECOME", "YOUR","EMBRACE", "PAIN", "FUEL", "JOURNEY","STOP","SIGNS","GUIDELINES","THEY","THANKFUL","SAID","DOING","MYSELF","BECAUSE","THAT","BEAR","MIND","SUCCEED","THING","IMPORTANT","ATTITUDE","LIKE","COMPLAIN","SOMETHING","HAPPY","HEALTH","DECIDED","THOUGHTS","WORLD","MATTER","SLOW","LONG","EXCEPT","ONES","MAKE","ANYTHING","LEAVE","FAR","BEHIND","AHEAD","LIGHT","DARK","CALM","STORM","PEACE","WAR","LIVE","TRY","PRAYERS","ANSWERED","RAINBOW","CLOUD"]

    var lastSelectedBlock : SKSpriteNode?
    var swipeDirection : SwipeDirection?
    
    func getTotalCount(){
        print("hi")

        print("hi \(allStrings.count)")
//        return allStrings.count
    }
    func getSwipeDirection(forNode:SKSpriteNode, fromNode:SKSpriteNode)->SwipeDirection
    {
        if abs(Int(forNode.position.x)-Int(fromNode.position.x))<2 {
            // vertical
            if abs(Int(forNode.position.y)-Int(fromNode.position.y)) > Int(forNode.size.height*2) {
                return .unIdentified
            }
            
            if forNode.position.y < fromNode.position.y {
                return .down
            }
            else {
                return .up
            }
        }
        if abs(Int(forNode.position.y)-Int(fromNode.position.y))<2 {
            // horizontal
            
            if abs(Int(forNode.position.x)-Int(fromNode.position.x)) > Int(forNode.size.width*2) {
                return .unIdentified
            }
            if forNode.position.x < fromNode.position.x {
                return .backward
            }
            else {
                return .forward
            }
        }
        // Cross
        return .unIdentified
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let parent = self.parent
        {
            gameCanvas = parent as? SKSpriteNode
            
            let arrBlocks = parent.children.filter { (spriteNode) -> Bool in
                if spriteNode is BlockNode && spriteNode.calculateAccumulatedFrame().contains(touches.first?.location(in: parent) ?? CGPoint.init(x: 0, y: 0))
                {
                    return true
                }
                return false
            }
            for node in arrBlocks
            {
                if let sprite = node as? SKSpriteNode {
                    let dummyNode = SKSpriteNode()
                    dummyNode.color = colorNormal
                    if sprite.color == dummyNode.color
                    {
                        if lastSelectedBlock != nil {
                            let currentDirection = getSwipeDirection(forNode: sprite, fromNode: lastSelectedBlock!)
                            if currentDirection == .unIdentified {
                                return
                            }
                            
                            if swipeDirection != nil
                            {
                                if swipeDirection != currentDirection {
                                    return
                                }
                            }
                        }
                        
                        sprite.color = colorHighlighted
                        if (lastSelectedBlock != nil) {
                            swipeDirection = getSwipeDirection(forNode: sprite, fromNode: lastSelectedBlock!)
                        }
                        if let label = sprite.childNode(withName: "Label") as? SKLabelNode
                        {
                            label.fontColor = colorTextHighlighted
                            stringMade = stringMade + (label.text ?? "")
                            arrNodesSelected.append(sprite)
                        }
                        lastSelectedBlock = sprite
                    }
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        lastSelectedBlock = nil
        swipeDirection = nil
//        if arrayStrings.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings2.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings3.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings4.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings5.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings6.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
        if allStrings1D.contains(stringMade.uppercased()) {
            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
        }

//        for i in 0...arrayStrings.count-1{
//            if arrayStrings[i].contains(stringMade.uppercased()) {
//                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//            }
//        }
        stringMade = ""
        arrNodesSelected = []
        for node in gameCanvas?.children ?? []
        {
            if let sprite = node as? SKSpriteNode, sprite is BlockNode {
                sprite.color = colorNormal
                if let label = sprite.childNode(withName: "Label") as? SKLabelNode
                {
                    label.fontColor = colorTextNormal
                }
            }
        }
    }
}
