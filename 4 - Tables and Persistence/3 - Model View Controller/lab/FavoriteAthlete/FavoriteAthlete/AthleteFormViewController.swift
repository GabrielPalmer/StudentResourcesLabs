//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Gabriel Blaine Palmer on 10/24/18.
//

import UIKit

class AthleteFormViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    var athlete: Athlete?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView() {
        guard let athlete = athlete else {return}
        
        nameTextField.text = athlete.name
        ageTextField.text = String(athlete.age)
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        var name: String
        if nameTextField.text == "" {
            name = "<no name>"
        } else {
            name = nameTextField.text ?? "<no name>"
        }
        
        var age: Int
        if ageTextField.text == "" {
            age = 0
        } else {
            age = Int(ageTextField.text!)!
        }
        
        var league: String
        if leagueTextField.text == "" {
            league = "<no name>"
        } else {
            league = leagueTextField.text ?? "<no league>"
        }
        
        var team: String
        if teamTextField.text == "" {
            team = "<no team>"
        } else {
            team = teamTextField.text ?? "<no team>"
        }
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
    }
 
}
