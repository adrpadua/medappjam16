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
    @IBOutlet weak var ratingDescLbl: UILabel!
    @IBOutlet weak var otcLbl: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
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
        
        addBtn.isHidden = symptom.rating == symptom.maxRating ? true : false
        minusBtn.isHidden = symptom.rating == 0 ? true : false
        
        ratingLbl.text = "\(symptom.rating)"
        ratingDescLbl.text = symptom.ratingDescriptions[symptom.rating]
        otcLbl.text = symptom.otcSuggestions
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateUserBtnPressed(_ sender: Any) {
        // if rating = 0, remove from list
        
        // else update rating or add new symptom
    }
    
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
