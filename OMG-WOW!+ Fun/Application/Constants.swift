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


enum SwipeDirection
{
    case forward
    case backward
    case up
    case down
    case unIdentified
}

