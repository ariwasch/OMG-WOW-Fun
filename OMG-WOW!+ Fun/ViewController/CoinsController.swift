//
//  CoinsController.swift
//  OMG-WOW!+ Fun
//
//  Created by Ari Wasch on 7/9/20.
//  Copyright © 2020 Ari Wasch. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import StoreKit
import GameplayKit
import GoogleMobileAds
import SwiftyStoreKit

class CoinsController: UIViewController, SKProductsRequestDelegate, GADRewardedAdDelegate, SKPaymentTransactionObserver {
    
    
//    private let productIdentifiers: Set<ProductIdentifier>
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) { //--------- In App Purchase
        for transaction in transactions {
            guard
                transaction.transactionState != .purchasing,
                transaction.transactionState != .deferred
            else {
                //Optionally provide user feedback for pending or processing transactions
                continue
            }

            if transaction.transactionState == .purchased && !completePurchase {
                print("Transaction Successful")
                verifyPurchase(with: defaults.string(forKey: "id") ?? "")
                let id = defaults.string(forKey: "id")
                let balance = defaults.integer(forKey: "balance")
                print("balance \(balance)")
                if(id == "omg.coins.100"){
                    defaults.set(balance+100, forKey: "balance")
                }else if(id == "omg.coins.250"){
                    defaults.set(balance+250, forKey: "balance")
                }else if(id == "omg.no.ads"){
//                    defaults.set(balance+500, forKey: "balance")
                    print("noADs")
                    defaults.set(true, forKey: "no-ads")
                    buy3?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
//                }else if(id == "omg.moreLevels"){
//                    defaults.set(true, forKey: "moreLevels")
//                    buy6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))

                }
                
                reloadBalance()
                completePurchase = true
            } else if transaction.transactionState == .purchasing {
                print("PURCHASING")
            } else if transaction.transactionState == .failed {
                print("Transaction Failed with error: \(transaction.error)")
            } else if transaction.transactionState == .restored {
                let id = defaults.string(forKey: "id")
                if(id == "omg.no.ads"){
                    defaults.set(true, forKey: "no-ads")
                    buy3?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))

                }
            }
            //Transaction can now be safely finished
            queue.finishTransaction(transaction)
        }
    }

    
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("SSDADS \(response.products.count)")
//        print(response.products.count)
        if let product = response.products.first {
            products = product
            print(product.productIdentifier)
            defaults.set(product.productIdentifier, forKey: "id")
            
//            for p in products {
//              print("Found product: \(p.productIdentifier) \(p.localizedTitle) \(p.price.floatValue)")
//            }

        }
    }
    
    var products: SKProduct?
//    var rewardedAd: GADRewardedAd?
    var transactionComplete : Bool = false
    var gameScene : Coins?
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
    var rewardedAd: GADRewardedAd?
    var completePurchase: Bool = false
    var infoPopup : SKSpriteNode?
    var donate : SKSpriteNode?

    var variableArray: [[SKSpriteNode?]] = [[]]
    var gameCongratulations : SKLabelNode?
    
    var gameBlockContainer2 : SKSpriteNode?
    var gameTextContainer2 : SKSpriteNode?

    var gameBlockTest : SKSpriteNode?
    var gameTextTest : SKSpriteNode?

    var touchBeganNode : SKSpriteNode?
    var currentLevel : Int = 31
