//
//  SendReportViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/20/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class SendReportViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var faceImg: UIImageView!

    var feelings = ["Terrible", "Worse", "Bad", "Decent", "Good", "Great"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Send Update"
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        slider.value = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        faceImg.image = UIImage(named: "\(currentValue)")
        label.text = "Current Feeling: \(feelings[currentValue - 1])"
    }

    @IBAction func sendUpdatePressed(_ sender: Any) {
        
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
