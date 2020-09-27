//
//  Constants.swift
//  SampleGame
//
//  Created by Hitesh Trantor on 16/04/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

let colorNormal = UIColor.init(red: 252.0/255.0, green: 240.0/255.0, blue: 248.0/255.0, alpha: 1.0)
let colorHighlighted = UIColor.init(red: 237.0/255.0, green: 204.0/255.0, blue: 72.0/255.0, alpha: 1.0)

let colorTextNormal = UIColor.init(red: 120.0/255.0, green: 100.0/255.0, blue: 230.0/255.0, alpha: 1.0)
let colorTextHighlighted = UIColor.white

var blockSwippedWord : (String,[SKSpriteNode])->() = {_,_ in}

let rewardedAdID : String = "ca-app-pub-7981805967745898/8079960600"
//let rewardedAdID : String = "ca-app-pub-3940256099942544/1712485313" //test ad

let bannerAdID : String = "ca-app-pub-7981805967745898/9084594126"
//let bannerAdID : String = "ca-app-pub-3940256099942544/2934735716" //test ad

let interstatialAdID : String = "ca-app-pub-7981805967745898/5325312511"
//let interstatialAdID : String = "ca-app-pub-3940256099942544/4411468910" //test ad


enum SwipeDirection
{
    case forward
    case backward
    case up
    case down
    case unIdentified
}

