//
//  BlockNode.swift
//  SampleGame
//
//  Created by Hitesh Trantor on 15/04/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import Foundation
import SpriteKit

class BlockNode : SKSpriteNode
{
    var gameCanvas : SKSpriteNode?
    var stringMade = ""
    static var disableButtons = false
    let defaults = UserDefaults.standard
    var arrNodesSelected : [SKSpriteNode] = []
    let arrayStrings = ["GOOD","BETTER","BEST"]
    let arrayStrings2 = ["GOLF","TENNIS","BALL","ROW","PITCH"]
    let arrayStrings3 = ["NEVER","ALWAYS","EYE"]
    let arrayStrings4 = ["NOTHING","THAN","POSITIVE"]
    let arrayStrings5 = ["THOUGHT","CHANGE","SMALL","DAY"]
    let arrayStrings6 = ["SITUATION","SITUATION","TURN","INTO"]
    //["GOLF","TENNIS","BALL","ROW","PITCH"]
    let allStrings = [["GOOD","BETTER","BEST"], ["DREAMS","TRUE","COURAGE","PURSUE"], ["NEVER","EYE","ALWAYS"], ["NOTHING","THAN","POSITIVE"], ["CHANGE","SMALL","DAY","THOUGHT"], ["INTO","TURN","SITUATION"], ["LIFE","YOUR","MORE","BECOME","RESPOND"], ["PAIN","JOURNEY","FUEL","EMBRACE"], ["STOP","SIGNS","THEY","GUIDELINES"],["THAT","DOING","SAID","BECAUSE","THANKFUL"],["THING","MIND","BEAR","SUCCEED","YOUR","IMPORTANT"], ["LIKE","ATTITUDE","COMPLAIN","CHANGE","SOMETHING"],["GOOD","HEALTH","DECIDED","HAPPY"],["WORLD","YOUR","CHANGE","THOUGHTS"],["STOP","LONG","SLOW","MATTER"],["LIFE","MAKE","ONES","EXCEPT"],["LEAVE","AHEAD","BEHIND","ANYTHING","FAR"],["PEACE","WAR","CALM","STORM","DARK","LIGHT"],["LIVE","YOUR","PRAYERS","ANSWERED"],["TRY","CLOUD","RAINBOW"],["WITH","NEW","COMES","STRENGTH"],["YOUR","DONE","BEST","HAVING","VICTORY"],["WILL","NOT","OKAY","END","YET"],["NOT","JOY","THINGS"],["THING","LITTLE","MAKES","ATTITUDE"],["GOOD","DRAWN","MAGNET","PEOPLE","HAPPINESS","OPTIMISM"],["PEOPLE","HOPE","TRYING","SEEMED","BEEN","IMPORTANT"],["LIFE","FACT","WORTH","CREATE","BELIEVE","LIVING"],["LEADS","DONE","FAITH","WITHOUT","OPTIMISM","CONFIDENCE"],["KEEP","FACE","SMILE","SPRING","STEP"]]
    let allStrings1D = ["GOOD","BETTER","BEST","DREAMS","TRUE","COURAGE","PURSUE", "NEVER","ALWAYS","EYE", "NOTHING","THAN","POSITIVE", "THOUGHT","CHANGE","SMALL","DAY","SITUATION","TURN","INTO","RESPOND", "MORE", "LIFE", "BECOME", "YOUR","EMBRACE", "PAIN", "FUEL", "JOURNEY","STOP","SIGNS","GUIDELINES","THEY","THANKFUL","SAID","DOING","MYSELF","BECAUSE","THAT","BEAR","MIND","SUCCEED","THING","IMPORTANT","ATTITUDE","LIKE","COMPLAIN","SOMETHING","HAPPY","HEALTH","DECIDED","THOUGHTS","WORLD","MATTER","SLOW","LONG","EXCEPT","ONES","MAKE","ANYTHING","LEAVE","FAR","BEHIND","AHEAD","LIGHT","DARK","CALM","STORM","PEACE","WAR","LIVE","TRY","PRAYERS","ANSWERED","RAINBOW","CLOUD","COMES","NEW","WITH","STRENGTH","VICTORY","HAVING","DONE","END","OKAY","NOT","JOY","THINGS","WILL","YET","LITTLE","MAKES","OPTIMISM","MAGNET","PEOPLE","DRAWN","HAPPINESS","BELIEVE","WORTH","CREATE","FACT","WITHOUT","FAITH","LEADS","CONFIDENCE","IMPORTANT","TRYING","SEEMED","BEEN","HOPE","PEOPLE","LIVING","KEEP","SMILE","FACE","SPRING","STEP"]

