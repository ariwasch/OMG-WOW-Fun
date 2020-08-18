//
//  GameViewController5.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/19/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController5: UIViewController, GADInterstitialDelegate, GADRewardedAdDelegate {
    
    var gameScene : MyScene5?
    var homeBackground : SKSpriteNode?
    var homeLogo : SKSpriteNode?
    var homePlayContainer : SKSpriteNode?
    var homePlayButton : SKSpriteNode?
    let previous = 84
    let defaults = UserDefaults.standard

    var arr : [SKSpriteNode] = []
    var gameBlockContainer : SKSpriteNode?
    var gameBackground : SKSpriteNode?
    var gameBack : SKSpriteNode?
    var gameLevelHeader : SKSpriteNode?
    var gameTitleHeader : SKSpriteNode?
    var gameCoin : SKSpriteNode?
    var coin : SKSpriteNode?

    var allStrings = [["TEACH","BETTER","BEST"], ["GOLF","TENNIS","BALL","ROW","PITCH"], ["NEVER","ALWAYS","EYE"], ["NOTHING","THAN","POSITIVE"], ["THOUGHT","CHANGE","SMALL","DAY"], ["SITUATION","SITUATION","TURN","INTO"]]
    
    var block : BlockNode = BlockNode()
    var gameOptionsBackground : SKSpriteNode?
    var gameOptionSearch : SKSpriteNode?
    var gameOptionHint : SKSpriteNode?
    var gameOptionShuffle : SKSpriteNode?
    var gameOptionAds : SKSpriteNode?; var gameTextContainer : SKSpriteNode?

    var gameTextContainer4 : SKSpriteNode?

    var infoPopup : SKSpriteNode?
        
    var variableArray: [[SKSpriteNode?]] = [[]]
    var gameCongratulations : SKLabelNode?
    
    var gameBlockContainer2 : SKSpriteNode?
    var gameTextContainer2 : SKSpriteNode?

    var gameBlockTest : SKSpriteNode?
    var gameTextTest : SKSpriteNode?

    var touchBeganNode : SKSpriteNode?
    var currentLevel : Int = 79
    var SKSpriteNodelol : SKSpriteNode?
    var infoTitle : SKSpriteNode?
    var infoBody : SKSpriteNode?

    var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    var rewardedAd: GADRewardedAd?

    var enableEndPop: Bool = false
    var pLevel: Int = 1
    var pBody: String = ""
    var pTitle: String = ""
    var pLTitle: String = ""
    var levelDelay = 0.0

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevel = 85
        loadAds()
        allStrings = block.allStrings5
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        hideGameComponents()
        initializeGameSwipeAction()
        print("IM BIG DUMB \(defaults.integer(forKey: "game5level"))")

        if(defaults.integer(forKey: "game5level") != 85 && (defaults.integer(forKey: "game5level") != 0)){
            skip(to: defaults.integer(forKey: "game5level"))
        }
        reloadBalance()

    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Load Scene
    func presentGameScene()
    {
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "MyScene5") as? MyScene5 {
                
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
        gameBackground = fetchSpriteNode(withName: "gameBackground")
        homePlayButton = fetchSpriteNode(withName: "homePlayButton",inNode:homePlayContainer)
        
        gameBack = fetchSpriteNode(withName: "gameBack")
        gameLevelHeader = fetchSpriteNode(withName: "gameLevelHeader")
        gameTitleHeader = fetchSpriteNode(withName: "gameTitleHeader")
        gameCoin = fetchSpriteNode(withName: "gameCoin")
        coin = fetchSpriteNode(withName: "coin")
        gameOptionsBackground = fetchSpriteNode(withName: "gameOptionsBackground")
        gameOptionSearch = fetchSpriteNode(withName: "gameOptionSearch")
        gameOptionHint = fetchSpriteNode(withName: "gameOptionHint")
        gameOptionShuffle = fetchSpriteNode(withName: "gameOptionShuffle")
        gameOptionAds = fetchSpriteNode(withName: "gameOptionAds")
        gameTextContainer = fetchSpriteNode(withName: "gameTextContainer")
        gameTextContainer4 = fetchSpriteNode(withName: "gameTextContainer4")

        infoPopup = fetchSpriteNode(withName: "infoPopup")

        for i in 0...allStrings.count-1{
            var tempArray = [SKSpriteNode?]()
            for j in 0...allStrings[i].count-1{
                var tempString = allStrings[i][j]
                for char in 0...tempString.count-1{
                    
                    var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(char+1)",inNode: gameScene?.textCanvases[i])
                    tempArray.append(tempVar)

//                    if(exception(string: allStrings[i][j]) > 1){
//                        var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(exception(string: allStrings[i][j]))\(char+1)",inNode: gameScene?.textCanvases[i])
//                        tempArray.append(tempVar)
//                    }
                    
                    print("\(allStrings[i][j])\(char)")
                }
                variableArray.append(tempArray)
            }
            print(allStrings.count)
        }
        
        SKSpriteNodelol = fetchSpriteNode(withName: "SKSpriteNodelol",inNode: infoPopup)

        infoBody = fetchSpriteNode(withName: "infoBody",inNode: SKSpriteNodelol)
        infoTitle = fetchSpriteNode(withName: "infoTitle",inNode: SKSpriteNodelol)

        homePlayButton?.isUserInteractionEnabled = true
        gameBack?.isUserInteractionEnabled = true
        infoPopup?.isUserInteractionEnabled = true
    }
    func wordInWord(string: String) -> Bool{
        var isDuplicate = true
        if((string == "LEADER" && currentLevel == 86) || (string == "LEAD" && currentLevel == 85) || (string == "LEAD" && currentLevel == 86)){
            isDuplicate = false
        }
        return isDuplicate
    }

    func duplicate(string: String) -> Bool{
        var isDuplicate = false
        print(currentLevel)
        if(string == "PEOPLE" ){
            isDuplicate = true
        }
        return isDuplicate
    }
    func duplicateHelper(string: String) -> Int{
        var num = 0
        if(string == "PEOPLE" && currentLevel == 85){
            num = 84 - previous
        }else if(string == "PEOPLE" && currentLevel == 89){
            num = 88 - previous
        }

        return num
    }

    
    func initializeGameSwipeAction()
    {

        blockSwippedWord = {[weak self] strWord,arrNodes in
            guard let `self` = self else {return}
            self.arr = arrNodes
            self.correctWordSwipe(forSwippedWord: strWord, selectedNodes: arrNodes)

        }
    }
    
    
    func initializeNextLevel(level: Int, title: String, popTitle: String, popBody: String)
    {
        pLevel = level
        pBody = popBody
        pTitle = popTitle
        pLTitle = title
        if(enableEndPop){
            infoPopup?.isHidden = false
        }else{
        DispatchQueue.main.asyncAfter(deadline: .now() + levelDelay) {
            if(!self.defaults.bool(forKey: "no-ads")){
            if self.interstitial.isReady {
                self.interstitial.present(fromRootViewController: self)
            }
        }
        self.defaults.set(level, forKey: "level")
        self.defaults.set(level, forKey: "game5level")

        self.currentLevel = level
        if(popTitle != "" && popBody != ""){
            if let body = self.SKSpriteNodelol?.childNode(withName: "infoBody") as? SKLabelNode
            {
                body.text = popBody
            }
            if let title = self.SKSpriteNodelol?.childNode(withName: "infoTitle") as? SKLabelNode
            {
                title.text = popTitle
            }
        }


        self.infoPopup?.isHidden = true
        
        self.gameScene?.gameCanvases[level-self.previous-1]?.children.forEach({ (node) in
            if node is BlockNode
            {
                node.run(SKAction.fadeOut(withDuration: 0))
            }
        })
        if let lblLevel = self.gameLevelHeader?.childNode(withName: "Label") as? SKLabelNode
        {
            lblLevel.text = "LEVEL \(level)"
        }
        if let lblTitle = self.gameTitleHeader?.childNode(withName: "Label") as? SKLabelNode
        {
            lblTitle.text = title
        }
        
        self.gameScene?.addNextPhysicsBody(index: level-1-self.previous)
        
        for scene in self.gameScene!.gameCanvases{
            if(scene != nil){
                scene!.isHidden = true
            }
        }
        
        for scene in self.gameScene!.textCanvases{
            scene!.isHidden = true
        }
        self.gameScene?.gameCanvases[level-self.previous-1]?.isHidden = false
        self.gameScene?.textCanvases[level-self.previous-1]?.isHidden = false

        var delay = 0.1
        for node in self.gameScene?.gameCanvases[level-self.previous-1]?.children ?? []
        {
            if node is BlockNode
            {
                DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
                    node.run(SKAction.fadeIn(withDuration: 0.2))
                }
                delay = delay + 0.1
            }
        }
        }
        }
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

        infoPopup?.isHidden = true

        
        for i in 0...variableArray.count-1{
            if(variableArray[i].count-1 > 0){
                    for j in 0...variableArray[i].count-1{
                            hideAndShowLabel(inNode: variableArray[i][j], hide: true)
                }
            }
        }
        hideHomeComponentsAndLoadGame()
    }
    
    func hideHomeComponentsAndLoadGame()
    {
//        homeLogo?.run(SKAction.moveTo(y: self.view.frame.height, duration: 0.5), completion: {
            self.homeLogo?.removeFromParent()
//        })
//        homePlayContainer?.run((SKAction.moveTo(y: 0, duration: 0.5)), completion: {
            self.homePlayContainer?.removeFromParent()
//        })
//        gameBackground?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.75), completion: {
        gameBackground?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))

            self.gameBlockContainer?.children.forEach({ (node) in
                if node is BlockNode
                {
                    node.run(SKAction.fadeOut(withDuration: 0))
                }
            })
            self.homeBackground?.removeFromParent()
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
            
            var delay = 0.1
            for node in self.gameBlockContainer?.children ?? []
            {
                if node is BlockNode
                {
                    DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
                        node.run(SKAction.fadeIn(withDuration: 0.2))
                    }
                    delay = delay + 0.1
                }
            }
