//
//  LevelSelect.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/8/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVKit
import WebKit

class LevelSelectController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    

    @IBOutlet weak var webView: WKWebView!
    var gameScene : LevelSelect?
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
    var gameCoin2 : SKSpriteNode?

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

    var infoPopup : SKSpriteNode?
        
    var variableArray: [[SKSpriteNode?]] = [[]]
    var gameCongratulations : SKLabelNode?
    
    var gameBlockContainer2 : SKSpriteNode?
    var gameTextContainer2 : SKSpriteNode?

    var gameBlockTest : SKSpriteNode?
    var gameTextTest : SKSpriteNode?

    var game1: SKSpriteNode?
    var game2: SKSpriteNode?
    var game3: SKSpriteNode?
    var game4: SKSpriteNode?
    var game5: SKSpriteNode?
    var game6: SKSpriteNode?
    var tutorial: SKSpriteNode?
    var tips: SKSpriteNode?

    var game1Enabled: Bool = false
    var game2Enabled: Bool = false
    var game3Enabled: Bool = false
    var game4Enabled: Bool = false
    var game5Enabled: Bool = false
    var game6Enabled: Bool = false

    var touchBeganNode : SKSpriteNode?
    var currentLevel : Int = 31
//    var SKSpriteNodelol : SKSpriteNode?
//    var infoTitle : SKSpriteNode?
//    var infoBody : SKSpriteNode?

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        number = number + 1
        print("number \(number)")
        super.viewDidLoad()
//        view.addSubview(webView)
        if(!self.defaults.bool(forKey: "initial")){
            let url = "https://docs.google.com/forms/u/1/d/e/1FAIpQLSfUe7pVS2JJ7HqL2fsLgQa1X4Q-qgwhnn56rvOwJLoYNnr2hg/viewform"
            
            let request = URLRequest(url: URL(string: url)!)
            
            webView.load(request)
            webView.navigationDelegate = self
            webView.uiDelegate = self
            defaults.set(true, forKey: "initial")
        }else{
            if(webView != nil){
                webView.removeFromSuperview()
            }
        }
    
        defaults.set(true, forKey: "level1")
//        defaults.set("")
//        defaults.set(true, forKey: "startview")
//        currentLevel = 31
//        allStrings = block.allStrings2
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        hideGameComponents()
        trueFalse()
