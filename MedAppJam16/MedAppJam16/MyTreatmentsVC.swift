//
//  MyTreatmentsViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/16/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MyTreatmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLbl: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if DataService.ds.user.currentTreatments.count == 0 {
            tableView.isHidden = true
            emptyLbl.isHidden = false
        } else {
            tableView.isHidden = false
            emptyLbl.isHidden = true
        }
        
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "MyTreatmentSegue" {
            let selectedTreatment = sender as! Treatment
            let myTreatmentVC = segue.destination as! TreatmentViewController
            myTreatmentVC.treatment = selectedTreatment
            myTreatmentVC.title = selectedTreatment.name
            myTreatmentVC.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
            myTreatmentVC.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        }
        
        
    }
 

}

extension MyTreatmentsViewController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TreatmentTableViewCell", for: indexPath) as? TreatmentTableViewCell {
        if DataService.ds.user.currentTreatments.count == 0  {
            return UITableViewCell()
        }
        
        let cellName = DataService.ds.user.currentTreatments[indexPath.row].name
        let cellColor = menuColors[2]
        
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
        return DataService.ds.user.currentTreatments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let screenHeight = UIScreen.main.bounds.height
        let tableViewHeight = screenHeight - 64
        
        return tableViewHeight / 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedTreatment: Treatment
        selectedTreatment = DataService.ds.user.currentTreatments[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "MyTreatmentSegue", sender: selectedTreatment)
    }
}