//        })
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
    
    //MARK:- Swipe Action
    
    func actionOnWord(word: String, num: Int){
        
        if(word != "" && num == 0){
            self.enableEndPop = true
        }

        if(word == "GREATEST" || num == 86){
            self.initializeNextLevel(level: 86, title: "LEADERSHIP", popTitle: "John C. Maxwell", popBody: "John Calvin Maxwell is an American author, speaker, and pastor who has written many books, primarily focusing on leadership.")
        }else if(word == "RELATE" || num == 87){
            self.initializeNextLevel(level: 87, title: "‭‭LEADERSHIP", popTitle: "Brandon Sanderson", popBody: "Brandon Sanderson is an American fantasy and science fiction writer. He is best known for the Cosmere universe.")
        }else if(word == "ACCEPT" || num == 88){
            self.initializeNextLevel(level: 88, title: "LEADERSHIP", popTitle: "‭‭Eleanor Roosevelt", popBody: "Anna Eleanor Roosevelt was an American political figure, diplomat and activist.")
        }else if(word == "OTHERS" || num == 89){
            self.initializeNextLevel(level: 89, title: "LEADERSHIP", popTitle: "‭‭Steve Jobs", popBody: "Steven Paul Jobs was an American business magnate, industrial designer, investor, and media proprietor.")
        }else if(word == "YARDSTICK" || num == 90){
            defaults.set(true, forKey: "level6")
            defaults.set(85, forKey: "game5level")
            defaults.set(false, forKey: "startview")
            performSegue(withIdentifier: "levelselect5", sender: nil)
        }
    }
    func correctWordSwipe(forSwippedWord strWord:String, selectedNodes arrNodes:[SKSpriteNode])
    {
        for i in 0...allStrings.count-1{
            var tempArray = [SKSpriteNode]()
            for j in 0...allStrings[i].count-1{
                var tempString = allStrings[i][j]
                
                if(strWord == allStrings[i][j].uppercased() && wordInWord(string: allStrings[i][j].uppercased())){
                    for char in 1...tempString.count{

                        if(duplicate(string: allStrings[i][j].uppercased())){
                            var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(char)",inNode: gameScene?.textCanvases[duplicateHelper(string: allStrings[i][j].uppercased())])
                            tempArray.append(tempVar!)
                        }else{
                            var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(char)",inNode: gameScene?.textCanvases[i])
                            print(tempString)
                            tempArray.append(tempVar!)
                        }
                    }
                    
                    let delay = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: tempArray)
                        DispatchQueue.main.asyncAfter(deadline: .now()+delay+1.0) {
                            self.actionOnWord(word: strWord, num: 0)
                    }

                }
            }

        }
        
    }
    
    func returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes arrNodes:[SKSpriteNode], onLetterNodes arrLetterNodes:[SKSpriteNode]) -> Double
    {
        var delay = 0.0
        for (index,node) in arrNodes.enumerated()
        {
            if node is BlockNode
            {
                DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
                    self.createAlphabetAndAnimate(fromNode: node, toLabelNode:arrLetterNodes[index])
                }
                delay = delay + 0.1
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
            for spriteNode in arrNodes
            {
                spriteNode.run(SKAction.removeFromParent())
            }
        }
        return delay
    }

    
    func createAlphabetAndAnimate(fromNode node:SKSpriteNode, toLabelNode labelNode:SKSpriteNode)
    {
        if let labelInNode = node.childNode(withName: "Label") as? SKLabelNode,let label = labelNode.childNode(withName: "Label") as? SKLabelNode  {
            let position = node.convert(labelInNode.position, to: gameScene!)
            
            let labelToAnimate = SKLabelNode.init(text: labelInNode.text)
            labelToAnimate.fontName = label.fontName
            labelToAnimate.fontSize = 30
            labelToAnimate.fontColor = .white
            labelToAnimate.position = position
            
            gameScene?.addChild(labelToAnimate)
            let positionEnd = labelNode.convert(label.position, to: gameScene!)
            labelToAnimate.run(SKAction.move(to: positionEnd, duration: 0.5),completion: {
                labelToAnimate.removeFromParent()
                label.isHidden = false
            })
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
                enableEndPop = false
                if(currentLevel > previous+1){
                    defaults.set(currentLevel-1, forKey: "level")
                    defaults.set(currentLevel-1, forKey: "game5level")
                    viewDidLoad()
                }else{
                    defaults.set(false, forKey: "startview")
                    performSegue(withIdentifier: "levelselect5", sender: nil)
                }            }
            if touchedNode == gameOptionShuffle
            {
//                print("SOFJODFHOIDHJFSIOJIOFJSODIFJOSDIFJOSDJFOSDJF")
                enableEndPop = false
                skip()

                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            
            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
            {
                infoPopup?.isHidden = true
                if(enableEndPop){
                    enableEndPop = false
                    levelDelay = 5
                    initializeNextLevel(level: pLevel, title: pLTitle, popTitle: pTitle, popBody: pBody)
                    levelDelay = 0
                }
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if touchedNode.name == "Author"
            {
                infoPopup?.isHidden = false
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            touchBeganNode = nil
            homePlayButton?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            gameBack?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            
            if touchedNode == gameOptionSearch
            {
                defaults.set(false, forKey: "startview")
                gameOptionSearch?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                performSegue(withIdentifier: "levelselect5", sender: nil)

            }
            if touchedNode == gameOptionHint
            {
                gameOptionHint?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                hint()
            }
            if touchedNode == gameCoin || touchedNode == coin
            {
                gameCoin?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                performSegue(withIdentifier: "tocoins5", sender: nil)
            }
            if touchedNode == gameOptionAds
            {
                gameOptionAds?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                if rewardedAd?.isReady == true {
                   rewardedAd?.present(fromRootViewController: self, delegate:self)
                }
            }


        }
    }
    func hint(){
        let balance = defaults.integer(forKey: "balance")
        var counter = 0
        if(balance >= 10){
        self.gameScene?.gameCanvases[currentLevel-previous-1]?.children.forEach({ (node) in
                if node is BlockNode
                {
                    node.children[0].description
                    let nodeText = (((node.children[0]) as! SKLabelNode).text)!
                    let stringHint = allStrings[currentLevel-previous-1][allStrings [currentLevel-previous-1].count-1]
                    print(nodeText)
                    print(allStrings[currentLevel-previous-1][allStrings        [currentLevel-previous-1].count-1])
                    if(stringHint.contains(nodeText) && counter < 6){
                        (node as! SKSpriteNode).color = colorHighlighted
                        counter += 1
                    }
                }
            })
            defaults.set(balance-10, forKey: "balance")
            reloadBalance()
        }else{
            performSegue(withIdentifier: "tocoins5", sender: nil)

        }
        
    }
    func skip(){
        let balance = defaults.integer(forKey: "balance")
        if(balance >= 20){
            for node in self.gameScene?.gameCanvases[currentLevel-previous-1]?.children ?? []
            {
                if node is BlockNode
                {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        node.run(SKAction.fadeOut(withDuration: 0.2))
                        node.run(SKAction.removeFromParent())
                    }
                }
            }
            actionOnWord(word: "",num: currentLevel+1)
            defaults.set(balance-20, forKey: "balance")
            reloadBalance()
        }else{
            performSegue(withIdentifier: "tocoins5", sender: nil)

        }
    }
    func reloadBalance(){
        if let lblLevel = gameCoin?.childNode(withName: "balance") as? SKLabelNode
        {
            lblLevel.text = "\(defaults.integer(forKey: "balance"))"
        }

    }
    func skip(to: Int){

        for node in self.gameScene?.gameCanvases[currentLevel-previous-1]?.children ?? []
        {
            if node is BlockNode
            {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    node.run(SKAction.fadeOut(withDuration: 0.2))
                    node.run(SKAction.removeFromParent())
                }
            }
        }
        actionOnWord(word: "",num: to)
    //        initializeNextLevel(level: currentLevel+1, title: "String", popTitle: "String", popBody: "String")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameBack?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        gameOptionShuffle?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        gameBack?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        gameOptionHint?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        gameOptionSearch?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        gameOptionAds?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        gameCoin?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        coin?.run(SKAction.fadeAlpha(to: 1, duration: 0))
    }

    var end:Bool = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(end){
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
            if touchBeganNode?.name == "closeInfo" {
                end = true
                touchBeganNode?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode.name == "Author" {
                end = true
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == gameOptionShuffle
            {
                end = true
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == gameOptionSearch
            {
                end = true
                gameOptionSearch?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))

            }
            if touchedNode == gameOptionHint
            {
                end = true
                gameOptionHint?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == gameCoin || touchedNode == coin
            {
                end = true
                gameCoin?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == gameOptionAds
            {
                end = true
                gameOptionAds?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }

            }

        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
          var interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
          interstitial.delegate = self
          interstitial.load(GADRequest())
          return interstitial
        }

        func interstitialDidDismissScreen(_ ad: GADInterstitial) {
            print("hi123")
          interstitial = createAndLoadInterstitial()
        
        }


    func addBannerViewToView(_ bannerView: GADBannerView) {
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(bannerView)
     view.addConstraints(
       [NSLayoutConstraint(item: bannerView,
                           attribute: .bottomMargin,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
    }
    func loadAds(){
        rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
        rewardedAd?.load(GADRequest()) { error in
          if let error = error {
            // Handle ad failed to load case.
          } else {
            // Ad successfully loaded.
          }
        }
        if(!(defaults.bool(forKey: "no-ads"))){
            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.center = CGPoint(x: view.frame.midX, y: view.bounds.height - bannerView.bounds.height / 2)
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
            let request = GADRequest()
            interstitial.delegate = self
            interstitial.load(request)

            addBannerViewToView(bannerView)
            self.view.bringSubviewToFront(bannerView);
        }
    }
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        let balance = defaults.integer(forKey: "balance")
        defaults.set(balance+10, forKey: "balance")
        reloadBalance()
    }
    func createAndLoadRewardedAd() -> GADRewardedAd{
      rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
      rewardedAd?.load(GADRequest()) { error in
        if let error = error {
          print("Loading failed: \(error)")
        } else {
          print("Loading Succeeded")
        }
      }
        return rewardedAd!
    }
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
      let rewardedAd = createAndLoadRewardedAd()
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
