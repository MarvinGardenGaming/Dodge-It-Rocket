//
//  OtherScene.swift
//  AstroMan
//
//  Created by Zachary Marvin on 1/8/17.
//  Copyright © 2017 Zachary Marvin. All rights reserved.
//

import Foundation
import SpriteKit

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class OtherScene: SKScene{
    
    let buttonClickSound = SKAction.playSoundFileNamed("buttonClick.mp3", waitForCompletion: false)
    
    let mainMenuLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let mainMenuButton = SKSpriteNode(imageNamed: "blueButton")
    
    let creditsLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let creditsButton = SKSpriteNode(imageNamed: "blueButton")
    
    let creditsLine1 = SKLabelNode(fontNamed: "spaceranger")
    
    let creditsLine2 = SKLabelNode(fontNamed: "spaceranger")
    
    let creditsLine3 = SKLabelNode(fontNamed: "spaceranger")
    
    let creditsLine4 = SKLabelNode(fontNamed: "spaceranger")
    
    let creditsLine5 = SKLabelNode(fontNamed: "spaceranger")
    
    let creditsLine6 = SKLabelNode(fontNamed: "spaceranger")
    
//    let rateLabel = SKLabelNode(fontNamed: "spaceranger")
//    
//    let rateButton = SKSpriteNode(imageNamed: "blueButton")
    
    let controlLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let controlButton = SKSpriteNode(imageNamed: "blueButton")
    
    let controlCheckGlass = SKSpriteNode(imageNamed: "glass")
    
    let controlCheckmark = SKSpriteNode(imageNamed: "checkmark")
    
    let statLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let highscoreLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let totalRuns = SKLabelNode(fontNamed: "spaceranger")
    
    let averageScoreLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let totalGoldCountLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let totalGoldSpentLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let averageGoldLabel = SKLabelNode(fontNamed: "spaceranger")
    
    var averageScore = 0.0
    
    var averageGold = 0.0
    
    var statOrCredit = 0
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.size = self.size
        background.zPosition = -10
        self.addChild(background)
        
        let backdrop = SKSpriteNode(imageNamed: "shipBackdrop")
        backdrop.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        backdrop.zPosition = -1
        backdrop.xScale = 0.8
        backdrop.yScale = 0.8
        self.addChild(backdrop)
        
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.fontSize = 90
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.36)
        mainMenuLabel.zPosition = 1
        self.addChild(mainMenuLabel)
        
        mainMenuButton.xScale = 1.07
        mainMenuButton.yScale = 0.4
        mainMenuButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.37)
        mainMenuButton.zPosition = 0
        self.addChild(mainMenuButton)
        
        creditsLabel.text = "Credits"
        creditsLabel.fontSize = 90
        creditsLabel.fontColor = SKColor.white
        creditsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.26)
        creditsLabel.zPosition = 1
        self.addChild(creditsLabel)
        
        creditsButton.xScale = 1.07
        creditsButton.yScale = 0.4
        creditsButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.27)
        creditsButton.zPosition = 0
        self.addChild(creditsButton)
        
        creditsLine1.text = "i would like to give"
        creditsLine1.fontSize = 50
        creditsLine1.fontColor = SKColor.white
        creditsLine1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        creditsLine1.zPosition = 1
        
        creditsLine2.text = "a special thanks to"
        creditsLine2.fontSize = 50
        creditsLine2.fontColor = SKColor.white
        creditsLine2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        creditsLine2.zPosition = 1

        creditsLine3.text = "www.kenney.nl for some"
        creditsLine3.fontSize = 50
        creditsLine3.fontColor = SKColor.white
        creditsLine3.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        creditsLine3.zPosition = 1

        creditsLine4.text = "of the graphics in this"
        creditsLine4.fontSize = 50
        creditsLine4.fontColor = SKColor.white
        creditsLine4.position = CGPoint(x: self.size.width/2, y: self.size.height*0.65)
        creditsLine4.zPosition = 1

        creditsLine5.text = "game and to my wife for"
        creditsLine5.fontSize = 50
        creditsLine5.fontColor = SKColor.white
        creditsLine5.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        creditsLine5.zPosition = 1

        creditsLine6.text = "supporting me during this process"
        creditsLine6.fontSize = 50
        creditsLine6.fontColor = SKColor.white
        creditsLine6.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        creditsLine6.zPosition = 1
        
