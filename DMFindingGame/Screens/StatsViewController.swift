//
//  StatsViewController.swift
//  DMFindingGame
//
//  Created by Michael Whaley on 5/10/23.
//

import UIKit

//var scoreArray = CoreDataManager.shared.fetchScores()

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    override func viewDidLoad() {
        super.viewDidLoad()
        CoreDataManager.shared.fetchScores()
        configureTableView()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        CoreDataManager.shared.fetchScores()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataManager.shared.scoreArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)
        
        cell.textLabel?.text = "\(CoreDataManager.shared.scoreArray[indexPath.row].score)"
        
        return cell
    }
    
    
    @IBAction func exitStatsPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBOutlet weak var scoreTable: UITableView!
    
    
    func configureTableView() {
        scoreTable.delegate = self
        scoreTable.dataSource = self
    }
    
    
}
    
    
        
        
        
    