//        initializeGameSwipeAction()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Load Scene
    func presentGameScene()
    {
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "LevelSelect") as? LevelSelect {
                
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
    
    func trueFalse(){
        print(defaults.bool(forKey: "level1"))
        game1Enabled = defaults.bool(forKey: "level1")
        game2Enabled = defaults.bool(forKey: "level2")
        game3Enabled = defaults.bool(forKey: "level3")
        game4Enabled = defaults.bool(forKey: "level4")
        game5Enabled = defaults.bool(forKey: "level5")
        game6Enabled = defaults.bool(forKey: "level6")
        
        if(!game1Enabled){
            game1?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }
        if(!game2Enabled){
            game2?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }
        if(!game3Enabled){
            game3?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }
        if(!game4Enabled){
            game4?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }
        if(!game5Enabled){
            game5?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }
        if(!game6Enabled){
            game6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }


    }
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
        gameCoin2 = fetchSpriteNode(withName: "gameCoin2")

        gameOptionsBackground = fetchSpriteNode(withName: "gameOptionsBackground")
        gameOptionSearch = fetchSpriteNode(withName: "gameOptionSearch")
        gameOptionHint = fetchSpriteNode(withName: "gameOptionHint")
        gameOptionShuffle = fetchSpriteNode(withName: "gameOptionShuffle")
        gameOptionAds = fetchSpriteNode(withName: "gameOptionAds")
        gameTextContainer = fetchSpriteNode(withName: "gameTextContainer")
        gameTextContainer4 = fetchSpriteNode(withName: "gameTextContainer4")
        game1 = fetchSpriteNode(withName: "game1")
        game2 = fetchSpriteNode(withName: "game2")
        game3 = fetchSpriteNode(withName: "game3")
        game4 = fetchSpriteNode(withName: "game4")
        game5 = fetchSpriteNode(withName: "game5")
        game6 = fetchSpriteNode(withName: "game6")
        infoPopup = fetchSpriteNode(withName: "infoPopup")
        tutorial = fetchSpriteNode(withName: "tutorial")
        tips = fetchSpriteNode(withName: "tips")
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
        gameCoin2?.isHidden = true

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
            self.gameCoin2?.isHidden = false

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
        if(end){
        if let touch = touches.randomElement(), gameScene != nil
        {
            let positionInScene = touch.location(in: gameScene!)
            let touchedNode = gameScene!.atPoint(positionInScene)
            if touchedNode == touchBeganNode {
                if touchBeganNode == homePlayButton {
                    hideHomeComponentsAndLoadGame()
                }
            }
//            touchBeganNode?.name == "gameCoin2"
            if touchBeganNode == gameCoin || touchBeganNode == gameCoin2 {
                performSegue(withIdentifier: "selectToCoins", sender: nil)
                gameCoin?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                gameCoin2?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))

            }

            if touchedNode == gameBack
            {
                if touchBeganNode == gameBack {
                    defaults.set(true, forKey: "startview")
                    self.viewDidLoad()
                }
            }
            if touchedNode == gameOptionShuffle
            {

                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            
//            touchBeganNode = nil
//            homePlayButton?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
//            gameBack?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            if(game1Enabled){
                if touchedNode == game1{
                    performSegue(withIdentifier: "togame1", sender: nil)
                    touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                }
            }
            if(game2Enabled){
                if touchedNode == game2{
                    performSegue(withIdentifier: "togame2", sender: nil)
                    touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                }
            }

            if(game3Enabled){
                if touchedNode == game3{
                    if(defaults.bool(forKey: "moreLevels")){
                        performSegue(withIdentifier: "togame3", sender: nil)
                        touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    }else{
                        performSegue(withIdentifier: "selectToCoins", sender: nil)
                    }
                }
            }
            if(game4Enabled){
                if touchedNode == game4{
                    performSegue(withIdentifier: "togame4", sender: nil)
                    touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                }
            }
            if(game5Enabled){
                if touchedNode == game5{
                    performSegue(withIdentifier: "togame5", sender: nil)
                    touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                }
            }
            if(game6Enabled){
                if touchedNode == game6{
                    performSegue(withIdentifier: "togame6", sender: nil)
                    touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                }
            }
            if touchedNode == tutorial{
//                performSegue(withIdentifier: "tutorial", sender: nil)
                tutorial?.run(SKAction.fadeAlpha(to: 1, duration: 0))
            }
            if touchedNode == tips{
                infoPopup?.isHidden = false
                tutorial?.run(SKAction.fadeAlpha(to: 1, duration: 0))
            }
            print(touchedNode.name, " ", touchBeganNode?.name)
            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
            {
                print("PPP")
                touchedNode.run(SKAction.fadeAlpha(to: 1, duration: 0))
                infoPopup?.isHidden = true
            }



        }
            end = false
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameBack?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        if(game1Enabled){
            game1?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
        if(game2Enabled){
            game2?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
        if(game3Enabled){
            game3?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
        if(game4Enabled){
            game4?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
        if(game5Enabled){
            game5?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
        if(game6Enabled){
            game6?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
        gameCoin?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        gameCoin2?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        tutorial?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        tips?.run(SKAction.fadeAlpha(to: 1, duration: 0))

    }

    var end:Bool = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, gameScene != nil
        {
            let positionInScene = touch.location(in: gameScene!)
            let touchedNode = gameScene!.atPoint(positionInScene)
            touchBeganNode = touchedNode as? SKSpriteNode
            if touchBeganNode == homePlayButton {
                end = true
                homePlayButton?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchBeganNode == gameBack {
                end = true
                gameBack?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchBeganNode == gameCoin || touchBeganNode == gameCoin2{
                end = true
                gameCoin?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                gameCoin2?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            trueFalse()
            print(game1Enabled)
            if(game1Enabled){
                if touchedNode == game1{
                    end = true
                    game1?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                }
            }
            if(game2Enabled){
                if touchedNode == game2{
                    end = true
                    game2?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                }
            }
            if(game3Enabled){
                if touchedNode == game3{
                    end = true
                    game3?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                }
            }
            if(game4Enabled){
                if touchedNode == game4{
                    end = true
                    game4?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                }
            }
            if(game5Enabled){
                if touchedNode == game5{
                    end = true
                    game5?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                }
            }
            if(game6Enabled){
                if touchedNode == game6{
                    end = true
                    game6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                }
            }
            if touchedNode == tutorial{
                end = true
//                performSegue(withIdentifier: "tutorial", sender: nil)
                tutorial?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                playVideo()
            }
            if touchedNode == tips{
                end = true
                print("TIPS")
                tips?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
            {
                end = true
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }


        }
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "output", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }

//    func webView(_ webView: WKWebView, contextMenuForElement elementInfo: WKContextMenuElementInfo, willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating){
//        print("request:  \(elementInfo.description)")
//    }
     func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping ((WKNavigationActionPolicy) -> Void)) {

        if let url = navigationAction.request.url {
                print(url.absoluteString)
                if url.absoluteString.hasPrefix("https://docs.google.com/forms/u/1/d/e/1FAIpQLSfUe7pVS2JJ7HqL2fsLgQa1X4Q-qgwhnn56rvOwJLoYNnr2hg/formResponse"){
                    print("SUCCESS")
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                        webView.removeFromSuperview()
                    }

             }
        }

        decisionHandler(.allow)
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

