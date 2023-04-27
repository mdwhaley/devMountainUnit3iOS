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
    
    @IBOutlet weak var highScoreLabel: UILabel!
    let gameBrain = GameBrain.shared
    
    /**
     3.1 Update the `highScoreLabel`'s text to be the high score from the game brain.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        highScoreLabel.text = "High Score: \(gameBrain.highScore)"
    }
    
    /**
     4.1 Transition the user to the `GameViewController`.
     */
    @IBAction func startButton(_ sender: UIButton) {
        guard let gameVC = storyboard?.instantiateViewController(identifier: "gameScreen", creator: { coder in return GameViewController(coder: coder)})
                else {
                fatalError("Failed to load GameViewController")
        }
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
}