    let allStrings2 =  [["TEACH","DEEP","RIGHT","PROVERBS","WISDOM","MEANINGS"],["WORDS","WELL","SAYINGS","WISER","SMART","RIDDLES"],["DIE","LIFE","PEOPLE","LOVED","ETERNAL","EVERYONE"],["WITH","ANYTHING","REQUESTS","HEARTS","ABOUT","WORRY"],["GIFT","DONE","BETTER","TREATS","DESERVE","ANYTHING"],["SURE","WHAT","CANNOT","PROOF","GIVES"],["GOOD","KNOW","LOVES","CHOSEN","PURPOSE","EVERYONE"],["SEED","ENOUGH","MOUNTAIN","POSSIBLE"],["WELL","PAIN","PEACE","WOMAN","HEALED"],["HELP","SINNED","SHOULD","ANOTHER","INNOCENT"],["EVIL","FIRM","DEFEND","BATTLE","GIVES"],["PRAY","FROM","NEEDS","BLESSINGS","WONDERFUL","CARE"],["DESTROY","ROB","FULLY","LIFE","KILL","THIEF"],["FAITH","SEARCHES","PLEASE","REAL","REWARDS","BELIEVE"],["GLORY","STRONG","SUFFER","STEADY","UNDESERVED"],["GAVE","WIFE","CHURCH","LIFE","HUSBAND","MUCH"],["RESPECT","MARRIAGE","PUNISH","PARTNER","IMMORAL"],["ALSO","FAITHFUL","BROKEN","EVEN","MURDER"],["KNOW","LIES","CHEAT","MURDER","STEAL","RESPECT"],["WALK","UPWARD","TIRED","STRENGTH","EAGLES","TRUST"],["MAKE","PROTECT","ARM","AFRAID","TREMBLE"],["EVEN","SEEM","FAIL","MIGHTY","POWER","DOOMED"],["HEARD","ANOTHER","LOVE","MEANS","DOING",],["LIVE","TREAT","EQUAL","HONOR"]]
    let allStrings1D2 = ["TEACH","PROVERBS","WISDOM","RIGHT","DEEP","MEANINGS","SMART","WELL","WISER","SAYINGS","WORDS","RIDDLES","LOVED","PEOPLE","EVERYONE","ETERNAL","DIE","LIFE","WORRY","ANYTHING","HEARTS","REQUESTS","ABOUT","WITH","TREATS","BETTER","DESERVE","GIFT","DONE","SURE","WHAT","PROOF","CANNOT","GIVES","KNOW","GOOD","CHOSEN","PURPOSE","LOVES","ENOUGH","SEED","MOUNTAIN","POSSIBLE","MARK","WOMAN","PEACE","HEALED","PAIN","SINNED","SHOULD","ANOTHER","INNOCENT","HELP","EVIL","DEFEND","BATTLE","FIRM","PRAY","NEEDS","CARE","WONDERFUL","FROM","BLESSINGS","THIEF","KILL","ROB","DESTROY","FULLY","FAITH","PLEASE","BELIEVE","REAL","REWARDS","SEARCHES","UNDESERVED","GLORY","SUFFER","STEADY","STRONG","WIFE","MUCH","CHURCH","GAVE","HUSBAND","RESPECT","PARTNER","IMMORAL","MARRIAGE","PUNISH","ALSO","MURDER","EVEN","FAITHFUL","BROKEN","STEAL","LIES","CHEAT","TRUST","STRENGTH","EAGLES","UPWARD","WALK","TIRED","AFRAID","TREMBLE","MAKE","PROTECT","ARM","MIGHTY","DOOMED","FAIL","POWER","SEEM","LOVE","MEANS","DOING","ANOTHER","HEARD","EQUAL","HONOR","LIVE","TREAT"]

