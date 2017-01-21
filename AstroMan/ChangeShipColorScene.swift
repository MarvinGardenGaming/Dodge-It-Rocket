//
//  ChangeShipColorScene.swift
//  AstroMan
//
//  Created by Zachary Marvin on 1/3/17.
//  Copyright © 2017 Zachary Marvin. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var chooseColor = defaults.integer(forKey: "shipColorSaved")

var blueUnlocked = defaults.integer(forKey: "blueUnlocked")

var yellowUnlocked = defaults.integer(forKey: "yellowUnlocked")

var greenUnlocked = defaults.integer(forKey: "greenUnlocked")

var orangeUnlocked = defaults.integer(forKey: "orangeUnlocked")

var pinkUnlocked = defaults.integer(forKey: "pinkUnlocked")


class ChangeShipColorScene: SKScene{
    
    let changeShipLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let changeShipButton = SKSpriteNode(imageNamed: "blueButton")
    
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
    
    let selectColorLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let buttonClickSound = SKAction.playSoundFileNamed("buttonClick.mp3", waitForCompletion: false)
    
    let mainMenuLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let mainMenuButton = SKSpriteNode(imageNamed: "blueButton")
    
    let blueLock = SKSpriteNode(imageNamed: "shipLock")
    
    let yellowLock = SKSpriteNode(imageNamed: "shipLock")
    
    let greenLock = SKSpriteNode(imageNamed: "shipLock")
    
    let orangeLock = SKSpriteNode(imageNamed: "shipLock")
    
    let pinkLock = SKSpriteNode(imageNamed: "shipLock")
    
    let selectedBackdrop = SKSpriteNode(imageNamed: "colorBackdropGlow")
    
    let redBackdrop = SKSpriteNode(imageNamed: "colorBackdrop")
    
    let blueBackdrop = SKSpriteNode(imageNamed: "colorBackdrop")
    
    let yellowBackdrop = SKSpriteNode(imageNamed: "colorBackdrop")
    
    let greenBackdrop = SKSpriteNode(imageNamed: "colorBackdrop")
    
    let orangeBackdrop = SKSpriteNode(imageNamed: "colorBackdrop")
    
    let pinkBackdrop = SKSpriteNode(imageNamed: "colorBackdrop")
    
    let goldCountLabel = SKLabelNode(fontNamed: "spaceranger")
    
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
        
