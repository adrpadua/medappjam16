//
//  DrugSideEffectsViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/19/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class DrugSideEffectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var drug: Drug!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "PossibleSymptomSegue" {
            let navVC = segue.destination as! UINavigationController
            let symptomVC = navVC.viewControllers.first as! SymptomViewController
            let listSymptom = sender as! Symptom
            
            symptomVC.fromPossibleSymptomsVC = true
            symptomVC.navigationItem.rightBarButtonItem?.title = "Add"
            
            symptomVC.symptom = listSymptom
            symptomVC.navigationController?.navigationBar.topItem?.title = listSymptom.name
            symptomVC.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
            symptomVC.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        }
        
    }

}

extension DrugSideEffectsViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomTableViewCell", for: indexPath) as? SymptomTableViewCell {
                
                let cellName = drug.symptoms[indexPath.row - 1].name
                let cellColor = menuColors[0]
                print(cellColor)
                
                cell.configureCell(name: cellName, color: UIColor(colorWithHexValue: cellColor))
                
                return cell
                
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as? LabelCell {
                cell.configureCell(lbl: "May cause the following side-effects:")
                return cell
            }
            
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drug.symptoms.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            let selectedSymptom = drug.symptoms[indexPath.row - 1]
            performSegue(withIdentifier: "PossibleSymptomSegue", sender: selectedSymptom)
            
        }
    }
}

class LabelCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    func configureCell(lbl: String) {
        label.text = lbl
    }
}
