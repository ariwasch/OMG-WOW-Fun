//
//  CoinsController.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/9/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class CoinsController: UIViewController {
    
    var gameScene : Coins?
    var homeBackground : SKSpriteNode?
    var homeLogo : SKSpriteNode?
    var homePlayContainer : SKSpriteNode?
    var homePlayButton : SKSpriteNode?
    let previous = 30
    var arr : [SKSpriteNode] = []
    var gameBlockContainer : SKSpriteNode?
    var gameBackground : SKSpriteNode?
    var gameBack : SKSpriteNode?
    var gameLevelHeader : SKSpriteNode?
    var gameTitleHeader : SKSpriteNode?
    var gameCoin : SKSpriteNode?
    var allStrings = [["TEACH","BETTER","BEST"], ["GOLF","TENNIS","BALL","ROW","PITCH"], ["NEVER","ALWAYS","EYE"], ["NOTHING","THAN","POSITIVE"], ["THOUGHT","CHANGE","SMALL","DAY"], ["SITUATION","SITUATION","TURN","INTO"]]
    
    var block : BlockNode = BlockNode()
    var gameOptionsBackground : SKSpriteNode?
    var gameOptionSearch : SKSpriteNode?
    var gameOptionHint : SKSpriteNode?
    var gameOptionShuffle : SKSpriteNode?
    var gameOptionAds : SKSpriteNode?; var gameTextContainer : SKSpriteNode?
    let defaults = UserDefaults.standard
    var gameTextContainer4 : SKSpriteNode?
    var number : Int = 0

//    var infoPopup : SKSpriteNode?
        
    var variableArray: [[SKSpriteNode?]] = [[]]
    var gameCongratulations : SKLabelNode?
    
    var gameBlockContainer2 : SKSpriteNode?
    var gameTextContainer2 : SKSpriteNode?

    var gameBlockTest : SKSpriteNode?
    var gameTextTest : SKSpriteNode?

    var touchBeganNode : SKSpriteNode?
    var currentLevel : Int = 31
