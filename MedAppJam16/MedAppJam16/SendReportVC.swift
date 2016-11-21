//
//  SendReportViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/20/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import Firebase

class SendReportViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sympLbl: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var faceImg: UIImageView!
    
    
    var feelings = ["Terrible", "Worse", "Bad", "Decent", "Good", "Great"]
    
    var channelRefHandle: FIRDatabaseHandle?
    var channels: [Channel] = []
    var channelRef: FIRDatabaseReference = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Send Update"
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        slider.value = 4
        observeChannels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sympLbl.text = "Symptoms: \(DataService.ds.user.currentSymptoms.count)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        if let refHandle = channelRefHandle {
            channelRef.removeObserver(withHandle: refHandle)
        }
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
        if channels.isEmpty {
            observeChannels()
            return
        }
        performSegue(withIdentifier: "ChatSegue", sender: channels[0])
    }
    
    func observeChannels() {
        // We can use the observe method to listen for new
        // channels being written to the Firebase DB
        channelRefHandle = channelRef.observe(.childAdded, with: { (snapshot) -> Void in
            let channelData = snapshot.value as! Dictionary<String, AnyObject>
            let id = snapshot.key
            if let name = channelData["name"] as! String!, name.characters.count > 0 {
                self.channels.append(Channel(id: id, name: name))
            } else {
                print("Error! Could not decode channel data")
            }
        })
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChatSegue" {
            if let channel = sender as? Channel {
                let navVC = segue.destination as! UINavigationController
                let chatVc = navVC.viewControllers.first as! ChatViewController
                
                chatVc.senderDisplayName = "Sarah"
                chatVc.channel = channel
                print(channel.id)
                chatVc.channelRef = FIRDatabase.database().reference().child(channel.id)
                chatVc.fromSentReport = true
                chatVc.feeling = feelings[Int(slider.value) - 1]
                chatVc.feelsNo = Int(slider.value)
            }
        }
    }
    
}
