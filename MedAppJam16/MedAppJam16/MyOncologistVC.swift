//
//  MyOncologistViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/19/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MyOncologistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension MyOncologistViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for:  indexPath) as? DoctorCell {
                let currentDoctor = DataService.ds.user.doctor
                cell.isUserInteractionEnabled = false
                cell.configureCell(name: currentDoctor.name, hospital: currentDoctor.hospital,  address: currentDoctor.address)
                return cell
            }
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommunicationCell", for:  indexPath) as? CommunicationCell {
            let currentDoctor = DataService.ds.user.doctor
            var imageName: String
            var label: String
            if indexPath.row == 1 {
                imageName = "phone-call"
                label = "Phone Call"
            } else {
                imageName = "chat"
                label = "Chat"
            }
            
            cell.configureCell(imageName: imageName, label: label)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 0 {
            return 100
        }
        return 170
    }
}

class DoctorCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var hospitalLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    func configureCell(name: String, hospital: String, address: String) {
        self.iconView.image = UIImage(named: "menu3")
        self.nameLbl.text = name
        self.hospitalLbl.text = hospital
        self.addressLbl.text = address
    }
}

class CommunicationCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func configureCell(imageName: String, label: String) {
        self.iconView.image = UIImage(named: imageName)
        self.label.text = label
    }
}
