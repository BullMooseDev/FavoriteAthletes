import UIKit

class AthleteFormViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete?) {
        super.init(coder: coder)
        self.athlete = athlete
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView(){
        guard let athlete = athlete else { return }
        nameTextField.text = athlete.name
        ageTextField.text = String(athlete.age)
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard
            let name = nameTextField.text,
            let ageString = ageTextField.text,
            let ageInt = Int(ageString),
            let league = leagueTextField.text,
            let team = teamTextField.text
        else { return }
        athlete = Athlete(name: name, age: ageInt, league: league, team: team)
        
        performSegue(withIdentifier: "UpdateUnwind", sender: self)
    }
}
