//
//  ViewController.swift
//  DeathNote
//
//  Created by User on 27.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar!
    
    var persons: [PersonModel]! = [PersonModel("Marck Smith", "Dead in fisting ass"),
                                   PersonModel("John Big", "Too big cock"),
                                   PersonModel("Bruice Dead", "Just old")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PersonTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hw")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell",
                                      for: indexPath) as! PersonTableViewCell
        cell.nameLabel.text = persons[indexPath.row].name
        cell.DescLabel.text = persons[indexPath.row].descripton
        
        return cell
    }
}

extension ViewController: UINavigationBarDelegate{
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
      if let playerDetailsViewController = segue.source as? NewSacrificeViewController {
          
          persons.append(playerDetailsViewController.player)
     
          let indexPath = IndexPath(row: persons.count-1, section: 0)
            tableView.insertRows(at:[indexPath], with: .automatic)
      }
    }}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