//    var SKSpriteNodelol : SKSpriteNode?
//    var infoTitle : SKSpriteNode?
//    var infoBody : SKSpriteNode?
    
    var buy1: SKSpriteNode?
    var buy2: SKSpriteNode?
    var buy3: SKSpriteNode?
    var buy4: SKSpriteNode?
    var buy5: SKSpriteNode?
    var buy6: SKSpriteNode?


    //MARK:- View LifeCycle
    override func viewDidLoad() {
//        number = number + 1
//        print("number \(number)")
        super.viewDidLoad()
//        defaults.set(true, forKey: "level1")
//        defaults.set("")
//        defaults.set(true, forKey: "startview")
//        currentLevel = 31
//        allStrings = block.allStrings2
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
//        hideGameComponents()
//        initializeGameSwipeAction()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Load Scene
    func presentGameScene()
    {
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "Coins") as? Coins {
                
                if gameScene != nil {
                    gameScene?.removeFromParent()
                    view.presentScene(nil)
                }
                
                gameScene = scene
                gameScene!.scaleMode = .aspectFit
//                gameScene?.size = view.bounds.size
                view.presentScene(gameScene!)
            }
            
            //view.ignoresSiblingOrder = true
            //            view.showsFPS = true
            //            view.showsNodeCount = true
            //            view.showsPhysics = true
            //            view.showsFields = true
            //            view.showsDrawCount = true
            //            view.showsQuadCount = true
        }
    }
    
    //MARK:- Initilizing Game Variables and Components
    
    func initializationOfGameVariable()
    {
        homeBackground = fetchSpriteNode(withName: "homeBackground")
        homeLogo = fetchSpriteNode(withName: "homeLogo")
        homePlayContainer = fetchSpriteNode(withName: "homePlayContainer")
        gameBlockContainer = fetchSpriteNode(withName: "gameBlockContainer")
        gameBackground = fetchSpriteNode(withName: "game2Background")
        homePlayButton = fetchSpriteNode(withName: "homePlayButton",inNode:homePlayContainer)
        
        gameBack = fetchSpriteNode(withName: "gameBack")
        gameLevelHeader = fetchSpriteNode(withName: "gameLevelHeader")
        gameTitleHeader = fetchSpriteNode(withName: "gameTitleHeader")
        gameCoin = fetchSpriteNode(withName: "gameCoin")
        
        gameOptionsBackground = fetchSpriteNode(withName: "gameOptionsBackground")
        gameOptionSearch = fetchSpriteNode(withName: "gameOptionSearch")
        gameOptionHint = fetchSpriteNode(withName: "gameOptionHint")
        gameOptionShuffle = fetchSpriteNode(withName: "gameOptionShuffle")
        gameOptionAds = fetchSpriteNode(withName: "gameOptionAds")
        gameTextContainer = fetchSpriteNode(withName: "gameTextContainer")
        gameTextContainer4 = fetchSpriteNode(withName: "gameTextContainer4")
        
        buy1 = fetchSpriteNode(withName: "buy1")
        buy2 = fetchSpriteNode(withName: "buy2")
        buy3 = fetchSpriteNode(withName: "buy3")
        buy4 = fetchSpriteNode(withName: "buy4")
        buy5 = fetchSpriteNode(withName: "buy5")
        buy6 = fetchSpriteNode(withName: "buy6")

        homePlayButton?.isUserInteractionEnabled = true
        gameBack?.isUserInteractionEnabled = true
    }
    

    func hideAndShowLabel(inNode wordNode:SKSpriteNode?, hide:Bool)
    {
        if let label = wordNode?.childNode(withName: "Label") as? SKLabelNode
        {
            label.isHidden = hide
        }
    }
    
    func hideGameComponents()
    {
        gameBlockContainer?.isHidden = true
        gameBackground?.run(SKAction.fadeAlpha(to: 0, duration: 0))
        gameBack?.isHidden = true
        gameTitleHeader?.isHidden = true
        gameLevelHeader?.isHidden = true
        gameCoin?.isHidden = true
        gameOptionsBackground?.isHidden = true
        gameOptionSearch?.isHidden = true
        gameOptionHint?.isHidden = true
        gameOptionShuffle?.isHidden = true
        gameOptionAds?.isHidden = true
        gameTextContainer?.isHidden = true
        
        gameCongratulations?.isHidden = true
        
        gameBlockContainer2?.isHidden = true
        gameTextContainer2?.isHidden = true
        
        gameBlockTest?.isHidden = true
        gameTextTest?.isHidden = true
        print("hi \(defaults.bool(forKey: "startview"))")
        if(!(defaults.bool(forKey: "startview"))){
            self.homeLogo?.removeFromParent()
            self.homePlayContainer?.removeFromParent()
            self.homeBackground?.removeFromParent()
            hideHomeComponentsAndLoadGame()
        }
    }
    
    func hideHomeComponentsAndLoadGame()
    {
        if(defaults.bool(forKey: "startview")){
        homeLogo?.run(SKAction.moveTo(y: self.view.frame.height, duration: 0.5), completion: {
            self.homeLogo?.removeFromParent()
        })
        homePlayContainer?.run((SKAction.moveTo(y: 0, duration: 0.5)), completion: {
            self.homePlayContainer?.removeFromParent()
        })
        gameBackground?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.75), completion: {
            self.homeBackground?.removeFromParent()
            })
            
        }
            self.gameBackground?.isHidden = false
            self.gameBackground?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))

            self.gameBlockContainer?.isHidden = false
            self.gameBack?.isHidden = false
            self.gameTitleHeader?.isHidden = false
            self.gameLevelHeader?.isHidden = false
            self.gameCoin?.isHidden = false
            self.gameOptionsBackground?.isHidden = false
            self.gameOptionSearch?.isHidden = false
            self.gameOptionHint?.isHidden = false
            self.gameOptionShuffle?.isHidden = false
            self.gameOptionAds?.isHidden = false
            self.gameTextContainer?.isHidden = false
            
    }
    
    //MARK: Child Node
    func fetchSpriteNode(withName strName:String, inNode node:SKNode? = nil)->SKSpriteNode?
    {
        if node == nil {
            return gameScene?.childNode(withName: strName) as? SKSpriteNode
        }
        else {
            return node?.childNode(withName: strName) as? SKSpriteNode
        }
    }
        
    //MARK:- Touch Actions
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.randomElement(), gameScene != nil
        {
            let positionInScene = touch.location(in: gameScene!)
            let touchedNode = gameScene!.atPoint(positionInScene)
            if touchedNode == touchBeganNode {
                if touchBeganNode == homePlayButton {
                    hideHomeComponentsAndLoadGame()
                }
            }
            
            if touchedNode == gameBack
            {
                if touchBeganNode == gameBack {
                    defaults.set(false, forKey: "startview")
                    performSegue(withIdentifier: "coinToLevels", sender: nil)
                }
            }
            
            if touchedNode == buy1
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if touchedNode == buy2
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if touchedNode == buy3
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if touchedNode == buy4
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if touchedNode == buy5
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if touchedNode == buy6
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }


            
//            touchBeganNode = nil
//            homePlayButton?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
//            gameBack?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("hi")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
                if let touch = touches.randomElement(), gameScene != nil
                {
                    let positionInScene = touch.location(in: gameScene!)
                    let touchedNode = gameScene!.atPoint(positionInScene)
                    if touchedNode == touchBeganNode {
                        if touchBeganNode == homePlayButton {
                            hideHomeComponentsAndLoadGame()
                        }
                    }
                    
                    
                    if touchedNode == buy1
                    {
                        touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    }
                    if touchedNode == buy2
                    {
                        touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    }
                    if touchedNode == buy3
                    {
                        touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    }
                    if touchedNode == buy4
                    {
                        touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    }
                    if touchedNode == buy5
                    {
                        touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    }
                    if touchedNode == buy6
                    {
                        touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    }


                    
        //            touchBeganNode = nil
        //            homePlayButton?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
        //            gameBack?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, gameScene != nil
        {
            let positionInScene = touch.location(in: gameScene!)
            let touchedNode = gameScene!.atPoint(positionInScene)
            touchBeganNode = touchedNode as? SKSpriteNode
            if touchBeganNode == homePlayButton {
                homePlayButton?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchBeganNode == gameBack {
                
                gameBack?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            
            if touchedNode == buy1
            {
                buy1?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == buy2
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == buy3
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == buy4
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == buy5
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == buy6
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }

    }
    


    }






//    override var shouldAutorotate: Bool {
//        return true
//    }
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }

//let magneticField = SKFieldNode.radialGravityField()

//magneticField.region = SKRegion.init(size: gameCanvas!.size)
//magneticField.minimumRgameCanvassius = Float(gameCanvas!.size.width)
// magneticField.strength = 10


//                   physicsWorld.gravity = CGVector(dx: 0, dy: 0)
//                   physicsBody = SKPhysicsBody(edgeLoopFrom: { () -> CGRect in
//                       var frame = self.frame
//                       frame.size.width = CGFloat(radius)
//                       frame.origin.x -= frame.size.width / 2
//                       return frame
//                   }())

/*let strength = Float(max(gameCanvas!.size.width, gameCanvas!.size.height))
 let radius = strength.squareRoot() * 100
 magneticField.region = SKRegion(radius: radius)
 magneticField.minimumRadius = radius
 magneticField.strength = 5000
 magneticField.position = CGPoint(x: (gameCanvas!.size.width/2)/gameCanvas!.xScale, y:0) //(gameCanvas!.size.height/2)/gameCanvas!.yScale)
 gameCanvas?.addChild(magneticField)*/


}
