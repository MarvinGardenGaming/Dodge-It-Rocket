//
//  ChangeShipScene.swift
//  AstroMan
//
//  Created by Zachary Marvin on 12/26/16.
//  Copyright © 2016 Zachary Marvin. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

let defaults = UserDefaults()

var chooseShip = defaults.integer(forKey: "shipChosenSaved")

var goldSpent = defaults.integer(forKey: "goldSpentSaved")

var ship1Unlocked = defaults.integer(forKey: "ship1Unlocked")

var ship2Unlocked = defaults.integer(forKey: "ship2Unlocked")

var ship3Unlocked = defaults.integer(forKey: "ship3Unlocked")

var ship4Unlocked = defaults.integer(forKey: "ship4Unlocked")

var ship5Unlocked = defaults.integer(forKey: "ship5Unlocked")

var ship6Unlocked = defaults.integer(forKey: "ship6Unlocked")

class ChangeShipScene: SKScene{
    
    let buttonClickSound = SKAction.playSoundFileNamed("buttonClick.mp3", waitForCompletion: false)
    
    let mainMenuLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let mainMenuButton = SKSpriteNode(imageNamed: "blueButton")
    
    let changeShipColorLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let changeShipColorButton = SKSpriteNode(imageNamed: "blueButton")
    
    let playerShip1 = SKSpriteNode(imageNamed: "playerShip1")
    
    let playerShip1Glow = SKSpriteNode(imageNamed: "playerShip1Glow")
    
    let playerShip1Glass = SKSpriteNode(imageNamed: "glass")
    
    let playerShip2Locked = SKSpriteNode(imageNamed: "lockedImage")
    
    let playerShip2Lock = SKSpriteNode(imageNamed: "shipLock")
    
    let playerShip2 = SKSpriteNode(imageNamed: "playerShip2")
    
    let playerShip2Glow = SKSpriteNode(imageNamed: "playerShip2Glow")
    
    let playerShip2Glass = SKSpriteNode(imageNamed: "glass")
    
    let ship2Description = SKLabelNode(fontNamed: "spaceranger")
    
    let playerShip3Locked = SKSpriteNode(imageNamed: "lockedImage")
    
    let playerShip3Lock = SKSpriteNode(imageNamed: "shipLock")
    
    let playerShip3 = SKSpriteNode(imageNamed: "playerShip3")
    
    let playerShip3Glow = SKSpriteNode(imageNamed: "playerShip3Glow")
    
    let playerShip3Glass = SKSpriteNode(imageNamed: "glass")
    
    let ship3Description = SKLabelNode(fontNamed: "spaceranger")
    
    let playerShip4 = SKSpriteNode(imageNamed: "playerShip4")
    
    let playerShip4Glow = SKSpriteNode(imageNamed: "playerShip4Glow")
    
    let playerShip4Glass = SKSpriteNode(imageNamed: "glass")
    
    let playerShip4Locked = SKSpriteNode(imageNamed: "lockedImage")
    
    let playerShip4Lock = SKSpriteNode(imageNamed: "shipLock")
    
    let ship4Description = SKLabelNode(fontNamed: "spaceranger")
    
    let playerShip5 = SKSpriteNode(imageNamed: "playerShip5")
    
    let playerShip5Glow = SKSpriteNode(imageNamed: "playerShip5Glow")
    
    let playerShip5Glass = SKSpriteNode(imageNamed: "glass")
    
    let playerShip5Locked = SKSpriteNode(imageNamed: "lockedImage")
    
    let playerShip5Lock = SKSpriteNode(imageNamed: "shipLock")
    
    let ship5Description = SKLabelNode(fontNamed: "spaceranger")
    
    let playerShip6 = SKSpriteNode(imageNamed: "playerShip6")
    
    let playerShip6Glow = SKSpriteNode(imageNamed: "playerShip6Glow")
    
    let playerShip6Glass = SKSpriteNode(imageNamed: "glass")
    
    let playerShip6Lock = SKSpriteNode(imageNamed: "shipLock")
    
    let playerShip6Locked = SKSpriteNode(imageNamed: "lockedImage")
    
    let ship6Description = SKLabelNode(fontNamed: "spaceranger")
    
    let ship6Description2 = SKLabelNode(fontNamed: "spaceranger")
    
    let goldCoin = SKSpriteNode(imageNamed: "goldCoin")
    
    let goldCoin2 = SKSpriteNode(imageNamed: "goldCoin")
    
