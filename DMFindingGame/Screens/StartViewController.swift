//
//  StartViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import UIKit

/**
 1.1 Create the user interface. The app will have two screens: the start screen and the game screen. The start screen will be controlled by the `StartViewController`, and the game screes will be controlled by the `GameViewController`.  See the provided screenshots and video for how the UI should look. Feel free to customize the colors, font, etc.
 1.2 Create an IBOutlet for the high score label.
 */
class StartViewController: UIViewController {
    
    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    let gameBrain = GameBrain.shared
    
    
    /**
     3.1 Update the `highScoreLabel`'s text to be the high score from the game brain.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let highScore = CoreDataManager.shared.calculateHighScore()
        yourScoreLabel.text = "Your Score: \(gameBrain.score)"
        highScoreLabel.text = "High Score: \(highScore)"
    }
    
    /**
     4.1 Transition the user to the `GameViewController`.
     */
    @IBAction func startButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gameScreen", sender: self)
        
    }
    
    @IBAction func statsButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "statsScreen", sender: self)
    }
    
}

