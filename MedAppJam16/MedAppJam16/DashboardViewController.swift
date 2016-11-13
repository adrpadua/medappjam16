//
//  FirstViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    
    let menuItems = ["My Symptoms", "My Treatments"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
//        doctorImageView.layer.masksToBounds = false
//        doctorImageView.layer.cornerRadius = 5.0
//        doctorImageView.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func phoneNumberBtnPressed(_ sender: Any) {
        print("Calling Doctor Chan!")
    }
}



extension DashboardViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell {
            
            let menuItem = menuItems[indexPath.row]
            
            cell.configureCell(name: menuItem, color: UIColor(colorWithHexValue: 0x7F64AF))
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
