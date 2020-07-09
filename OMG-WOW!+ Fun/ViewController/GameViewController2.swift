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

class GameViewController2: UIViewController {
    
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
    var currentLevel : Int = 31
    var SKSpriteNodelol : SKSpriteNode?
    var infoTitle : SKSpriteNode?
    var infoBody : SKSpriteNode?

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevel = 31
        allStrings = block.allStrings2
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        hideGameComponents()
        initializeGameSwipeAction()
        if(!(defaults.integer(forKey: "game2level") ?? 31 == 31)){
            skip(to: defaults.integer(forKey: "game2level") ?? 31)
        }

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
//        if(string == "THING" && currentLevel == 12){
//            isDuplicate = false
//        }
        return isDuplicate
    }

    func duplicate(string: String) -> Bool{
        var isDuplicate = false
        print(currentLevel)
        if(string == "EVERYONE" || string == "WELL" || string == "LIFE" || string == "GIVES"){
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
        if(string == "WELL" && currentLevel == 32){
            num = 31 - previous
        }else if(string == "WELL" && currentLevel == 39){
            num = 38 - previous
        }
        if(string == "GIVES" && currentLevel == 40){
            num = 39 - previous
        }else if(string == "GIVES" && currentLevel == 36){
            num = 35 - previous
        }
        if(string == "LIFE" && currentLevel == 33){
            num = 32 - previous
        }else if(string == "LIFE" && currentLevel == 44){
            num = 43 - previous
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
        defaults.set(level, forKey: "level")
        defaults.set(level, forKey: "game2level")

        self.currentLevel = level
        if(popTitle != "" && popBody != ""){
            if let body = SKSpriteNodelol?.childNode(withName: "infoBody") as? SKLabelNode
            {
                body.text = popBody
            }
            if let title = SKSpriteNodelol?.childNode(withName: "infoTitle") as? SKLabelNode
            {
                title.text = popTitle
            }
        }


        infoPopup?.isHidden = true
        
        self.gameScene?.gameCanvases[level-previous-1]?.children.forEach({ (node) in
            if node is BlockNode
            {
                node.run(SKAction.fadeOut(withDuration: 0))
            }
        })
        if let lblLevel = gameLevelHeader?.childNode(withName: "Label") as? SKLabelNode
        {
            lblLevel.text = "LEVEL \(level)"
        }
        if let lblTitle = gameTitleHeader?.childNode(withName: "Label") as? SKLabelNode
        {
            lblTitle.text = title
        }
        
        self.gameScene?.addNextPhysicsBody(index: level-1-previous)
        self.gameScene?.delete(index: currentLevel)

        for scene in gameScene!.gameCanvases{
            scene!.isHidden = true
        }
        for scene in gameScene!.textCanvases{
            scene!.isHidden = true
        }
        gameScene?.gameCanvases[level-previous-1]?.isHidden = false
        gameScene?.textCanvases[level-previous-1]?.isHidden = false

        var delay = 0.1
        for node in self.gameScene?.gameCanvases[level-previous-1]?.children ?? []
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
    
        if(word == "MEANINGS" || num == 32){
            self.initializeNextLevel(level: 32, title: "‭‭FAITH", popTitle: "Proverbs‬ ‭1:5-6‬ ‭CEV‬‬", popBody: "Proverbs is not merely an anthology but a \",collection of collections\" relating to a pattern of life which lasted for more than a millennium.[2] It is an example of the biblical wisdom literature")
        }else if(word == "RIDDLES" || num == 33){
            self.initializeNextLevel(level: 33, title: "FAITH", popTitle: "John‬ ‭3:16‬ ‭CEV‬‬", popBody: "John the Apostle (c. AD 6 – c. 100) was one of the Twelve Apostles of Jesus according to the New Testament. Generally listed as the youngest apostle. His brother was James, who was another of the Twelve Apostles.")
        }else if((word == "EVERYONE" && currentLevel == 33) || num == 34){
            self.initializeNextLevel(level: 34, title: "‭‭FAITH", popTitle: "Philippians‬ ‭4:6‬ ‭CEV‬‬", popBody: "Philippians 1 is the first chapter of the Epistle to the Philippians in the New Testament of the Christian Bible. It is authored by Paul the Apostle about mid-50s to early 60s AD and addressed to the Christians in Philippi, written either in Rome or Ephesus.")
        }else if(word == "WORRY" || num == 35){
            self.initializeNextLevel(level: 35, title: "FAITH", popTitle: "‭‭Ephesians‬ ‭2:8‬ ‭CEV‬‬", popBody: "A major theme in Ephesians is the keeping of Christ's body (that is, the Church) pure and holy. Therefore be imitators of God, as beloved children. And walk in love, as Christ loved us and gave himself up for us, a fragrant offering and sacrifice to God.")
        }else if(word == "ANYTHING" || num == 36){
            self.initializeNextLevel(level: 36, title: "FAITH", popTitle: "‭‭Hebrews‬ ‭11:1‬ ‭CEV‬‬", popBody: "The Epistle to the Hebrews, or Letter to the Hebrews, or in the Greek manuscripts, simply To the Hebrews is one of the books of the New Testament. The text does not mention the name of its author, but was traditionally attributed to Paul the Apostle.")
        }else if(word == "GIVES" || num == 37){
            self.initializeNextLevel(level: 37, title: "FAITH", popTitle: "‭‭Romans‬ ‭8:28‬ ‭CEV‬‬", popBody: "The Epistle to the Romans or Letter to the Romans, often shortened to Romans, is the sixth book in the New Testament.  ")
        }else if((word == "EVERYONE" && currentLevel == 37) || num == 38){
            self.initializeNextLevel(level: 38, title: "FAITH", popTitle: "‭‭Matthew‬ ‭17:20-21‬ ‭CEV‬‬", popBody: "Matthew the Apostle, also known as Saint Matthew and as Levi, was, according to the New Testament, one of the twelve apostles of Jesus. According to Christian tradition, he was also one of the four Evangelists and thus is also known as Matthew the Evangelist.")
        }else if(word == "POSSIBLE" || num == 39){
            self.initializeNextLevel(level: 39, title: "FAITH", popTitle: "‭‭Mark‬ ‭5:34‬ ‭CEV‬‬", popBody: "Mark the Evangelist (Acts 12:12; 15:37), an associate of St. Paul and a disciple of St. Peter, whose teachings the Gospel may reflect. It is the shortest and the earliest of the four Gospels, presumably written during the decade preceding the destruction of Jerusalem in 70 ce.")
        }else if(word == "HEALED" || num == 40){
            self.initializeNextLevel(level: 40, title: "FAITH", popTitle: "‭‭James‬ ‭5:16‬ ‭CEV‬‬", popBody: "The Letter of James, the Epistle of James, or simply James, is one of the 21 epistles in the New Testament. The author identifies himself as \"James, a servant [or slave] of God and of the Lord Jesus Christ\".")
        }else if(word == "INNOCENT" || num == 41){
            self.initializeNextLevel(level: 41, title: "FAITH", popTitle: "‭‭Ephesians‬ ‭6:13‬ ‭CEV‬‬", popBody: "A major theme in Ephesians is the keeping of Christ's body (that is, the Church) pure and holy. Therefore be imitators of God, as beloved children. And walk in love, as Christ loved us and gave himself up for us, a fragrant offering and sacrifice to God.")
        }else if(word == "CARE" || num == 42){
            self.initializeNextLevel(level: 42, title: "FAITH", popTitle: "‭‭‭‭John‬ ‭10:10‬ ‭CEV‬‬", popBody: "John the Apostle (c. AD 6 – c. 100) was one of the Twelve Apostles of Jesus according to the New Testament. Generally listed as the youngest apostle. His brother was James, who was another of the Twelve Apostles.")
        }else if(word == "THIEF" || num == 43){
            self.initializeNextLevel(level: 43, title: "FAITH", popTitle: "‭‭Hebrews‬ ‭11:6‬ ‭CEV‬‬", popBody: "The Epistle to the Hebrews, or Letter to the Hebrews, or in the Greek manuscripts, simply To the Hebrews is one of the books of the New Testament. The text does not mention the name of its author, but was traditionally attributed to Paul the Apostle.")
        }else if(word == "BELIEVE" || num == 44){
            self.initializeNextLevel(level: 44, title: "FAITH", popTitle: "‭‭1 Peter‬ ‭5:10‬ ‭CEV‬‬", popBody: "The First Epistle of Peter, usually referred to simply as First Peter and often written 1 Peter, is a book of the New Testament.")
        }else if(word == "UNDESERVED" || num == 45){
            self.initializeNextLevel(level: 45, title: "FAITH", popTitle: "‭‭Ephesians‬ ‭5:25‬ ‭CEV‬‬", popBody: "A major theme in Ephesians is the keeping of Christ's body (that is, the Church) pure and holy. Therefore be imitators of God, as beloved children. And walk in love, as Christ loved us and gave himself up for us, a fragrant offering and sacrifice to God.")
        }else if(word == "MUCH" || num == 46){
            self.initializeNextLevel(level: 46, title: "FAITH", popTitle: "‭‭Hebrews‬ ‭13:4‬ ‭CEV‬‬", popBody: "The Epistle to the Hebrews, or Letter to the Hebrews, or in the Greek manuscripts, simply To the Hebrews is one of the books of the New Testament. The text does not mention the name of its author, but was traditionally attributed to Paul the Apostle.")
        }else if(word == "IMMORAL" || num == 47){
            self.initializeNextLevel(level: 47, title: "FAITH", popTitle: "‭‭James‬ ‭2:11‬ ‭CEV‬‬", popBody: "The Letter of James, the Epistle of James, or simply James, is one of the 21 epistles in the New Testament. The author identifies himself as \"James, a servant [or slave] of God and of the Lord Jesus Christ\".")
        }else if(word == "MURDER" || num == 48){
            self.initializeNextLevel(level: 48, title: "FAITH", popTitle: "Mike Dolan", popBody: "Michael Dolan (born June 21, 1965, Oklahoma City, Oklahoma) is an American theatre and film actor, director and educator.")
        }else if(word == "RESPECT" || num == 49){
            self.initializeNextLevel(level: 49, title: "FAITH", popTitle: "", popBody: "")
        }else if(word == "TRUST" || num == 50){
            self.initializeNextLevel(level: 50, title: "FAITH", popTitle: "Maya Angelou", popBody: "Maya Angelou (April 4, 1928 – May 28, 2014) was an American poet, memoirist, and civil rights activist. Angelou is best known for her series of seven autobiographies, which focus on her childhood and early adult experiences. The first, I Know Why the Caged Bird Sings (1969), tells of her life up to the age of 17 and brought her international recognition and acclaim.")
        }else if(word == "RAINBOW" || num == 21){
//            self.initializeNextLevel(level: 18, title: "PURPOSE", popTitle: "Mike Dolan", popBody: "Michael Dolan (born June 21, 1965, Oklahoma City, Oklahoma) is an American theatre and film actor, director and educator.")
        }else if(false){
//            defaults.set(true, forKey: "level3")
            defaults.set(31, forKey: "game2level")
            defaults.set(false, forKey: "startview")
            performSegue(withIdentifier: "levelselect2", sender: nil)

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
                defaults.set(true, forKey: "startview")
                performSegue(withIdentifier: "levelselect2", sender: nil)
            }
            if touchedNode == gameOptionShuffle
            {
//                print("SOFJODFHOIDHJFSIOJIOFJSODIFJOSDIFJOSDJFOSDJF")
                skip()

                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            
            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
            {
                infoPopup?.isHidden = true
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
                performSegue(withIdentifier: "levelselect2", sender: nil)

            }

        }
    }
    func skip(){

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
//        initializeNextLevel(level: currentLevel+1, title: "String", popTitle: "String", popBody: "String")
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
            if touchBeganNode?.name == "closeInfo" {
                touchBeganNode?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode.name == "Author" {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == gameOptionShuffle
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchedNode == gameOptionSearch
            {
                gameOptionSearch?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))

            }


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
