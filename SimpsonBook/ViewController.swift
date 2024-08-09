//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Dilara Akdeniz on 9.08.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Simpson object
        let homer = Simpson(name: "Homer Simpson", job: "nuclear safety", image: UIImage(named: "homer")!)
        let marge = Simpson(name: "Marge Simpson", job: "housewife", image: UIImage(named: "marge")!)
        let bart = Simpson(name: "Bart Simpson", job: "student", image: UIImage(named: "bart")!)
        let lisa = Simpson(name: "Lisa Simpson", job: "student", image: UIImage(named: "lisa")!)
        let maggie = Simpson(name: "Maggie Simpson", job: "baby", image: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = mySimpsons[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

