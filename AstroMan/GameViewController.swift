//
//  GameViewController.swift
//  MarvinGardenGamingFirstGame
//
//  Created by Zachary Marvin on 12/12/16.
//  Copyright © 2016 Zachary Marvin. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
import GoogleMobileAds

class GameViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var BannerView: GADBannerView!
    
    var backingAudio = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID] //need this for test devices. Maybe take away for distribution?
        BannerView.delegate = self
        BannerView.adUnitID = "ca-app-pub-5182028278298665/4701257037"
        BannerView.rootViewController = self
        BannerView.load(request)
        
        let filePath = Bundle.main.path(forResource: "Backing Audio", ofType: "mp3")
        let audioNSURL = NSURL(fileURLWithPath: filePath!)
        
        do { backingAudio = try AVAudioPlayer (contentsOf: audioNSURL as URL) }
        catch { return print("Cannot Find The Audio") }
        
        backingAudio.numberOfLoops = -1  //The -1 means it will play for ever
        backingAudio.volume = 1
        backingAudio.play()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false  //DO OR DONT SHOW FPS
            view.showsNodeCount = false  //DO OR DONT SHOW NODE COUNT
            view.showsPhysics = false
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


    
}
