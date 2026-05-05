import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var askedQuestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia", "spain", "uk", "us"]

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        updateScore()
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = countries[correctAnswer].uppercased()
    }

    func updateScore() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Score: \(score)",
            style: .plain,
            target: self,
            action: #selector(showScoreTapped)
        )
    }

    @objc func showScoreTapped(){
        let scoreAllert : String = "Your Score"
        let showScoreAllert = UIAlertController(title:scoreAllert , message: "your score is \(score)", preferredStyle:.alert)
        showScoreAllert.addAction(UIAlertAction(title: "OK", style: .default))
            present(showScoreAllert , animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        let alertTitle: String
        let message: String

        if sender.tag == correctAnswer {
            alertTitle = "Correct"
            score += 1
            message = "Your score is \(score)"
        } else {
            alertTitle = "Wrong"
            score -= 1
            message = "Wrong! That’s the flag of \(countries[sender.tag].uppercased()).\nYour score is \(score)"
        }

        askedQuestion += 1
        updateScore()

       
        if askedQuestion == 10 {
            let finalAC = UIAlertController(
                title: "Game Over",
                message: "Final score is \(score)",
                preferredStyle: .alert
            )

            finalAC.addAction(UIAlertAction(title: "Restart", style: .default) { [weak self] _ in
                guard let self = self else { return }
                self.score = 0
                self.askedQuestion = 0
                self.updateScore()
                self.askQuestion()
            })

            present(finalAC, animated: true)
            return
        }

        
        let ac = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

