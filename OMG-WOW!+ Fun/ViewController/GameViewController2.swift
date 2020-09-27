//
//  GameViewController.swift
//  SampleGame
//
//  Created by Hitesh Trantor on 30/03/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController2: UIViewController, GADInterstitialDelegate, GADRewardedAdDelegate {
    
    var gameScene : MyScene2?
    var homeBackground : SKSpriteNode?
    var homeLogo : SKSpriteNode?
    var homePlayContainer : SKSpriteNode?
    var homePlayButton : SKSpriteNode?
    let previous = 30
    let defaults = UserDefaults.standard

    var arr : [SKSpriteNode] = []
    var gameBlockContainer : SKSpriteNode?
    var gameBackground : SKSpriteNode?
    var gameBack : SKSpriteNode?
    var gameLevelHeader : SKSpriteNode?
    var gameTitleHeader : SKSpriteNode?
    var gameCoin : SKSpriteNode?
    var coin : SKSpriteNode?
    var nextLevelButton : SKSpriteNode?

    var allStrings = [["TEACH","BETTER","BEST"], ["GOLF","TENNIS","BALL","ROW","PITCH"], ["NEVER","ALWAYS","EYE"], ["NOTHING","THAN","POSITIVE"], ["THOUGHT","CHANGE","SMALL","DAY"], ["SITUATION","SITUATION","TURN","INTO"]]
    var wordsSolved : Int = 0
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
    
    var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    var rewardedAd: GADRewardedAd?

    var touchBeganNode : SKSpriteNode?
    var currentLevel : Int = 31
    var SKSpriteNodelol : SKSpriteNode?
    var infoTitle : SKSpriteNode?
    var infoBody : SKSpriteNode?

    var enableEndPop: Bool = false
    var pLevel: Int = 1
    var pBody: String = ""
    var pTitle: String = ""
    var pLTitle: String = ""
    var levelDelay = 0.0

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAds()
        currentLevel = 31
        allStrings = block.allStrings2
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        hideGameComponents()
        initializeGameSwipeAction()
        print("IM BIG DUMB \(defaults.integer(forKey: "game2level"))")
        if(defaults.integer(forKey: "game2level") != 31 && (defaults.integer(forKey: "game2level") != 0)){
            skip(to: defaults.integer(forKey: "game2level"))
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
            if let scene = SKScene(fileNamed: "MyScene2") as? MyScene2 {
                
                if gameScene != nil {
                    gameScene?.removeFromParent()
                    view.presentScene(nil)
                }
                
                gameScene = scene
                gameScene!.scaleMode = .aspectFit
                view.presentScene(gameScene!)
            }
            
        }
    }
    
    //MARK:- Initilizing Game Variables and Components
    
    func initializationOfGameVariable()
    {
        wordsSolved = 0
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
        nextLevelButton = fetchSpriteNode(withName: "nextLevel")

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
        if((string == "LOVE" && currentLevel == 43) || (string == "LOVE" && currentLevel == 33) || (string == "LOVE" && currentLevel == 47)  || (string == "LOVE" && currentLevel == 37) || (string == "TREAT" && currentLevel == 45) || (string == "DONE" && currentLevel == 33) || (string == "FAITH" && currentLevel == 48) || (string == "LIVE" && currentLevel == 41) || (string == "EVIL" && currentLevel == 54)){
            isDuplicate = false
        }
        return isDuplicate
    }

    func duplicate(string: String) -> Bool{
        var isDuplicate = false
        print(currentLevel)
        if(string == "EVERYONE" || string == "WELL" || string == "LIFE" || string == "GIVES" || string == "KNOW" || string == "MURDER" || string == "RESPECT" || string == "EVEN" || string == "ANOTHER" || string == "ANYTHING"){
            isDuplicate = true
        }
        return isDuplicate
    }
    func duplicateHelper(string: String) -> Int{
        var num = 0
        if(string == "EVERYONE" && currentLevel == 33){
            num = 32 - previous
        }else if(string == "EVERYONE" && currentLevel == 37){
            num = 36 - previous
        }
        if(string == "ANYTHING" && currentLevel == 34){
            num = 33 - previous
        }else if(string == "ANYTHING" && currentLevel == 35){
            num = 34 - previous
        }
        if(string == "WELL" && currentLevel == 32){
            num = 31 - previous
        }else if(string == "WELL" && currentLevel == 39){
            num = 38 - previous
        }
        if(string == "GIVES" && currentLevel == 41){
            num = 40 - previous
        }else if(string == "GIVES" && currentLevel == 36){
            num = 35 - previous
        }
        if(string == "LIFE" && currentLevel == 33){
            num = 32 - previous
        }else if(string == "LIFE" && currentLevel == 43){
            num = 42 - previous
        }else if(string == "LIFE" && currentLevel == 46){
            num = 45 - previous
        }
        if(string == "KNOW" && currentLevel == 37){
            num = 36 - previous
        }else if(string == "KNOW" && currentLevel == 49){
            num = 48 - previous
        }
        if(string == "MURDER" && currentLevel == 49){
            num = 48 - previous
        }else if(string == "MURDER" && currentLevel == 48){
            num = 47 - previous
        }
        if(string == "RESPECT" && currentLevel == 47){
            num = 46 - previous
        }else if(string == "RESPECT" && currentLevel == 49){
            num = 48 - previous
        }
        if(string == "EVEN" && currentLevel == 48){
            num = 47 - previous
        }else if(string == "EVEN" && currentLevel == 52){
            num = 51 - previous
        }
        if(string == "ANOTHER" && currentLevel == 53){
            num = 52 - previous
        }else if(string == "ANOTHER" && currentLevel == 40){
            num = 39 - previous
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
        wordsSolved = 0
        pLevel = level
        pBody = popBody
        pTitle = popTitle
        pLTitle = title
        

        if(enableEndPop){
            infoPopup?.isHidden = false
        }else if(level == 55){
            defaults.set(true, forKey: "level3")
            defaults.set(31, forKey: "game2level")
            defaults.set(false, forKey: "startview")
            performSegue(withIdentifier: "levelselect2", sender: nil)
        }else{
        DispatchQueue.main.asyncAfter(deadline: .now() + levelDelay) {
        let random = Int.random(in: 1...3)
        if(!self.defaults.bool(forKey: "no-ads") && random % 3 == 0){
            if self.interstitial.isReady {
                self.interstitial.present(fromRootViewController: self)
            }
        }

        self.defaults.set(level, forKey: "level")
        self.defaults.set(level, forKey: "game2level")

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
            self.homeLogo?.removeFromParent()
            self.homePlayContainer?.removeFromParent()
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
            self.coin?.isHidden = false
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

        if(word == "MEANINGS" || num == 32){
            self.initializeNextLevel(level: 32, title: "‭‭FAITH", popTitle: "Proverbs‬ ‭1:5-6‬ ‭CEV‬‬", popBody: "Proverbs is not merely an anthology but a \",collection of collections\" relating to a pattern of life which lasted for more than a millennium. It is an example of the biblical wisdom literature")
        }else if(word == "RIDDLES" || num == 33){
            self.initializeNextLevel(level: 33, title: "FAITH", popTitle: "John‬ ‭3:16‬ ‭CEV‬‬", popBody: "John the Apostle (c. AD 6 – c. 100) was one of the Twelve Apostles of Jesus according to the New Testament. Generally listed as the youngest apostle.")
        }else if((word == "EVERYONE" && currentLevel == 33) || num == 34){
            self.initializeNextLevel(level: 34, title: "‭‭FAITH", popTitle: "Philippians‬ ‭4:6‬ ‭CEV‬‬", popBody: "Philippians 1 is the first chapter of the Epistle to the Philippians in the New Testament of the Christian Bible. It is authored by Paul the Apostle about mid-50s to early 60s AD.")
        }else if(word == "WORRY" || num == 35){
            self.initializeNextLevel(level: 35, title: "FAITH", popTitle: "‭‭Ephesians‬ ‭2:8‬ ‭CEV‬‬", popBody: "A major theme in Ephesians is the keeping of Christ's body (that is, the Church) pure and holy. Therefore be imitators of God, as beloved children.")
        }else if((word == "ANYTHING" && currentLevel == 35) || num == 36){
            self.initializeNextLevel(level: 36, title: "FAITH", popTitle: "‭‭Hebrews‬ ‭11:1‬ ‭CEV‬‬", popBody: "The Epistle to the Hebrews, or Letter to the Hebrews, or in the Greek manuscripts, simply To the Hebrews is one of the books of the New Testament.")
        }else if((word == "GIVES" && currentLevel == 36) || num == 37){
            self.initializeNextLevel(level: 37, title: "FAITH", popTitle: "‭‭Romans‬ ‭8:28‬ ‭CEV‬‬", popBody: "The Epistle to the Romans or Letter to the Romans, often shortened to Romans, is the sixth book in the New Testament.")
        }else if((word == "EVERYONE" && currentLevel == 37) || num == 38){
            self.initializeNextLevel(level: 38, title: "FAITH", popTitle: "‭‭Matthew‬ ‭17:20-21‬", popBody: "Matthew the Apostle, also known as Saint Matthew and as Levi, was, according to the New Testament, one of the twelve apostles of Jesus.")
        }else if(word == "POSSIBLE" || num == 39){
            self.initializeNextLevel(level: 39, title: "FAITH", popTitle: "‭‭Mark‬ ‭5:34‬ ‭CEV‬‬", popBody: "Mark the Evangelist (Acts 12:12; 15:37), an associate of St. Paul and a disciple of St. Peter, whose teachings the Gospel may reflect.")
        }else if(word == "HEALED" || num == 40){
            self.initializeNextLevel(level: 40, title: "FAITH", popTitle: "‭‭James‬ ‭5:16‬ ‭CEV‬‬", popBody: "The Letter of James, the Epistle of James, or simply James, is one of the 21 epistles in the New Testament.")
        }else if(word == "INNOCENT" || num == 41){
            self.initializeNextLevel(level: 41, title: "FAITH", popTitle: "‭‭Ephesians‬ ‭6:13‬ ‭CEV‬‬", popBody: "The Letter of James, the Epistle of James, or simply James, is one of the 21 epistles in the New Testament.")
        }else if((word == "GIVES" && currentLevel == 41) || num == 42){
            self.initializeNextLevel(level: 42, title: "FAITH", popTitle: "‭‭‭‭‭‭Philippians‬ ‭4:19‬ ‭CEV‬‬", popBody: "Philippians 1 is the first chapter of the Epistle to the Philippians in the New Testament of the Christian Bible. It is authored by Paul the Apostle.")

        }else if(word == "CARE" || num == 43){
            self.initializeNextLevel(level: 43, title: "FAITH", popTitle: "‭‭‭‭John‬ ‭10:10‬ ‭CEV‬‬", popBody: "John the Apostle (c. AD 6 – c. 100) was one of the Twelve Apostles of Jesus according to the New Testament. Generally listed as the youngest apostle.")

        }else if(word == "THIEF" || num == 44){
            self.initializeNextLevel(level: 44, title: "FAITH", popTitle: "‭‭Hebrews‬ ‭11:6‬ ‭CEV‬‬", popBody: "The Epistle to the Hebrews, or Letter to the Hebrews, or in the Greek manuscripts, simply To the Hebrews is one of the books of the New Testament. The text does not mention the name of its author, but was traditionally attributed to Paul the Apostle.")

        }else if(word == "BELIEVE" || num == 45){
            self.initializeNextLevel(level: 45, title: "FAITH", popTitle: "‭‭1 Peter‬ ‭5:10‬ ‭CEV‬‬", popBody: "The First Epistle of Peter, usually referred to simply as First Peter and often written 1 Peter, is a book of the New Testament.")

        }else if(word == "UNDESERVED" || num == 46){
            self.initializeNextLevel(level: 46, title: "FAITH", popTitle: "‭‭Ephesians‬ ‭5:25‬ ‭CEV‬‬", popBody: "A major theme in Ephesians is the keeping of Christ's body (that is, the Church) pure and holy. Therefore be imitators of God, as beloved children.")

        }else if(word == "MUCH" || num == 47){
            self.initializeNextLevel(level: 47, title: "FAITH", popTitle: "‭‭‭‭‭‭Hebrews‬ ‭13:4‬ ‭CEV‬‬", popBody: "The Epistle to the Hebrews, or Letter to the Hebrews, or in the Greek manuscripts, simply To the Hebrews is one of the books of the New Testament.")
        }else if(word == "IMMORAL" || num == 48){
            self.initializeNextLevel(level: 48, title: "FAITH", popTitle: "‭‭‭‭James‬ ‭2:11‬ ‭CEV‬‬", popBody: "The Letter of James, the Epistle of James, or simply James, is one of the 21 epistles in the New Testament.")
        }else if((word == "MURDER" && currentLevel == 48) || num == 49){
            self.initializeNextLevel(level: 49, title: "FAITH", popTitle: "‭‭‭‭Mark‬ ‭10:19‬ ‭CEV‬‬", popBody: "Mark the Evangelist (Acts 12:12; 15:37), an associate of St. Paul and a disciple of St. Peter, whose teachings the Gospel may reflect. It is the shortest and the earliest of the four Gospels.")
        }else if((word == "RESPECT" && currentLevel == 49) || num == 50){
            self.initializeNextLevel(level: 50, title: "FAITH", popTitle: "‭‭Isaiah‬ ‭40:31‬ ‭CEV‬‬", popBody: "Isaiah was the 8th-century BC Israelite prophet after whom the Book of Isaiah is named. Within the text of the Book of Isaiah, Isaiah himself is referred to as \"the prophet\"")
        }else if(word == "TRUST" || num == 51){
            self.initializeNextLevel(level: 51, title: "FAITH", popTitle: "‭‭Isaiah‬ ‭40:31‬ ‭CEV‬‬", popBody: "Isaiah was the 8th-century BC Israelite prophet after whom the Book of Isaiah is named. Within the text of the Book of Isaiah, Isaiah himself is referred to as \"the prophet\"")
        }else if(word == "TREMBLE" || num == 52){
            self.initializeNextLevel(level: 52, title: "FAITH", popTitle: "‭‭Job‬ ‭24:22‬ ‭CEV‬‬", popBody: "Rabbinic tradition ascribes it to Moses, but scholars generally agree that it was written between the 7th and 4th centuries BCE.")
        }else if(word == "DOOMED" || num == 53){
            self.initializeNextLevel(level: 53, title: "FAITH", popTitle: "‭‭‭‭2 John‬ ‭1:6‬ ‭NLT‬‬", popBody: "The Second Epistle of John, often referred to as Second John and often written 2 John or II John, is a book of the New Testament attributed to John the Evangelist.")
        }else if((word == "DOING"  && currentLevel == 53) || num == 54){
            self.initializeNextLevel(level: 54, title: "FAITH", popTitle: "‭‭‭‭1 Peter‬ ‭3:7‬ ‭NLT‬‬", popBody: "The First Epistle of Peter, usually referred to simply as First Peter and often written 1 Peter, is a book of the New Testament.")
        }else if(word == "HONOR" || num == 55){
            self.initializeNextLevel(level: 55, title: "", popTitle: "‭‭‭‭", popBody: "")

        }else{
            self.enableEndPop = false
        }

    }
    func correctWordSwipe(forSwippedWord strWord:String, selectedNodes arrNodes:[SKSpriteNode])
    {
        wordsSolved += 1
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
    //MARK:- Touch Actions
    
    var end:Bool = false
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
            if touchedNode == gameCoin || touchedNode == coin || touchedNode.parent == gameCoin
            {
                end = true
                gameCoin?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == gameOptionAds
            {
                end = true
                gameOptionAds?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == nextLevelButton
            {
                end = true
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }


        }
    }
    
    
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
            
            if touchedNode == gameBack
            {
                enableEndPop = false
                if touchBeganNode == gameBack {
                    if(currentLevel > previous+1){
                        defaults.set(currentLevel-1, forKey: "level")
                        defaults.set(currentLevel-1, forKey: "game2level")
                        viewDidLoad()
                    }else{
                        defaults.set(false, forKey: "startview")
                        performSegue(withIdentifier: "levelselect2", sender: nil)
                    }
                }

            }
            if touchedNode == gameOptionShuffle
            {
                nextLevelButton?.isHidden = true
                enableEndPop = false
                skip()

                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            
            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    infoPopup?.isHidden = true
                        if(enableEndPop){
                            enableEndPop = false
                            nextLevelButton?.isHidden = false
                        }
                
            }
            if touchedNode == nextLevelButton
                {
                    touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    nextLevelButton?.isHidden = true
                    infoPopup?.isHidden = true
                    levelDelay = 1
                    initializeNextLevel(level: pLevel, title: pLTitle, popTitle: pTitle, popBody: pBody)
                    levelDelay = 0
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
                performSegue(withIdentifier: "levelselect2", sender: nil)

            }
            if touchedNode == gameOptionHint
            {
                gameOptionHint?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                hint()
            }
            if touchedNode == gameCoin || touchedNode == coin || touchedNode.parent == gameCoin
            {
                gameCoin?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                performSegue(withIdentifier: "tocoins2", sender: nil)
            }
            if touchedNode == gameOptionAds
            {
                gameOptionAds?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                if rewardedAd?.isReady == true {
                   rewardedAd?.present(fromRootViewController: self, delegate:self)
                }
            }



        }
            end = false
        }
    }
    func hint(){
        let balance = defaults.integer(forKey: "balance")
        print("HINT \(wordsSolved)")
        var counter = 0
        if(balance >= 10){
            self.gameScene?.gameCanvases[currentLevel-previous-1]?.children.forEach({ (node) in
                if node is BlockNode
                {
                    node.children[0].description
                    let nodeText = (((node.children[0]) as! SKLabelNode).text)!
                    var stringHint = allStrings[currentLevel-previous-1][allStrings[currentLevel-previous-1].count-1]
                    if(wordsSolved <= allStrings[currentLevel-previous-1].count-1){
                        stringHint = allStrings[currentLevel-previous-1][wordsSolved]
                    }
                    print(nodeText)
                    print(allStrings[currentLevel-previous-1][allStrings[currentLevel-previous-1].count-1])
                    if(stringHint.contains(nodeText) && counter < 6){
                        (node as! SKSpriteNode).color = colorHighlighted
                        counter += 1
                    }
                }
            })
            defaults.set(balance-10, forKey: "balance")
            reloadBalance()

        }else{
            performSegue(withIdentifier: "tocoins2", sender: nil)
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
            performSegue(withIdentifier: "tocoins2", sender: nil)
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
    }

    func createAndLoadInterstitial() -> GADInterstitial {
//          var interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        var interstitial = GADInterstitial(adUnitID: interstatialAdID)

        
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
//        rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
        rewardedAd = GADRewardedAd(adUnitID: rewardedAdID)

        
        rewardedAd?.load(GADRequest()) { error in
          if let error = error {
            // Handle ad failed to load case.
          } else {
            // Ad successfully loaded.
          }
        }
        if(!(defaults.bool(forKey: "no-ads"))){
            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
//            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.adUnitID = bannerAdID
            
            bannerView.center = CGPoint(x: view.frame.midX, y: view.bounds.height - bannerView.bounds.height / 2)
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        //  interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")

            interstitial = GADInterstitial(adUnitID: interstatialAdID)
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
      rewardedAd = GADRewardedAd(adUnitID: rewardedAdID)
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
