import UIKit

class AthleteTableViewController: UITableViewController {
    
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let destination = segue.destination as? AthleteFormViewController else {fatalError("Unexpected Segue Destination")}
        
        switch segue.identifier {
            
        case "AddAthlete":
            break
            
        case "EditAthlete":
            if let indexPath = tableView.indexPathForSelectedRow {
                destination.athlete = athletes[indexPath.row]
            }
            
        default:
            fatalError("Unexpected segue identifier")
        }
        
    }
    
    @IBAction func unwindToAthleteTableViewController(segue: UIStoryboardSegue) {
        
        if let sourceViewController = segue.source as? AthleteFormViewController, let athlete = sourceViewController.athlete {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                //update athlete
                athletes[indexPath.row] = athlete
                tableView.reloadRows(at: [indexPath], with: .none)
            } else {
                
                //add athlete
                let newIndexPath = IndexPath(row: 0, section: 0)
                athletes.insert(athlete, at: 0)
                tableView.insertRows(at: [newIndexPath], with: .none)
            }
            
            //save athletes here
        }
        
    }
    
}
