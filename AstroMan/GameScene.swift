//
//  GameScene.swift
//  MarvinGardenGamingFirstGame
//
//  Created by Zachary Marvin on 12/12/16.
//  Copyright © 2016 Zachary Marvin. All rights reserved.
//

import SpriteKit
import GameplayKit

var gameScore = 0  //Declared this outside of the scene that way it can be used on all scenes

var goldCount = defaults.integer(forKey: "goldCountSaved")

var currentGoldCount = 0

enum gameState{
    
    case preGame //when the game state is before the start of the game
    case inGame  //when the game state is during the game
    case afterGame  //when the game state is after the game
    
}

var currentGameState = gameState.preGame

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let coinSound = SKAction.playSoundFileNamed("coinSound.wav", waitForCompletion: true)
    
    let fuelSound = SKAction.playSoundFileNamed("fuelSound.mp3", waitForCompletion: true)
    
    var timer = Timer()
    
    let scoreBackdrop = SKSpriteNode(imageNamed: "blueButton")
    
    let fuelBarBackdrop = SKSpriteNode(imageNamed: "blueButton")
    
    let fuelSymbol = SKSpriteNode(imageNamed: "fuelSymbol")
    
    let fuelBar = SKSpriteNode(imageNamed: "fuelBar")
    
    var player = SKSpriteNode(imageNamed: "playerShip1")
    
    var levelNumber = 0
    
    var livesNumber = 3
    
    var currentGameState = gameState.preGame
    
    var levelDuration = TimeInterval()
    
    let livesLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let scoreLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let goldCoin = SKSpriteNode(imageNamed: "goldCoin")
    
    let goldLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let thrusterSound = SKAction.playSoundFileNamed("thrustSound.mp3", waitForCompletion: false)
    
    let explosionSound = SKAction.playSoundFileNamed("explosion.wav", waitForCompletion: false)
    
    let buttonClickSound = SKAction.playSoundFileNamed("buttonClick.mp3", waitForCompletion: false)
    
    let tapToStartLabel = SKLabelNode(fontNamed: "spaceranger")
    
    let tapToStartButton = SKSpriteNode(imageNamed: "blueButton")
    
    var amountAdded = 0
    
    var levelLabel = SKLabelNode(fontNamed: "spaceranger")
    
    var fuelCount = 100.0
    
    struct PhysicsCategories{
        static let None : UInt32 = 0 //0
        static let Player : UInt32 = 0b1 //1
        static let Gold : UInt32 = 0b10 //2
        static let Enemy : UInt32 = 0b100 //3
        static let Gas : UInt32 = 0b1000 //4
        static let Edge : UInt32 = 0b10000 //5
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    
    
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
    let gameArea: CGRect
    
    override init(size: CGSize){
        
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        if chooseShip == 2{
            fuelCount = 200
        }
        if chooseShip == 3 || chooseShip == 6{
            fuelCount = 300
        }
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody!.categoryBitMask = PhysicsCategories.Edge
        
        gameScore = 0  //Sets the score to 0 at the beginning of the game
        
        currentGoldCount = 0
        
        self.physicsWorld.contactDelegate = self
        
        for i in 0...1{  //For loop for background. Make sure the curly bracket is after all the background info
            
            let background = SKSpriteNode(imageNamed: "background")
            background.size = self.size
            background.anchorPoint = CGPoint(x: 0.5, y: 0)  //Setting background anchor point to bottom center
            background.position = CGPoint(x: self.size.width/2, y: self.size.height*CGFloat(i))  //Times self.size.height by 1 and 0 depending on i value
            background.zPosition = -10
            background.name = "Background"  //Gives background the name "Background" so it can be called outside of the function
            self.addChild(background)
            
            
            
            
        }
        
        if chooseShip == 1  &&  chooseColor == 1{
            
            player = SKSpriteNode(imageNamed: "playerShip1")
            let playerTexture = SKTexture(imageNamed: "playerShip1")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 1  &&  chooseColor == 2{
            
            player = SKSpriteNode(imageNamed: "playerShip1Blue")
            let playerTexture = SKTexture(imageNamed: "playerShip1Blue")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 1  &&  chooseColor == 3{
            
            player = SKSpriteNode(imageNamed: "playerShip1Yellow")
            let playerTexture = SKTexture(imageNamed: "playerShip1Yellow")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 1  &&  chooseColor == 4{
            
            player = SKSpriteNode(imageNamed: "playerShip1Green")
            let playerTexture = SKTexture(imageNamed: "playerShip1Green")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 1  &&  chooseColor == 5{
            
            player = SKSpriteNode(imageNamed: "playerShip1Orange")
            let playerTexture = SKTexture(imageNamed: "playerShip1Orange")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 1  &&  chooseColor == 6{
            
            player = SKSpriteNode(imageNamed: "playerShip1Pink")
            let playerTexture = SKTexture(imageNamed: "playerShip1Pink")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 2  &&  chooseColor == 1{
            
            player = SKSpriteNode(imageNamed: "playerShip2")
            let playerTexture = SKTexture(imageNamed: "playerShip2")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 2  &&  chooseColor == 2{
            
            player = SKSpriteNode(imageNamed: "playerShip2Blue")
            let playerTexture = SKTexture(imageNamed: "playerShip2Blue")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 2  &&  chooseColor == 3{
            
            player = SKSpriteNode(imageNamed: "playerShip2Yellow")
            let playerTexture = SKTexture(imageNamed: "playerShip2Yellow")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 2  &&  chooseColor == 4{
            
            player = SKSpriteNode(imageNamed: "playerShip2Green")
            let playerTexture = SKTexture(imageNamed: "playerShip2Green")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 2  &&  chooseColor == 5{
            
            player = SKSpriteNode(imageNamed: "playerShip2Orange")
            let playerTexture = SKTexture(imageNamed: "playerShip2Orange")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 2  &&  chooseColor == 6{
            
            player = SKSpriteNode(imageNamed: "playerShip2Pink")
            let playerTexture = SKTexture(imageNamed: "playerShip2Pink")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 3  &&  chooseColor == 1{
            
            player = SKSpriteNode(imageNamed: "playerShip3")
            let playerTexture = SKTexture(imageNamed: "playerShip3")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 3  &&  chooseColor == 2{
            
            player = SKSpriteNode(imageNamed: "playerShip3Blue")
            let playerTexture = SKTexture(imageNamed: "playerShip3Blue")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 3  &&  chooseColor == 3{
            
            player = SKSpriteNode(imageNamed: "playerShip3Yellow")
            let playerTexture = SKTexture(imageNamed: "playerShip3Yellow")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 3  &&  chooseColor == 4{
            
            player = SKSpriteNode(imageNamed: "playerShip3Green")
            let playerTexture = SKTexture(imageNamed: "playerShip3Green")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 3  &&  chooseColor == 5{
            
            player = SKSpriteNode(imageNamed: "playerShip3Orange")
            let playerTexture = SKTexture(imageNamed: "playerShip3Orange")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 3  &&  chooseColor == 6{
            
            player = SKSpriteNode(imageNamed: "playerShip3Pink")
            let playerTexture = SKTexture(imageNamed: "playerShip3Pink")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(1)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1)
        }
        
        if chooseShip == 4  &&  chooseColor == 1{
            
            player = SKSpriteNode(imageNamed: "playerShip4")
            let playerTexture = SKTexture(imageNamed: "playerShip4")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 4  &&  chooseColor == 2{
            
            player = SKSpriteNode(imageNamed: "playerShip4Blue")
            let playerTexture = SKTexture(imageNamed: "playerShip4Blue")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 4  &&  chooseColor == 3{
            
            player = SKSpriteNode(imageNamed: "playerShip4Yellow")
            let playerTexture = SKTexture(imageNamed: "playerShip4Yellow")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 4  &&  chooseColor == 4{
            
            player = SKSpriteNode(imageNamed: "playerShip4Green")
            let playerTexture = SKTexture(imageNamed: "playerShip4Green")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 4  &&  chooseColor == 5{
            
            player = SKSpriteNode(imageNamed: "playerShip4Orange")
            let playerTexture = SKTexture(imageNamed: "playerShip4Orange")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 4  &&  chooseColor == 6{
            
            player = SKSpriteNode(imageNamed: "playerShip4Pink")
            let playerTexture = SKTexture(imageNamed: "playerShip4Pink")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 5  &&  chooseColor == 1{
            
            player = SKSpriteNode(imageNamed: "playerShip5")
            let playerTexture = SKTexture(imageNamed: "playerShip5")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 5  &&  chooseColor == 2{
            
            player = SKSpriteNode(imageNamed: "playerShip5Blue")
            let playerTexture = SKTexture(imageNamed: "playerShip5Blue")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 5  &&  chooseColor == 3{
            
            player = SKSpriteNode(imageNamed: "playerShip5Yellow")
            let playerTexture = SKTexture(imageNamed: "playerShip5Yellow")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 5  &&  chooseColor == 4{
            
            player = SKSpriteNode(imageNamed: "playerShip5Green")
            let playerTexture = SKTexture(imageNamed: "playerShip5Green")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 5  &&  chooseColor == 5{
            
            player = SKSpriteNode(imageNamed: "playerShip5Orange")
            let playerTexture = SKTexture(imageNamed: "playerShip5Orange")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 5  &&  chooseColor == 6{
            
            player = SKSpriteNode(imageNamed: "playerShip5Pink")
            let playerTexture = SKTexture(imageNamed: "playerShip5Pink")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 6  &&  chooseColor == 1{
            
            player = SKSpriteNode(imageNamed: "playerShip6")
            let playerTexture = SKTexture(imageNamed: "playerShip6")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 6  &&  chooseColor == 2{
            
            player = SKSpriteNode(imageNamed: "playerShip6Blue")
            let playerTexture = SKTexture(imageNamed: "playerShip6Blue")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 6  &&  chooseColor == 3{
            
            player = SKSpriteNode(imageNamed: "playerShip6Yellow")
            let playerTexture = SKTexture(imageNamed: "playerShip6Yellow")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 6  &&  chooseColor == 4{
            
            player = SKSpriteNode(imageNamed: "playerShip6Green")
            let playerTexture = SKTexture(imageNamed: "playerShip6Green")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 6  &&  chooseColor == 5{
            
            player = SKSpriteNode(imageNamed: "playerShip6Orange")
            let playerTexture = SKTexture(imageNamed: "playerShip6Orange")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        if chooseShip == 6  &&  chooseColor == 6{
            
            player = SKSpriteNode(imageNamed: "playerShip6Pink")
            let playerTexture = SKTexture(imageNamed: "playerShip6Pink")
            player.physicsBody = SKPhysicsBody(texture: playerTexture, alphaThreshold: 0, size: CGSize(width: player.size.width, height: player.size.height))
            player.size = playerTexture.size()
            player.setScale(2)
            player.position = CGPoint(x: self.size.width/2, y: player.size.height * 1.8)
        }
        
        player.zPosition = 6
        player.zRotation = CGFloat(atan2f(0, 0))
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.categoryBitMask = PhysicsCategories.Player
        player.physicsBody!.collisionBitMask = PhysicsCategories.None //Don't allow collision
        player.physicsBody!.contactTestBitMask = PhysicsCategories.Enemy //If player hits enemy let me know
        self.addChild(player)
        
        fuelSymbol.position = CGPoint(x: self.size.width*0.675, y: self.size.height*0.96)
        fuelSymbol.setScale(0.3)
        fuelSymbol.zPosition = 100
        self.addChild(fuelSymbol)
        
        fuelBar.position = CGPoint(x: self.size.width*0.692, y: self.size.height*0.9485)
        fuelBar.yScale = 0.8
        fuelBar.color = SKColor.green
        fuelBar.colorBlendFactor = 1
        if chooseShip == 1 || chooseShip == 4 || chooseShip == 5{
        fuelBar.xScale = CGFloat(Double(fuelCount*0.0125))
        }
        if chooseShip == 2{
            fuelBar.xScale = CGFloat(Double(fuelCount*0.00625))
        }
        if chooseShip == 3 || chooseShip == 6{
            fuelBar.xScale = CGFloat(Double(fuelCount*0.00416))
        }
        fuelBar.anchorPoint = CGPoint(x: 0, y: 0)
        fuelBar.zPosition = 100
        self.addChild(fuelBar)
        
        scoreLabel.text = "Score: 0"  //Setting up the Score configurations
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.white
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.position = CGPoint(x:self.size.width*0, y: self.size.height*0.95)  //Height starts with the screen height + the label height
        scoreLabel.zPosition = 100
        self.addChild(scoreLabel)
        
        scoreBackdrop.position = CGPoint(x:self.size.width*0.145, y: self.size.height*0.94)
        scoreBackdrop.xScale = (0.37)
        scoreBackdrop.yScale = (0.17)
        scoreBackdrop.zPosition = 99
        scoreBackdrop.anchorPoint = CGPoint(x: 0, y: 0)
        self.addChild(scoreBackdrop)
        
        goldCoin.position.x = goldLabel.position.x
        goldCoin.position.y = self.size.height*0.96
        goldCoin.zPosition = 100
        goldCoin.setScale(0.5)
        
        fuelBarBackdrop.position = CGPoint(x:self.size.width*0.76, y: self.size.height*0.96)
        fuelBarBackdrop.xScale = (0.37)
        fuelBarBackdrop.yScale = (0.17)
        fuelBarBackdrop.zPosition = 99
        self.addChild(fuelBarBackdrop)
        
        self.addChild(goldCoin)
        goldLabel.text = "\(currentGoldCount)"  //Setting up the Score configurations
        goldLabel.fontSize = 70
        goldLabel.fontColor = SKColor.white
        goldLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        goldLabel.position = CGPoint(x:self.size.width*0.1, y: self.size.height*0.95)  //Height starts with the screen height + the label height
        goldLabel.zPosition = 100
        self.addChild(goldLabel)
        
        levelLabel.text = "Level: \(levelNumber)"
        levelLabel.fontSize = 150
        levelLabel.fontColor = SKColor.white
        levelLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        levelLabel.zPosition = 100
        
        let moveOnToScreenGoldCoin = SKAction.moveTo(x: self.size.width*0.46, duration: 0.4)
        let moveOnToScreenGoldAction = SKAction.moveTo(x: self.size.width*0.5, duration: 0.4)
        let moveOnToScreenScoreAction = SKAction.moveTo(x: self.size.width*0.16, duration: 0.4)
        goldCoin.run(moveOnToScreenGoldCoin)
        scoreLabel.run(moveOnToScreenScoreAction)  //Running the moveOnToScreenAction for both
        goldLabel.run(moveOnToScreenGoldAction)
        
        tapToStartLabel.text = "Tap To Begin"
        tapToStartLabel.fontSize = 120
        tapToStartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        tapToStartLabel.zPosition = 100
        tapToStartLabel.alpha = 0  //.alpha is the transparency, 0 is see through and 1 is not see through
        self.addChild(tapToStartLabel)
        

        tapToStartButton.xScale = 1.05
        tapToStartButton.yScale = 0.5
        tapToStartButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.515)
        tapToStartButton.zPosition = 99
        self.addChild(tapToStartButton)
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.6)  //How fast the tapToStartLabel will fade in
        tapToStartButton.run(fadeInAction)
        tapToStartLabel.run(fadeInAction)
        
    }
    
    //Declaring the to var's below globally so they dont set to 0 every time the override func update runs
    
    var lastUpdateTime: TimeInterval = 0  //Stores the time of last update (Time interval is a number in seconds)
    var deltaFrameTime: TimeInterval = 0  //How much time has passed
    let amountToMovePerSecond: CGFloat = 400.0  //The pace in which the background scrolls, if this were var you could change scrolling speed during game
    
    override func update(_ currentTime: TimeInterval) {  //Pulls the current time  **xcode made me add _ not sure why
        
        if player.position.x > gameArea.maxX{
            player.position.x = gameArea.maxX - player.size.width
        }
        
        if player.position.x < gameArea.minX{
            player.position.x = gameArea.minX + player.size.width
        }
        
        if lastUpdateTime == 0{  //If last update time is 0 then this hasnt ran yet
            lastUpdateTime = currentTime
        }
        else{
            deltaFrameTime = currentTime - lastUpdateTime  //current time - last updated time = time change
            lastUpdateTime = currentTime  //sets last update time to current time
        }
        
        let amountToMoveBackground = amountToMovePerSecond * CGFloat(deltaFrameTime)
        
        self.enumerateChildNodes(withName: "Background"){  //Creates a list for backgrounds
            background, stop in
            
            if self.currentGameState == gameState.inGame{  //Only scroll the background if the game is in play
                background.position.y -= amountToMoveBackground  //moves the background by the amount stated above
            }
            
            if background.position.y < -self.size.height{  //If the background is below the screen
                background.position.y += self.size.height*2  //move it above the screen
            }
        }
        
        
    }
    
    
    
    
    func startGame()  //Everything that is going to happen when user starts game
    {
        currentGameState = gameState.inGame  //Changes game state
        
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)  //Fading out timing for label
        let deleteAction = SKAction.removeFromParent()  //Deleting the label
        let deleteSequence = SKAction.sequence([buttonClickSound, fadeOutAction, deleteAction])   //Sequence for both fading and deleting label
        tapToStartLabel.run(deleteSequence)  //Actually calling on the sequence
        tapToStartButton.run(deleteSequence)
        
        let fireParticleFilePath = Bundle.main.path(forResource: "fireParticle", ofType: "sks")
        
        let rocketFire = NSKeyedUnarchiver.unarchiveObject(withFile: fireParticleFilePath!) as! SKEmitterNode
        if chooseShip == 1 || chooseShip == 2{
        rocketFire.targetNode = self
        rocketFire.position.x = 0
        rocketFire.position.y = -150
        rocketFire.zPosition = 5
        player.addChild(rocketFire)
        }
        
        if chooseShip == 3{
            rocketFire.targetNode = self
            rocketFire.position.x = 0
            rocketFire.position.y = -190
            rocketFire.zPosition = 5
            player.addChild(rocketFire)
        }
        
        if chooseShip == 4 || chooseShip == 5 || chooseShip == 6{
            rocketFire.targetNode = self
            rocketFire.position.x = 0
            rocketFire.position.y = -40
            rocketFire.zPosition = 5
            rocketFire.setScale(0.1)
            player.addChild(rocketFire)
        }
        

        let startLevelAction = SKAction.run(startNewLevel)  //Starting the first level
        let startGameSequence = SKAction.sequence([startLevelAction])  //Sequence for moving ship and starting first level
        player.run(startGameSequence)  //Actually calling on the sequence
        
        let newMoonSpawn = SKAction.run(spawnNewMoon)
        let newMoonWaitToSpawn = SKAction.wait(forDuration: 30)
        let newMoonSpawnSequence = SKAction.sequence([newMoonWaitToSpawn, newMoonSpawn])
        let newMoonSpawnForever = SKAction.repeatForever(newMoonSpawnSequence)
        self.run(newMoonSpawnForever)
        
        let galaxySpawn = SKAction.run(spawnGalaxy)
        let galaxyWaitToSpawn = SKAction.wait(forDuration: 126)
        let galaxySpawnSequence = SKAction.sequence([galaxyWaitToSpawn, galaxySpawn])
        let galaxySpawnForever = SKAction.repeatForever(galaxySpawnSequence)
        self.run(galaxySpawnForever)
        
        let planetSpawn = SKAction.run(spawnPlanet)
        let planetWaitToSpawn = SKAction.wait(forDuration: 30, withRange: 15)
        let planetSpawnSequence = SKAction.sequence([planetWaitToSpawn, planetSpawn])
        let planetSpawnForever = SKAction.repeatForever(planetSpawnSequence)
        self.run(planetSpawnForever)
        
        let firstEnemySpawn = SKAction.run(spawnFirstEnemy)
        let firstEnemyWaitToSpawn = SKAction.wait(forDuration: 5)
        let firstEnemySpawnSequence = SKAction.sequence([firstEnemyWaitToSpawn, firstEnemySpawn])
        self.run(firstEnemySpawnSequence)
        
        let spawnStar = SKAction.run(spawnShootingStar)
        let waitToSpawnStar = SKAction.wait(forDuration: 5)
        let spawnStarSequence = SKAction.sequence([waitToSpawnStar , spawnStar])
        let spawnStarForever = SKAction.repeatForever(spawnStarSequence)
        self.run(spawnStarForever)
        
        let spawnGold = SKAction.run(spawnGoldNugget)
        let waitToSpawnGold = SKAction.wait(forDuration: 5)
        let goldSequence = SKAction.sequence([waitToSpawnGold , spawnGold])
        let goldForever = SKAction.repeatForever(goldSequence)
        self.run(goldForever)
        
        let spawnGas = SKAction.run(spawnGasBarrel)
        let waitToSpawnGas = SKAction.wait(forDuration: 6)
        let gasSequence = SKAction.sequence([waitToSpawnGas , spawnGas])
        let gasForever = SKAction.repeatForever(gasSequence)
        self.run(gasForever)
        
        let minus = SKAction.run(minusCount)
        let waitToMinus = SKAction.wait(forDuration: 0.15)
        let minusSequence = SKAction.sequence([waitToMinus, minus])
        let minusForever = SKAction.repeatForever(minusSequence)
        self.run(minusForever)
        
    }

    func minusCount(){
        fuelCount -= 0.55
        
        if fuelCount <= 0{
            spawnRanOutOfGas()
            runGameOver()
        }
        
        if chooseShip == 1 || chooseShip == 4 || chooseShip == 5{
            fuelBar.xScale = CGFloat(Double(fuelCount*0.0125))
            if fuelCount >= 66{
                fuelBar.color = SKColor.green
            }
            if fuelCount >= 35 && fuelCount <= 65{
                fuelBar.color = SKColor.yellow
            }
            if fuelCount <= 34{
                fuelBar.color = SKColor.red
            }
        }
        if chooseShip == 2{
            fuelBar.xScale = CGFloat(Double(fuelCount*0.00625))
            if fuelCount >= 140{
                fuelBar.color = SKColor.green
            }
            if fuelCount >= 70 && fuelCount <= 139{
                fuelBar.color = SKColor.yellow
            }
            if fuelCount <= 69{
                fuelBar.color = SKColor.red
            }
        }
        if chooseShip == 3 || chooseShip == 6{
            fuelBar.xScale = CGFloat(Double(fuelCount*0.00416))
            if fuelCount >= 220{
                fuelBar.color = SKColor.green
            }
            if fuelCount >= 100 && fuelCount <= 219{
                fuelBar.color = SKColor.yellow
            }
            if fuelCount <= 99{
                fuelBar.color = SKColor.red
            }
        }
    }
    
    func addScore(){
        gameScore += 1
        
        if gameScore >= 10 && gameScore <= 19{
            let scaleBackdrop = SKAction.scaleX(to: 0.40, duration: 0)
            scoreBackdrop.run(scaleBackdrop)
        }
        
        if gameScore >= 20 && gameScore <= 99{
            let scaleBackdrop = SKAction.scaleX(to: 0.42, duration: 0)
            scoreBackdrop.run(scaleBackdrop)
        }
        
        if gameScore >= 100{
            let scaleBackdrop = SKAction.scaleX(to: 0.45, duration: 0)
            scoreBackdrop.run(scaleBackdrop)
        }
        
        let scaleUp = SKAction.scale(to: 1.2, duration: 0.08)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.08)
        let scaleSequence = SKAction.sequence([scaleUp, scaleDown])
        
        scoreLabel.text = "Score: \(gameScore)"  //This function adds 1 to the game score and displays it as a String
        
        scoreLabel.run(scaleSequence)
        
        if gameScore == 5 || gameScore == 11 || gameScore == 18 || gameScore == 26 || gameScore == 35 || gameScore == 45 || gameScore == 56 || gameScore == 68 || gameScore == 81{  //If gamescore is 10, 25 or 50 start new level
            startNewLevel()
        }
        
    }
    
    func addGold(){
        
        self.run(coinSound)
        let randGold = Int(arc4random_uniform(10) + 1)
        
        if randGold <= 6{
            amountAdded = 1
        }
        if randGold <= 9 && randGold >= 7{
            amountAdded = 2
        }
        if randGold == 10{
            amountAdded = 3
        }
        
        currentGoldCount += amountAdded
        let scaleUp = SKAction.scale(to: 1.2, duration: 0.08)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.08)
        let scaleSequence = SKAction.sequence([scaleUp, scaleDown])
        
        goldLabel.text = "\(currentGoldCount)"  //This function adds 1 to the game score and displays it as a String
        
        goldLabel.run(scaleSequence)
        
    }
    
    func addGas(){
        
        self.run(fuelSound)
        fuelCount += 27
        if chooseShip == 1 || chooseShip == 4 || chooseShip == 5{
            if fuelCount >= 100{
                fuelCount = 100
            }
            fuelBar.xScale = CGFloat(Double(fuelCount*0.0125))
        }
        if chooseShip == 2{
            if fuelCount >= 200{
                fuelCount = 200
            }
            fuelBar.xScale = CGFloat(Double(fuelCount*0.00625))
        }
        if chooseShip == 3 || chooseShip == 6{
            if fuelCount >= 300{
                fuelCount = 300
            }
            fuelBar.xScale = CGFloat(Double(fuelCount*0.00416))
        }
        
    }
    
    func runGameOver(){
        
        currentGameState = gameState.afterGame
        
        self.removeAllActions()  //Removes all spawning actions
        
        self.enumerateChildNodes(withName: "Enemy"){  //Creates a list for all active instances of Enemy
            enemy, stop in  //cycle through each instance of enemy
            
            enemy.removeAllActions()  //removes all actions for active enemy
        }
        
        
        
        let changeSceneAction = SKAction.run(changeScene)  //References changeScene func and runs it
        let waitToChangeScene = SKAction.wait(forDuration: 3)  //Wait for 1 second
        let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])  //combines change scene with wait to change scene into a sequence
        self.run(changeSceneSequence)  //Runs the Sequence
        
    }
    
    
    func changeScene(){  //All the code for changing the Scene
        
        let sceneToMoveTo = GameOverScene(size: self.size)  //Tells it which scene to move to and to copy the size of the current scene to the new one
        sceneToMoveTo.scaleMode = self.scaleMode  //Tells it to carry of the same Scale so things arent disorted
        let myTransition = SKTransition.fade(withDuration: 0.5)  //Half second fade into new scene
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)  //Uses scenetomoveto and mytransition to initiate the transition
        
        
    }
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{  //making sure body A and B are always in numerical order
            body1 = contact.bodyA
            body2 = contact.bodyB
        }
        else{
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        
        if body1.categoryBitMask == PhysicsCategories.Player && body2.categoryBitMask == PhysicsCategories.Enemy{ //if the player has hit the enemy
            
            if body2.node != nil { //make sure there is a node
                spawnExplosion(spawnPosition: body2.node!.position) //explode enemy
                spawnExplosion(spawnPosition: body1.node!.position)
            }
            
            
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
            runGameOver()  //set up game over screen from referenced function
            
        }
        
        if  body1.categoryBitMask == PhysicsCategories.Player && body2.categoryBitMask == PhysicsCategories.Gold{ //if the gold has hit the player
            
            addGold()
            
            if body2.node != nil { //make sure there is a node
                spawnAmountAdded(spawnPosition: CGPoint(x: body1.node!.position.x, y: body1.node!.position.y + 300)) //explode enemy
            }
            
            body2.categoryBitMask = 10  //Changes THAT gold pieces bitmask so it doesnt collide twice with the player
//adds score is bullet hits enemy
            
            body2.node?.removeFromParent()
            
        }
        
        if  body1.categoryBitMask == PhysicsCategories.Player && body2.categoryBitMask == PhysicsCategories.Gas{ //if the gas has hit the player
            body2.categoryBitMask = 10  //Changes THAT gold pieces bitmask so it doesnt collide twice with the player
            addGas()//adds score is bullet hits enemy
            
            body2.node?.removeFromParent()
            
        }
        
        if  body1.categoryBitMask == PhysicsCategories.Player && body2.categoryBitMask == PhysicsCategories.Edge{ //if the player hits the edge
            
            player.removeAllActions()
            
            
        }
        
    }
    
    
    func spawnExplosion(spawnPosition: CGPoint){
        
        let explosion = SKSpriteNode(imageNamed: "explosion")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(0)
        self.addChild(explosion)
        
        let scaleIn = SKAction.scale(to: 0.8, duration: 0.08)
        let fadeOut = SKAction.fadeOut(withDuration: 0.1)
        let delete = SKAction.removeFromParent()
        
        let explosionSequence = SKAction.sequence([explosionSound, scaleIn, fadeOut, delete])
        
        explosion.run(explosionSequence)
        
    }
    
    func spawnAmountAdded(spawnPosition: CGPoint){
        
        let amountAddedLabel = SKLabelNode(fontNamed: "spaceranger")
        amountAddedLabel.text = "+ \(amountAdded) Gold"
        amountAddedLabel.fontSize = 100
        amountAddedLabel.fontColor = SKColor.yellow
        amountAddedLabel.position = spawnPosition
        amountAddedLabel.zPosition = 3
        amountAddedLabel.setScale(0)
        self.addChild(amountAddedLabel)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.3)
        let fadeOut = SKAction.fadeOut(withDuration: 1)
        let delete = SKAction.removeFromParent()
        
        let amountAddedSequence = SKAction.sequence([scaleIn, fadeOut, delete])
        
        amountAddedLabel.run(amountAddedSequence)
        
    }
    
    func spawnRanOutOfGas(){
        let ranOutOfGasLabel = SKLabelNode(fontNamed: "spaceranger")
        ranOutOfGasLabel.text = "You Ran Out of Gas"
        ranOutOfGasLabel.fontSize = 100
        ranOutOfGasLabel.fontColor = SKColor.red
        ranOutOfGasLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        ranOutOfGasLabel.zPosition = 3
        ranOutOfGasLabel.setScale(0)
        self.addChild(ranOutOfGasLabel)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.3)
        let fadeOut = SKAction.fadeOut(withDuration: 2)
        let delete = SKAction.removeFromParent()
        
        let ranOutOfGasSequence = SKAction.sequence([scaleIn, fadeOut, delete])
        
        ranOutOfGasLabel.run(ranOutOfGasSequence)
    }
    
    
    
    func startNewLevel(){
        
        levelNumber += 1  //Add one to level
        
        levelLabel.text = "Level: \(levelNumber)"
        
        self.addChild(levelLabel)
        
        let fadeInLevel = SKAction.fadeIn(withDuration: 2)
        let fadeOutLevel = SKAction.fadeOut(withDuration: 2)
        let deleteLabel = SKAction.removeFromParent()
        let levelSequence = SKAction.sequence([fadeInLevel, fadeOutLevel, deleteLabel])
        
        levelLabel.run(levelSequence)
        
        
        if self.action(forKey: "spawningEnemies") != nil{  //If we are currently spawning enemies stop
            self.removeAction(forKey: "spawningEnemies")
        }
        
        
        
        switch levelNumber{  //Setting up enemy spawn rate for 4 levels
        case 1: levelDuration = 2.6
        case 2: levelDuration = 2.4
        case 3: levelDuration = 2.2
        case 4: levelDuration = 2.0
        case 5: levelDuration = 1.8
        case 6: levelDuration = 1.7
        case 7: levelDuration = 1.6
        case 8: levelDuration = 1.5
        case 9: levelDuration = 1.4
        case 10: levelDuration = 1.3
        default:
            levelDuration = 0.5
            print("Cannot find level info")  //If it cant find level display string
        }
        
        
        let spawn = SKAction.run(spawnEnemy)
        let waitToSpawn = SKAction.wait(forDuration: levelDuration)  //references levelDuration for the spawn rate
        let spawnSequence = SKAction.sequence([waitToSpawn, spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever, withKey: "spawningEnemies")
        
        
    }
    
    func spawnGasBarrel(){
        
        let rotateAction = SKAction.rotate(byAngle: 8, duration: 3)
        
        let randomXStart = random(min: gameArea.minX + 100, max: gameArea.maxX - 100)
        //      let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXStart, y: -self.size.height * 0.2)
        
        let gasBarrelTexture = SKTexture(imageNamed: "gasBarrel")
        
        let gasBarrel = SKSpriteNode(imageNamed: "gasBarrel")
        gasBarrel.setScale(0.8)
        gasBarrel.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
        gasBarrel.position = startPoint
        gasBarrel.zPosition = 3
        gasBarrel.physicsBody = SKPhysicsBody(texture: gasBarrelTexture, alphaThreshold: 0, size: CGSize(width: gasBarrel.size.width, height: gasBarrel.size.height))
        gasBarrel.physicsBody!.affectedByGravity = false
        gasBarrel.physicsBody!.categoryBitMask = PhysicsCategories.Gas
        gasBarrel.physicsBody!.collisionBitMask = PhysicsCategories.None //Don't allow collision
        gasBarrel.physicsBody!.contactTestBitMask = PhysicsCategories.Player //If enemy hits player let me know
        self.addChild(gasBarrel)
        
        
        let moveGasBarrel = SKAction.move(to: endPoint, duration: 1.7)  //Moves enemy
        let deleteGasBarrel = SKAction.removeFromParent()  //Deletes enemy
        let gasBarrelGroup = SKAction.group([moveGasBarrel, rotateAction])
        let gasBarrelSequence = SKAction.sequence([gasBarrelGroup, deleteGasBarrel])  //Enemy action sequence
        
        
        
        if currentGameState == gameState.inGame && gameScore > 0{
            gasBarrel.run(gasBarrelSequence)
        }
        
        let dx = endPoint.x - startPoint.x
        let dy = endPoint.y - startPoint.y
        let amountToRotate = atan2(dy, dx)
        gasBarrel.zRotation = amountToRotate
        
    }

    
    func spawnGoldNugget(){
        
        let rotateAction = SKAction.rotate(byAngle: 8, duration: 3)
        
        let randomXStart = random(min: gameArea.minX + 100, max: gameArea.maxX - 100)
        //      let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXStart, y: -self.size.height * 0.2)
        
        let goldNuggetTexture = SKTexture(imageNamed: "goldNugget")
        
        let goldNugget = SKSpriteNode(imageNamed: "goldNugget\(arc4random_uniform(3) + 1)")
        goldNugget.setScale(1)
        goldNugget.name = "GoldNugget"  //Reference name so enemy can be called upon outside of the function
        goldNugget.position = startPoint
        goldNugget.zPosition = 3
        goldNugget.physicsBody = SKPhysicsBody(texture: goldNuggetTexture, alphaThreshold: 0, size: CGSize(width: goldNugget.size.width, height: goldNugget.size.height))
        goldNugget.physicsBody!.affectedByGravity = false
        goldNugget.physicsBody!.categoryBitMask = PhysicsCategories.Gold
        goldNugget.physicsBody!.collisionBitMask = PhysicsCategories.None //Don't allow collision
        goldNugget.physicsBody!.contactTestBitMask = PhysicsCategories.Player //If enemy hits player let me know
        self.addChild(goldNugget)
        
        
        let moveGoldNugget = SKAction.move(to: endPoint, duration: 1.4)  //Moves enemy
        let deleteGoldNugget = SKAction.removeFromParent()  //Deletes enemy
        let goldNuggetGroup = SKAction.group([moveGoldNugget, rotateAction])
        let goldNuggetSequence = SKAction.sequence([goldNuggetGroup, deleteGoldNugget])  //Enemy action sequence
        
        
        
        if currentGameState == gameState.inGame && gameScore > 0{
            goldNugget.run(goldNuggetSequence)
        }
        
        let dx = endPoint.x - startPoint.x
        let dy = endPoint.y - startPoint.y
        let amountToRotate = atan2(dy, dx)
        goldNugget.zRotation = amountToRotate
        
    }
    
    func spawnEnemy(){
        
        let rand = Double(arc4random_uniform(30) + 30)
        
        let randFloat = rand*0.15
        
        let rotateAction = SKAction.rotate(byAngle: 8, duration: 3)
        
        let randomXStart = random(min: gameArea.minX + 100, max: gameArea.maxX - 100)
//      let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXStart, y: -self.size.height * 0.2)
        
        let enemyTexture = SKTexture(imageNamed: "asteroid1")
        
        let enemy = SKSpriteNode(imageNamed: "asteroid\(arc4random_uniform(11) + 1)")
        enemy.setScale(CGFloat(randFloat))
        enemy.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
        enemy.position = startPoint
        enemy.zPosition = 3
        enemy.physicsBody = SKPhysicsBody(texture: enemyTexture, alphaThreshold: 0, size: CGSize(width: enemy.size.width, height: enemy.size.height))
        enemy.physicsBody!.affectedByGravity = false
        enemy.physicsBody!.categoryBitMask = PhysicsCategories.Enemy
        enemy.physicsBody!.collisionBitMask = PhysicsCategories.None //Don't allow collision
        enemy.physicsBody!.contactTestBitMask = PhysicsCategories.Player | PhysicsCategories.Gold //If enemy hits player let me know
        self.addChild(enemy)
        
        
        let moveEnemy = SKAction.move(to: endPoint, duration: levelDuration)  //Moves enemy
        let deleteEnemy = SKAction.removeFromParent()  //Deletes enemy
        let addScoreAction = SKAction.run(addScore)  //References loseALife
        let enemyGroup = SKAction.group([moveEnemy, rotateAction])
        let enemySequence = SKAction.sequence([enemyGroup, deleteEnemy, addScoreAction])  //Enemy action sequence
        
        
        
        if currentGameState == gameState.inGame && gameScore > 0{
            enemy.run(enemySequence)
        }
        
        let dx = endPoint.x - startPoint.x
        let dy = endPoint.y - startPoint.y
        let amountToRotate = atan2(dy, dx)
        enemy.zRotation = amountToRotate
        
    }
    
    func spawnFirstEnemy(){
        
        let rand = Double(arc4random_uniform(30) + 30)
        
        let randFloat = rand*0.15
        
        let rotateAction = SKAction.rotate(byAngle: 8, duration: 3)
        
        let startPoint = CGPoint(x: self.size.height/2, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: self.size.height/2, y: -self.size.height * 0.2)
        
        let enemyTexture = SKTexture(imageNamed: "asteroid1")
        
        let enemy = SKSpriteNode(imageNamed: "asteroid\(arc4random_uniform(11) + 1)")
        enemy.setScale(CGFloat(randFloat))
        enemy.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
        enemy.position = startPoint
        enemy.zPosition = 3
        enemy.physicsBody = SKPhysicsBody(texture: enemyTexture, alphaThreshold: 0, size: CGSize(width: enemy.size.width, height: enemy.size.height))
        enemy.physicsBody!.affectedByGravity = false
        enemy.physicsBody!.categoryBitMask = PhysicsCategories.Enemy
        enemy.physicsBody!.collisionBitMask = PhysicsCategories.None //Don't allow collision
        enemy.physicsBody!.contactTestBitMask = PhysicsCategories.Player | PhysicsCategories.Gold //If enemy hits player let me know
        self.addChild(enemy)
        
        
        let moveEnemy = SKAction.move(to: endPoint, duration: levelDuration)  //Moves enemy
        let deleteEnemy = SKAction.removeFromParent()  //Deletes enemy
        let addScoreAction = SKAction.run(addScore)  //References loseALife
        let enemyGroup = SKAction.group([moveEnemy, rotateAction])
        let enemySequence = SKAction.sequence([enemyGroup, deleteEnemy, addScoreAction])  //Enemy action sequence
        
        
        
        if currentGameState == gameState.inGame{
            enemy.run(enemySequence)
        }
        
        let dx = endPoint.x - startPoint.x
        let dy = endPoint.y - startPoint.y
        let amountToRotate = atan2(dy, dx)
        enemy.zRotation = amountToRotate
        
    }
    
    func spawnShootingStar(){
        
        let randomStart = CGPoint(x: Int(arc4random_uniform(1400)), y: 2500)
        let randomEnd = CGPoint(x: Int(arc4random_uniform(1400)), y: 0)
        
        let rand = Double(arc4random_uniform(50) + 10)
        
        let randFloat = rand*0.01
        
        let shootingStar = SKSpriteNode(imageNamed: "shootingStar")
        shootingStar.setScale(CGFloat(randFloat))
        shootingStar.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
        shootingStar.position = randomStart
        shootingStar.zPosition = -2
        self.addChild(shootingStar)
        
        let moveShootingStar = SKAction.move(to: randomEnd, duration: 1.0)  //Moves enemy
        let deleteShootingStar = SKAction.removeFromParent()  //Deletes enemy
        let shootingStarSequence = SKAction.sequence([moveShootingStar, deleteShootingStar])  //Enemy action sequence
        
        shootingStar.run(shootingStarSequence)
        
        
        let dx = randomEnd.x - randomStart.x
        let dy = randomEnd.y - randomStart.y
        let amountToRotate = atan2(dy, dx)
        shootingStar.zRotation = amountToRotate
        
        
    }
    
    func spawnNewMoon(){
    
        let rand = Double(arc4random_uniform(40) + 10)
    
        let randFloat = rand*0.01
    
        let randomXStart = random(min: gameArea.minX + 100, max: gameArea.maxX - 100)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXStart, y: -self.size.height * 0.2)
        
        
        let newMoon = SKSpriteNode(imageNamed: "newMoon")
        newMoon.setScale(CGFloat(randFloat))
        newMoon.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
        newMoon.position = startPoint
        newMoon.zPosition = 1
        self.addChild(newMoon)
        
        let moveNewMoon = SKAction.move(to: endPoint, duration: 7.15)  //Moves enemy
        let deleteNewMoon = SKAction.removeFromParent()  //Deletes enemy
        let newMoonSequence = SKAction.sequence([moveNewMoon, deleteNewMoon])  //Enemy action sequence
        
        if currentGameState == gameState.inGame{
            newMoon.run(newMoonSequence)
        }

    }
    
    
    
    func spawnGalaxy(){
        
        let randomXStart = random(min: gameArea.minX + 100, max: gameArea.maxX - 100)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXStart, y: -self.size.height * 0.2)
        
        
        let galaxy = SKSpriteNode(imageNamed: "galaxy")
        galaxy.setScale(1)
        galaxy.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
        galaxy.position = startPoint
        galaxy.zPosition = 0
        self.addChild(galaxy)
        
        let moveGalaxy = SKAction.move(to: endPoint, duration: 7.15)  //Moves enemy
        let deleteGalaxy = SKAction.removeFromParent()  //Deletes enemy
        let galaxySequence = SKAction.sequence([moveGalaxy, deleteGalaxy])  //Enemy action sequence
        
        if currentGameState == gameState.inGame{
            galaxy.run(galaxySequence)
        }
    }
    
    
    
    func spawnPlanet(){
        
        let rand = Double(arc4random_uniform(34) + 9)
        
        let randFloat = rand*0.01
        
        let randomXStart = random(min: gameArea.minX + 100, max: gameArea.maxX - 100)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXStart, y: -self.size.height * 0.2)
        
        
        let planet = SKSpriteNode(imageNamed: "planet\(arc4random_uniform(12) + 1)")
        planet.setScale(CGFloat(randFloat))
        planet.name = "Enemy"  //Reference name so enemy can be called upon outside of the function
        planet.position = startPoint
        planet.zPosition = 1
        self.addChild(planet)
        
        let movePlanet = SKAction.move(to: endPoint, duration: 7.15)  //Moves enemy
        let deletePlanet = SKAction.removeFromParent()  //Deletes enemy
        let planetSequence = SKAction.sequence([movePlanet, deletePlanet])  //Enemy action sequence
        
        if currentGameState == gameState.inGame{
            planet.run(planetSequence)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.preGame{  //start the game if the user touches the screen
            startGame()
        }

        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            
            if currentGameState == gameState.inGame{  //only move the player if game state is in game
                if pointOfTouch.x > frame.midX && player.position.x > frame.minX + 400  && invertedControl == 1{
                    if chooseShip == 1 || chooseShip == 2 || chooseShip == 3{
                    let movePlayerLeft = SKAction.moveBy(x: -100, y: 0, duration: 0.2)
                    let moveLeftRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                    let moveLeftRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                    let touchRightSequence = SKAction.sequence([thrusterSound, moveLeftRotatePlayerLeft, movePlayerLeft,moveLeftRotatePlayerRight])
                    player.run(touchRightSequence)
                    }
                    if chooseShip == 4{
                        let movePlayerLeft = SKAction.moveBy(x: -200, y: 0, duration: 0.2)
                        let moveLeftRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveLeftRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        let touchRightSequence = SKAction.sequence([thrusterSound, moveLeftRotatePlayerLeft, movePlayerLeft,moveLeftRotatePlayerRight])
                        player.run(touchRightSequence)
                    }
                    if chooseShip == 5 || chooseShip == 6{
                        let movePlayerLeft = SKAction.moveBy(x: -300, y: 0, duration: 0.2)
                        let moveLeftRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveLeftRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        let touchRightSequence = SKAction.sequence([thrusterSound, moveLeftRotatePlayerLeft, movePlayerLeft,moveLeftRotatePlayerRight])
                        player.run(touchRightSequence)
                    }
                }
                
                if pointOfTouch.x > frame.midX && player.position.x < frame.maxX - 400  && invertedControl != 1{
                    if chooseShip == 1 || chooseShip == 2 || chooseShip == 3{
                        let movePlayerRight = SKAction.moveBy(x: 100, y: 0, duration: 0.2)
                        let moveRightRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveRightRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        
                        let touchLeftSequence = SKAction.sequence([thrusterSound, moveRightRotatePlayerRight, movePlayerRight, moveRightRotatePlayerLeft])
                        player.run(touchLeftSequence)
                    }
                    if chooseShip == 4{
                        let movePlayerRight = SKAction.moveBy(x: 200, y: 0, duration: 0.2)
                        let moveRightRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveRightRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        
                        let touchLeftSequence = SKAction.sequence([thrusterSound, moveRightRotatePlayerRight, movePlayerRight, moveRightRotatePlayerLeft])
                        player.run(touchLeftSequence)
                    }
                    if chooseShip == 5 || chooseShip == 6{
                        let movePlayerRight = SKAction.moveBy(x: 300, y: 0, duration: 0.2)
                        let moveRightRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveRightRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        
                        let touchLeftSequence = SKAction.sequence([thrusterSound, moveRightRotatePlayerRight, movePlayerRight, moveRightRotatePlayerLeft])
                        player.run(touchLeftSequence)
                    }
                }
                    
                else if pointOfTouch.x < frame.midX && player.position.x < frame.maxX - 400  && invertedControl == 1{
                    if chooseShip == 1 || chooseShip == 2 || chooseShip == 3{
                        let movePlayerRight = SKAction.moveBy(x: 100, y: 0, duration: 0.2)
                        let moveRightRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveRightRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                    
                        let touchLeftSequence = SKAction.sequence([thrusterSound, moveRightRotatePlayerRight, movePlayerRight, moveRightRotatePlayerLeft])
                        player.run(touchLeftSequence)
                    }
                    if chooseShip == 4{
                        let movePlayerRight = SKAction.moveBy(x: 200, y: 0, duration: 0.2)
                        let moveRightRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveRightRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        
                        let touchLeftSequence = SKAction.sequence([thrusterSound, moveRightRotatePlayerRight, movePlayerRight, moveRightRotatePlayerLeft])
                        player.run(touchLeftSequence)
                    }
                    if chooseShip == 5 || chooseShip == 6{
                        let movePlayerRight = SKAction.moveBy(x: 300, y: 0, duration: 0.2)
                        let moveRightRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveRightRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        
                        let touchLeftSequence = SKAction.sequence([thrusterSound, moveRightRotatePlayerRight, movePlayerRight, moveRightRotatePlayerLeft])
                        player.run(touchLeftSequence)
                    }
                }
                
                else if pointOfTouch.x < frame.midX && player.position.x > frame.minX + 400  && invertedControl != 1{
                    
                    if chooseShip == 1 || chooseShip == 2 || chooseShip == 3{
                        let movePlayerLeft = SKAction.moveBy(x: -100, y: 0, duration: 0.2)
                        let moveLeftRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveLeftRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        let touchRightSequence = SKAction.sequence([thrusterSound, moveLeftRotatePlayerLeft, movePlayerLeft,moveLeftRotatePlayerRight])
                        player.run(touchRightSequence)
                    }
                    if chooseShip == 4{
                        let movePlayerLeft = SKAction.moveBy(x: -200, y: 0, duration: 0.2)
                        let moveLeftRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveLeftRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        let touchRightSequence = SKAction.sequence([thrusterSound, moveLeftRotatePlayerLeft, movePlayerLeft,moveLeftRotatePlayerRight])
                        player.run(touchRightSequence)
                    }
                    if chooseShip == 5 || chooseShip == 6{
                        let movePlayerLeft = SKAction.moveBy(x: -300, y: 0, duration: 0.2)
                        let moveLeftRotatePlayerLeft = SKAction.rotate(byAngle: 0.2, duration: 0.06)
                        let moveLeftRotatePlayerRight = SKAction.rotate(byAngle: -0.2, duration: 0.06)
                        let touchRightSequence = SKAction.sequence([thrusterSound, moveLeftRotatePlayerLeft, movePlayerLeft,moveLeftRotatePlayerRight])
                        player.run(touchRightSequence)
                    }
                    
                }

            }
            
            if player.position.x > gameArea.maxX{
                player.position.x = gameArea.maxX - player.size.width
            }
            
            if player.position.x < gameArea.minX{
                player.position.x = gameArea.minX + player.size.width
            }
            
        }

    }
    
}