//        rateLabel.text = "Rate This App"
//        rateLabel.fontSize = 90
//        rateLabel.fontColor = SKColor.white
//        rateLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.36)
//        rateLabel.zPosition = 1
//        self.addChild(rateLabel)
//        
//        rateButton.xScale = 1.07
//        rateButton.yScale = 0.4
//        rateButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.37)
//        rateButton.zPosition = 0
//        self.addChild(rateButton)
        
        controlLabel.text = "inverted Controls:"
        controlLabel.fontSize = 70
        controlLabel.fontColor = SKColor.white
        controlLabel.position = CGPoint(x: self.size.width*0.45, y: self.size.height*0.16)
        controlLabel.zPosition = 1
        self.addChild(controlLabel)
        
        controlButton.xScale = 1.07
        controlButton.yScale = 0.4
        controlButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.17)
        controlButton.zPosition = 0
        self.addChild(controlButton)
        
        controlCheckGlass.xScale = 1
        controlCheckGlass.yScale = 1
        controlCheckGlass.position = CGPoint(x: self.size.width*0.75, y: self.size.height*0.168)
        controlCheckGlass.zPosition = 2
        self.addChild(controlCheckGlass)
        
        controlCheckmark.xScale = 1.2
        controlCheckmark.yScale = 1.2
        controlCheckmark.position = CGPoint(x: self.size.width*0.75, y: self.size.height*0.168)
        controlCheckmark.zPosition = 3
        if invertedControl == 1{
            self.addChild(controlCheckmark)
        }
        
        statLabel.text = "Stats"
        statLabel.fontSize = 120
        statLabel.fontColor = SKColor.white
        statLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.872)
        statLabel.zPosition = 1
        self.addChild(statLabel)
        
        highscoreLabel.text = "High Score: \(highScoreNumber)"
        highscoreLabel.fontSize = 60
        highscoreLabel.fontColor = SKColor.white
        highscoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        self.addChild(highscoreLabel)
        
        totalRuns.text = "Times Played: \(timesPlayed)"
        totalRuns.fontSize = 60
        totalRuns.fontColor = SKColor.white
        totalRuns.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        self.addChild(totalRuns)
        
        if totalDistanceTraveled == 0 || timesPlayed == 0{
            averageScore = 0
        }
        if totalDistanceTraveled != 0 && timesPlayed != 0{
        averageScore = Double(totalDistanceTraveled) / Double(timesPlayed)
        }
        
        averageScoreLabel.text = "Average Score: \(averageScore.roundTo(places: 2))"
        averageScoreLabel.fontSize = 60
        averageScoreLabel.fontColor = SKColor.white
        averageScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        self.addChild(averageScoreLabel)
        
        totalGoldCountLabel.text = "Total Gold Earned: \(totalGoldCount)"
        totalGoldCountLabel.fontSize = 60
        totalGoldCountLabel.fontColor = SKColor.white
        totalGoldCountLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        self.addChild(totalGoldCountLabel)
        
        totalGoldSpentLabel.text = "Total Gold Spent: \(goldSpent)"
        totalGoldSpentLabel.fontSize = 60
        totalGoldSpentLabel.fontColor = SKColor.white
        totalGoldSpentLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.65)
        self.addChild(totalGoldSpentLabel)
        
        if totalGoldCount == 0 || timesPlayed == 0{
            averageGold = 0
        }
        if totalGoldCount != 0 && timesPlayed != 0{
            averageGold = Double(totalGoldCount) / Double(timesPlayed)
        }
        
        averageGoldLabel.text = "Average Gold Earned: \(averageGold.roundTo(places: 2))"
        averageGoldLabel.fontSize = 60
        averageGoldLabel.fontColor = SKColor.white
        averageGoldLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        self.addChild(averageGoldLabel)
        
        
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
            
            if nodeITapped == creditsLabel || nodeITapped == creditsButton{  //references startButton and runs any code below if this is the node tapped
                
                nodeITapped.run(buttonClickSound)
                let scaleDownButton = SKAction.scaleX(to: 1.02, y: 0.35, duration: 0.03)
                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                creditsLabel.run(scaleDownText)
                creditsButton.run(scaleDownButton)
            }
            
