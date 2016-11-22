//
//  TreatmentViewController.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/17/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import Firebase

class TreatmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var treatment: Treatment!
    @IBOutlet weak var tableView: UITableView!
    
    var channelRefHandle: FIRDatabaseHandle?
    var channels: [Channel] = []
    var channelRef: FIRDatabaseReference = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        observeChannels()
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
        self.navigationController!.popViewController(animated: true)
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "ChatSegue" {
            if let channel = sender as? Channel {
                let navVC = segue.destination as! UINavigationController
                let chatVc = navVC.viewControllers.first as! ChatViewController
                
                chatVc.senderDisplayName = "Sarah"
                chatVc.channel = channel
                print(channel.id)
                chatVc.channelRef = FIRDatabase.database().reference().child(channel.id)
                
                chatVc.initialText = "\(ChronoService.cs.dateTimeStr): I have questions about the following treatment: \(treatment.name)"
            }
        } else {
            let drugSideEffectsVC = segue.destination as! DrugSideEffectsViewController
            drugSideEffectsVC.drug = sender as! Drug
            
            drugSideEffectsVC.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
            drugSideEffectsVC.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            drugSideEffectsVC.title = (sender as! Drug).name
        }
        
    }

    @IBAction func askDocPressed(_ sender: Any) {
        if channels.isEmpty {
            observeChannels()
            return
        }
        performSegue(withIdentifier: "ChatSegue", sender: channels[0])
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
                cell.isUserInteractionEnabled = true
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
            return 150
        } else if indexPath.row == treatment.drugs.count + 1 {
            return 180
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
    
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func configureCell(desc: String) {
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