        selectColorLabel.text = "Select Color"
        selectColorLabel.fontSize = 70
        selectColorLabel.fontColor = SKColor.white
        selectColorLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.867)
        selectColorLabel.zPosition = 1
        self.addChild(selectColorLabel)
        
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
        
        redBackdrop.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.73)
        redBackdrop.zPosition = 1
        redBackdrop.setScale(1.4)
        self.addChild(redBackdrop)
        
        let redExample = SKSpriteNode(imageNamed: "redColor")
        redExample.position = redBackdrop.position
        redExample.zPosition = 2
        redExample.setScale(1.6)
        self.addChild(redExample)
        
        blueBackdrop.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.73)
        blueBackdrop.zPosition = 1
        blueBackdrop.setScale(1.4)
        self.addChild(blueBackdrop)
        
        let blueExample = SKSpriteNode(imageNamed: "blueColor")
        blueExample.position = blueBackdrop.position
        blueExample.zPosition = 2
        blueExample.setScale(1.6)
        self.addChild(blueExample)
        
        if blueUnlocked != 1{
            goldCoin2.position.x = blueExample.position.x - 80
            goldCoin2.position.y = blueExample.position.y - 165
            goldCoin2.zPosition = 100
            goldCoin2.setScale(0.5)
            self.addChild(goldCoin2)
            goldCost2.text = "50"
            goldCost2.fontSize = 70
            goldCost2.fontColor = SKColor.white
            goldCost2.position = CGPoint(x: blueExample.position.x + 20, y: blueExample.position.y - 180)
            goldCost2.zPosition = 100
            self.addChild(goldCost2)
            blueLock.xScale = 1.8
            blueLock.yScale = 1.8
            blueLock.position = blueExample.position
            blueLock.zPosition = 4
            self.addChild(blueLock)
        }
        
        yellowBackdrop.position = CGPoint(x: self.size.width*0.7, y: self.size.height*0.73)
        yellowBackdrop.zPosition = 1
        yellowBackdrop.setScale(1.4)
        self.addChild(yellowBackdrop)
        
        let yellowExample = SKSpriteNode(imageNamed: "yellowColor")
        yellowExample.position = yellowBackdrop.position
        yellowExample.zPosition = 2
        yellowExample.setScale(1.6)
        self.addChild(yellowExample)
        
        if yellowUnlocked != 1{
            goldCoin3.position.x = yellowExample.position.x - 80
            goldCoin3.position.y = yellowExample.position.y - 165
            goldCoin3.zPosition = 100
            goldCoin3.setScale(0.5)
            self.addChild(goldCoin3)
            goldCost3.text = "50"
            goldCost3.fontSize = 70
            goldCost3.fontColor = SKColor.white
            goldCost3.position = CGPoint(x: yellowExample.position.x + 20, y: yellowExample.position.y - 180)
            goldCost3.zPosition = 100
            self.addChild(goldCost3)
            yellowLock.xScale = 1.8
            yellowLock.yScale = 1.8
            yellowLock.position = yellowExample.position
            yellowLock.zPosition = 4
            self.addChild(yellowLock)
        }
        
        greenBackdrop.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.5)
        greenBackdrop.zPosition = 1
        greenBackdrop.setScale(1.4)
        self.addChild(greenBackdrop)
        
        let greenExample = SKSpriteNode(imageNamed: "greenColor")
        greenExample.position = greenBackdrop.position
        greenExample.zPosition = 2
        greenExample.setScale(1.6)
        self.addChild(greenExample)
        
        if greenUnlocked != 1{
            goldCoin4.position.x = greenExample.position.x - 80
            goldCoin4.position.y = greenExample.position.y - 165
            goldCoin4.zPosition = 100
            goldCoin4.setScale(0.5)
            self.addChild(goldCoin4)
            goldCost4.text = "50"
            goldCost4.fontSize = 70
            goldCost4.fontColor = SKColor.white
            goldCost4.position = CGPoint(x: greenExample.position.x + 20, y: greenExample.position.y - 180)
            goldCost4.zPosition = 100
            self.addChild(goldCost4)
            greenLock.xScale = 1.8
            greenLock.yScale = 1.8
            greenLock.position = greenExample.position
            greenLock.zPosition = 4
            self.addChild(greenLock)
        }
        
        orangeBackdrop.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        orangeBackdrop.zPosition = 1
        orangeBackdrop.setScale(1.4)
        self.addChild(orangeBackdrop)
        
        let orangeExample = SKSpriteNode(imageNamed: "orangeColor")
        orangeExample.position = orangeBackdrop.position
        orangeExample.zPosition = 2
        orangeExample.setScale(1.6)
        self.addChild(orangeExample)
        
        if orangeUnlocked != 1{
            goldCoin5.position.x = orangeExample.position.x - 80
            goldCoin5.position.y = orangeExample.position.y - 165
            goldCoin5.zPosition = 100
            goldCoin5.setScale(0.5)
            self.addChild(goldCoin5)
            goldCost5.text = "50"
            goldCost5.fontSize = 70
            goldCost5.fontColor = SKColor.white
            goldCost5.position = CGPoint(x: orangeExample.position.x + 20, y: orangeExample.position.y - 180)
            goldCost5.zPosition = 100
            self.addChild(goldCost5)
            orangeLock.xScale = 1.8
            orangeLock.yScale = 1.8
            orangeLock.position = orangeExample.position
            orangeLock.zPosition = 4
            self.addChild(orangeLock)
        }
        
        pinkBackdrop.position = CGPoint(x: self.size.width*0.7, y: self.size.height*0.5)
        pinkBackdrop.zPosition = 1
        pinkBackdrop.setScale(1.4)
        self.addChild(pinkBackdrop)
        
        let pinkExample = SKSpriteNode(imageNamed: "pinkColor")
        pinkExample.position = pinkBackdrop.position
        pinkExample.zPosition = 2
        pinkExample.setScale(1.6)
        self.addChild(pinkExample)
        
        if pinkUnlocked != 1{
            goldCoin6.position.x = pinkExample.position.x - 80
            goldCoin6.position.y = pinkExample.position.y - 165
            goldCoin6.zPosition = 100
            goldCoin6.setScale(0.5)
            self.addChild(goldCoin6)
            goldCost6.text = "50"
            goldCost6.fontSize = 70
            goldCost6.fontColor = SKColor.white
            goldCost6.position = CGPoint(x: pinkExample.position.x + 20, y: pinkExample.position.y - 180)
            goldCost6.zPosition = 100
            self.addChild(goldCost6)
            pinkLock.xScale = 1.8
            pinkLock.yScale = 1.8
            pinkLock.position = pinkExample.position
            pinkLock.zPosition = 4
            self.addChild(pinkLock)
        }
        
        selectedBackdrop.setScale(1.5)
        selectedBackdrop.zPosition = 0
        self.addChild(selectedBackdrop)
        
        if chooseColor == 1{
            selectedBackdrop.position = redBackdrop.position
        }
        
        if chooseColor == 2{
            selectedBackdrop.position = blueBackdrop.position
        }
        
        if chooseColor == 3{
            selectedBackdrop.position = yellowBackdrop.position
        }
        
        if chooseColor == 4{
            selectedBackdrop.position = greenBackdrop.position
        }
        
        if chooseColor == 5{
            selectedBackdrop.position = orangeBackdrop.position
        }
        
        if chooseColor == 6{
            selectedBackdrop.position = pinkBackdrop.position
        }
        
        changeShipLabel.text = "Change Ship"
        changeShipLabel.fontSize = 90
        changeShipLabel.fontColor = SKColor.white
        changeShipLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.18)
        changeShipLabel.zPosition = 1
        self.addChild(changeShipLabel)
        
        changeShipButton.xScale = 1.07
        changeShipButton.yScale = 0.4
        changeShipButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.19)
        changeShipButton.zPosition = 0
        self.addChild(changeShipButton)
        
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
            
            if nodeITapped == changeShipLabel || nodeITapped == changeShipButton{  //references startButton and runs any code below if this is the node tapped
                
                nodeITapped.run(buttonClickSound)
                let scaleDownButton = SKAction.scaleX(to: 1.02, y: 0.35, duration: 0.03)
                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                changeShipLabel.run(scaleDownText)
                changeShipButton.run(scaleDownButton)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {  //All this is information is used to restart the game
        
        for touch: AnyObject in touches{  //This areas pulls all information for where we touched
            
            
            let pointOfTouch = touch.location(in: self)  //You have to manually add in:
            let nodeITapped = atPoint(pointOfTouch)  //any object we touch will be set to node I tapped
            
            if nodeITapped != mainMenuLabel && nodeITapped != mainMenuButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                mainMenuLabel.run(scaleUpText)
                mainMenuButton.run(scaleUpButton)
            }
            
            if nodeITapped != changeShipLabel && nodeITapped != changeShipButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                changeShipLabel.run(scaleUpText)
                changeShipButton.run(scaleUpButton)
            }
            
            if nodeITapped == mainMenuLabel || nodeITapped == mainMenuButton{
                let sceneToMoveTo = MainMenuScene(size: self.size)
                mainMenuLabel.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.1)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            if nodeITapped == changeShipLabel || nodeITapped == changeShipButton{
                let sceneToMoveTo = ChangeShipScene(size: self.size)
                changeShipLabel.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.1)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            if redBackdrop.contains(pointOfTouch)  &&  chooseColor != 1{
                redBackdrop.run(buttonClickSound)
                chooseColor = 1
                defaults.set(chooseColor, forKey: "shipColorSaved")
                defaults.synchronize()
                defaults.set(goldCount, forKey: "goldCountSaved")
                defaults.synchronize()
                selectedBackdrop.position = redBackdrop.position
            }
            if blueBackdrop.contains(pointOfTouch) && goldCount >= 50  &&  blueUnlocked != 1{
                goldSpent += 50
                defaults.set(goldSpent, forKey: "goldSpentSaved")
                goldCount -= 50
                blueUnlocked = 1
                defaults.set(blueUnlocked, forKey: "blueUnlocked")
                defaults.synchronize()
                blueLock.removeFromParent()
                goldCoin2.removeFromParent()
                goldCost2.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            if blueBackdrop.contains(pointOfTouch) && chooseColor != 2 && blueUnlocked == 1{
                blueBackdrop.run(buttonClickSound)
                chooseColor = 2
                defaults.set(chooseColor, forKey: "shipColorSaved")
                defaults.synchronize()
                selectedBackdrop.position = blueBackdrop.position
            }
            
            if yellowBackdrop.contains(pointOfTouch) && goldCount >= 50  &&  yellowUnlocked != 1{
                goldSpent += 50
                defaults.set(goldSpent, forKey: "goldSpentSaved")
                goldCount -= 50
                yellowUnlocked = 1
                defaults.set(yellowUnlocked, forKey: "yellowUnlocked")
                defaults.synchronize()
                yellowLock.removeFromParent()
                goldCoin3.removeFromParent()
                goldCost3.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            if yellowBackdrop.contains(pointOfTouch) && chooseColor != 3 && yellowUnlocked == 1{
                yellowBackdrop.run(buttonClickSound)
                chooseColor = 3
                defaults.set(chooseColor, forKey: "shipColorSaved")
                defaults.synchronize()
                selectedBackdrop.position = yellowBackdrop.position
            }
            
            if greenBackdrop.contains(pointOfTouch) && goldCount >= 50  &&  greenUnlocked != 1{
                goldSpent += 50
                defaults.set(goldSpent, forKey: "goldSpentSaved")
                goldCount -= 50
                greenUnlocked = 1
                defaults.set(greenUnlocked, forKey: "greenUnlocked")
                defaults.synchronize()
                greenLock.removeFromParent()
                goldCoin4.removeFromParent()
                goldCost4.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            if greenBackdrop.contains(pointOfTouch) && chooseColor != 4 && greenUnlocked == 1{
                greenBackdrop.run(buttonClickSound)
                chooseColor = 4
                defaults.set(chooseColor, forKey: "shipColorSaved")
                defaults.synchronize()
                selectedBackdrop.position = greenBackdrop.position
            }
            
            if orangeBackdrop.contains(pointOfTouch) && goldCount >= 50  &&  orangeUnlocked != 1{
                goldSpent += 50
                defaults.set(goldSpent, forKey: "goldSpentSaved")
                goldCount -= 50
                orangeUnlocked = 1
                defaults.set(orangeUnlocked, forKey: "orangeUnlocked")
                defaults.synchronize()
                orangeLock.removeFromParent()
                goldCoin5.removeFromParent()
                goldCost5.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            if orangeBackdrop.contains(pointOfTouch) && chooseColor != 5 && orangeUnlocked == 1{
                orangeBackdrop.run(buttonClickSound)
                chooseColor = 5
                defaults.set(chooseColor, forKey: "shipColorSaved")
                defaults.synchronize()
                selectedBackdrop.position = orangeBackdrop.position
            }
            
            if pinkBackdrop.contains(pointOfTouch) && goldCount >= 50  &&  pinkUnlocked != 1{
                goldSpent += 50
                defaults.set(goldSpent, forKey: "goldSpentSaved")
                goldCount -= 50
                pinkUnlocked = 1
                defaults.set(pinkUnlocked, forKey: "pinkUnlocked")
                defaults.synchronize()
                pinkLock.removeFromParent()
                goldCoin6.removeFromParent()
                goldCost6.removeFromParent()
                goldCountLabel.text = "\(goldCount)"
                defaults.set(goldCount, forKey: "goldCountSaved")
                
                defaults.synchronize()
            }
            if pinkBackdrop.contains(pointOfTouch) && chooseColor != 6 && pinkUnlocked == 1{
                pinkBackdrop.run(buttonClickSound)
                chooseColor = 6
                defaults.set(chooseColor, forKey: "shipColorSaved")
                defaults.synchronize()
                selectedBackdrop.position = pinkBackdrop.position
            }
            
        }
    }
    
}
