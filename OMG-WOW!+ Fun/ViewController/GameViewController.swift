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

class GameViewController: UIViewController {
    
    var gameScene : MyScene?
    var homeBackground : SKSpriteNode?
    var homeLogo : SKSpriteNode?
    var homePlayContainer : SKSpriteNode?
    var homePlayButton : SKSpriteNode?
    let defaults = UserDefaults.standard

    var arr : [SKSpriteNode] = []
    var gameBlockContainer : SKSpriteNode?
    var gameBackground : SKSpriteNode?
    var gameBack : SKSpriteNode?
    var gameLevelHeader : SKSpriteNode?
    var gameTitleHeader : SKSpriteNode?
    var gameCoin : SKSpriteNode?
    var allStrings = [["GOOD","BETTER","BEST"], ["GOLF","TENNIS","BALL","ROW","PITCH"], ["NEVER","ALWAYS","EYE"], ["NOTHING","THAN","POSITIVE"], ["THOUGHT","CHANGE","SMALL","DAY"], ["SITUATION","SITUATION","TURN","INTO"]]
    
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
    var currentLevel : Int = 1
    var SKSpriteNodelol : SKSpriteNode?
    var infoTitle : SKSpriteNode?
    var infoBody : SKSpriteNode?

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevel = 1
        allStrings = block.allStrings
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        hideGameComponents()
        initializeGameSwipeAction()
        if(!(defaults.integer(forKey: "game1level") ?? 1 == 1)){
            skip(to: defaults.integer(forKey: "game1level") ?? 1)
        }
//        actionOnWord(word: "",num: 2)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Load Scene
    func presentGameScene()
    {
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "MyScene") as? MyScene {
                
                if gameScene != nil {
                    gameScene?.removeFromParent()
                    view.presentScene(nil)
                }
                
                gameScene = scene
                gameScene!.scaleMode = .aspectFit
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
        if(string == "THING" && currentLevel == 12){
            isDuplicate = false
        }else if(string == "THING" && currentLevel == 14){
            isDuplicate = false
        }else if(string == "THING" && currentLevel == 17){
            isDuplicate = false
        }else if(string == "THING" && currentLevel == 24){
            isDuplicate = false
        }
        if(string == "THOUGHT" && currentLevel == 14){
            isDuplicate = false
        }
        if(string == "NOT" && currentLevel == 4){
            isDuplicate = false
        }
        if(string == "MAKE" && currentLevel == 25){
            isDuplicate = false
        }
        if(string == "TRY" && currentLevel == 27){
            isDuplicate = false
        }
        if(string == "WITH" && currentLevel == 29){
            isDuplicate = false
        }



        return isDuplicate
    }

