//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by VIMLAN.G on 7/26/15.
//  Copyright (c) 2015 VIMLAN.G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButtonLabel: UIButton!
    
    
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        var button :UIButton
        
        for var i = 0 ; i < 9 ; i++ {
            
            button = view.viewWithTag(i) as! UIButton
            
            button.setImage(nil, forState: .Normal)
        }
        
        
        self.gameOverLabel.hidden = true
        self.playAgainButtonLabel.hidden = true
        
        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x - 400, self.gameOverLabel.center.y)
        self.playAgainButtonLabel.center = CGPointMake(self.playAgainButtonLabel.center.x - 400, self.playAgainButtonLabel.center.y)
    }
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true{
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1{
                image = UIImage(named: "cross.png")!
                activePlayer = 2
            }else{
                image = UIImage(named: "nought.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, forState: UIControlState.Normal) //we set it to sender so that it sends the button we click specifically
            // each cell can be differentiated using the tag number
            
            for combination in winningCombination{
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    var labelText = "Crosses has won!"
                    
                    if gameState[combination[0]] == 2{
                        labelText = "Noughts has won!"
                    }
                    self.gameOverLabel.backgroundColor = UIColor.yellowColor()
                    self.gameOverLabel.text = labelText
                    
                    self.gameOverLabel.hidden = false
                    self.playAgainButtonLabel.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        self.playAgainButtonLabel.center = CGPointMake(self.playAgainButtonLabel.center.x + 400, self.playAgainButtonLabel.center.y)
                    })
                    
                    
                    gameActive = false
                    
                }
            }
            var counter = 0;
            for var i = 0;i < 9; i++ {
                if gameState[i] == 1{
                    counter++
                }else if gameState[i] == 2{
                    counter++
                }
            }
            if counter == 9{
                self.playAgainButtonLabel.hidden = false
                self.gameOverLabel.hidden = false
                
                self.gameOverLabel.backgroundColor = UIColor.redColor()
                self.gameOverLabel.text = "Game Over"
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                    self.playAgainButtonLabel.center = CGPointMake(self.playAgainButtonLabel.center.x + 400, self.playAgainButtonLabel.center.y)
                })

            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.gameOverLabel.hidden = true
        self.playAgainButtonLabel.hidden = true
        
        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x - 400, self.gameOverLabel.center.y)
        self.playAgainButtonLabel.center = CGPointMake(self.playAgainButtonLabel.center.x - 400, self.playAgainButtonLabel.center.y)
    }
    
    override func viewDidLayoutSubviews() { //called when everything is created but not yet displayed on the screen
        
    }
    
    
}

