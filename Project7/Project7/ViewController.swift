//
//  ViewController.swift
//  Project7
//
//  Created by ömer kumek on 22.04.2026.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString: String
        let creditsButton = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(buttonTapped))
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterTapped))
        let refreshButton =  UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTapped))
        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortTapped))
        
        navigationItem.rightBarButtonItems = [creditsButton, filterButton, refreshButton,sortButton]
        
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
            }
        }
        showError()
        
    }
    
    func parse(json : Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            tableView.reloadData()
            
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let petition = filteredPetitions[indexPath.row]
        vc.detailItem = petition
        vc.title = petition.title
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    @objc func buttonTapped(){
        
        let ac = UIAlertController(title: "Credits", message: "The data comes from the We The People API of the Whitehouse.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac,animated: true)
    }
    
    
    @objc func filterTapped(){
        let ac = UIAlertController(title: "Filter petitions", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Filter", style: .default) { [weak self, weak ac] _ in
            guard let searchText = ac?.textFields?[0].text else { return }
            
            self?.filteredPetitions = self?.petitions.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.body.localizedCaseInsensitiveContains(searchText)
            } ?? []
            
            self?.tableView.reloadData()
        }
        
        ac.addAction(submitAction)
        present(ac,animated: true)
        
    }
    @objc func refreshTapped(){
        filteredPetitions = petitions
        tableView.reloadData()
        
    }
    @objc func sortTapped() {
        filteredPetitions.sort {
            $0.signatureCount > $1.signatureCount
        }

        tableView.reloadData()
    }
    
}



