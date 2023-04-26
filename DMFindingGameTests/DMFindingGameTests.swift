//
//  DMFindingGameTests.swift
//  DMFindingGameTests
//
//  Created by David Ruvinskiy on 3/1/23.
//

import XCTest
@testable import DMFindingGame

final class DMFindingGameTests: XCTestCase {
    
    func testGameplay() {
        let gameBrain = GameBrain.shared
        
        for _ in 1...100 {
            let numLetters = Int.random(in: 1...12)
            gameBrain.newGame(numLetters: numLetters)
            let oldHighScore = gameBrain.highScore
            
            XCTAssertEqual(gameBrain.randomLetters.count, numLetters)
            XCTAssertEqual(Set(gameBrain.randomLetters).count, gameBrain.randomLetters.count)
            XCTAssertTrue(gameBrain.randomLetters.contains(gameBrain.targetLetter))
            XCTAssertEqual(gameBrain.score, 0)
            
            for _ in 1...50 {
                let oldScore = gameBrain.score
                
                let userChoseCorrectLetter = Bool.random()
                
                if userChoseCorrectLetter {
                    gameBrain.letterSelected(letter: gameBrain.targetLetter)
                    XCTAssertEqual(gameBrain.score, oldScore + 1)
                } else {
                    let filteredArray = gameBrain.letters.filter { $0 != gameBrain.targetLetter }
                    let randomLetter = filteredArray.randomElement()!
                    gameBrain.letterSelected(letter: randomLetter)
                    XCTAssertEqual(gameBrain.score, oldScore)
                }
                
                XCTAssertEqual(gameBrain.highScore, max(oldHighScore, gameBrain.score))
            }
        }
    }
}
