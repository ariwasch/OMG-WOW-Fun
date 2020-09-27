//
//  GameViewController4.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/19/20.
//  Copyright © 2020 Ari Wasch. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController4: UIViewController, GADInterstitialDelegate, GADRewardedAdDelegate {
    
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
        loadAds()
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
        reloadBalance()

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
        if((string == "fff" && currentLevel == 60)){
            isDuplicate = false
        }
        return isDuplicate
    }

    func duplicate(string: String) -> Bool{
        var isDuplicate = false
        print(currentLevel)
        if(string == "fff" ){
            isDuplicate = true
        }
        return isDuplicate
    }
    func duplicateHelper(string: String) -> Int{
        var num = 0
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
        }else if(level == 85){
            defaults.set(true, forKey: "level5")
            defaults.set(79, forKey: "game4level")
            defaults.set(false, forKey: "startview")
            performSegue(withIdentifier: "levelselect4", sender: nil)
        }else{
        DispatchQueue.main.asyncAfter(deadline: .now() + levelDelay) {
            let random = Int.random(in: 1...3)
        if(!self.defaults.bool(forKey: "no-ads") && random % 3 == 0){
            if self.interstitial.isReady {
                self.interstitial.present(fromRootViewController: self)
            }
        }
        self.defaults.set(level, forKey: "level")
        self.defaults.set(level, forKey: "game4level")

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
            self.initializeNextLevel(level: 85, title: "", popTitle: "‭‭", popBody: "")
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
                    defaults.set(currentLevel-1, forKey: "game4level")
                    viewDidLoad()
                }else{
                    defaults.set(false, forKey: "startview")
                    performSegue(withIdentifier: "levelselect4", sender: nil)
                }            }
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
                performSegue(withIdentifier: "levelselect4", sender: nil)

            }
            if touchedNode == gameOptionHint
            {
                gameOptionHint?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                hint()
            }

            if touchedNode == gameCoin || touchedNode == coin || touchedNode.parent == gameCoin
            {
                gameCoin?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                performSegue(withIdentifier: "tocoins4", sender: nil)
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
            performSegue(withIdentifier: "tocoins4", sender: nil)
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
            performSegue(withIdentifier: "tocoins4", sender: nil)
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
//            interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
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