    let allStrings3 =  [["PART","CONSTANT","PLAN","HEALTH","LIFE"],["WILL","EVEN","PRETEND","POINT","BELIEVE"],["SMILE","HAPPENS","TEARS","SENSE","LAUGH"], ["SUCCESS","DIRTY","TERRIFIC","BRIGHT","TUXEDO"],["WHO","THINK","KNOW","PEOPLE","GREAT","THOSE",],["GETS","THERE","GOOD","AMOUNT","CREDIT","LIMIT"],["HANG","OUT","PEOPLE","SHORT"],["LIVE","HATRED","WHAT","IGNORE","CREATE"],["WASTE","GRUDGES","CHANGE","LAUGH","SHOULD","PERFECT"],["LOVE","HELL","HEAVEN","FEAR","LIVE","WHERE"],["MAKING","YOURSELF","SMALLER","OVERCOME"],["TRYING","MORE","OTHERS","IMPROVING"],["TAKE","LEARN","CAUSE","EXAMPLE","HUMAN","PROBLEM"],["ABOUT","MOST","BEHOLDER","BEAUTY","REALIZING"],["FAIRLY","BULL","ATTACK","LITTLE","WORLD"],["MAKE","MISTAKES","MARK","BRILLIANT","BEST"],["TIME","GIFT","HELP","ENERGY","RETURN","EXPECTING"],["PEOPLE","RESPECT","LIFE","HATE","SIMPLY","CUTTING"],["JOB","STATE","MIND","FUTURE","ALTER","TITLE"],["MUST","PAIN","REASON","LAUGH","NEVER"],["FULLY","GIVE","SHARE","UNIVERSE"],["TAKES","SEE","STRONGER","PERSON","ADVERSITY"],["CITY","COMFORT","WHAT","DISCOVER","INTUITION"],["MONEY","LAWS","GOVERN","SIMPLE","PLENTIFUL"]]
    let allStrings1D3 = ["LIFE","PART","HEALTH","PLAN","CONSTANT","BELIEVE","PRETEND","POINT","EVEN","WILL","SENSE","LAUGH","SMILE","TEARS","HAPPENS","SUCCESS","BRIGHT","TUXEDO","TERRIFIC","DIRTY","PEOPLE","THINK","KNOW","GREAT","THOSE","WHO","GOOD","LIMIT","CREDIT","AMOUNT","THERE","GETS","SHORT","HANG","OUT","IGNORE","HATRED","CREATE","WHAT","LIVE","PERFECT","GRUDGES","WASTE","SHOULD","CHANGE","HEAVEN","HELL","WHERE","FEAR","LOVE","OVERCOME","MAKING","SMALLER","YOURSELF","TRYING","OTHERS","MORE","IMPROVING","CAUSE","PROBLEM","EXAMPLE","HUMAN","LEARN","TAKE","REALIZING","BEHOLDER","BEAUTY","ABOUT","MOST","WORLD","FAIRLY","BULL","ATTACK","LITTLE","MISTAKES","MARK","BEST","BRILLIANT","MAKE","GIFT","TIME","ENERGY","HELP","EXPECTING","RETURN","CUTTING","HATE","RESPECT","SIMPLY","TITLE","STATE","MIND","JOB","ALTER","FUTURE","PAIN","NEVER","REASON","MUST","GIVE","SHARE","FULLY","UNIVERSE","ADVERSITY","SEE","TAKES","PERSON","STRONGER","CITY","COMFORT","INTUITION","DISCOVER","MONEY","PLENTIFUL","SIMPLE","LAWS","GOVERN"]

