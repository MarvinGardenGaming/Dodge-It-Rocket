//
//  GameOverScene.swift
//  MarvinGardenGamingFirstGame
//
//  Created by Zachary Marvin on 12/14/16.
//  Copyright © 2016 Zachary Marvin. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import Social

var totalDistanceTraveled = defaults.integer(forKey: "totalDistanceTraveled")

var highScoreNumber = defaults.integer(forKey: "highScoreSaved")

var timesPlayed = defaults.integer(forKey: "timesPlayedSaved")

var totalGoldCount = defaults.integer(forKey: "totalGoldCountSaved")

class GameOverScene: SKScene{
    
    let buttonClickSound = SKAction.playSoundFileNamed("buttonClick.mp3", waitForCompletion: false)
    
    let restartLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let restartButton = SKSpriteNode(imageNamed: "blueButton")
    
    let mainMenuLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let mainMenuButton = SKSpriteNode(imageNamed: "blueButton")
    
    override func didMove(to view: SKView) {  //Runs as soon as moved into game over scene, sets up screen
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = -2
        background.size = self.size
        self.addChild(background)
        
        let backdrop = SKSpriteNode(imageNamed: "backdrop")
        backdrop.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        backdrop.zPosition = -1
        backdrop.xScale = 1.05
        backdrop.yScale = 0.7
        self.addChild(backdrop)

        
        let gameOverLabel = SKLabelNode(fontNamed: "spaceranger")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 145
        gameOverLabel.fontColor = SKColor.red
        gameOverLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.85)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "spaceranger")
        scoreLabel.text = "Score: \(gameScore)"
        scoreLabel.fontSize = 95
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.78)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        totalDistanceTraveled += gameScore
        
        defaults.set(totalDistanceTraveled, forKey: "totalDistanceTraveled")
        
        timesPlayed += 1
        
        defaults.set(timesPlayed, forKey: "timesPlayedSaved")
        
        totalGoldCount += currentGoldCount
        
        defaults.set(totalGoldCount, forKey: "totalGoldCountSaved")
        
        goldCount += currentGoldCount
        
        defaults.set(goldCount, forKey: "goldCountSaved")
        
        defaults.synchronize()
        
        if gameScore > highScoreNumber{  //If the game score is higher than the high score set as new high score
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey: "highScoreSaved")  //Make sure "highScoreSaved" matches exactly to what is written in var highScoreNumber
        }
        
        let goldEarnedThisRunLabel = SKLabelNode(fontNamed: "spaceranger")
        goldEarnedThisRunLabel.text = "Gold earned this run: \(currentGoldCount)"
        goldEarnedThisRunLabel.fontSize = 60
        goldEarnedThisRunLabel.fontColor = SKColor.white
        goldEarnedThisRunLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.65)
        goldEarnedThisRunLabel.zPosition = 1
        self.addChild(goldEarnedThisRunLabel)
        
        let totalGoldLabel = SKLabelNode(fontNamed: "spaceranger")
        totalGoldLabel.text = "Total Gold: \(goldCount)"
        totalGoldLabel.fontSize = 60
        totalGoldLabel.fontColor = SKColor.white
        totalGoldLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.62)
        totalGoldLabel.zPosition = 1
        self.addChild(totalGoldLabel)
        
        let highScoreLabel = SKLabelNode(fontNamed: "spaceranger")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 95
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.73)
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        restartLabel.text = "restart"
        restartLabel.fontSize = 100
        restartLabel.fontColor = SKColor.white
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.38)
        restartLabel.zPosition = 1
        self.addChild(restartLabel)
        
        restartButton.xScale = 0.68
        restartButton.yScale = 0.5
        restartButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.39)
        restartButton.zPosition = 0
        self.addChild(restartButton)
        
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.fontSize = 100
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.24)
        mainMenuLabel.zPosition = 1
        self.addChild(mainMenuLabel)
        
        mainMenuButton.xScale = 0.68
        mainMenuButton.yScale = 0.5
        mainMenuButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        mainMenuButton.zPosition = 0
        self.addChild(mainMenuButton)
        
        let topBorder = SKSpriteNode(imageNamed: "topBorder")
        topBorder.xScale = 0.68
        topBorder.yScale = 0.6
        topBorder.position = CGPoint(x: self.size.width/2, y: self.size.height*0.47)
        topBorder.zPosition = 0
        self.addChild(topBorder)
        
        let bottomBorder = SKSpriteNode(imageNamed: "bottomBorder")
        bottomBorder.xScale = 0.68
        bottomBorder.yScale = 0.6
        bottomBorder.position = CGPoint(x: self.size.width/2, y: self.size.height*0.17)
        bottomBorder.zPosition = 0
        self.addChild(bottomBorder)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)  //You have to manually add in:
            let nodeITapped = atPoint(pointOfTouch)  //any object we touch will be set to node I tapped
            
            if nodeITapped == mainMenuLabel || nodeITapped == mainMenuButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleDownButton = SKAction.scaleX(to: 0.63, y: 0.45, duration: 0.03)
                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                mainMenuLabel.run(scaleDownText)
                mainMenuButton.run(scaleDownButton)
            }
            
            if nodeITapped == restartLabel || nodeITapped == restartButton{  //references startButton and runs any code below if this is the node tapped
                
                let scaleDownButton = SKAction.scaleX(to: 0.63, y: 0.45, duration: 0.03)
                let scaleDownText = SKAction.scaleX(to: 0.85, y: 0.85, duration: 0.03)
                restartLabel.run(scaleDownText)
                restartButton.run(scaleDownButton)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {  //All this is information is used to restart the game
        
        for touch: AnyObject in touches{  //This areas pulls all information for where we touched
            
            let pointOfTouch = touch.location(in: self)  //You have to manually add in:
            let nodeITapped = atPoint(pointOfTouch)  //any object we touch will be set to node I tapped
            
            if nodeITapped != mainMenuLabel || nodeITapped != mainMenuButton{  //references startButton and runs any code below if this is the node tapped
                
                nodeITapped.run(buttonClickSound)
                let scaleUpButton = SKAction.scaleX(to: 0.68, y: 0.5, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                mainMenuLabel.run(scaleUpText)
                mainMenuButton.run(scaleUpButton)
            }
            
            if nodeITapped != restartLabel || nodeITapped != restartButton{  //references startButton and runs any code below if this is the node tapped
                
                nodeITapped.run(buttonClickSound)
                let scaleUpButton = SKAction.scaleX(to: 0.68, y: 0.5, duration: 0.03)
                let scaleUpText = SKAction.scaleX(to: 1, y: 1, duration: 0.03)
                restartLabel.run(scaleUpText)
                restartButton.run(scaleUpButton)
            }
            
            if restartLabel.contains(pointOfTouch) || restartButton.contains(pointOfTouch){  //If restart label is in the same place we touched
                
                currentGameState = gameState.preGame
                
                let sceneToMoveTo = GameScene(size: self.size)  //This is the information used to set up scene size scale and transition
                restartLabel.run(buttonClickSound)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.1)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if mainMenuLabel.contains(pointOfTouch) || mainMenuButton.contains(pointOfTouch){
                
                currentGameState = gameState.preGame
                
                nodeITapped.run(buttonClickSound)
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.1)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
        }
        
    }
    
}
