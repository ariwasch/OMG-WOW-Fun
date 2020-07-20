//
//  GameViewController4.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/19/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController4: UIViewController {
    
    var gameScene : MyScene4?
    var homeBackground : SKSpriteNode?
    var homeLogo : SKSpriteNode?
    var homePlayContainer : SKSpriteNode?
    var homePlayButton : SKSpriteNode?
    let previous = 78
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
    var currentLevel : Int = 79
    var SKSpriteNodelol : SKSpriteNode?
    var infoTitle : SKSpriteNode?
    var infoBody : SKSpriteNode?

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevel = 79
        allStrings = block.allStrings4
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        hideGameComponents()
        initializeGameSwipeAction()
        if(defaults.integer(forKey: "game4level") != 79 && (defaults.integer(forKey: "game4level") != 0)){
            skip(to: defaults.integer(forKey: "game4level"))
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Load Scene
    func presentGameScene()
    {
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "MyScene4") as? MyScene4 {
                
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
        if((string == "POOP" && currentLevel == 60)){
            isDuplicate = false
        }
        return isDuplicate
    }

    func duplicate(string: String) -> Bool{
        var isDuplicate = false
        print(currentLevel)
        if(string == "POOP" ){
            isDuplicate = true
        }
        return isDuplicate
    }
    func duplicateHelper(string: String) -> Int{
        var num = 0
//        if(string == "EVERYONE" && currentLevel == 34){
//            num = 33 - previous
//        }else if(string == "EVERYONE" && currentLevel == 37){
//            num = 36 - previous
//        }
//        if(string == "PEOPLE" && currentLevel == 61){
//            num = 60 - previous
//        }else if(string == "PEOPLE" && currentLevel == 59){
//            num = 58 - previous
//        }else if(string == "PEOPLE" && currentLevel == 72){
//            num = 71 - previous
//        }
//        if(string == "LIVE" && currentLevel == 64){
//            num = 63 - previous
//        }else if(string == "LIVE" && currentLevel == 62){
//            num = 61 - previous
//        }
//        if(string == "LAUGH" && currentLevel == 57){
//            num = 56 - previous
//        }else if(string == "LAUGH" && currentLevel == 63){
//            num = 62 - previous
//        }else if(string == "LAUGH" && currentLevel == 74){
//            num = 73 - previous
//        }
//
//        if(string == "MURDER" && currentLevel == 49){
//            num = 48 - previous
//        }else if(string == "MURDER" && currentLevel == 48){
//            num = 47 - previous
//        }
//        if(string == "RESPECT" && currentLevel == 47){
//            num = 46 - previous
//        }else if(string == "RESPECT" && currentLevel == 49){
//            num = 48 - previous
//        }
//        if(string == "EVEN" && currentLevel == 48){
//            num = 47 - previous
//        }else if(string == "EVEN" && currentLevel == 52){
//            num = 51 - previous
//        }
//        if(string == "ANOTHER" && currentLevel == 53){
//            num = 52 - previous
//        }else if(string == "ANOTHER" && currentLevel == 40){
//            num = 39 - previous
//        }
//        if(string == "LIFE" && currentLevel == 55){
//            num = 54 - previous
//        }else if(string == "LIFE" && currentLevel == 72){
//            num = 71 - previous
//        }
//        if(string == "WHAT" && currentLevel == 77){
//            num = 76 - previous
//        }else if(string == "WHAT" && currentLevel == 62){
//            num = 61 - previous
//        }



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
        defaults.set(level, forKey: "game4level")

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
        
        for scene in gameScene!.gameCanvases{
            if(scene != nil){
                scene!.isHidden = true
            }
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
    
        if(word == "DIFFERENT" || num == 80){
            self.initializeNextLevel(level: 80, title: "‭‭INCLUSION", popTitle: "Pat Wadors", popBody: "Pat Wadors is Chief Talent Officer at ServiceNow Inc. See Pat Wadors's compensation, career history, education, & memberships.")
        }else if(word == "LISTEN" || num == 81){
            self.initializeNextLevel(level: 81, title: "INCLUSION", popTitle: "Martin Luther King, Jr", popBody: "Martin Luther King Jr. was an African American minister and activist who became the most visible spokesperson and leader in the civil rights movement.")
        }else if(word == "STARTED" || num == 82){
            self.initializeNextLevel(level: 82, title: "‭‭INCLUSION", popTitle: "Doris Kearns Goodwin", popBody: "Doris Kearns Goodwin is a presidential historian, international keynote speaker, Pulitzer Prize-winning, New York Times #1 best-selling author.")
        }else if(word == "REQUIRES" || num == 83){
            self.initializeNextLevel(level: 83, title: "INCLUSION", popTitle: "‭‭Jimmy Carter", popBody: "James Earl Carter Jr. is an American politician, philanthropist, and former farmer who served as the 39th president of the United States from 1977 to 1981.")
        }else if(word == "YEARNINGS" || num == 84){
            self.initializeNextLevel(level: 84, title: "INCLUSION", popTitle: "‭‭Ginni Rometty", popBody: "Virginia \"Ginni\" Marie Rometty is an American business executive, serving as executive chairman of IBM. ")
        }else if(word == "BELIEVE" || num == 85){
            defaults.set(true, forKey: "level5")
            defaults.set(79, forKey: "game4level")
            defaults.set(false, forKey: "startview")
            performSegue(withIdentifier: "levelselect4", sender: nil)

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
                performSegue(withIdentifier: "levelselect4", sender: nil)
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
                performSegue(withIdentifier: "levelselect4", sender: nil)

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