    let goldCost2 = SKLabelNode(fontNamed: "spaceranger")
    
    let goldCoin3 = SKSpriteNode(imageNamed: "goldCoin")
    
    let goldCost3 = SKLabelNode(fontNamed: "spaceranger")
    
    let goldCoin4 = SKSpriteNode(imageNamed: "goldCoin")
    
    let goldCost4 = SKLabelNode(fontNamed: "spaceranger")
    
    let goldCoin5 = SKSpriteNode(imageNamed: "goldCoin")
    
    let goldCost5 = SKLabelNode(fontNamed: "spaceranger")
    
    let goldCoin6 = SKSpriteNode(imageNamed: "goldCoin")
    
    let goldCost6 = SKLabelNode(fontNamed: "spaceranger")
    
    let goldCountLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let selectShipLabel = SKLabelNode(fontNamed: "spaceranger")
    
    override func didMove(to view: SKView) {
        
        goldCountLabel.text = "\(goldCount)"
        goldCountLabel.fontSize = 70
        goldCountLabel.fontColor = SKColor.white
        goldCountLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.96)
        goldCountLabel.zPosition = 1
        self.addChild(goldCountLabel)
        
        goldCoin.position.x = self.size.width*0.42
        goldCoin.position.y = self.size.height*0.969
        goldCoin.zPosition = 100
        goldCoin.setScale(0.5)
        self.addChild(goldCoin)
        
