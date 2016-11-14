//
//  FirstViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
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
            let cellColor = menuColors[indexPath.row]
            let menuImage = menuImages[indexPath.row]
            print(cellColor)
            
            cell.configureCell(name: menuItem, color: UIColor(colorWithHexValue: cellColor), imageName: menuImage)
            
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
        
        let screenHeight = UIScreen.main.bounds.height
        let tableViewHeight = screenHeight - 98
        
        if indexPath.row == 0 {
            return tableViewHeight / 2
        }
        
        return tableViewHeight / 4
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
