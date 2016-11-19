//
//  TreatmentViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/17/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class TreatmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var treatment: Treatment!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
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
        
        let drugSideEffectsVC = segue.destination as! DrugSideEffectsViewController
        drugSideEffectsVC.drug = sender as! Drug
        
        drugSideEffectsVC.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        drugSideEffectsVC.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        drugSideEffectsVC.title = (sender as! Drug).name
    }

}

extension TreatmentViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TreatmentDescriptionCell")  as? TreatmentDescriptionCell  {
                cell.configureCell(desc: treatment.desc)
                cell.isUserInteractionEnabled = false
                return cell
            }
            
        } else if indexPath.row < treatment.drugs.count + 1 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DrugCell")  as? DrugCell  {
                cell.configureCell(name: treatment.drugs[indexPath.row - 1].name)
                cell.selectionStyle = .default
                return cell
            }
            
        } else {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsCell")  as? QuestionsCell  {
                cell.isUserInteractionEnabled = false
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treatment.drugs.count + 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 170
        } else if indexPath.row == treatment.drugs.count + 1 {
            return 170
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDrug = treatment.drugs[indexPath.row - 1]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "PossibleSymptomsSegue", sender: selectedDrug)
    }
}

class TreatmentDescriptionCell: UITableViewCell {
    
    
    @IBOutlet weak var whatThisMeans: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func configureCell(desc: String) {
        whatThisMeans.text = "What this means:"
        descriptionLbl.text = desc
    }

    
}

class DrugCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    
    func configureCell(name: String) {
        self.nameLbl.text = name
    }
}

class QuestionsCell: UITableViewCell {
    
    
    
}
