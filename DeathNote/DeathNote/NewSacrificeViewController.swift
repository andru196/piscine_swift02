//
//  NewSacrificeViewController.swift
//  DeathNote
//
//  Created by User on 27.09.2021.
//

import Foundation
import UIKit

class NewSacrificeViewController: UIViewController{
    @IBOutlet var nameField: UITextField!
    @IBOutlet var descriptionFirel: UITextField!
    @IBOutlet var dtDP: UIDatePicker!
    
    var player:PersonModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewSacrificeViewController{
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
     
    }
     
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        player = PersonModel(nameField.text!, descriptionFirel.text!)
    }
    
    @IBAction func kill(sender:UIButton) {
        player = PersonModel(nameField.text!, descriptionFirel.text!)
    }
}