    let allStrings4 =  [["LIFE","GREAT","VERY","UNIQUE","DIFFERENT"],["WHEN","WISER","MORE","BETTER","COMMON","LISTEN"],["UNTIL","NARROW","RISE","BROADER","STARTED"],["FEAR","PEOPLE","GOOD","DISAGREE","REQUIRES"],["HOPES","POT","MOSAIC","DREAMS","BECOME","YEARNINGS"],["THING","STICK","THAT","BIGGEST","DRIVING","BELIEVE"]]
    let allStrings1D4 = ["DIFFERENT","GREAT","UNIQUE","LIFE","VERY","LISTEN","COMMON","WISER","MORE","BETTER","WHEN","STARTED","UNTIL","RISE","NARROW","BROADER","GOOD","REQUIRES","PEOPLE","DISAGREE","FEAR","BECOME","POT","MOSAIC","HOPES","DREAMS","YEARNINGS","BELIEVE","STICK","THING","THAT","DRIVING","BIGGEST"]

    let allStrings5 =  [["GETS","THINGS","PEOPLE","LEADER","GREATEST"],["CLOSE","ENOUGH","AHEAD","FAR","LEADERS","RELATE"],["LEAD","KINGDOM","IDEAS","ACCEPT"],["HEAD","HANDLE","HEART","OTHERS"],["WHERE","PEOPLE","USED","EXPECTED","YARDSTICK"]]
    let allStrings1D5 = ["LEADER","GREATEST","GETS","PEOPLE","THINGS","LEADERS","CLOSE","ENOUGH","RELATE","AHEAD","FAR","ACCEPT","IDEAS","KINGDOM","LEAD","HANDLE","HEAD","OTHERS","HEART","YARDSTICK","USED","WHERE","EXPECTED"]
    
    let allStrings6 =  [["WASTED","SMALL","KINDNESS","MATTER"],["TAKE","THINGS","SAID","OTHERS"],["TRUE","PURE","FREELY","STRINGS","OFFERING"],["ALWAYS","NOTHING","COSTS","FEEL","CONSIDER"],["PLAGUE","COULD","LONG","ENOUGH","CARRIERS","ZOMBIE"],["NORMAL","HAND","HARD","GENEROUS"],["DIES","DONE","ALONE","WORLD","IMMORTAL"],["MUST","LIGHT","WALK","DARKNESS","EVERY"],["TRUTH","REAL","MAKES","GIVING"],["NEED","WHEN","FEELING","POWERFUL","GENEROUS"],["BORN","ABATES","ELSE","WHEN","PRESENT","GIVE"],["WANT","OTHERS","HAPPY","PRACTICE","COMPASSION"],["SAID","PEOPLE","NEVER","DID","FORGET","FEEL"],["MOST","LIVED","LIFE","BUSINESS","OTHERS"]]
    let allStrings1D6 = ["KINDNESS","MATTER","SMALL","WASTED","SAID","TAKE","THINGS","OTHERS","TRUE","OFFERING","FREELY","PURE","STRINGS","CONSIDER","ALWAYS","FEEL","COSTS","NOTHING","ZOMBIE","PLAGUE","ENOUGH","CARRIERS","LONG","GENEROUS","HAND","HARD","NORMAL","DONE","ALONE","DIES","WORLD","IMMORTAL","EVERY","WALK","LIGHT","DARKNESS","MUST","GIVING","TRUTH","MAKES","REAL","ABATES","BORN","WHEN","PRESENT","ELSE","GIVE","HAPPY","PRACTICE","WANT","COMPASSION","PEOPLE","FORGET","DID","NEVER","FEEL","LIFE","BUSINESS","MOST","LIVED","NEED","FEELING","POWERFUL","COULD"]

    var lastSelectedBlock : SKSpriteNode?
    var swipeDirection : SwipeDirection?
    