    func duplicate(string: String) -> Bool{
        var isDuplicate = false
        print(currentLevel)
        if(string == "YOUR" || string == "CHANGE" || string == "GOOD" || string == "THING" || string == "STOP" || string == "LIFE" || string == "BEST" || string == "NOT" || string == "ATTITUDE" || string == "IMPORTANT" || string == "PEOPLE" || string == "LIFE" || string == "OPTIMISM" || string == "DONE"){
            isDuplicate = true
        }
        return isDuplicate
    }
    func duplicateHelper(string: String) -> Int{
        var num = 0
        print(string)
        if(string == "YOUR" && currentLevel == 7){
            num = 6
        }else if(string == "YOUR" && currentLevel == 11){
            num = 10
        }else if(string == "YOUR" && currentLevel == 14){
            num = 13
        }else if(string == "YOUR" && currentLevel == 19){
            num = 18
        }else if(string == "YOUR" && currentLevel == 22){
            num = 21
        }

        if(string == "CHANGE" && currentLevel == 5){
            num = 4
        }else if(string == "CHANGE" && currentLevel == 12){
            num = 11
        }else if(string == "CHANGE" && currentLevel == 14){
            num = 13
        }
        if(string == "GOOD" && currentLevel == 1){
            num = 0
        }else if(string == "GOOD" && currentLevel == 13){
            num = 12
        }else if(string == "GOOD" && currentLevel == 26){
            num = 25
        }
        if(string == "THING" && currentLevel == 4){
            num = 3
        }else if(string == "THING" && currentLevel == 11){
            num = 10
        }else if(string == "THING" && currentLevel == 12){
            num = 11
        }else if(string == "THING" && currentLevel == 25){
            num = 24
        }
        if(string == "STOP" && currentLevel == 15){
            num = 14
        }else if(string == "THING" && currentLevel == 9){
            num = 8
        }
        if(string == "LIFE" && currentLevel == 7){
            num = 6
        }else if(string == "LIFE" && currentLevel == 16){
            num = 15
        }
        if(string == "BEST" && currentLevel == 1){
            num = 0
        }else if(string == "BEST" && currentLevel == 22){
            num = 21
        }
        if(string == "NOT" && currentLevel == 23){
            num = 22
        }else if(string == "NOT" && currentLevel == 24){
            num = 23
        }
        if(string == "ATTITUDE" && currentLevel == 12){
            num = 11
        }else if(string == "ATTITUDE" && currentLevel == 25){
            num = 24
        }
        if(string == "IMPORTANT" && currentLevel == 27){
            num = 26
        }else if(string == "ATTITUDE" && currentLevel == 11){
            num = 10
        }
        if(string == "PEOPLE" && currentLevel == 26){
            num = 25
        }else if(string == "PEOPLE" && currentLevel == 27){
            num = 26
        }
        if(string == "LIFE" && currentLevel == 7){
            num = 6
        }else if(string == "LIFE" && currentLevel == 28){
            num = 27
        }
        if(string == "DONE" && currentLevel == 29){
            num = 28
        }else if(string == "DONE" && currentLevel == 22){
            num = 21
        }
        if(string == "OPTIMISM" && currentLevel == 26){
            num = 25
        }else if(string == "OPTIMISM" && currentLevel == 29){
            num = 28
        }









//        if(string == "GOOD" && currentLevel == 1){
//            num = 0
//        }else if(string == "GOOD" && currentLevel == 13){
//            num = 12
//        }
        print(num)
        print(currentLevel)
        return num
    }

    
    func initializeGameSwipeAction()
    {
        blockSwippedWord = {[weak self] strWord,arrNodes in
            guard let `self` = self else {return}
            self.arr = arrNodes
            self.correctWordSwipe(forSwippedWord: strWord, selectedNodes: arrNodes)
            print(strWord)
        }
    }
    
    
    func initializeNextLevel(level: Int, title: String, popTitle: String, popBody: String)
    {
        self.currentLevel = level
        defaults.set(level, forKey: "level")
        defaults.set(level, forKey: "game1level")

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
        
        self.gameScene?.gameCanvases[level-1]?.children.forEach({ (node) in
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
        
        self.gameScene?.addNextPhysicsBody(index: level-1)
        self.gameScene?.delete(index: currentLevel)

        for scene in gameScene!.gameCanvases{
            scene!.isHidden = true
        }
        for scene in gameScene!.textCanvases{
            scene!.isHidden = true
        }
        gameScene?.gameCanvases[level-1]?.isHidden = false
        gameScene?.textCanvases[level-1]?.isHidden = false

        var delay = 0.1
        for node in self.gameScene?.gameCanvases[level-1]?.children ?? []
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
//        gameBackground?.run(SKAction.fadeAlpha(to: 0, duration: 0))
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
        homePlayButton?.isHidden = true
        homeBackground?.isHidden = true
        homePlayContainer?.isHidden = true
        homeLogo?.isHidden = true
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
//
            self.gameBlockContainer?.children.forEach({ (node) in
//                if node is BlockNode
//                {
//                    node.run(SKAction.fadeOut(withDuration: 0))
//                }
//            })
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
        })
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
    
        if(word == "BETTER" || num == 2){
            self.initializeNextLevel(level: 2, title: "SPORTS", popTitle: "", popBody: "")
        }else if(word == "TENNIS" || num == 3){
            self.initializeNextLevel(level: 3, title: "INSPIRATION", popTitle: "Helen Keller", popBody: "Helen Adams Keller was an American author, political activist, and lecturer. She was the first deaf-blind person to earn a Bachelor of Arts degree.")
        }else if(word == "ALWAYS" || num == 4){
            self.initializeNextLevel(level: 4, title: "PURPOSE", popTitle: "Elbert Hubbard", popBody: "Elbert Green Hubbard (June 19, 1856 – May 7, 1915) was an American writer, publisher, artist, and philosopher. Raised in Hudson, Illinois, he had early success as a traveling salesman for the Larkin Soap Company.")
        }else if(word == "POSITIVE" || num == 5){
            self.initializeNextLevel(level: 5, title: "PURPOSE", popTitle: "Zig Ziglar", popBody: "Jean Ziglar (married 1946–2012, his death) Children. 4, including Julie Ziglar Norman. Signature. Hilary Hinton \"Zig\" Ziglar (November 6, 1926 – November 28, 2012) was an American author, salesman, and motivational speaker.")
        }else if(word == "THOUGHT" || num == 6){
            self.initializeNextLevel(level: 6, title: "PURPOSE", popTitle: "Michael Jordan", popBody: "Michael Jeffrey Jordan (born February 17, 1963), also known by his initials MJ, is an American former professional basketball player and the principal owner of the Charlotte Hornets of the National Basketball Association (NBA). He played 15 seasons in the NBA, winning six championships with the Chicago Bulls.")
        }else if(word == "SITUATION" || num == 7){
            self.initializeNextLevel(level: 7, title: "PURPOSE", popTitle: "Paulo Coelho", popBody: "Christina Oiticica. Website. paulocoelhoblog.com. Paulo Coelho de Souza (/ˈkwɛl.juː, kuˈɛl-, -joʊ/; Portuguese: [ˈpawlu kuˈeʎu]; born 24 August 1947) is a Brazilian lyricist and novelist, best known for his novel The Alchemist. In 2014, he uploaded his personal papers online to create a virtual Paulo Coelho Foundation.")
        }else if(word == "RESPOND" || num == 8){
            self.initializeNextLevel(level: 8, title: "INSPIRATION", popTitle: "Kenji Miyazawa", popBody: "Kenji Miyazawa Miyazawa Kenji, 27 August 1896 – 21 September 1933) was a Japanese novelist and poet of children's literature from Hanamaki, Iwate, in the late Taishō and early Shōwa periods.")
        }else if(word == "EMBRACE" || num == 9){
            self.initializeNextLevel(level: 9, title: "PURPOSE", popTitle: "Robert Schuller", popBody: "Robert Harold Schuller (September 16, 1926 – April 2, 2015) was an American Christian televangelist, pastor, motivational speaker, and author. In his five decades of television, Schuller was principally known for the weekly Hour of Power television program, which he began hosting in 1970 until his retirement in 2010.")
        }else if(word == "GUIDELINES" || num == 10){
            self.initializeNextLevel(level: 10, title: "INSPIRATIONAL", popTitle: "Albert Einstein", popBody: "Albert Einstein (/ˈaɪnstaɪn/ EYEN-styne;[4] German: [ˈalbɛʁt ˈʔaɪnʃtaɪn] (About this soundlisten); 14 March 1879 – 18 April 1955) was a German-born theoretical physicist[5] who developed the theory of relativity, one of the two pillars of modern physics (alongside quantum mechanics).[3][6]:274 His work is also known for its influence on the philosophy of science.[7][8] He is best known to the general public for his mass–energy equivalence formula E = mc^2, which has been dubbed \"the world's most famous equation\".[9] He received the 1921 Nobel Prize in Physics \"for his services to theoretical physics, and especially for his discovery of the law of the photoelectric effect\",[10] a pivotal step in the development of quantum theory.")
        }else if(word == "THANKFUL" || num == 11){
            self.initializeNextLevel(level: 11, title: "INSPIRATIONAL", popTitle: "Abraham Lincoln", popBody: "Abraham Lincoln (/ˈlɪŋkən/;[2] February 12, 1809 – April 15, 1865) was an American statesman and lawyer who served as the 16th president of the United States (1861–1865). Lincoln led the nation through its greatest moral, constitutional, and political crisis in the American Civil War. He preserved the Union, abolished slavery, strengthened the federal government, and modernized the U.S. economy.")
        }else if((word == "IMPORTANT" && currentLevel == 11) || num == 12){
//            self.initializeNextLevel(level: 12, title: "INSPIRATIONAL", popTitle: "Maya Angelou", popBody: "Maya Angelou (April 4, 1928 – May 28, 2014) was an American poet, memoirist, and civil rights activist. Angelou is best known for her series of seven autobiographies, which focus on her childhood and early adult experiences. The first, I Know Why the Caged Bird Sings (1969), tells of her life up to the age of 17 and brought her international recognition and acclaim.")
            self.initializeNextLevel(level: 12, title: "INSPIRATIONAL", popTitle: "Maya Angelou", popBody: "Maya Angelou (April 4, 1928 – May 28, 2014) was an American poet, memoirist, and civil rights activist. Angelou is best known for her series of seven autobiographies, which focus on her childhood and early adult experiences. The first, I Know Why the Caged Bird Sings (1969), tells of her life up to the age of 17 and brought her international recognition and acclaim.")

        }else if(word == "SOMETHING" || num == 13){
            self.initializeNextLevel(level: 13, title: "PURPOSE", popTitle: "Voltaire", popBody: "François-Marie Arouet (French: [fʁɑ̃swa maʁi aʁwɛ]; 21 November 1694 – 30 May 1778), known by his nom de plume Voltaire (/vɒlˈtɛər, voʊlˈ-/;[5][6][7] also US: /vɔːlˈ-/,[8][9] French: [vɔltɛːʁ]), was a French Enlightenment writer, historian, and philosopher famous for his wit, his criticism of Christianity—especially the Roman Catholic Church—as well as his advocacy of freedom of speech, freedom of religion, and separation of church and state.")
        }else if(word == "HAPPY" || num == 14){
            self.initializeNextLevel(level: 14, title: "PURPOSE", popTitle: "Norman Vincent Peale", popBody: "Norman Vincent Peale (May 31, 1898 – December 24, 1993) was an American minister and author known for his work in popularizing the concept of positive thinking, especially through his best-selling book The Power of Positive Thinking.")
        }else if(word == "THOUGHTS" || num == 15){
            self.initializeNextLevel(level: 15, title: "PURPOSE", popTitle: "Confucius", popBody: "Confucius (/kənˈfjuːʃəs/ kən-FEW-shəs; 551 BC–479 BC)[1][2] was a Chinese philosopher and politician of the Spring and Autumn period.")
        }else if(word == "MATTER" || num == 16){
            self.initializeNextLevel(level: 16, title: "INSPIRATIONAL", popTitle: "Les Brown", popBody: "Leslie Calvin \"Les\" Brown (born February 17, 1945) is an American motivational speaker, author, former radio DJ, and former television host. He was a member of the Ohio House of Representatives from 1976 to 1981.")
        }else if(word == "EXCEPT" || num == 17){
            self.initializeNextLevel(level: 17, title: "INSPIRATIONAL", popTitle: "C. S. Lewis", popBody: "Clive Staples Lewis (29 November 1898 – 22 November 1963) was a British writer and lay theologian. He held academic positions in English literature at both Oxford University (Magdalen College, 1925–1954) and Cambridge University (Magdalene College, 1954–1963). He is best known for his works of fiction, especially The Screwtape Letters, The Chronicles of Narnia, and The Space Trilogy, and for his non-fiction Christian apologetics, such as Mere Christianity, Miracles, and The Problem of Pain.")
        }else if(word == "FAR" || num == 18){
            self.initializeNextLevel(level: 18, title: "PURPOSE", popTitle: "Mike Dolan", popBody: "Michael Dolan (born June 21, 1965, Oklahoma City, Oklahoma) is an American theatre and film actor, director and educator.")
        }else if(word == "LIGHT" || num == 19){
            self.initializeNextLevel(level: 19, title: "INSPIRATIONAL", popTitle: "", popBody: "")
        }else if(word == "ANSWERED" || num == 20){
            self.initializeNextLevel(level: 20, title: "INSPIRATIONAL", popTitle: "Maya Angelou", popBody: "Maya Angelou (April 4, 1928 – May 28, 2014) was an American poet, memoirist, and civil rights activist. Angelou is best known for her series of seven autobiographies, which focus on her childhood and early adult experiences. The first, I Know Why the Caged Bird Sings (1969), tells of her life up to the age of 17 and brought her international recognition and acclaim.")
        }else if(word == "RAINBOW" || num == 21){
            self.initializeNextLevel(level: 21, title: "INSPIRATIONAL", popTitle: "Eleanor Roosevelt", popBody: "Anna Eleanor Roosevelt was an American political figure, diplomat and activist. She served as the First Lady of the United States from March 4, 1933, to April 12, 1945, during her husband President Franklin D. Roosevelt's four terms in office, making her the longest-serving First Lady of the United States.")
        }else if(word == "STRENGTH" || num == 22){
            self.initializeNextLevel(level: 22, title: "PURPOSE", popTitle: "Billy Bowerman", popBody: "William Jay \"Bill\" Bowerman (February 19, 1911 – December 24, 1999) was an American track and field coach and co-founder of Nike, Inc. Over his career, he trained 31 Olympic athletes, 51 All-Americans, 12 American record-holders, 22 NCAA champions and 16 sub-4 minute milers. He disliked being called a coach and during his 24 years at the University of Oregon, the Ducks track and field team had a winning season every season but one, attained 4 NCAA titles, and finished in the top 10 in the nation 16 times.")
        }else if(word == "VICTORY" || num == 23){
            self.initializeNextLevel(level: 23, title: "INSPIRATIONAL", popTitle: "Fernando Sabino", popBody: "Sabino was the author of 50 books, as well as many short stories and essays. His first book was published in 1941, when he was just 18 years old. Sabino vaulted to national and international fame in 1956 with the novel A Time to Meet, the tale of three friends in the inland city of Belo Horizonte.")
        }else if(word == "YET" || num == 24){
            self.initializeNextLevel(level: 24, title: "INSPIRATIONAL", popTitle: "Richard Wagner", popBody: "Wilhelm Richard Wagner (/ˈvɑːɡnər/ VAHG-nər, German: [ˈʁɪçaʁt ˈvaːɡnɐ] (About this soundlisten);[1] 22 May 1813 – 13 February 1883) was a German composer, theatre director, polemicist, and conductor who is chiefly known for his operas (or, as some of his mature works were later known, \"music dramas\").")
        }else if(word == "THINGS" || num == 25){
            self.initializeNextLevel(level: 25, title: "PURPOSE", popTitle: "Winston Churchill", popBody: "Sir Winston Leonard Spencer Churchill[1] (30 November 1874 – 24 January 1965) was a British politician, army officer, and writer. He was Prime Minister of the United Kingdom from 1940 to 1945, when he led the country to victory in the Second World War, and again from 1951 to 1955. Apart from two years between 1922 and 1924, Churchill was a Member of Parliament (MP) from 1900 to 1964 and represented a total of five constituencies. Ideologically an economic liberal and imperialist, he was for most of his career a member of the Conservative Party, as leader from 1940 to 1955. He was a member of the Liberal Party from 1904 to 1924.")
        }else if(word == "ATTITUDE" || num == 26){
            self.initializeNextLevel(level: 26, title: "PURPOSE", popTitle: "Mary Lou Retton", popBody: "Mary Lou Retton (born January 24, 1968) is a retired American gymnast. At the boycotted 1984 Summer Olympics in Los Angeles, she won a gold medal in the individual all-around competition, as well as two silver medals and two bronze medals.[2] Her performance made her one of the most popular athletes in the United States.[3]")
        }else if((word == "OPTIMISM" && currentLevel == 26) || num == 27){
            print(word)
            print(currentLevel)
            print(num)
            self.initializeNextLevel(level: 27, title: "INSPIRATIONAL", popTitle: "Dale Carnegie", popBody: "Dale Carnegie (/ˈkɑːrnɪɡi/;[1] spelled Carnagey until c. 1922; November 24, 1888 – November 1, 1955) was an American writer and lecturer, and the developer of courses in self-improvement, salesmanship, corporate training, public speaking, and interpersonal skills.")
        }else if(word == "IMPORTANT" || num == 28){
            print(word)
            print(currentLevel)
            print(num)
            self.initializeNextLevel(level: 28, title: "PURPOSE", popTitle: "William James", popBody: "William James (January 11, 1842 – August 26, 1910) was an American philosopher and psychologist, and the first educator to offer a psychology course in the United States.[5] James is considered to be a leading thinker of the late nineteenth century, one of the most influential philosophers of the United States, and the \"Father of American psychology\"")
        }else if(word == "LIVING" || num == 29){
            print(word)
            print(currentLevel)
            print(num)

            self.initializeNextLevel(level: 29, title: "INSPIRATIONAL", popTitle: "Helen Keller", popBody: "Helen Adams Keller (June 27, 1880 – June 1, 1968) was an American author, political activist, and lecturer. She was the first deaf-blind person to earn a Bachelor of Arts degree. The story of Keller and her teacher, Anne Sullivan, was made famous by Keller's autobiography, The Story of My Life, and its adaptations for film and stage, The Miracle Worker.")
        }else if(word == "CONFIDENCE" || num == 30){
            self.initializeNextLevel(level: 30, title: "INSPIRATIONAL", popTitle: "Joel Osteen", popBody: "Joel Scott Osteen (born March 5, 1963)[2] is an American pastor, televangelist, and author, based in Houston, Texas. As of 2018, Osteen's televised sermons were seen by approximately 10 million viewers in the US and several million more in over 100 countries weekly.[3] Osteen has also written several best-selling books.[4]")
        }else if(word == "STEP" || num == 31){
            defaults.set(true, forKey: "level1")
            defaults.set(true, forKey: "level2")
            defaults.set(1, forKey: "game1level")
            defaults.set(false, forKey: "startview")
            performSegue(withIdentifier: "levelselect1", sender: nil)
            //NEXT
//            self.initializeNextLevel(level: 18, title: "INSPIRATIONAL", popTitle: "Eleanor Roosevelt", popBody: "Anna Eleanor Roosevelt was an American political figure, diplomat and activist. She served as the First Lady of the United States from March 4, 1933, to April 12, 1945, during her husband President Franklin D. Roosevelt's four terms in office, making her the longest-serving First Lady of the United States.")
        }


//            if let view = self.view as! SKView? {
//                if let scene = SKScene(fileNamed: "MyScene2") as? MyScene {
//                    
//                    if gameScene != nil {
//                        gameScene?.removeFromParent()
//                        view.presentScene(nil)
//                    }
//                    
//                    gameScene = scene
//                    gameScene!.scaleMode = .aspectFit
//                    view.presentScene(gameScene!)
//                }
//            }
        





        

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
                if touchBeganNode == gameBack {
//                    self.viewDidLoad()
                    defaults.set(true, forKey: "startview")
                    performSegue(withIdentifier: "levelselect1", sender: nil)
                }
            }
            if touchedNode == gameOptionShuffle
            {
                print("SOFJODFHOIDHJFSIOJIOFJSODIFJOSDIFJOSDJFOSDJF")
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
                performSegue(withIdentifier: "levelselect1", sender: nil)

            }
        }
    }
    func skip(to: Int){

        for node in self.gameScene?.gameCanvases[currentLevel-1]?.children ?? []
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

    func skip(){

        for node in self.gameScene?.gameCanvases[currentLevel-1]?.children ?? []
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
