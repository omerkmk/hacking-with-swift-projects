//
//  ViewController.swift
//  Project1
//
//  Created by ömer kumek on 26.01.2026.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendTapped))

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl"){
                // this is a picture loaded
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. ADIM: "Detail" taslağından bir nesne oluştur ve onun bizim DetailViewController olduğunu doğrula.
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // 2. ADIM: Detay ekranı henüz ekranda değil ama bellekte oluştu.
            // İçindeki boş "selectedImage" değişkenine resmin adını gönderiyoruz.
            vc.selectedImage = pictures[indexPath.row]
            
            // 3. ADIM: Artık verisi dolu olan bu ekranı kullanıcının önüne it (push).
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func recommendTapped(){
        let message : String = "Try this app this aplication is very good for you"
        let vc = UIActivityViewController(activityItems: [message], applicationActivities:[])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
}
    


    