//    var SKSpriteNodelol : SKSpriteNode?
//    var infoTitle : SKSpriteNode?
//    var infoBody : SKSpriteNode?
    
    var productIDs: Array<String?> = []
    var productsArray: Array<SKProduct?> = []
    
    
    var buy1: SKSpriteNode?
    var buy2: SKSpriteNode?
    var buy3: SKSpriteNode?
    var buy4: SKSpriteNode?
    var buy5: SKSpriteNode?
    var buy6: SKSpriteNode?
    var balance: SKLabelNode?
    var restore: SKSpriteNode?


    //MARK:- View LifeCycle
    override func viewDidLoad() {
        fetchProduct()
//        restorePurchases()
        super.viewDidLoad()
        loadAds()
        view.layoutIfNeeded()
        presentGameScene()
        initializationOfGameVariable()
        if(defaults.bool(forKey: "moreLevels")){
            buy6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }
        if(defaults.bool(forKey: "no-ads")){
            buy3?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
        }

        reloadBalance()
        verifyPurchase(with: "omg.no.ads")
        verifyPurchase(with: "omg.coins.100")
        verifyPurchase(with: "omg.coins.250")

    }
    func fetchProduct(){
        let request = SKProductsRequest(productIdentifiers: ["omg.coins.100","omg.coins.250","omg.no.ads"])
        request.delegate = self
        request.start()
    }
    func verifyPurchase(with id: String){
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: "2ef6aeb74bc046a5b770fed6d282059d")
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "com.musevisions.SwiftyStoreKit.Purchase1"
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: id,
                    inReceipt: receipt)
                    
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(id) is purchased: \(receiptItem)")
                    print("LOLOTTOERASDASF")
                case .notPurchased:
                    print("The user has never purchased \(id)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
    }
    func requestProductInfo() {
        if SKPaymentQueue.canMakePayments() {
            let productIdentifiers = NSSet(array: productIDs)
            let productRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)

            productRequest.delegate = self
            productRequest.start()
        }
        else {
            print("Cannot perform In App Purchases.")
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Load Scene
    func presentGameScene()
    {
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "Coins") as? Coins {
                
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
        
        gameOptionsBackground = fetchSpriteNode(withName: "gameOptionsBackground")
        gameOptionSearch = fetchSpriteNode(withName: "gameOptionSearch")
        gameOptionHint = fetchSpriteNode(withName: "gameOptionHint")
        gameOptionShuffle = fetchSpriteNode(withName: "gameOptionShuffle")
        gameOptionAds = fetchSpriteNode(withName: "gameOptionAds")
        gameTextContainer = fetchSpriteNode(withName: "gameTextContainer")
        gameTextContainer4 = fetchSpriteNode(withName: "gameTextContainer4")
        
        buy1 = fetchSpriteNode(withName: "buy1")
        buy2 = fetchSpriteNode(withName: "buy2")
        buy3 = fetchSpriteNode(withName: "buy3")
        buy4 = fetchSpriteNode(withName: "buy4")
        buy5 = fetchSpriteNode(withName: "buy5")
        buy6 = fetchSpriteNode(withName: "buy6")
        infoPopup = fetchSpriteNode(withName: "infoPopup")
        donate = fetchSpriteNode(withName: "donate")
        restore = fetchSpriteNode(withName: "restore")
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
    
    public func restorePurchases() {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }

    func inAppPurchase(forKey: String){
        //actual in app purchases
        let request = SKProductsRequest(productIdentifiers: [forKey])
        request.delegate = self
        request.start()
        guard let products = products else {
            return
        }
        print("(AD!")

        if(SKPaymentQueue.canMakePayments()){
            completePurchase = false
            let payment = SKPayment(product: products)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }

    }
    //MARK:- Touch Actions
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if(end){

        if let touch = touches.randomElement(), gameScene != nil
        {
            let positionInScene = touch.location(in: gameScene!)
            let touchedNode = gameScene!.atPoint(positionInScene)

            if touchedNode == gameBack
            {
                if touchBeganNode == gameBack {
                    defaults.set(false, forKey: "startview")
                    performSegue(withIdentifier: "coinToLevels", sender: nil)
                }
            }

            if touchedNode == buy1 || touchedNode.parent == buy1
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1, duration: 0))
                buy1?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                inAppPurchase(forKey: "omg.coins.100")
            }
            if touchedNode == buy2 || touchedNode.parent == buy2
            {
                inAppPurchase(forKey: "omg.coins.250")
                buy2?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if (touchedNode == buy3 || touchedNode.parent == buy1) && !defaults.bool(forKey: "no-ads")
            {
                inAppPurchase(forKey: "omg.no.ads")
                buy3?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }else if((touchedNode == buy3 || touchedNode.parent == buy1) && defaults.bool(forKey: "no-ads")){
                buy3?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }

            if touchedNode == buy5 || touchedNode.parent == buy5
            {
                if rewardedAd?.isReady == true {
                   rewardedAd?.present(fromRootViewController: self, delegate:self)
                }
                buy5?.run(SKAction.fadeAlpha(to: 1.0, duration: 0))
            }
            if (touchedNode == buy6 || touchedNode.parent == buy1) && !defaults.bool(forKey: "moreLevels")
            {
//                inAppPurchase(forKey: "omg.moreLevels")
                let balance = defaults.integer(forKey: "balance")
                if(balance > 400){
                    defaults.set(true, forKey: "moreLevels")
                    buy6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
                    defaults.set(balance-400, forKey: "balance")
                    reloadBalance()
                }else{
                    buy6?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                }
                    
//                buy6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
//                if let url = URL(string: "https://forms.gle/92RmX2RTRhG76mLA6") {
//                    UIApplication.shared.open(url)
//                    defaults.set(true, forKey: "surveyDone")
//                    let balance = defaults.integer(forKey: "balance")
//                    defaults.set(balance+20, forKey: "balance")
//                    defaults.set(true, forKey: "no-ads")
//                    reloadBalance()
//                }


//            }else if(touchedNode == buy6 && defaults.bool(forKey: "moreLevels")){
//                buy6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))

            }
            if touchedNode == donate
            {
                infoPopup?.isHidden = false
                donate?.run(SKAction.fadeAlpha(to: 1, duration: 0))
                buy1?.isUserInteractionEnabled = false
                buy2?.isUserInteractionEnabled = false
                buy3?.isUserInteractionEnabled = false
                buy4?.isUserInteractionEnabled = false
                buy5?.isUserInteractionEnabled = false
                buy6?.isUserInteractionEnabled = false
            }

            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1, duration: 0))
                buy1?.isUserInteractionEnabled = true
                buy2?.isUserInteractionEnabled = true
                buy3?.isUserInteractionEnabled = true
                buy4?.isUserInteractionEnabled = true
                buy5?.isUserInteractionEnabled = true
                buy6?.isUserInteractionEnabled = true
                infoPopup?.isHidden = true
                
            }
            print(touchedNode.name, " ", touchBeganNode?.name)

            if touchedNode.name == "donate1"
            {
                touchedNode.run(SKAction.fadeAlpha(to: 1, duration: 0))
                if let url = URL(string: "https://www.google.com") {
                    UIApplication.shared.open(url)
                }
            }
            
            if touchedNode == restore
            {
                restorePurchases()
                restore?.run(SKAction.fadeAlpha(to: 1, duration: 0))
            }
        }
    }
    
    public func buyProduct(_ product: SKProduct) {
      print("Buying \(product.productIdentifier)...")
      let payment = SKPayment(product: product)
      SKPaymentQueue.default().add(payment)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameBack?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        buy1?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        buy2?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        restore?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        if(!defaults.bool(forKey: "no-ads")){
            buy3?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
//        buy4?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        buy5?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        if(!defaults.bool(forKey: "moreLevels")){
            buy6?.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
        
        if let touch = touches.first, gameScene != nil
        {
            let touchedNode = gameScene!.atPoint(touch.location(in: gameScene!))
            touchedNode.run(SKAction.fadeAlpha(to: 1, duration: 0))
        }
    }
    
    var end:Bool = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, gameScene != nil
        {
            let positionInScene = touch.location(in: gameScene!)
            let touchedNode = gameScene!.atPoint(positionInScene)
            touchBeganNode = touchedNode as? SKSpriteNode
            print(touchedNode.parent?.name)
            if touchBeganNode == gameBack {
                end = true
                gameBack?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }

            if touchBeganNode == buy1 || touchedNode.parent == buy1
            {
                end = true
                buy1?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchBeganNode == buy2 || touchedNode.parent == buy2
            {
                end = true
                buy2?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchBeganNode == buy3 || touchedNode.parent == buy3
            {
                end = true
                buy3?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
//            if touchedNode == buy4
//            {
//                buy4?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
//            }
            if touchBeganNode == buy5 || touchedNode.parent == buy5
            {
                end = true
                buy5?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchBeganNode == buy6 || touchedNode.parent == buy6
            {
                end = true
                buy6?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            if touchBeganNode == donate
            {
                end = true
                donate?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            
            if touchedNode.name == "closeInfo" && touchBeganNode?.name == "closeInfo"
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
            print(touchedNode.name, " ", touchBeganNode?.name)
            if touchedNode.name == "donate1"
            {
                touchedNode.run(SKAction.fadeAlpha(to: 0.5, duration: 0))

            }
            if touchBeganNode == restore {
                end = true
                restore?.run(SKAction.fadeAlpha(to: 0.5, duration: 0))
            }
    }

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

    func reloadBalance(){
        if let lblLevel = gameLevelHeader?.childNode(withName: "balance") as? SKLabelNode
        {
            lblLevel.text = "BALANCE: \(defaults.integer(forKey: "balance"))"
        }

    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            let prodID = t.payment.productIdentifier as String

            switch prodID {
            case "omg.no.ads":
                inAppPurchase(forKey: "omg.no.ads")
                // implement the given in-app purchase as if it were bought
            default:
                print("iap not found")
            }
        }
    }

}