        selectShipLabel.text = "Select Ship"
        selectShipLabel.fontSize = 70
        selectShipLabel.fontColor = SKColor.white
        selectShipLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.867)
        selectShipLabel.zPosition = 1
        self.addChild(selectShipLabel)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.size = self.size
        background.zPosition = -10
        self.addChild(background)
        
        let backdrop = SKSpriteNode(imageNamed: "shipBackdrop")
        backdrop.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        backdrop.zPosition = -1
        backdrop.xScale = 0.8
        backdrop.yScale = 1.2
        self.addChild(backdrop)
        
        playerShip1.setScale(0.9)
        playerShip1.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.68)
        playerShip1.zPosition = 1
        self.addChild(playerShip1)
        
        playerShip2.setScale(1)
        playerShip2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.68)
        playerShip2.zPosition = 1
        self.addChild(playerShip2)
        ship2Description.text = "2x Fuel"
        ship2Description.fontSize = 40
        ship2Description.fontColor = SKColor.white
        ship2Description.position = CGPoint(x: playerShip2.position.x, y: playerShip2.position.y + 215)
        ship2Description.zPosition = 100
        self.addChild(ship2Description)
        
        if ship2Unlocked != 1{
            playerShip2Locked.xScale = 2.5
            playerShip2Locked.yScale = 4
            playerShip2Locked.position = playerShip2.position
            playerShip2Locked.zPosition = 2
            self.addChild(playerShip2Locked)
            playerShip2Lock.xScale = 2
            playerShip2Lock.yScale = 2
            playerShip2Lock.position = playerShip2.position
            playerShip2Lock.zPosition = 4
            self.addChild(playerShip2Lock)
            goldCoin2.position.x = playerShip2.position.x - 100
            goldCoin2.position.y = playerShip2.position.y - 250
            goldCoin2.zPosition = 100
            goldCoin2.setScale(0.5)
            self.addChild(goldCoin2)
            goldCost2.text = "50"
            goldCost2.fontSize = 70
            goldCost2.fontColor = SKColor.white
            goldCost2.position = CGPoint(x: playerShip2.position.x, y: playerShip2.position.y - 265)
            goldCost2.zPosition = 100
            self.addChild(goldCost2)
        }
        playerShip3.setScale(0.8)
        playerShip3.position = CGPoint(x: self.size.width*0.7, y: self.size.height*0.68)
        playerShip3.zPosition = 1
        self.addChild(playerShip3)
        ship3Description.text = "3x Fuel"
        ship3Description.fontSize = 40
        ship3Description.fontColor = SKColor.white
        ship3Description.position = CGPoint(x: playerShip3.position.x, y: playerShip3.position.y + 215)
        ship3Description.zPosition = 100
        self.addChild(ship3Description)
        
        if ship3Unlocked != 1{
            playerShip3Locked.xScale = 2.5
            playerShip3Locked.yScale = 4
            playerShip3Locked.position = playerShip3.position
            playerShip3Locked.zPosition = 2
            self.addChild(playerShip3Locked)
            playerShip3Lock.xScale = 2
            playerShip3Lock.yScale = 2
            playerShip3Lock.position = playerShip3.position
            playerShip3Lock.zPosition = 4
            self.addChild(playerShip3Lock)
            goldCoin3.position.x = playerShip3.position.x - 100
            goldCoin3.position.y = playerShip3.position.y - 250
            goldCoin3.zPosition = 100
            goldCoin3.setScale(0.5)
            self.addChild(goldCoin3)
            goldCost3.text = "100"
            goldCost3.fontSize = 70
            goldCost3.fontColor = SKColor.white
            goldCost3.position = CGPoint(x: playerShip3.position.x, y: playerShip3.position.y - 265)
            goldCost3.zPosition = 100
            self.addChild(goldCost3)
        }
        
        playerShip4.setScale(2)
        playerShip4.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.43)
        playerShip4.zPosition = 1
        self.addChild(playerShip4)
        ship4Description.text = "2x Speed"
        ship4Description.fontSize = 40
        ship4Description.fontColor = SKColor.white
        ship4Description.position = CGPoint(x: playerShip4.position.x, y: playerShip4.position.y + 143)
        ship4Description.zPosition = 100
        self.addChild(ship4Description)
        
        if ship4Unlocked != 1{
            playerShip4Locked.setScale(2.5)
            playerShip4Locked.position = playerShip4.position
            playerShip4Locked.zPosition = 2
            self.addChild(playerShip4Locked)
            playerShip4Lock.xScale = 2
            playerShip4Lock.yScale = 2
            playerShip4Lock.position = playerShip4.position
            playerShip4Lock.zPosition = 4
            self.addChild(playerShip4Lock)
            goldCoin4.position.x = playerShip4.position.x - 100
            goldCoin4.position.y = playerShip4.position.y - 170
            goldCoin4.zPosition = 100
            goldCoin4.setScale(0.5)
            self.addChild(goldCoin4)
            goldCost4.text = "75"
            goldCost4.fontSize = 70
            goldCost4.fontColor = SKColor.white
            goldCost4.position = CGPoint(x: playerShip4.position.x, y: playerShip4.position.y - 185)
            goldCost4.zPosition = 100
            self.addChild(goldCost4)
        }
        playerShip5.setScale(2)
        playerShip5.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.43)
        playerShip5.zPosition = 1
        self.addChild(playerShip5)
        ship5Description.text = "3x Speed"
        ship5Description.fontSize = 40
        ship5Description.fontColor = SKColor.white
        ship5Description.position = CGPoint(x: playerShip5.position.x, y: playerShip5.position.y + 143)
        ship5Description.zPosition = 100
        self.addChild(ship5Description)
        
        if ship5Unlocked != 1{
            playerShip5Locked.setScale(2.5)
            playerShip5Locked.position = playerShip5.position
            playerShip5Locked.zPosition = 2
            self.addChild(playerShip5Locked)
            playerShip5Lock.xScale = 2
            playerShip5Lock.yScale = 2
            playerShip5Lock.position = playerShip5.position
            playerShip5Lock.zPosition = 4
            self.addChild(playerShip5Lock)
            goldCoin5.position.x = playerShip5.position.x - 100
            goldCoin5.position.y = playerShip5.position.y - 170
            goldCoin5.zPosition = 100
            goldCoin5.setScale(0.5)
            self.addChild(goldCoin5)
            goldCost5.text = "125"
            goldCost5.fontSize = 70
            goldCost5.fontColor = SKColor.white
            goldCost5.position = CGPoint(x: playerShip5.position.x, y: playerShip5.position.y - 185)
            goldCost5.zPosition = 100
            self.addChild(goldCost5)
        }
        
        playerShip6.setScale(2)
        playerShip6.position = CGPoint(x: self.size.width*0.7, y: self.size.height*0.43)
        playerShip6.zPosition = 1
        self.addChild(playerShip6)
        ship6Description.text = "Max"
        ship6Description.fontSize = 40
        ship6Description.fontColor = SKColor.white
        ship6Description.position = CGPoint(x: playerShip6.position.x, y: playerShip6.position.y + 161)
        ship6Description.zPosition = 100
        self.addChild(ship6Description)
        ship6Description2.text = "Fuel & Speed"
        ship6Description2.fontSize = 40
        ship6Description2.fontColor = SKColor.white
        ship6Description2.position = CGPoint(x: playerShip6.position.x, y: playerShip6.position.y + 131)
        ship6Description2.zPosition = 100
        self.addChild(ship6Description2)
        
        if ship6Unlocked != 1{
            playerShip6Locked.setScale(2.5)
            playerShip6Locked.position = playerShip6.position
            playerShip6Locked.zPosition = 2
            self.addChild(playerShip6Locked)
            playerShip6Lock.xScale = 2
            playerShip6Lock.yScale = 2
            playerShip6Lock.position = playerShip6.position
            playerShip6Lock.zPosition = 4
            self.addChild(playerShip6Lock)
            goldCoin6.position.x = playerShip6.position.x - 100
            goldCoin6.position.y = playerShip6.position.y - 170
            goldCoin6.zPosition = 100
            goldCoin6.setScale(0.5)
            self.addChild(goldCoin6)
            goldCost6.text = "400"
            goldCost6.fontSize = 70
            goldCost6.fontColor = SKColor.white
            goldCost6.position = CGPoint(x: playerShip6.position.x + 10, y: playerShip6.position.y - 185)
            goldCost6.zPosition = 100
            self.addChild(goldCost6)
        }
        
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.fontSize = 90
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.08)
        mainMenuLabel.zPosition = 1
        self.addChild(mainMenuLabel)

        mainMenuButton.xScale = 1.07
        mainMenuButton.yScale = 0.4
        mainMenuButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.09)
        mainMenuButton.zPosition = 0
        self.addChild(mainMenuButton)
        
        changeShipColorLabel.text = "Change Color"
        changeShipColorLabel.fontSize = 90
        changeShipColorLabel.fontColor = SKColor.white
        changeShipColorLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.18)
        changeShipColorLabel.zPosition = 1
        self.addChild(changeShipColorLabel)
        
        changeShipColorButton.xScale = 1.07
        changeShipColorButton.yScale = 0.4
        changeShipColorButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.19)
        changeShipColorButton.zPosition = 0
        self.addChild(changeShipColorButton)
        
        playerShip1Glow.xScale = 1
        playerShip1Glow.yScale = 0.95
        playerShip1Glow.position = playerShip1.position
        playerShip1Glow.zPosition = 0
        if chooseShip == 1{
            self.addChild(playerShip1Glow)
        }
        
        playerShip2Glow.xScale = 1.1
        playerShip2Glow.yScale = 1.05
        playerShip2Glow.position = playerShip2.position
        playerShip2Glow.zPosition = 0
        if chooseShip == 2{
            self.addChild(playerShip2Glow)
        }

        playerShip3Glow.xScale = 0.9
        playerShip3Glow.yScale = 0.85
        playerShip3Glow.position = playerShip3.position
        playerShip3Glow.zPosition = 0
        if chooseShip == 3{
            self.addChild(playerShip3Glow)
        }
        
        playerShip4Glow.xScale = 2.1
        playerShip4Glow.yScale = 2.3
        playerShip4Glow.position = playerShip4.position
        playerShip4Glow.zPosition = 0
        if chooseShip == 4{
            self.addChild(playerShip4Glow)
        }
        
        playerShip5Glow.xScale = 2.1
        playerShip5Glow.yScale = 2.3
        playerShip5Glow.position = playerShip5.position
        playerShip5Glow.zPosition = 0
        if chooseShip == 5{
            self.addChild(playerShip5Glow)
        }
        
        playerShip6Glow.xScale = 2.1
        playerShip6Glow.yScale = 2.3
        playerShip6Glow.position = playerShip6.position
        playerShip6Glow.zPosition = 0
        if chooseShip == 6{
            self.addChild(playerShip6Glow)
        }
        
        playerShip1Glass.xScale = 2.5
        playerShip1Glass.yScale = 4
        playerShip1Glass.position = playerShip1.position
        playerShip1Glass.zPosition = 3
        self.addChild(playerShip1Glass)

        
        playerShip2Glass.xScale = 2.5
        playerShip2Glass.yScale = 4
        playerShip2Glass.position = playerShip2.position
        playerShip2Glass.zPosition = 3
        self.addChild(playerShip2Glass)

        
        playerShip3Glass.xScale = 2.5
        playerShip3Glass.yScale = 4
        playerShip3Glass.position = playerShip3.position
        playerShip3Glass.zPosition = 3
        self.addChild(playerShip3Glass)
        
        playerShip4Glass.xScale = 2.5
        playerShip4Glass.yScale = 2.5
        playerShip4Glass.position = playerShip4.position
        playerShip4Glass.zPosition = 3
        self.addChild(playerShip4Glass)
        
        playerShip5Glass.xScale = 2.5
        playerShip5Glass.yScale = 2.5
        playerShip5Glass.position = playerShip5.position
        playerShip5Glass.zPosition = 3
        self.addChild(playerShip5Glass)
        
        playerShip6Glass.xScale = 2.5
        playerShip6Glass.yScale = 2.5
        playerShip6Glass.position = playerShip6.position
        playerShip6Glass.zPosition = 3
        self.addChild(playerShip6Glass)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)  //You have to manually add in:
            let nodeITapped = atPoint(pointOfTouch)  //any object we touch will be set to node I tapped
            
            if nodeITapped == mainMenuLabel || nodeITapped == mainMenuButton{  //references startButton and runs any code below if this is the node tapped
                
                nodeITapped.run(buttonClickSound)
                let scaleDownButton = SKAction.scaleX(to: 1.02, y: 0.35, duration: 0.03)
                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                mainMenuLabel.run(scaleDownText)
                mainMenuButton.run(scaleDownButton)
            }
            
            if nodeITapped == changeShipColorLabel || nodeITapped == changeShipColorButton{  //references startButton and runs any code below if this is the node tapped
                
                nodeITapped.run(buttonClickSound)
                let scaleDownButton = SKAction.scaleX(to: 1.02, y: 0.35, duration: 0.03)
                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                changeShipColorLabel.run(scaleDownText)
                changeShipColorButton.run(scaleDownButton)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {  //All this is information is used to restart the game
        
        for touch: AnyObject in touches{  //This areas pulls all information for where we touched
            
            let pointOfTouch = touch.location(in: self)  //Take the coordinates of where we touched and set this to point of touch
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped != mainMenuLabel || nodeITapped != mainMenuButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                mainMenuLabel.run(scaleUpText)
                mainMenuButton.run(scaleUpButton)
            }
            
            if nodeITapped != changeShipColorLabel || nodeITapped != changeShipColorButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                changeShipColorLabel.run(scaleUpText)
                changeShipColorButton.run(scaleUpButton)
            }
            
            if mainMenuLabel.contains(pointOfTouch) || mainMenuButton.contains(pointOfTouch){
                let sceneToMoveTo = MainMenuScene(size: self.size)
                mainMenuLabel.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.1)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            if changeShipColorLabel.contains(pointOfTouch) || changeShipColorButton.contains(pointOfTouch){
                let sceneToMoveTo = ChangeShipColorScene(size: self.size)
                changeShipColorLabel.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.1)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            if playerShip1Glass.contains(pointOfTouch)  &&  chooseShip != 1{
                playerShip1.run(buttonClickSound)
                chooseShip = 1
                defaults.set(chooseShip, forKey: "shipChosenSaved")
                defaults.synchronize()
                self.addChild(playerShip1Glow)
                playerShip2Glow.removeFromParent()
                playerShip3Glow.removeFromParent()
                playerShip4Glow.removeFromParent()
                playerShip5Glow.removeFromParent()
                playerShip6Glow.removeFromParent()
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            
            if playerShip2Glass.contains(pointOfTouch) && goldCount >= 50  &&  chooseShip != 2  &&  ship2Unlocked != 1{
                    goldSpent += 50
                    defaults.set(goldSpent, forKey: "goldSpentSaved")
                    goldCount -= 50
                    ship2Unlocked = 1
                    defaults.set(ship2Unlocked, forKey: "ship2Unlocked")
                    
                    defaults.synchronize()
                    playerShip2Locked.removeFromParent()
                    playerShip2Lock.removeFromParent()
                    goldCoin2.removeFromParent()
                    goldCost2.removeFromParent()
            }
            if playerShip2Glass.contains(pointOfTouch) && chooseShip != 2 && ship2Unlocked == 1{
                playerShip2.run(buttonClickSound)
                chooseShip = 2
                defaults.set(chooseShip, forKey: "shipChosenSaved")
                defaults.synchronize()
                self.addChild(playerShip2Glow)
                playerShip1Glow.removeFromParent()
                playerShip3Glow.removeFromParent()
                playerShip4Glow.removeFromParent()
                playerShip5Glow.removeFromParent()
                playerShip6Glow.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            
            if playerShip3Glass.contains(pointOfTouch) && goldCount >= 100  &&  chooseShip != 3  &&  ship3Unlocked != 1{
                    goldSpent += 100
                    defaults.set(goldSpent, forKey: "goldSpentSaved")
                    goldCount -= 100
                    ship3Unlocked = 1
                    defaults.set(ship3Unlocked, forKey: "ship3Unlocked")
                    
                    defaults.synchronize()
                    playerShip3Locked.removeFromParent()
                    playerShip3Lock.removeFromParent()
                    goldCoin3.removeFromParent()
                    goldCost3.removeFromParent()
                    
            }
            if playerShip3Glass.contains(pointOfTouch) && chooseShip != 3 && ship3Unlocked == 1{
                playerShip3.run(buttonClickSound)
                chooseShip = 3
                defaults.set(chooseShip, forKey: "shipChosenSaved")
                defaults.synchronize()
                self.addChild(playerShip3Glow)
                playerShip1Glow.removeFromParent()
                playerShip2Glow.removeFromParent()
                playerShip4Glow.removeFromParent()
                playerShip5Glow.removeFromParent()
                playerShip6Glow.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            
            if playerShip4Glass.contains(pointOfTouch) && goldCount >= 75  &&  chooseShip != 4  &&  ship4Unlocked != 1{
                    goldSpent += 75
                    defaults.set(goldSpent, forKey: "goldSpentSaved")
                    goldCount -= 75
                    ship4Unlocked = 1
                    defaults.set(ship4Unlocked, forKey: "ship4Unlocked")
                    
                    defaults.synchronize()
                    playerShip4Locked.removeFromParent()
                    playerShip4Lock.removeFromParent()
                    goldCoin4.removeFromParent()
                    goldCost4.removeFromParent()
            }
            if playerShip4Glass.contains(pointOfTouch) && chooseShip != 4 && ship4Unlocked == 1{
                playerShip4.run(buttonClickSound)
                chooseShip = 4
                defaults.set(chooseShip, forKey: "shipChosenSaved")
                defaults.synchronize()
                self.addChild(playerShip4Glow)
                playerShip1Glow.removeFromParent()
                playerShip2Glow.removeFromParent()
                playerShip3Glow.removeFromParent()
                playerShip5Glow.removeFromParent()
                playerShip6Glow.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            
            if playerShip5Glass.contains(pointOfTouch) && goldCount >= 125  &&  chooseShip != 5  &&  ship5Unlocked != 1{
                    goldSpent += 125
                    defaults.set(goldSpent, forKey: "goldSpentSaved")
                    goldCount -= 125
                    ship5Unlocked = 1
                    defaults.set(ship5Unlocked, forKey: "ship5Unlocked")
                    
                    defaults.synchronize()
                    playerShip5Locked.removeFromParent()
                    playerShip5Lock.removeFromParent()
                    goldCoin5.removeFromParent()
                    goldCost5.removeFromParent()
                    
                }
            if playerShip5Glass.contains(pointOfTouch) && chooseShip != 5 && ship5Unlocked == 1{
                playerShip5.run(buttonClickSound)
                chooseShip = 5
                defaults.set(chooseShip, forKey: "shipChosenSaved")
                defaults.synchronize()
                self.addChild(playerShip5Glow)
                playerShip1Glow.removeFromParent()
                playerShip2Glow.removeFromParent()
                playerShip3Glow.removeFromParent()
                playerShip4Glow.removeFromParent()
                playerShip6Glow.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            
            if playerShip6Glass.contains(pointOfTouch) && goldCount >= 400  &&  chooseShip != 6  &&  ship6Unlocked != 1{
                    goldSpent += 400
                    defaults.set(goldSpent, forKey: "goldSpentSaved")
                    goldCount -= 400
                    ship6Unlocked = 1
                    defaults.set(ship6Unlocked, forKey: "ship6Unlocked")
                    
                    defaults.synchronize()
                    playerShip6Locked.removeFromParent()
                    playerShip6Lock.removeFromParent()
                    goldCoin6.removeFromParent()
                    goldCost6.removeFromParent()
                    
            }
            
            if playerShip6Glass.contains(pointOfTouch) && chooseShip != 6 && ship6Unlocked == 1{
                playerShip6.run(buttonClickSound)
                chooseShip = 6
                defaults.set(chooseShip, forKey: "shipChosenSaved")
                defaults.synchronize()
                self.addChild(playerShip6Glow)
                playerShip1Glow.removeFromParent()
                playerShip2Glow.removeFromParent()
                playerShip3Glow.removeFromParent()
                playerShip4Glow.removeFromParent()
                playerShip5Glow.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            
        }
        
    }

}
