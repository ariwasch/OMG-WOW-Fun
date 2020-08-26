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

class GameViewController3: UIViewController, GADInterstitialDelegate, GADRewardedAdDelegate {
    
    var gameScene : MyScene3?
    var homeBackground : SKSpriteNode?
    var homeLogo : SKSpriteNode?
    var homePlayContainer : SKSpriteNode?
    var homePlayButton : SKSpriteNode?
    let previous = 54
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

    var touchBeganNode : SKSpriteNode?
    var currentLevel : Int = 55
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
        loadAds()
        currentLevel = 55
        allStrings = block.allStrings3
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        hideGameComponents()
        initializeGameSwipeAction()
        print("HEIRHIEHRHEIRH \(defaults.integer(forKey: "game3level"))")
        if(defaults.integer(forKey: "game3level") != 55 && (defaults.integer(forKey: "game3level") != 0)){
            skip(to: defaults.integer(forKey: "game3level"))
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
            if let scene = SKScene(fileNamed: "MyScene3") as? MyScene3 {
                
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
        if((string == "OUT" && currentLevel == 68) || (string == "TAKE" && currentLevel == 70) || (string == "TAKE" && currentLevel == 76) || (string == "TAKES" && currentLevel == 70)){
            isDuplicate = false
        }
        return isDuplicate
    }

    func duplicate(string: String) -> Bool{
        var isDuplicate = false
        print(currentLevel)
        if(string == "EVERYONE" || string == "PEOPLE" || string == "LIVE" || string == "LAUGH" || string == "LIFE" || string == "WHAT"){
            isDuplicate = true
        }
        return isDuplicate
    }
    func duplicateHelper(string: String) -> Int{
        var num = 0
        if(string == "EVERYONE" && currentLevel == 34){
            num = 33 - previous
        }else if(string == "EVERYONE" && currentLevel == 37){
            num = 36 - previous
        }
        if(string == "PEOPLE" && currentLevel == 61){
            num = 60 - previous
        }else if(string == "PEOPLE" && currentLevel == 59){
            num = 58 - previous
        }else if(string == "PEOPLE" && currentLevel == 72){
            num = 71 - previous
        }
        if(string == "LIVE" && currentLevel == 64){
            num = 63 - previous
        }else if(string == "LIVE" && currentLevel == 62){
            num = 61 - previous
        }
        if(string == "LAUGH" && currentLevel == 57){
            num = 56 - previous
        }else if(string == "LAUGH" && currentLevel == 63){
            num = 62 - previous
        }else if(string == "LAUGH" && currentLevel == 74){
            num = 73 - previous
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
        if(string == "LIFE" && currentLevel == 55){
            num = 54 - previous
        }else if(string == "LIFE" && currentLevel == 72){
            num = 71 - previous
        }
        if(string == "WHAT" && currentLevel == 77){
            num = 76 - previous
        }else if(string == "WHAT" && currentLevel == 62){
            num = 61 - previous
        }



//        print(num)
//        print(currentLevel)
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
        }else if(level == 79){
            defaults.set(true, forKey: "level4")
            defaults.set(55, forKey: "game3level")
            defaults.set(false, forKey: "startview")
            performSegue(withIdentifier: "levelselect3", sender: nil)
        }else{
        DispatchQueue.main.asyncAfter(deadline: .now() + levelDelay) {
        let random = Int.random(in: 1...3)
        if(!self.defaults.bool(forKey: "no-ads") && random % 3 == 0){
            if self.interstitial.isReady {
                self.interstitial.present(fromRootViewController: self)
            }
        }
        
        self.defaults.set(level, forKey: "level")
        self.defaults.set(level, forKey: "game3level")

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
        if((word == "LIFE" && currentLevel == 55) || num == 56){
            self.initializeNextLevel(level: 56, title: "‭‭21ST CENTURY", popTitle: "Venus Williams", popBody: "Venus Ebony Starr Williams is an American professional tennis player. A former world No. 1, Williams is generally regarded as one of the all-time greats")
        }else if(word == "BELIEVE" || num == 57){
            self.initializeNextLevel(level: 57, title: "21ST CENTURY", popTitle: "John Mayer", popBody: "John Clayton Mayer is an American singer-songwriter, guitarist and record producer. Born in Bridgeport, Connecticut, Mayer attended Berklee College of Music in Boston")
        }else if((word == "LAUGH" && currentLevel == 57) || num == 58){
            self.initializeNextLevel(level: 58, title: "‭‭21ST CENTURY", popTitle: "Conan O'Brien", popBody: "Conan Christopher O'Brien is an American television host, comedian, writer, podcaster, and producer. He is best known for hosting the late-night talk shows Late Night with Conan O'Brien, The Tonight Show with Conan O'Brien")
        }else if(word == "TUXEDO" || num == 59){
            self.initializeNextLevel(level: 59, title: "21ST CENTURY", popTitle: "‭‭Isaac Asimov", popBody: "Isaac Asimov was an American writer and professor of biochemistry at Boston University. He was known for his works of science fiction and popular science.")
        }else if(word == "THOSE" || num == 60){
            self.initializeNextLevel(level: 60, title: "21ST CENTURY", popTitle: "‭‭Ronald Reagan", popBody: "Ronald Wilson Reagan was an American politician who served as the 40th president of the United States from 1981 to 1989 and became a highly influential voice of modern conservatism.")
        }else if(word == "LIMIT" || num == 61){
            self.initializeNextLevel(level: 61, title: "21ST CENTURY", popTitle: "‭‭Jeff Bezos", popBody: "Jeffrey Preston Bezos is an American internet entrepreneur, industrialist, media proprietor, and investor. He is best known as the founder, CEO, and president of the multi-national technology company Amazon.")
        }else if(word == "SHORT" || num == 62){
            self.initializeNextLevel(level: 62, title: "21ST CENTURY", popTitle: "‭‭Lady Gaga", popBody: "Stefani Joanne Angelina Germanotta, known professionally as Lady Gaga, is an American singer, songwriter, record producer, actress, and businesswoman.")
        }else if(word == "CREATE" || num == 63){
            self.initializeNextLevel(level: 63, title: "21ST CENTURY", popTitle: "‭‭Drake", popBody: "Aubrey Drake Graham is a Canadian rapper, singer, songwriter, record producer, actor, and entrepreneur. A prominent figure in popular music, Drake is widely credited for popularizing the Toronto sound to the music industry.")
        }else if(word == "PERFECT" || num == 64){
            self.initializeNextLevel(level: 64, title: "21ST CENTURY", popTitle: "‭‭Alan Cohen", popBody: "Alan Cohen is the inspirational author of 24 book and several audio CDs, in addition to many foreign language titles.")
        }else if(word == "WHERE" || num == 65){
            self.initializeNextLevel(level: 65, title: "21ST CENTURY", popTitle: "‭‭John C. Maxwell", popBody: "John Calvin Maxwell is an American author, speaker, and pastor who has written many books, primarily focusing on leadership.")
        }else if(word == "OVERCOME" || num == 66){
            self.initializeNextLevel(level: 66, title: "21ST CENTURY", popTitle: "‭‭‭‭‭‭Dale Carnegie", popBody: "Dale Carnegie was an American writer and lecturer, and the developer of courses in self-improvement, salesmanship, corporate training, public speaking, and interpersonal skills.")
        }else if(word == "IMPROVING" || num == 67){
            self.initializeNextLevel(level: 67, title: "21ST CENTURY", popTitle: "‭‭‭‭Tony Robbins", popBody: "Anthony Jay Robbins is an American author, public speaker, life coach, and philanthropist. Robbins is known for his infomercials, seminars, and self-help books including the books Unlimited Power.")
        }else if(word == "PROBLEM" || num == 68){
            self.initializeNextLevel(level: 68, title: "21ST CENTURY", popTitle: "‭‭Salma Hayek", popBody: "Salma Hayek Pinault is a Mexican and American film actress and producer.")
        }else if(word == "REALIZING" || num == 69){
            self.initializeNextLevel(level: 69, title: "21ST CENTURY", popTitle: "‭‭Dennis Wholey", popBody: "Dennis Wholey is an American television host and producer, and the author of a number of self-help books, one of which was a New York Times bestseller.")
        }else if(word == "WORLD" || num == 70){
            self.initializeNextLevel(level: 70, title: "21ST CENTURY", popTitle: "‭‭James Corden", popBody: "James Kimberley Corden OBE is an English actor, comedian, writer, and television host.")
        }else if(word == "BEST" || num == 71){
            self.initializeNextLevel(level: 71, title: "21ST CENTURY", popTitle: "‭‭Nelson Mandela", popBody: "Nelson Rolihlahla Mandela was a South African anti-apartheid revolutionary, political leader and philanthropist who served as President of South Africa from 1994 to 1999.")
        }else if(word == "EXPECTING" || num == 72){
            self.initializeNextLevel(level: 72, title: "21ST CENTURY", popTitle: "‭‭Marilyn Monroe", popBody: "Marilyn Monroe was an American actress, model, and singer.")
        }else if(word == "CUTTING" || num == 73){
            self.initializeNextLevel(level: 73, title: "21ST CENTURY", popTitle: "‭‭Guy Kawasaki", popBody: "Guy Takeo Kawasaki is an American marketing specialist, author, and Silicon Valley venture capitalist.")
        }else if(word == "TITLE" || num == 74){
            self.initializeNextLevel(level: 74, title: "21ST CENTURY", popTitle: "‭‭Charlie Chaplin", popBody: "Sir Charles Spencer Chaplin KBE was an English comic actor, filmmaker, and composer who rose to fame in the era of silent film.")
        }else if(word == "NEVER" || num == 75){
            self.initializeNextLevel(level: 75, title: "21ST CENTURY", popTitle: "‭‭T. Harv Eker", popBody: "T. Harv Eker is an author, businessman and motivational speaker known for his theories on wealth and motivation. He is the author of the book Secrets of the Millionaire Mind published by HarperCollins.")
        }else if(word == "UNIVERSE" || num == 76){
            self.initializeNextLevel(level: 76, title: "21ST CENTURY", popTitle: "‭‭Drew Brees", popBody: "Drew Christopher Brees is an American football quarterback for the New Orleans Saints of the National Football League (NFL). He had a successful college football career at Purdue University")
        }else if(word == "ADVERSITY" || num == 77){
            self.initializeNextLevel(level: 77, title: "21ST CENTURY", popTitle: "‭‭Alan Alda", popBody: "Alan Alda is an American actor, director, screenwriter, comedian, and author. A six-time Emmy Award and Golden Globe Award winner")
        }else if(word == "INTUITION" || num == 78){
            self.initializeNextLevel(level: 78, title: "21ST CENTURY", popTitle: "‭‭", popBody: "")
        }else if(word == "PLENTIFUL" || num == 79){
            self.initializeNextLevel(level: 79, title: "21ST CENTURY", popTitle: "‭‭", popBody: "")

        }else{
            self.enableEndPop = false
        }
//            self.initializeNextLevel(level: 69, title: "21ST CENTURY", popTitle: "‭‭Salma Hayek", popBody: "Salma Hayek Pinault is a Mexican and American film actress and producer.")
//
//        }else if(word == "UNDESERVED" || num == 46){
//            self.initializeNextLevel(level: 46, title: "21ST CENTURY", popTitle: "‭‭Ephesians‬ ‭5:25‬ ‭CEV‬‬", popBody: "A major theme in Ephesians is the keeping of Christ's body (that is, the Church) pure and holy. Therefore be imitators of God, as beloved children. And walk in love, as Christ loved us and gave himself up for us, a fragrant offering and sacrifice to God.")
//
//
//        }else if(word == "MUCH" || num == 47){
//            self.initializeNextLevel(level: 47, title: "21ST CENTURY", popTitle: "‭‭‭‭‭‭Hebrews‬ ‭13:4‬ ‭CEV‬‬", popBody: "The Epistle to the Hebrews, or Letter to the Hebrews, or in the Greek manuscripts, simply To the Hebrews is one of the books of the New Testament.")
//        }else if(word == "IMMORAL" || num == 48){
//            self.initializeNextLevel(level: 48, title: "21ST CENTURY", popTitle: "‭‭‭‭James‬ ‭2:11‬ ‭CEV‬‬", popBody: "The Letter of James, the Epistle of James, or simply James, is one of the 21 epistles in the New Testament.")
//        }else if((word == "MURDER" && currentLevel == 48) || num == 49){
//            self.initializeNextLevel(level: 49, title: "21ST CENTURY", popTitle: "‭‭‭‭Mark‬ ‭10:19‬ ‭CEV‬‬", popBody: "Mark the Evangelist (Acts 12:12; 15:37), an associate of St. Paul and a disciple of St. Peter, whose teachings the Gospel may reflect. It is the shortest and the earliest of the four Gospels.")
//        }else if((word == "RESPECT" && currentLevel == 49) || num == 50){
//            self.initializeNextLevel(level: 50, title: "21ST CENTURY", popTitle: "‭‭Isaiah‬ ‭40:31‬ ‭CEV‬‬", popBody: "Isaiah was the 8th-century BC Israelite prophet after whom the Book of Isaiah is named. Within the text of the Book of Isaiah, Isaiah himself is referred to as \"the prophet\"")
//        }else if(word == "TRUST" || num == 51){
//            self.initializeNextLevel(level: 51, title: "21ST CENTURY", popTitle: "‭‭Isaiah‬ ‭40:31‬ ‭CEV‬‬", popBody: "Isaiah was the 8th-century BC Israelite prophet after whom the Book of Isaiah is named. Within the text of the Book of Isaiah, Isaiah himself is referred to as \"the prophet\"")
//        }else if(word == "TREMBLE" || num == 52){
//            self.initializeNextLevel(level: 52, title: "21ST CENTURY", popTitle: "‭‭Job‬ ‭24:22‬ ‭CEV‬‬", popBody: "Rabbinic tradition ascribes it to Moses, but scholars generally agree that it was written between the 7th and 4th centuries BCE.")
//        }else if(word == "DOOMED" || num == 53){
//            self.initializeNextLevel(level: 53, title: "21ST CENTURY", popTitle: "‭‭‭‭2 John‬ ‭1:6‬ ‭NLT‬‬", popBody: "The Second Epistle of John, often referred to as Second John and often written 2 John or II John, is a book of the New Testament attributed to John the Evangelist.")
//        }else if((word == "DOING"  && currentLevel == 53) || num == 54){
//            self.initializeNextLevel(level: 54, title: "21ST CENTURY", popTitle: "‭‭‭‭1 Peter‬ ‭3:7‬ ‭NLT‬‬", popBody: "The First Epistle of Peter, usually referred to simply as First Peter and often written 1 Peter, is a book of the New Testament.")
//        }else if(word == "HONOR" || num == 55){
////            defaults.set(true, forKey: "level3")
//            defaults.set(31, forKey: "game2level")
//            defaults.set(false, forKey: "startview")
//            performSegue(withIdentifier: "levelselect3", sender: nil)
//
        





        

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
            
            if touchedNode == gameBack
            {
                enableEndPop = false
                if(currentLevel > previous+1){
                    defaults.set(currentLevel-1, forKey: "level")
                    defaults.set(currentLevel-1, forKey: "game3level")
                    viewDidLoad()
                }else{
                    defaults.set(false, forKey: "startview")
                    performSegue(withIdentifier: "levelselect3", sender: nil)
                }
            }
            if touchedNode == gameOptionShuffle
            {
//                print("SOFJODFHOIDHJFSIOJIOFJSODIFJOSDIFJOSDJFOSDJF")
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
                //                    levelDelay = 1
                //                    initializeNextLevel(level: pLevel, title: pLTitle, popTitle: pTitle, popBody: pBody)
                //                    levelDelay = 0
                        }
                
            }
            if touchedNode == nextLevelButton
                {
                    touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
                    nextLevelButton?.isHidden = true
                    infoPopup?.isHidden = true
            //                if(enableEndPop){
            //                    enableEndPop = false
                    levelDelay = 1
                    initializeNextLevel(level: pLevel, title: pLTitle, popTitle: pTitle, popBody: pBody)
                    levelDelay = 0
            //                }
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
                performSegue(withIdentifier: "levelselect3", sender: nil)

            }
            if touchedNode == gameOptionHint
            {
                gameOptionHint?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                hint()
            }
            if touchedNode == gameCoin || touchedNode == coin
            {
                gameCoin?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                performSegue(withIdentifier: "tocoins3", sender: nil)
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
            performSegue(withIdentifier: "tocoins3", sender: nil)
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
            performSegue(withIdentifier: "tocoins3", sender: nil)

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
    var end:Bool = false

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
            if touchedNode == nextLevelButton
            {
                end = true
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
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