//            if nodeITapped == rateLabel || nodeITapped == rateButton{  //references startButton and runs any code below if this is the node tapped
//                
//                let scaleDownButton = SKAction.scaleX(to: 1.02, y: 0.35, duration: 0.03)
//                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
//                rateLabel.run(scaleDownText)
//                rateButton.run(scaleDownButton)
//                nodeITapped.run(buttonClickSound)
//            }
            
            if nodeITapped == controlLabel || nodeITapped == controlButton{  //references startButton and runs any code below if this is the node tapped
                
                nodeITapped.run(buttonClickSound)
                let scaleDownButton = SKAction.scaleX(to: 1.02, y: 0.35, duration: 0.03)
                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                let scaleDownCheckGlass = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                let scaleDownCheckmark = SKAction.scaleX(to: 1.05, y: 1.05, duration: 0.03)
                let moveCheckMarkLeft = SKAction.moveBy(x: -50, y: 0, duration: 0.03)
                
                controlLabel.run(scaleDownText)
                controlButton.run(scaleDownButton)
                controlCheckGlass.run(scaleDownCheckGlass)
                controlCheckmark.run(scaleDownCheckmark)
                controlCheckmark.run(moveCheckMarkLeft)
                controlCheckGlass.run(moveCheckMarkLeft)
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {  //All this is information is used to restart the game
        
        for touch: AnyObject in touches{  //This areas pulls all information for where we touched
            
            let pointOfTouch = touch.location(in: self)  //You have to manually add in:
            let nodeITapped = atPoint(pointOfTouch)  //any object we touch will be set to node I tapped
            
            if nodeITapped != mainMenuLabel || nodeITapped != mainMenuButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                mainMenuLabel.run(scaleUpText)
                mainMenuButton.run(scaleUpButton)
            }
            
            if nodeITapped != creditsLabel || nodeITapped != creditsButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                creditsLabel.run(scaleUpText)
                creditsButton.run(scaleUpButton)
            }
            
//            if nodeITapped != rateLabel || nodeITapped != rateButton{  //references startButton and runs any code below if this is the node tapped
//                
//                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
//                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
//                rateLabel.run(scaleUpText)
//                rateButton.run(scaleUpButton)
//            }
            
            if nodeITapped != controlLabel || nodeITapped != controlButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleUpButton = SKAction.scaleX(to: 1.07, y: 0.4, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                let scaleUpCheckGlass = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                let scaleUpCheckmark = SKAction.scaleX(to: 1.2, y: 1.2, duration: 0.03)
                let moveCheckMarkRight = SKAction.moveTo(x: self.size.width*0.75, duration: 0.03)
                
                nodeITapped.run(buttonClickSound)
                controlLabel.run(scaleUpText)
                controlButton.run(scaleUpButton)
                controlCheckGlass.run(scaleUpCheckGlass)
                controlCheckmark.run(scaleUpCheckmark)
                controlCheckmark.run(moveCheckMarkRight)
                controlCheckGlass.run(moveCheckMarkRight)
                
            }
            
            if controlLabel.contains(pointOfTouch) || controlButton.contains(pointOfTouch){
                nodeITapped.run(buttonClickSound)
                if invertedControl == 1{
                    invertedControl = 0
                    defaults.set(invertedControl, forKey: "invertedValueSaved")
                    controlCheckmark.removeFromParent()
                }
                else if invertedControl == 0{
                    invertedControl = 1
                    defaults.set(invertedControl, forKey: "invertedValueSaved")
                    self.addChild(controlCheckmark)
                }
            }
            
            if creditsLabel.contains(pointOfTouch) || creditsButton.contains(pointOfTouch){
                nodeITapped.run(buttonClickSound)
                if statOrCredit == 0{
                    creditsLabel.text = "Stats"
                    statLabel.text = "Credits"
                    highscoreLabel.removeFromParent()
                    averageScoreLabel.removeFromParent()
                    totalGoldCountLabel.removeFromParent()
                    totalGoldSpentLabel.removeFromParent()
                    averageGoldLabel.removeFromParent()
                    totalRuns.removeFromParent()
                    self.addChild(creditsLine1)
                    self.addChild(creditsLine2)
                    self.addChild(creditsLine3)
                    self.addChild(creditsLine4)
                    self.addChild(creditsLine5)
                    self.addChild(creditsLine6)
                    statOrCredit += 1
                }
                else if statOrCredit == 1{
                    creditsLabel.text = "Credits"
                    statLabel.text = "Stats"
                    creditsLine1.removeFromParent()
                    creditsLine2.removeFromParent()
                    creditsLine3.removeFromParent()
                    creditsLine4.removeFromParent()
                    creditsLine5.removeFromParent()
                    creditsLine6.removeFromParent()
                    self.addChild(highscoreLabel)
                    self.addChild(averageScoreLabel)
                    self.addChild(totalGoldCountLabel)
                    self.addChild(totalGoldSpentLabel)
                    self.addChild(averageGoldLabel)
                    self.addChild(totalRuns)
                    statOrCredit -= 1
                }
            }
            
            if mainMenuLabel.contains(pointOfTouch) || mainMenuButton.contains(pointOfTouch){
                nodeITapped.run(buttonClickSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                mainMenuLabel.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.1)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        }
    }
}