    func getTotalCount(){
        print("hi")

        print("hi \(allStrings.count)")
//        return allStrings.count
    }
    func getSwipeDirection(forNode:SKSpriteNode, fromNode:SKSpriteNode)->SwipeDirection
    {
        if abs(Int(forNode.position.x)-Int(fromNode.position.x))<2 {
            // vertical
            if abs(Int(forNode.position.y)-Int(fromNode.position.y)) > Int(forNode.size.height*2) {
                return .unIdentified
            }
            
            if forNode.position.y < fromNode.position.y {
                return .down
            }
            else {
                return .up
            }
        }
        if abs(Int(forNode.position.y)-Int(fromNode.position.y))<2 {
            // horizontal
            
            if abs(Int(forNode.position.x)-Int(fromNode.position.x)) > Int(forNode.size.width*2) {
                return .unIdentified
            }
            if forNode.position.x < fromNode.position.x {
                return .backward
            }
            else {
                return .forward
            }
        }
        // Cross
        return .unIdentified
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        BlockNode.disableButtons = true
        if let parent = self.parent
        {
            gameCanvas = parent as? SKSpriteNode
            
            let arrBlocks = parent.children.filter { (spriteNode) -> Bool in
                if spriteNode is BlockNode && spriteNode.calculateAccumulatedFrame().contains(touches.first?.location(in: parent) ?? CGPoint.init(x: 0, y: 0))
                {
                    return true
                }
                return false
            }
            for node in arrBlocks
            {
                if let sprite = node as? SKSpriteNode {
                    let dummyNode = SKSpriteNode()
                    dummyNode.color = colorNormal
                    if sprite.color == dummyNode.color
                    {
                        if lastSelectedBlock != nil {
                            let currentDirection = getSwipeDirection(forNode: sprite, fromNode: lastSelectedBlock!)
                            if currentDirection == .unIdentified {
                                return
                            }
                            
                            if swipeDirection != nil
                            {
                                if swipeDirection != currentDirection {
                                    return
                                }
                            }
                        }
                        
                        sprite.color = colorHighlighted
                        if (lastSelectedBlock != nil) {
                            swipeDirection = getSwipeDirection(forNode: sprite, fromNode: lastSelectedBlock!)
                        }
                        if let label = sprite.childNode(withName: "Label") as? SKLabelNode
                        {
                            label.fontColor = colorTextHighlighted
                            stringMade = stringMade + (label.text ?? "")
                            arrNodesSelected.append(sprite)
                        }
                        lastSelectedBlock = sprite
                    }
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        lastSelectedBlock = nil
        swipeDirection = nil
        BlockNode.disableButtons = false

        print("ASIDJJDSIO1 \(stringMade.uppercased())")

//        if arrayStrings.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings2.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings3.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings4.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings5.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
//        if arrayStrings6.contains(stringMade.uppercased()) {
//            blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//        }
        
        let level = defaults.integer(forKey: "level")
        print(level)
        if(level <= 30){
            if allStrings1D.contains(stringMade.uppercased()) {
                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
            }
        }else if(level <= 54){
            if allStrings1D2.contains(stringMade.uppercased()) {
                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
            }
        }else if(level <= 78){
            if allStrings1D3.contains(stringMade.uppercased()) {
                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
            }
        }else if(level <= 84){
            if allStrings1D4.contains(stringMade.uppercased()) {
                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
            }
        }else if(level <= 89){
            if allStrings1D5.contains(stringMade.uppercased()) {
                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
            }
        }else{
            if allStrings1D6.contains(stringMade.uppercased()) {
                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
            }


        }

//        for i in 0...arrayStrings.count-1{
//            if arrayStrings[i].contains(stringMade.uppercased()) {
//                blockSwippedWord(stringMade.uppercased(),arrNodesSelected)
//            }
//        }
        stringMade = ""
        arrNodesSelected = []
        for node in gameCanvas?.children ?? []
        {
            if let sprite = node as? SKSpriteNode, sprite is BlockNode {
                sprite.color = colorNormal
                if let label = sprite.childNode(withName: "Label") as? SKLabelNode
                {
                    label.fontColor = colorTextNormal
                }
            }
        }
    }
}
