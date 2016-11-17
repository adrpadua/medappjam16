//
//  MySymptomsViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/14/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MySymptomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if DataService.ds.user.currentSymptoms.count == 0 {
            tableView.isHidden = true
            emptyLbl.isHidden = false
        } else {
            tableView.isHidden = false
            emptyLbl.isHidden = true
        }
        
        print(DataService.ds.user.currentSymptoms.count)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddSymptomSegue", sender: nil)
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

extension MySymptomsViewController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MySymptomTableViewCell", for: indexPath) as? MySymptomTableViewCell {
            
            if DataService.ds.user.currentSymptoms.count == 0  {
                return UITableViewCell()
            }
            
            let cellName = DataService.ds.user.currentSymptoms[indexPath.row].name
            let cellRating = DataService.ds.user.currentSymptoms[indexPath.row].rating
            let cellColor = menuColors[1]
            print(cellColor)
            
            cell.configureCell(name: cellName, rating: cellRating, color: UIColor(colorWithHexValue: cellColor))
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.ds.user.currentSymptoms.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let screenHeight = UIScreen.main.bounds.height
        let tableViewHeight = screenHeight - 64
        
        return tableViewHeight / 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let symptom = symptoms[0]
        performSegue(withIdentifier: "MySymptomSegue", sender: symptom)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "AddSymptomSegue" {
            let navVC = segue.destination as! UINavigationController
            let reportSymptomVC = navVC.viewControllers.first as! ReportSymptomViewController
            
            reportSymptomVC.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
            reportSymptomVC.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            reportSymptomVC.navigationController?.navigationBar.topItem?.title = "Add a Symptom"
            reportSymptomVC.fromMySymptomsVC = true
            
            return
        }
        
        let navVC = segue.destination as! UINavigationController
        let symptomVC = navVC.viewControllers.first as! SymptomViewController
        
        symptomVC.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        symptomVC.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let listSymptom = sender as! Symptom
        symptomVC.symptom = listSymptom
        symptomVC.navigationController?.navigationBar.topItem?.title = listSymptom.name
        
    }
}
