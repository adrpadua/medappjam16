//
//  ReportSymptomViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/13/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class SymptomReferenceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var fromMySymptomsVC = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

extension SymptomReferenceViewController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomTableViewCell", for: indexPath) as? SymptomTableViewCell {
            
            let cellName = symptomNames[indexPath.row]
            let cellColor = menuColors[1]
            print(cellColor)
            
            cell.configureCell(name: cellName, color: UIColor(colorWithHexValue: cellColor))
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symptomNames.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let screenHeight = UIScreen.main.bounds.height
        let tableViewHeight = screenHeight - 64
        
        return tableViewHeight / 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var symptom: Symptom
        if indexPath.row < symptoms.count {
            symptom = symptoms[indexPath.row]
        } else {
            symptom = symptoms[0]
        }
        performSegue(withIdentifier: "SymptomSegue", sender: symptom)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navVC = segue.destination as! UINavigationController
        let symptomVC = navVC.viewControllers.first as! SymptomViewController
        let listSymptom = sender as! Symptom
        symptomVC.navigationItem.rightBarButtonItem?.title = "Add"
        
//        if (fromMySymptomsVC) {
//            symptomVC.fromMySymptomsVC = true
//            symptomVC.navigationItem.rightBarButtonItem?.title = "Add"
//        }
//        
        if DataService.ds.user.has(symptomName: listSymptom.name) {
            symptomVC.navigationItem.rightBarButtonItem?.title = "Update"
        }
        
        symptomVC.symptom = listSymptom
        symptomVC.navigationController?.navigationBar.topItem?.title = listSymptom.name
        symptomVC.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        symptomVC.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
}
