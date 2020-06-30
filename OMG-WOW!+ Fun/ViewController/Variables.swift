////
////  GameViewController.swift
////  SampleGame
////
////  Created by Hitesh Trantor on 30/03/20.
////  Copyright © 2020 TrantorSoftware. All rights reserved.
////
//
//import UIKit
//import SpriteKit
//import GameplayKit
//
//class GameViewController: UIViewController {
//    
//    var gameScene : MyScene?
//    var homeBackground : SKSpriteNode?
//    var homeLogo : SKSpriteNode?
//    var homePlayContainer : SKSpriteNode?
//    var homePlayButton : SKSpriteNode?
//    
//    var gameBlockContainer : SKSpriteNode?
//    var gameBackground : SKSpriteNode?
//    var gameBack : SKSpriteNode?
//    var gameLevelHeader : SKSpriteNode?
//    var gameTitleHeader : SKSpriteNode?
//    var gameCoin : SKSpriteNode?
//    var allStrings = [["GOOD","BETTER","BEST"], ["GOLF","TENNIS","BALL","ROW","PITCH"], ["NEVER","ALWAYS","EYE"], ["NOTHING","THAN","POSITIVE"], ["THOUGHT","CHANGE","SMALL","DAY"], ["SITUATION","SITUATION","TURN","INTO"]]
//    
//    var block : BlockNode = BlockNode()
//    var gameOptionsBackground : SKSpriteNode?
//    var gameOptionSearch : SKSpriteNode?
//    var gameOptionHint : SKSpriteNode?
//    var gameOptionShuffle : SKSpriteNode?
//    var gameOptionAds : SKSpriteNode?; var gameTextContainer : SKSpriteNode?
//
//    var gameTextContainer4 : SKSpriteNode?
//
//    var infoPopup : SKSpriteNode?
//
//    var gameBetterB : SKSpriteNode?; var gameBetterE : SKSpriteNode?; var gameBetterT : SKSpriteNode?; var gameBetterTT : SKSpriteNode?; var gameBetterEE : SKSpriteNode?; var gameBetterR : SKSpriteNode?
//    
//    var gameGoodG : SKSpriteNode?; var gameGoodO : SKSpriteNode?; var gameGoodOO : SKSpriteNode?; var gameGoodD : SKSpriteNode?
//    
//    var gameBestB : SKSpriteNode?; var gameBestE : SKSpriteNode?; var gameBestS : SKSpriteNode?; var gameBestT : SKSpriteNode?
//
//    var gameGolfG : SKSpriteNode?; var gameGolfO : SKSpriteNode?; var gameGolfL : SKSpriteNode?; var gameGolfF : SKSpriteNode?
//
//    var gameTennisT : SKSpriteNode?; var gameTennisE : SKSpriteNode?; var gameTennisN : SKSpriteNode?; var gameTennisNN : SKSpriteNode?; var gameTennisI : SKSpriteNode?; var gameTennisS : SKSpriteNode?
//
//    var gameBallB : SKSpriteNode?; var gameBallA : SKSpriteNode?; var gameBallL : SKSpriteNode?; var gameBallLL : SKSpriteNode?
//
//    var gameRowR : SKSpriteNode?; var gameRowO : SKSpriteNode?; var gameRowW : SKSpriteNode?
//
//    var gamePitchP : SKSpriteNode?; var gamePitchI : SKSpriteNode?; var gamePitchT : SKSpriteNode?; var gamePitchC : SKSpriteNode?; var gamePitchH : SKSpriteNode?
//
//    var gameNeverN : SKSpriteNode?; var gameNeverE : SKSpriteNode?; var gameNeverV : SKSpriteNode?; var gameNeverEE : SKSpriteNode?; var gameNeverR : SKSpriteNode?
//
//    var gameAlwaysA : SKSpriteNode?; var gameAlwaysL : SKSpriteNode?; var gameAlwaysW : SKSpriteNode?; var gameAlwaysAA : SKSpriteNode?; var gameAlwaysY : SKSpriteNode?; var gameAlwaysS : SKSpriteNode?
//
//    var gameEyeE : SKSpriteNode?; var gameEyeY : SKSpriteNode?; var gameEyeEE : SKSpriteNode?
//
//
//    var thanT : SKSpriteNode?; var thanH : SKSpriteNode?; var thanA : SKSpriteNode?; var thanN : SKSpriteNode?;
//    var positiveP : SKSpriteNode?; var positiveO : SKSpriteNode?; var positiveS : SKSpriteNode?; var positiveI : SKSpriteNode?; var positiveT : SKSpriteNode?; var positiveII : SKSpriteNode?; var positiveV : SKSpriteNode?; var positiveE : SKSpriteNode?;
//    var nothingN : SKSpriteNode?; var nothingO : SKSpriteNode?; var nothingT : SKSpriteNode?; var nothingH : SKSpriteNode?; var nothingI : SKSpriteNode?; var nothingNN : SKSpriteNode?; var nothingG : SKSpriteNode?;
//    
//    var thoughtT : SKSpriteNode?; var thoughtHH : SKSpriteNode?; var thoughtO : SKSpriteNode?; var thoughtU : SKSpriteNode?; var thoughtG : SKSpriteNode?; var thoughtH : SKSpriteNode?; var thoughtTT : SKSpriteNode?;
//    var smallS : SKSpriteNode?; var smallM : SKSpriteNode?; var smallA : SKSpriteNode?; var smallL : SKSpriteNode?; var smallLL : SKSpriteNode?;
//    var dayD : SKSpriteNode?; var dayA : SKSpriteNode?; var dayY : SKSpriteNode?;
//    var changeC : SKSpriteNode?; var changeH : SKSpriteNode?; var changeA : SKSpriteNode?; var changeN : SKSpriteNode?; var changeG : SKSpriteNode?; var changeE : SKSpriteNode?;
//    var situationS : SKSpriteNode?; var situationI : SKSpriteNode?; var situationTT : SKSpriteNode?; var situationU : SKSpriteNode?; var situationA : SKSpriteNode?; var situationT : SKSpriteNode?; var situationII : SKSpriteNode?; var situationO : SKSpriteNode?; var situationN : SKSpriteNode?;
//    var turnT : SKSpriteNode?; var turnU : SKSpriteNode?; var turnR : SKSpriteNode?; var turnN : SKSpriteNode?;
//    var intoI : SKSpriteNode?; var intoN : SKSpriteNode?; var intoT : SKSpriteNode?; var intoO : SKSpriteNode?;
//        
//    var variableArray: [[SKSpriteNode?]] = [[]]
//    var gameCongratulations : SKLabelNode?
//    
//    var gameBlockContainer2 : SKSpriteNode?
//    var gameTextContainer2 : SKSpriteNode?
//
//    var gameBlockTest : SKSpriteNode?
//    var gameTextTest : SKSpriteNode?
//
//    var touchBeganNode : SKSpriteNode?
//    var currentLevel : Int = 0
//    var SKSpriteNodelol : SKSpriteNode?
//    var infoTitle : SKSpriteNode?
//    var infoBody : SKSpriteNode?
//
//    //MARK:- View LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        currentLevel = 0
//        allStrings = block.allStrings
//        view.layoutIfNeeded()
//        presentGameScene()
//        initializationOfGameVariable()
//        hideGameComponents()
//        initializeGameSwipeAction()
//    }
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
//    
//    //MARK:- Load Scene
//    func presentGameScene()
//    {
//        if let view = self.view as! SKView? {
//            if let scene = SKScene(fileNamed: "MyScene") as? MyScene {
//                
//                if gameScene != nil {
//                    gameScene?.removeFromParent()
//                    view.presentScene(nil)
//                }
//                
//                gameScene = scene
//                gameScene!.scaleMode = .aspectFit
//                view.presentScene(gameScene!)
//            }
//            
//            //view.ignoresSiblingOrder = true
//            //            view.showsFPS = true
//            //            view.showsNodeCount = true
//            //            view.showsPhysics = true
//            //            view.showsFields = true
//            //            view.showsDrawCount = true
//            //            view.showsQuadCount = true
//        }
//    }
//    
//    //MARK:- Initilizing Game Variables and Components
//    
//    func initializationOfGameVariable()
//    {
//        homeBackground = fetchSpriteNode(withName: "homeBackground")
//        homeLogo = fetchSpriteNode(withName: "homeLogo")
//        homePlayContainer = fetchSpriteNode(withName: "homePlayContainer")
//        gameBlockContainer = fetchSpriteNode(withName: "gameBlockContainer")
//        gameBackground = fetchSpriteNode(withName: "gameBackground")
//        homePlayButton = fetchSpriteNode(withName: "homePlayButton",inNode:homePlayContainer)
//        
//        gameBack = fetchSpriteNode(withName: "gameBack")
//        gameLevelHeader = fetchSpriteNode(withName: "gameLevelHeader")
//        gameTitleHeader = fetchSpriteNode(withName: "gameTitleHeader")
//        gameCoin = fetchSpriteNode(withName: "gameCoin")
//        
//        gameOptionsBackground = fetchSpriteNode(withName: "gameOptionsBackground")
//        gameOptionSearch = fetchSpriteNode(withName: "gameOptionSearch")
//        gameOptionHint = fetchSpriteNode(withName: "gameOptionHint")
//        gameOptionShuffle = fetchSpriteNode(withName: "gameOptionShuffle")
//        gameOptionAds = fetchSpriteNode(withName: "gameOptionAds")
//        gameTextContainer = fetchSpriteNode(withName: "gameTextContainer")
//        gameTextContainer4 = fetchSpriteNode(withName: "gameTextContainer4")
//
//        infoPopup = fetchSpriteNode(withName: "infoPopup")
//
//        gameBetterB = fetchSpriteNode(withName: "gameBetterB",inNode: gameTextContainer)
//        gameBetterE = fetchSpriteNode(withName: "gameBetterE",inNode: gameTextContainer)
//        gameBetterT = fetchSpriteNode(withName: "gameBetterT",inNode: gameTextContainer)
//        gameBetterTT = fetchSpriteNode(withName: "gameBetterTT",inNode: gameTextContainer)
//        gameBetterEE = fetchSpriteNode(withName: "gameBetterEE",inNode: gameTextContainer)
//        gameBetterR = fetchSpriteNode(withName: "gameBetterR",inNode: gameTextContainer)
//        
//        gameGoodD = fetchSpriteNode(withName: "gameGoodD",inNode: gameTextContainer)
//        gameGoodO = fetchSpriteNode(withName: "gameGoodO",inNode: gameTextContainer)
//        gameGoodOO = fetchSpriteNode(withName: "gameGoodOO",inNode: gameTextContainer)
//        gameGoodG = fetchSpriteNode(withName: "gameGoodG",inNode: gameTextContainer)
//        
//        gameBestB = fetchSpriteNode(withName: "gameBestB",inNode: gameTextContainer)
//        gameBestE = fetchSpriteNode(withName: "gameBestE",inNode: gameTextContainer)
//        gameBestS = fetchSpriteNode(withName: "gameBestS",inNode: gameTextContainer)
//        gameBestT = fetchSpriteNode(withName: "gameBestT",inNode: gameTextContainer)
//
//        gameCongratulations = gameScene?.childNode(withName: "gameCongratulations") as? SKLabelNode
//        gameBlockContainer2 = fetchSpriteNode(withName: "gameBlockContainer2")
//        gameTextContainer2 = fetchSpriteNode(withName: "gameTextContainer2")
//
//        gameBlockTest = fetchSpriteNode(withName: "gameBlockContainer3")
//        gameTextTest = fetchSpriteNode(withName: "gameTextContainer3")
//
//        gameTennisT = fetchSpriteNode(withName: "gameTennisT",inNode: gameTextContainer2)
//        gameTennisE = fetchSpriteNode(withName: "gameTennisE",inNode: gameTextContainer2)
//        gameTennisN = fetchSpriteNode(withName: "gameTennisN",inNode: gameTextContainer2)
//        gameTennisNN = fetchSpriteNode(withName: "gameTennisNN",inNode: gameTextContainer2)
//        gameTennisI = fetchSpriteNode(withName: "gameTennisI",inNode: gameTextContainer2)
//        gameTennisS = fetchSpriteNode(withName: "gameTennisS",inNode: gameTextContainer2)
//
//        gameBallB = fetchSpriteNode(withName: "gameBallB",inNode: gameTextContainer2)
//        gameBallA = fetchSpriteNode(withName: "gameBallA",inNode: gameTextContainer2)
//        gameBallL = fetchSpriteNode(withName: "gameBallL",inNode: gameTextContainer2)
//        gameBallLL = fetchSpriteNode(withName: "gameBallLL",inNode: gameTextContainer2)
//
//        gameRowR = fetchSpriteNode(withName: "gameRowR",inNode: gameTextContainer2)
//        gameRowO = fetchSpriteNode(withName: "gameRowO",inNode: gameTextContainer2)
//        gameRowW = fetchSpriteNode(withName: "gameRowW",inNode: gameTextContainer2)
//
//        gamePitchP = fetchSpriteNode(withName: "gamePitchP",inNode: gameTextContainer2)
//        gamePitchI = fetchSpriteNode(withName: "gamePitchI",inNode: gameTextContainer2)
//        gamePitchT = fetchSpriteNode(withName: "gamePitchT",inNode: gameTextContainer2)
//        gamePitchC = fetchSpriteNode(withName: "gamePitchC",inNode: gameTextContainer2)
//        gamePitchH = fetchSpriteNode(withName: "gamePitchH",inNode: gameTextContainer2)
//        
//        gameGolfG = fetchSpriteNode(withName: "gameGolfG",inNode: gameTextContainer2)
//        gameGolfO = fetchSpriteNode(withName: "gameGolfO",inNode: gameTextContainer2)
//        gameGolfL = fetchSpriteNode(withName: "gameGolfL",inNode: gameTextContainer2)
//        gameGolfF = fetchSpriteNode(withName: "gameGolfF",inNode: gameTextContainer2)
//        
//        gameNeverN = fetchSpriteNode(withName: "gameNeverN",inNode: gameTextTest)
//        gameNeverE = fetchSpriteNode(withName: "gameNeverE",inNode: gameTextTest)
//        gameNeverV = fetchSpriteNode(withName: "gameNeverV",inNode: gameTextTest)
//        gameNeverEE = fetchSpriteNode(withName: "gameNeverEE",inNode: gameTextTest)
//        gameNeverR = fetchSpriteNode(withName: "gameNeverR",inNode: gameTextTest)
//
//        gameAlwaysA = fetchSpriteNode(withName: "gameAlwaysA",inNode: gameTextTest)
//        gameAlwaysL = fetchSpriteNode(withName: "gameAlwaysL",inNode: gameTextTest)
//        gameAlwaysW = fetchSpriteNode(withName: "gameAlwaysW",inNode: gameTextTest)
//        gameAlwaysAA = fetchSpriteNode(withName: "gameAlwaysAA",inNode: gameTextTest)
//        gameAlwaysY = fetchSpriteNode(withName: "gameAlwaysY",inNode: gameTextTest)
//        gameAlwaysS = fetchSpriteNode(withName: "gameAlwaysS",inNode: gameTextTest)
//
//        gameEyeE = fetchSpriteNode(withName: "gameEyeE",inNode: gameTextTest)
//        gameEyeY = fetchSpriteNode(withName: "gameEyeY",inNode: gameTextTest)
//        gameEyeEE = fetchSpriteNode(withName: "gameEyeEE",inNode: gameTextTest)
//
//        thanT = fetchSpriteNode(withName: "thanT",inNode: gameScene?.textCanvases[3])
//        thanH = fetchSpriteNode(withName: "thanH",inNode: gameScene?.textCanvases[3])
//        thanA = fetchSpriteNode(withName: "thanA",inNode: gameScene?.textCanvases[3])
//        thanN = fetchSpriteNode(withName: "thanN",inNode: gameScene?.textCanvases[3])
//
//        positiveP = fetchSpriteNode(withName: "positiveP",inNode: gameScene?.textCanvases[3])
//        positiveO = fetchSpriteNode(withName: "positiveO",inNode: gameScene?.textCanvases[3])
//        positiveS = fetchSpriteNode(withName: "positiveS",inNode: gameScene?.textCanvases[3])
//        positiveI = fetchSpriteNode(withName: "positiveI",inNode: gameScene?.textCanvases[3])
//        positiveT = fetchSpriteNode(withName: "positiveT",inNode: gameScene?.textCanvases[3])
//        positiveII = fetchSpriteNode(withName: "positiveII",inNode: gameScene?.textCanvases[3])
//        positiveV = fetchSpriteNode(withName: "positiveV",inNode:  gameTextContainer4)
//        positiveE = fetchSpriteNode(withName: "positiveE",inNode:  gameTextContainer4)
//        nothingN = fetchSpriteNode(withName: "nothingN",inNode:  gameTextContainer4)
//        nothingO = fetchSpriteNode(withName: "nothingO",inNode:  gameTextContainer4)
//        nothingT = fetchSpriteNode(withName: "nothingT",inNode:  gameTextContainer4)
//        nothingH = fetchSpriteNode(withName: "nothingH",inNode:  gameTextContainer4)
//        nothingI = fetchSpriteNode(withName: "nothingI",inNode:  gameTextContainer4)
//        nothingNN = fetchSpriteNode(withName: "nothingNN",inNode: gameTextContainer4)
//        nothingG = fetchSpriteNode(withName: "nothingG",inNode:  gameTextContainer4)
//        
//        thoughtT = fetchSpriteNode(withName: "thoughtT",inNode: gameScene?.textCanvases[4])
//        thoughtHH = fetchSpriteNode(withName: "thoughtHH",inNode: gameScene?.textCanvases[4])
//        thoughtO = fetchSpriteNode(withName: "thoughtO",inNode: gameScene?.textCanvases[4])
//        thoughtU = fetchSpriteNode(withName: "thoughtU",inNode: gameScene?.textCanvases[4])
//        thoughtG = fetchSpriteNode(withName: "thoughtG",inNode: gameScene?.textCanvases[4])
//        thoughtH = fetchSpriteNode(withName: "thoughtH",inNode: gameScene?.textCanvases[4])
//        thoughtTT = fetchSpriteNode(withName: "thoughtTT",inNode: gameScene?.textCanvases[4])
//        smallS = fetchSpriteNode(withName: "smallS",inNode: gameScene?.textCanvases[4])
//        smallM = fetchSpriteNode(withName: "smallM",inNode: gameScene?.textCanvases[4])
//        smallA = fetchSpriteNode(withName: "smallA",inNode: gameScene?.textCanvases[4])
//        smallL = fetchSpriteNode(withName: "smallL",inNode: gameScene?.textCanvases[4])
//        smallLL = fetchSpriteNode(withName: "smallLL",inNode: gameScene?.textCanvases[4])
//        dayD = fetchSpriteNode(withName: "dayD",inNode: gameScene?.textCanvases[4])
//        dayA = fetchSpriteNode(withName: "dayA",inNode: gameScene?.textCanvases[4])
//        dayY = fetchSpriteNode(withName: "dayY",inNode: gameScene?.textCanvases[4])
//        changeC = fetchSpriteNode(withName: "changeC",inNode: gameScene?.textCanvases[4])
//        changeH = fetchSpriteNode(withName: "changeH",inNode: gameScene?.textCanvases[4])
//        changeA = fetchSpriteNode(withName: "changeA",inNode: gameScene?.textCanvases[4])
//        changeN = fetchSpriteNode(withName: "changeN",inNode: gameScene?.textCanvases[4])
//        changeG = fetchSpriteNode(withName: "changeG",inNode: gameScene?.textCanvases[4])
//        changeE = fetchSpriteNode(withName: "changeE",inNode: gameScene?.textCanvases[4])
//
//        situationS = fetchSpriteNode(withName: "situationS",inNode: gameScene?.textCanvases[5])
//        situationI = fetchSpriteNode(withName: "situationI",inNode: gameScene?.textCanvases[5])
//        situationTT = fetchSpriteNode(withName: "situationTT",inNode: gameScene?.textCanvases[5])
//        situationU = fetchSpriteNode(withName: "situationU",inNode: gameScene?.textCanvases[5])
//        situationA = fetchSpriteNode(withName: "situationA",inNode: gameScene?.textCanvases[5])
//        situationT = fetchSpriteNode(withName: "situationT",inNode: gameScene?.textCanvases[5])
//        situationII = fetchSpriteNode(withName: "situationII",inNode: gameScene?.textCanvases[5])
//        situationO = fetchSpriteNode(withName: "situationO",inNode: gameScene?.textCanvases[5])
//        situationN = fetchSpriteNode(withName: "situationN",inNode: gameScene?.textCanvases[5])
//        turnT = fetchSpriteNode(withName: "turnT",inNode: gameScene?.textCanvases[5])
//        turnU = fetchSpriteNode(withName: "turnU",inNode: gameScene?.textCanvases[5])
//        turnR = fetchSpriteNode(withName: "turnR",inNode: gameScene?.textCanvases[5])
//        turnN = fetchSpriteNode(withName: "turnN",inNode: gameScene?.textCanvases[5])
//        intoI = fetchSpriteNode(withName: "intoI",inNode: gameScene?.textCanvases[5])
//        intoN = fetchSpriteNode(withName: "intoN",inNode: gameScene?.textCanvases[5])
//        intoT = fetchSpriteNode(withName: "intoT",inNode: gameScene?.textCanvases[5])
//        intoO = fetchSpriteNode(withName: "intoO",inNode: gameScene?.textCanvases[5])
//
//
//        for i in 0...allStrings.count-1{
//            var tempArray = [SKSpriteNode?]()
//            for j in 0...allStrings[i].count-1{
//                var tempString = allStrings[i][j]
//                for char in 0...tempString.count-1{
//                    
//                    var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(char+1)",inNode: gameScene?.textCanvases[i])
//                    tempArray.append(tempVar)
//
////                    if(exception(string: allStrings[i][j]) > 1){
////                        var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(exception(string: allStrings[i][j]))\(char+1)",inNode: gameScene?.textCanvases[i])
////                        tempArray.append(tempVar)
////                    }
//                    
//                    print("\(allStrings[i][j])\(char)")
//                }
//                variableArray.append(tempArray)
//            }
//
//        }
//
//        
//        SKSpriteNodelol = fetchSpriteNode(withName: "SKSpriteNodelol",inNode: infoPopup)
//
//        infoBody = fetchSpriteNode(withName: "infoBody",inNode: SKSpriteNodelol)
//        infoTitle = fetchSpriteNode(withName: "infoTitle",inNode: SKSpriteNodelol)
//
//        homePlayButton?.isUserInteractionEnabled = true
//        gameBack?.isUserInteractionEnabled = true
//        infoPopup?.isUserInteractionEnabled = true
//    }
//    
//    func duplicate(string: String) -> Bool{
//        var isDuplicate = false
//        print(currentLevel)
//        if(string == "YOUR"){
//            isDuplicate = true
//        }
//        return isDuplicate
//    }
//    func duplicateHelper(string: String) -> Int{
//        var num = 0
//        print(string)
//        if(string == "YOUR" && currentLevel == 7){
//            num = 6
//        }else if(string == "YOUR" && currentLevel == 11){
//            num = 10
//        }
//        print(num)
//        print(currentLevel)
//        return num
//    }
//
//    
//    func initializeGameSwipeAction()
//    {
//        blockSwippedWord = {[weak self] strWord,arrNodes in
//            guard let `self` = self else {return}
//            self.correctWordSwipe(forSwippedWord: strWord, selectedNodes: arrNodes)
//        }
//    }
//    func initializeLevel2()
//    {
//        infoPopup?.isHidden = true
//        self.gameBlockContainer2?.children.forEach({ (node) in
//            if node is BlockNode
//            {
//                node.run(SKAction.fadeOut(withDuration: 0))
//            }
//        })
//        if let lblLevel = gameLevelHeader?.childNode(withName: "Label") as? SKLabelNode
//        {
//            lblLevel.text = "LEVEL 2"
//        }
//        if let lblTitle = gameTitleHeader?.childNode(withName: "Label") as? SKLabelNode
//        {
//            lblTitle.text = "SPORTS"
//        }
//        
//        self.gameScene?.addSecondLevelPhysicsBody()
//        gameTextContainer2?.isHidden = false
//        self.gameBlockContainer2?.isHidden = false
//        self.gameTextContainer?.isHidden = true
//        var delay = 0.1
//        for node in self.gameBlockContainer2?.children ?? []
//        {
//            if node is BlockNode
//            {
//                DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
//                    node.run(SKAction.fadeIn(withDuration: 0.2))
//                }
//                delay = delay + 0.1
//            }
//        }
//    }
//    
//    func initializeLevel3()
//    {
//
//        if let body = SKSpriteNodelol?.childNode(withName: "infoBody") as? SKLabelNode
//        {
//            body.text = "Helen Adams Keller was an American author, political activist, and lecturer. She was the first deaf-blind person to earn a Bachelor of Arts degree."
//        }
//        if let title = SKSpriteNodelol?.childNode(withName: "infoTitle") as? SKLabelNode
//        {
//            title.text = "Helen Keller"
//        }
//
//        infoPopup?.isHidden = true
//
//        self.gameBlockTest?.children.forEach({ (node) in
//            if node is BlockNode
//            {
//                node.run(SKAction.fadeOut(withDuration: 0))
//            }
//        })
//        if let lblLevel = gameLevelHeader?.childNode(withName: "Label") as? SKLabelNode
//        {
//            lblLevel.text = "LEVEL 3"
//        }
//        if let lblTitle = gameTitleHeader?.childNode(withName: "Label") as? SKLabelNode
//        {
//            lblTitle.text = "INSPIRATION"
//        }
//        
//        self.gameScene?.addThirdLevelPhysicsBody()
//        gameTextTest?.isHidden = false
//        self.gameBlockTest?.isHidden = false
//        self.gameTextContainer2?.isHidden = true
//        var delay = 0.1
//        for node in self.gameBlockTest?.children ?? []
//        {
//            if node is BlockNode
//            {
//                DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
//                    node.run(SKAction.fadeIn(withDuration: 0.2))
//                }
//                delay = delay + 0.1
//            }
//        }
//    }
//    
//    
//    func initializeNextLevel(level: Int, title: String, popTitle: String, popBody: String)
//    {
//        self.currentLevel = level
//        if(popTitle != "" && popBody != ""){
//            if let body = SKSpriteNodelol?.childNode(withName: "infoBody") as? SKLabelNode
//            {
//                body.text = popBody
//            }
//            if let title = SKSpriteNodelol?.childNode(withName: "infoTitle") as? SKLabelNode
//            {
//                title.text = popTitle
//            }
//        }
//
//
//        infoPopup?.isHidden = true
//        
//        self.gameScene?.gameCanvases[level-1]?.children.forEach({ (node) in
//            if node is BlockNode
//            {
//                node.run(SKAction.fadeOut(withDuration: 0))
//            }
//        })
//        if let lblLevel = gameLevelHeader?.childNode(withName: "Label") as? SKLabelNode
//        {
//            lblLevel.text = "LEVEL \(level)"
//        }
//        if let lblTitle = gameTitleHeader?.childNode(withName: "Label") as? SKLabelNode
//        {
//            lblTitle.text = title
//        }
//        
//        self.gameScene?.addNextPhysicsBody(index: level-1)
////        self.gameScene?.addThirdLevelPhysicsBody()
//        
////        gameTextContainer2?.isHidden = false
////        self.gameBlockContainer2?.isHidden = false
////        self.gameTextContainer?.isHidden = true
//        for scene in gameScene!.gameCanvases{
//            scene!.isHidden = true
//        }
//        for scene in gameScene!.textCanvases{
//            scene!.isHidden = true
//        }
//        gameScene?.gameCanvases[level-1]?.isHidden = false
//        gameScene?.textCanvases[level-1]?.isHidden = false
//
//
////        if(level - 2 >= 0){
////            gameScene?.gameCanvases[level-2]?.isHidden = true
////            gameScene?.textCanvases[level-2]?.isHidden = true
////
////        }
//
////        for i in 0...self.gameScene!.gameCanvases.count-1 {
////            if(i == self.gameScene!.gameCanvases.count-1){
////                gameScene?.gameCanvases[i]!.isHidden = false
////                gameScene?.textCanvases[i]!.isHidden = false
////            }else{
////                gameScene?.gameCanvases[i]!.isHidden = true
////                gameScene?.textCanvases[i]!.isHidden = true
////
////            }
////        }
////        gameTextTest?.isHidden = false
////        self.gameBlockTest?.isHidden = false
////        self.gameTextContainer2?.isHidden = true
//        var delay = 0.1
//        for node in self.gameScene?.gameCanvases[level-1]?.children ?? []
//        {
//            if node is BlockNode
//            {
//                DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
//                    node.run(SKAction.fadeIn(withDuration: 0.2))
//                }
//                delay = delay + 0.1
//            }
//        }
//    }
//
//
//    func hideAndShowLabel(inNode wordNode:SKSpriteNode?, hide:Bool)
//    {
//        if let label = wordNode?.childNode(withName: "Label") as? SKLabelNode
//        {
//            label.isHidden = hide
//        }
//    }
//    
//    func hideGameComponents()
//    {
//        gameBlockContainer?.isHidden = true
//        gameBackground?.run(SKAction.fadeAlpha(to: 0, duration: 0))
//        gameBack?.isHidden = true
//        gameTitleHeader?.isHidden = true
//        gameLevelHeader?.isHidden = true
//        gameCoin?.isHidden = true
//        gameOptionsBackground?.isHidden = true
//        gameOptionSearch?.isHidden = true
//        gameOptionHint?.isHidden = true
//        gameOptionShuffle?.isHidden = true
//        gameOptionAds?.isHidden = true
//        gameTextContainer?.isHidden = true
//        
//        gameCongratulations?.isHidden = true
//        
//        gameBlockContainer2?.isHidden = true
//        gameTextContainer2?.isHidden = true
//        
//        gameBlockTest?.isHidden = true
//        gameTextTest?.isHidden = true
//
//        infoPopup?.isHidden = true
//        
////        for i in 0...allStrings.count-1{
////            var tempArray = [SKSpriteNode?]()
////            for j in 0...allStrings[i].count-1{
////                var tempString = allStrings[i][j]
////                for char in 0...tempString.count-1{
////                    hideAndShowLabel(inNode: fetchSpriteNode(withName: "\(allStrings[i][j])\(char)",inNode: gameScene?.textCanvases[i]), hide: true)
//////                    tempArray.append(tempVar)
////                    print("\(allStrings[i][j])\(char)")
////                }
////            }
////
////        }
//        
//        for i in 0...variableArray.count-1{
//            if(variableArray[i].count-1 > 0){
//                    for j in 0...variableArray[i].count-1{
//                            hideAndShowLabel(inNode: variableArray[i][j], hide: true)
//                }
//            }
//        }
//        
//
//
////        hideAndShowLabel(inNode: fetchSpriteNode(withName: "\(allStrings[i][j])\(char)",inNode: gameScene?.textCanvases[i]), hide: true)
//
//        hideAndShowLabel(inNode: fetchSpriteNode(withName: "better1",inNode: gameScene?.textCanvases[0]), hide: true)
//
//        print(variableArray.capacity)
//        for i in 0...variableArray.count-1{
//            if(i > 0){
//            print(variableArray[i].count)
//            for j in 0...variableArray[i].count-1{
//                print("hide")
//                hideAndShowLabel(inNode: variableArray[i][j], hide: true)
//            }
//            }
//        }
//
//        if(variableArray.count > 2){
//            if(variableArray[0].count > 1){
//                hideAndShowLabel(inNode: variableArray[0][0], hide: true)
//            }
//        }
//        hideAndShowLabel(inNode: gameBetterE, hide: true)
//        hideAndShowLabel(inNode: gameBetterT, hide: true)
//        hideAndShowLabel(inNode: gameBetterTT, hide: true)
//        hideAndShowLabel(inNode: gameBetterEE, hide: true)
//        hideAndShowLabel(inNode: gameBetterR, hide: true)
//        
//        hideAndShowLabel(inNode: gameGoodG, hide: true)
//        hideAndShowLabel(inNode: gameGoodO, hide: true)
//        hideAndShowLabel(inNode: gameGoodOO, hide: true)
//        hideAndShowLabel(inNode: gameGoodD, hide: true)
//        
//        hideAndShowLabel(inNode: gameBestB, hide: true)
//        hideAndShowLabel(inNode: gameBestE, hide: true)
//        hideAndShowLabel(inNode: gameBestS, hide: true)
//        hideAndShowLabel(inNode: gameBestT, hide: true)
//        
//        hideAndShowLabel(inNode: gameGolfG, hide: true)
//        hideAndShowLabel(inNode: gameGolfO, hide: true)
//        hideAndShowLabel(inNode: gameGolfL, hide: true)
//        hideAndShowLabel(inNode: gameGolfF, hide: true)
//
//        hideAndShowLabel(inNode: gameTennisT, hide: true)
//        hideAndShowLabel(inNode: gameTennisE, hide: true)
//        hideAndShowLabel(inNode: gameTennisN, hide: true)
//        hideAndShowLabel(inNode: gameTennisNN, hide: true)
//        hideAndShowLabel(inNode: gameTennisI, hide: true)
//        hideAndShowLabel(inNode: gameTennisS, hide: true)
//
//        hideAndShowLabel(inNode: gameBallB, hide: true)
//        hideAndShowLabel(inNode: gameBallA, hide: true)
//        hideAndShowLabel(inNode: gameBallL, hide: true)
//        hideAndShowLabel(inNode: gameBallLL, hide: true)
//
//        hideAndShowLabel(inNode: gameRowR, hide: true)
//        hideAndShowLabel(inNode: gameRowO, hide: true)
//        hideAndShowLabel(inNode: gameRowW, hide: true)
//
//        hideAndShowLabel(inNode: gamePitchP, hide: true)
//        hideAndShowLabel(inNode: gamePitchI, hide: true)
//        hideAndShowLabel(inNode: gamePitchT, hide: true)
//        hideAndShowLabel(inNode: gamePitchC, hide: true)
//        hideAndShowLabel(inNode: gamePitchH, hide: true)
//        
//        hideAndShowLabel(inNode: gameNeverN, hide: true)
//        hideAndShowLabel(inNode: gameNeverE, hide: true)
//        hideAndShowLabel(inNode: gameNeverV, hide: true)
//        hideAndShowLabel(inNode: gameNeverEE, hide: true)
//        hideAndShowLabel(inNode: gameNeverR, hide: true)
//
//        hideAndShowLabel(inNode: gameAlwaysA, hide: true)
//        hideAndShowLabel(inNode: gameAlwaysL, hide: true)
//        hideAndShowLabel(inNode: gameAlwaysW, hide: true)
//        hideAndShowLabel(inNode: gameAlwaysAA, hide: true)
//        hideAndShowLabel(inNode: gameAlwaysY, hide: true)
//        hideAndShowLabel(inNode: gameAlwaysS, hide: true)
//
//        hideAndShowLabel(inNode: gameEyeE, hide: true)
//        hideAndShowLabel(inNode: gameEyeY, hide: true)
//        hideAndShowLabel(inNode: gameEyeEE, hide: true)
//
//        hideAndShowLabel(inNode: thanT, hide: true)
//        hideAndShowLabel(inNode: thanH, hide: true)
//        hideAndShowLabel(inNode: thanA, hide: true)
//        hideAndShowLabel(inNode: thanN, hide: true)
//        hideAndShowLabel(inNode: positiveP, hide: true)
//        hideAndShowLabel(inNode: positiveO, hide: true)
//        hideAndShowLabel(inNode: positiveS, hide: true)
//        hideAndShowLabel(inNode: positiveI, hide: true)
//        hideAndShowLabel(inNode: positiveT, hide: true)
//        hideAndShowLabel(inNode: positiveII, hide: true)
//        hideAndShowLabel(inNode: positiveV, hide: true)
//        hideAndShowLabel(inNode: positiveE, hide: true)
//        hideAndShowLabel(inNode: nothingN, hide: true)
//        hideAndShowLabel(inNode: nothingO, hide: true)
//        hideAndShowLabel(inNode: nothingT, hide: true)
//        hideAndShowLabel(inNode: nothingH, hide: true)
//        hideAndShowLabel(inNode: nothingI, hide: true)
//        hideAndShowLabel(inNode: nothingNN, hide: true)
//        hideAndShowLabel(inNode: nothingG, hide: true)
//
//        hideAndShowLabel(inNode: thoughtT, hide: true)
//        hideAndShowLabel(inNode: thoughtHH, hide: true)
//        hideAndShowLabel(inNode: thoughtO, hide: true)
//        hideAndShowLabel(inNode: thoughtU, hide: true)
//        hideAndShowLabel(inNode: thoughtG, hide: true)
//        hideAndShowLabel(inNode: thoughtH, hide: true)
//        hideAndShowLabel(inNode: thoughtTT, hide: true)
//        hideAndShowLabel(inNode: smallS, hide: true)
//        hideAndShowLabel(inNode: smallM, hide: true)
//        hideAndShowLabel(inNode: smallA, hide: true)
//        hideAndShowLabel(inNode: smallL, hide: true)
//        hideAndShowLabel(inNode: smallLL, hide: true)
//        hideAndShowLabel(inNode: dayD, hide: true)
//        hideAndShowLabel(inNode: dayA, hide: true)
//        hideAndShowLabel(inNode: dayY, hide: true)
//        hideAndShowLabel(inNode: changeC, hide: true)
//        hideAndShowLabel(inNode: changeH, hide: true)
//        hideAndShowLabel(inNode: changeA, hide: true)
//        hideAndShowLabel(inNode: changeN, hide: true)
//        hideAndShowLabel(inNode: changeG, hide: true)
//        hideAndShowLabel(inNode: changeE, hide: true)
//        
//        hideAndShowLabel(inNode: situationS, hide: true)
//        hideAndShowLabel(inNode: situationI, hide: true)
//        hideAndShowLabel(inNode: situationTT, hide: true)
//        hideAndShowLabel(inNode: situationU, hide: true)
//        hideAndShowLabel(inNode: situationA, hide: true)
//        hideAndShowLabel(inNode: situationT, hide: true)
//        hideAndShowLabel(inNode: situationII, hide: true)
//        hideAndShowLabel(inNode: situationO, hide: true)
//        hideAndShowLabel(inNode: situationN, hide: true)
//        hideAndShowLabel(inNode: turnT, hide: true)
//        hideAndShowLabel(inNode: turnU, hide: true)
//        hideAndShowLabel(inNode: turnR, hide: true)
//        hideAndShowLabel(inNode: turnN, hide: true)
//        hideAndShowLabel(inNode: intoI, hide: true)
//        hideAndShowLabel(inNode: intoN, hide: true)
//        hideAndShowLabel(inNode: intoT, hide: true)
//        hideAndShowLabel(inNode: intoO, hide: true)
//    }
//    
//    func hideHomeComponentsAndLoadGame()
//    {
//        homeLogo?.run(SKAction.moveTo(y: self.view.frame.height, duration: 0.5), completion: {
//            self.homeLogo?.removeFromParent()
//        })
//        homePlayContainer?.run((SKAction.moveTo(y: 0, duration: 0.5)), completion: {
//            self.homePlayContainer?.removeFromParent()
//        })
//        gameBackground?.run(SKAction.fadeAlpha(to: 1.0, duration: 0.75), completion: {
//            
//            self.gameBlockContainer?.children.forEach({ (node) in
//                if node is BlockNode
//                {
//                    node.run(SKAction.fadeOut(withDuration: 0))
//                }
//            })
//            self.homeBackground?.removeFromParent()
//            self.gameBlockContainer?.isHidden = false
//            self.gameBack?.isHidden = false
//            self.gameTitleHeader?.isHidden = false
//            self.gameLevelHeader?.isHidden = false
//            self.gameCoin?.isHidden = false
//            self.gameOptionsBackground?.isHidden = false
//            self.gameOptionSearch?.isHidden = false
//            self.gameOptionHint?.isHidden = false
//            self.gameOptionShuffle?.isHidden = false
//            self.gameOptionAds?.isHidden = false
//            self.gameTextContainer?.isHidden = false
//            
//            var delay = 0.1
//            for node in self.gameBlockContainer?.children ?? []
//            {
//                if node is BlockNode
//                {
//                    DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
//                        node.run(SKAction.fadeIn(withDuration: 0.2))
//                    }
//                    delay = delay + 0.1
//                }
//            }
//        })
//    }
//    
//    //MARK: Child Node
//    func fetchSpriteNode(withName strName:String, inNode node:SKNode? = nil)->SKSpriteNode?
//    {
//        if node == nil {
//            return gameScene?.childNode(withName: strName) as? SKSpriteNode
//        }
//        else {
//            return node?.childNode(withName: strName) as? SKSpriteNode
//        }
//    }
//    
//    //MARK:- Swipe Action
//    
//    func actionOnWord(word: String){
//        if(word == "BETTER"){
//            self.initializeNextLevel(level: 11, title: "SPORTS", popTitle: "", popBody: "")
//        }else if(word == "TENNIS"){
//            self.initializeNextLevel(level: 3, title: "INSPIRATION", popTitle: "Helen Keller", popBody: "Helen Adams Keller was an American author, political activist, and lecturer. She was the first deaf-blind person to earn a Bachelor of Arts degree.")
//        }else if(word == "ALWAYS"){
//            self.initializeNextLevel(level: 4, title: "PURPOSE", popTitle: "Elbert Hubbard", popBody: "Elbert Green Hubbard (June 19, 1856 – May 7, 1915) was an American writer, publisher, artist, and philosopher. Raised in Hudson, Illinois, he had early success as a traveling salesman for the Larkin Soap Company.")
//        }else if(word == "POSITIVE"){
//            self.initializeNextLevel(level: 5, title: "PURPOSE", popTitle: "Zig Ziglar", popBody: "Jean Ziglar (married 1946–2012, his death) Children. 4, including Julie Ziglar Norman. Signature. Hilary Hinton \"Zig\" Ziglar (November 6, 1926 – November 28, 2012) was an American author, salesman, and motivational speaker.")
//        }else if(word == "THOUGHT"){
//            self.initializeNextLevel(level: 6, title: "PURPOSE", popTitle: "Michael Jordan", popBody: "Michael Jeffrey Jordan (born February 17, 1963), also known by his initials MJ, is an American former professional basketball player and the principal owner of the Charlotte Hornets of the National Basketball Association (NBA). He played 15 seasons in the NBA, winning six championships with the Chicago Bulls.")
//        }else if(word == "SITUATION"){
//            self.initializeNextLevel(level: 7, title: "PURPOSE", popTitle: "Paulo Coelho", popBody: "Christina Oiticica. Website. paulocoelhoblog.com. Paulo Coelho de Souza (/ˈkwɛl.juː, kuˈɛl-, -joʊ/; Portuguese: [ˈpawlu kuˈeʎu]; born 24 August 1947) is a Brazilian lyricist and novelist, best known for his novel The Alchemist. In 2014, he uploaded his personal papers online to create a virtual Paulo Coelho Foundation.")
//        }else if(word == "RESPOND"){
//            self.initializeNextLevel(level: 8, title: "INSPIRATION", popTitle: "Kenji Miyazawa", popBody: "Kenji Miyazawa Miyazawa Kenji, 27 August 1896 – 21 September 1933) was a Japanese novelist and poet of children's literature from Hanamaki, Iwate, in the late Taishō and early Shōwa periods.")
//        }else if(word == "EMBRACE"){
//            self.initializeNextLevel(level: 9, title: "PURPOSE", popTitle: "Robert Schuller", popBody: "Robert Harold Schuller (September 16, 1926 – April 2, 2015) was an American Christian televangelist, pastor, motivational speaker, and author. In his five decades of television, Schuller was principally known for the weekly Hour of Power television program, which he began hosting in 1970 until his retirement in 2010.")
//        }else if(word == "GUIDELINES"){
//            self.initializeNextLevel(level: 10, title: "INSPIRATIONAL", popTitle: "Albert Einstein", popBody: "Albert Einstein (/ˈaɪnstaɪn/ EYEN-styne;[4] German: [ˈalbɛʁt ˈʔaɪnʃtaɪn] (About this soundlisten); 14 March 1879 – 18 April 1955) was a German-born theoretical physicist[5] who developed the theory of relativity, one of the two pillars of modern physics (alongside quantum mechanics).[3][6]:274 His work is also known for its influence on the philosophy of science.[7][8] He is best known to the general public for his mass–energy equivalence formula E = mc^2, which has been dubbed \"the world's most famous equation\".[9] He received the 1921 Nobel Prize in Physics \"for his services to theoretical physics, and especially for his discovery of the law of the photoelectric effect\",[10] a pivotal step in the development of quantum theory.")
//        }else if(word == "THANKFUL"){
//            self.initializeNextLevel(level: 11, title: "INSPIRATIONAL", popTitle: "Abraham Lincoln", popBody: "Abraham Lincoln (/ˈlɪŋkən/;[2] February 12, 1809 – April 15, 1865) was an American statesman and lawyer who served as the 16th president of the United States (1861–1865). Lincoln led the nation through its greatest moral, constitutional, and political crisis in the American Civil War. He preserved the Union, abolished slavery, strengthened the federal government, and modernized the U.S. economy.")
//        }else if(word == "IMPORTANT"){
//
//        }
//
//
//
//        
//
//    }
//    func correctWordSwipe(forSwippedWord strWord:String, selectedNodes arrNodes:[SKSpriteNode])
//    {
//        for i in 0...allStrings.count-1{
//            var tempArray = [SKSpriteNode]()
//            for j in 0...allStrings[i].count-1{
//                var tempString = allStrings[i][j]
//                
//                if(strWord == allStrings[i][j].uppercased()){
//                    for char in 1...tempString.count{
//
//                        if(duplicate(string: allStrings[i][j].uppercased())){
//                            var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(char)",inNode: gameScene?.textCanvases[duplicateHelper(string: allStrings[i][j].uppercased())])
//                            tempArray.append(tempVar!)
//                        }else{
//                            var tempVar = fetchSpriteNode(withName: "\(allStrings[i][j].lowercased())\(char)",inNode: gameScene?.textCanvases[i])
//                            print(tempString)
//                            tempArray.append(tempVar!)
//                        }
//                    }
//                    
//                    let delay = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: tempArray)
//                        DispatchQueue.main.asyncAfter(deadline: .now()+delay+1.0) {
//                            self.actionOnWord(word: strWord)
//                    }
//
//                }
//            }
//
//        }
//        
////        if strWord == "BETTER" {
////
////            let delay = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameBetterB!,gameBetterE!,gameBetterT!,gameBetterTT!,gameBetterEE!,gameBetterR!])
////            DispatchQueue.main.asyncAfter(deadline: .now()+delay+1.0) {
//////                self.initializeLevel2()
////                self.initializeNextLevel(level: 2, title: "SPORTS", popTitle: "", popBody: "")
////            }
////        }
////        else if strWord == "GOOD" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameGoodG!,gameGoodO!,gameGoodOO!,gameGoodD!])
////        }
////        else if strWord == "BEST" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameBestB!,gameBestE!,gameBestS!,gameBestT!])
////        }
////        else if strWord == "GOLF" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameGolfG!,gameGolfO!,gameGolfL!,gameGolfF!])
////        }
////        else if strWord == "BALL" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameBallB!,gameBallA!,gameBallL!,gameBallLL!])
////        }
////        else if strWord == "ROW" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameRowR!,gameRowO!,gameRowW!])
////        }
////        else if strWord == "PITCH" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gamePitchP!,gamePitchI!,gamePitchT!,gamePitchC!,gamePitchH!])
////        }
////        if strWord == "NEVER" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameNeverN!,gameNeverE!,gameNeverV!,gameNeverEE!,gameNeverR!])
////        }
////        else if strWord == "EYE" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameEyeE!,gameEyeY!,gameEyeEE!])
////        }
////        else if strWord == "THAN" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [thanT!,thanH!,thanA!,thanN!])
////        }
////        else if strWord == "POSITIVE" {
////            let delay = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [positiveP!,positiveO!,positiveS!,positiveI!,positiveT!,positiveII!,positiveV!,positiveE!])
////
////            DispatchQueue.main.asyncAfter(deadline: .now()+delay+1.0) {          self.initializeNextLevel(level: 5, title: "PURPOSE", popTitle: "Zig Ziglar", popBody: "Jean Ziglar (married 1946–2012, his death) Children. 4, including Julie Ziglar Norman. Signature. Hilary Hinton \"Zig\" Ziglar (November 6, 1926 – November 28, 2012) was an American author, salesman, and motivational speaker.")
////            }
////
////        }
////        else if strWord == "NOTHING" {
////            print("IT WORKED")
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [nothingN!,nothingO!,nothingT!,nothingH!,nothingI!,nothingNN!,nothingG!])
////        }
////        else if strWord == "ALWAYS" {
////            let delay = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameAlwaysA!,gameAlwaysL!,gameAlwaysW!,gameAlwaysAA!,gameAlwaysY!,gameAlwaysS!])
////
////
////                DispatchQueue.main.asyncAfter(deadline: .now()+delay+1.0) {          self.initializeNextLevel(level: 4, title: "PURPOSE", popTitle: "Elbert Hubbard", popBody: "Elbert Green Hubbard (June 19, 1856 – May 7, 1915) was an American writer, publisher, artist, and philosopher. Raised in Hudson, Illinois, he had early success as a traveling salesman for the Larkin Soap Company.")
////                }
//////            DispatchQueue.main.asyncAfter(deadline: .now()+delay+0.7) {
//////                self.gameTextTest?.isHidden = true
//////
//////            }
//////              end
//////            DispatchQueue.main.asyncAfter(deadline: .now()+delay+0.2) {
//////                self.gameCongratulations?.run(SKAction.fadeOut(withDuration: 0.0))
//////                self.gameCongratulations?.isHidden = false
//////                self.gameCongratulations?.run(SKAction.fadeIn(withDuration: 0.5))
//////            }
////        }
////
//////        else if strWord == "TENNIS" {
//////            let delay = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [gameTennisT!,gameTennisE!,gameTennisN!,gameTennisNN!,gameTennisI!,gameTennisS!])
//////
//////            DispatchQueue.main.asyncAfter(deadline: .now()+delay+1.0) {
////////                self.initializeLevel3()
//////                self.initializeNextLevel(level: 3, title: "INSPIRATION", popTitle: "Helen Keller", popBody: "Helen Adams Keller was an American author, political activist, and lecturer. She was the first deaf-blind person to earn a Bachelor of Arts degree.")
//////
//////            }
//////
//////        }
////        else if strWord == "THOUGHT" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [thoughtT!,thoughtHH!,thoughtO!,thoughtU!,thoughtG!,thoughtH!,thoughtTT!,])
////        }
////        else if strWord == "SMALL" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [smallS!,smallM!,smallA!,smallL!,smallLL!,])
////        }
////        else if strWord == "DAY" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [dayD!,dayA!,dayY!,])
////        }
////        else if strWord == "CHANGE" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [changeC!,changeH!,changeA!,changeN!,changeG!,changeE!,])
////        }
////        else if strWord == "SITUATION" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [situationS!,situationI!,situationTT!,situationU!,situationA!,situationT!,situationII!,situationO!,situationN!,])
////        }
////        else if strWord == "TURN" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [turnT!,turnU!,turnR!,turnN!,])
////        }
////        else if strWord == "INTO" {
////            let _ = returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes: arrNodes, onLetterNodes: [intoI!,intoN!,intoT!,intoO!,])
////        }
//        
//    }
//    
//    func returnAnimationTimeAndanimateBlockOneByOneAndRemove(forNodes arrNodes:[SKSpriteNode], onLetterNodes arrLetterNodes:[SKSpriteNode]) -> Double
//    {
//        var delay = 0.0
//        for (index,node) in arrNodes.enumerated()
//        {
//            if node is BlockNode
//            {
//                DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
//                    self.createAlphabetAndAnimate(fromNode: node, toLabelNode:arrLetterNodes[index])
//                }
//                delay = delay + 0.1
//            }
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
//            for spriteNode in arrNodes
//            {
//                spriteNode.run(SKAction.removeFromParent())
//            }
//        }
//        return delay
//    }
//
//    
//    func createAlphabetAndAnimate(fromNode node:SKSpriteNode, toLabelNode labelNode:SKSpriteNode)
//    {
//        if let labelInNode = node.childNode(withName: "Label") as? SKLabelNode,let label = labelNode.childNode(withName: "Label") as? SKLabelNode  {
//            let position = node.convert(labelInNode.position, to: gameScene!)
//            
//            let labelToAnimate = SKLabelNode.init(text: labelInNode.text)
//            labelToAnimate.fontName = label.fontName
//            labelToAnimate.fontSize = 30
//            labelToAnimate.fontColor = .white
//            labelToAnimate.position = position
//            
//            gameScene?.addChild(labelToAnimate)
//            let positionEnd = labelNode.convert(label.position, to: gameScene!)
//            labelToAnimate.run(SKAction.move(to: positionEnd, duration: 0.5),completion: {
//                labelToAnimate.removeFromParent()
//                label.isHidden = false
//            })
//        }
//    }
//    
//    //MARK:- Touch Actions
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.randomElement(), gameScene != nil
//        {
//            let positionInScene = touch.location(in: gameScene!)
//            let touchedNode = gameScene!.atPoint(positionInScene)
//            if touchedNode == touchBeganNode {
//                if touchBeganNode == homePlayButton {
//                    hideHomeComponentsAndLoadGame()
//                }
//            }
//            
//            if touchedNode == gameBack
//            {
//                if touchBeganNode == gameBack {
//                    self.viewDidLoad()
//                }
//            }
//            
//            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
//            {
//                infoPopup?.isHidden = true
//                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
//            }
//            if touchedNode.name == "Author"
//            {
//                infoPopup?.isHidden = false
//                touchedNode.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
//            }
//            touchBeganNode = nil
//            homePlayButton?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
//            gameBack?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
//        }
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first, gameScene != nil
//        {
//            let positionInScene = touch.location(in: gameScene!)
//            let touchedNode = gameScene!.atPoint(positionInScene)
//            touchBeganNode = touchedNode as? SKSpriteNode
//            if touchBeganNode == homePlayButton {
//                homePlayButton?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
//            }
//            if touchBeganNode == gameBack {
//                gameBack?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
//            }
//            if touchBeganNode?.name == "closeInfo" {
//                touchBeganNode?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
//            }
//            if touchedNode.name == "Author" {
//                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
//            }
//        }
//    }
//    
//
//
//}
//
//
//
//
//
//
////    override var shouldAutorotate: Bool {
////        return true
////    }
////
////    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
////        if UIDevice.current.userInterfaceIdiom == .phone {
////            return .allButUpsideDown
////        } else {
////            return .all
////        }
////    }
//
////let magneticField = SKFieldNode.radialGravityField()
//
////magneticField.region = SKRegion.init(size: gameCanvas!.size)
////magneticField.minimumRgameCanvassius = Float(gameCanvas!.size.width)
//// magneticField.strength = 10
//
//
////                   physicsWorld.gravity = CGVector(dx: 0, dy: 0)
////                   physicsBody = SKPhysicsBody(edgeLoopFrom: { () -> CGRect in
////                       var frame = self.frame
////                       frame.size.width = CGFloat(radius)
////                       frame.origin.x -= frame.size.width / 2
////                       return frame
////                   }())
//
///*let strength = Float(max(gameCanvas!.size.width, gameCanvas!.size.height))
// let radius = strength.squareRoot() * 100
// magneticField.region = SKRegion(radius: radius)
// magneticField.minimumRadius = radius
// magneticField.strength = 5000
// magneticField.position = CGPoint(x: (gameCanvas!.size.width/2)/gameCanvas!.xScale, y:0) //(gameCanvas!.size.height/2)/gameCanvas!.yScale)
// gameCanvas?.addChild(magneticField)*/
