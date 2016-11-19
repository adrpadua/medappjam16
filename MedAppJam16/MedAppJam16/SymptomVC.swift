//
//  SymptomViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/13/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class SymptomViewController: UITableViewController {
    
    var symptom: Symptom!
    
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var warningLbl0: UILabel!
    @IBOutlet weak var warningLbl1: UILabel!
    @IBOutlet weak var warningLbl2: UILabel!
    @IBOutlet weak var warningLbl3: UILabel!
    @IBOutlet weak var ratingDescLbl: UILabel!
    @IBOutlet weak var posCausesLbl: UILabel!
    @IBOutlet weak var otcLbl: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var updateAddButton: UIBarButtonItem!
    
    var fromMySymptomsVC = false
    var fromPossibleSymptomsVC = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    @IBAction func addBtnPressed(_ sender: Any) {
        symptom.addRating()
        updateUI()
    }

    @IBAction func minusBtnPressed(_ sender: Any) {
        symptom.minusRating()
        updateUI()
    }
    
    func updateUI() {
        
        addBtn.isEnabled = symptom.rating == symptom.maxRating ? false : true
        minusBtn.isEnabled = symptom.rating == 0 ? false : true
        warningLbl0.isHidden = symptom.rating == 0 ? false : true
        warningLbl1.isHidden = symptom.rating == 1 ? false : true
        warningLbl2.isHidden = symptom.rating == 2 ? false : true
        warningLbl3.isHidden = symptom.rating == 3 ? false : true
        
        if (fromMySymptomsVC || fromPossibleSymptomsVC) {
            updateAddButton.isEnabled = symptom.rating == 0 ? false : true
        }
        
        ratingLbl.text = "\(symptom.rating)"
        
        ratingDescLbl.text = symptom.ratingDescriptions[symptom.rating]
        otcLbl.text = symptom.otcSuggestions
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateUserBtnPressed(_ sender: Any) {
        
        // if rating = 0, remove from list
        if symptom.rating == 0 {
            for index in 0...DataService.ds.user.currentSymptoms.count {
                if DataService.ds.user.currentSymptoms[index].name == symptom.name {
                    DataService.ds.user.currentSymptoms.remove(at: index)
                }
            }
        }
            
        // else update rating or add new symptom
        else {
            symptom.rating = NumberFormatter().number(from: ratingLbl.text!) as! Int
            DataService.ds.user.updateAddSymptom(symptom: symptom)
            
            if (fromMySymptomsVC) {
                dismiss(animated: true, completion: nil)
                presentingViewController?.dismiss(animated: false, completion: nil)
            } else if (fromPossibleSymptomsVC){
                dismiss(animated: true, completion: nil)
                
            }
            dismiss(animated: true, completion: nil)
            
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "PossibleCausesSegue" {
            print("pc bro")
            let causesVC = segue.destination as! PossibleCausesViewController
            causesVC.symptom = self.symptom
        }
        
        
    }
}


