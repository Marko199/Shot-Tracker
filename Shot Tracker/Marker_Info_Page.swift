//
//  Marker_Info_Page.swift
//  Shot Tracker
//
//  Created by Greg Brooks on 2019-01-17.
//  Copyright © 2019 MAG Industries. All rights reserved.
//

import UIKit

class Marker_Info_Page: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var teamPickerView: UIPickerView!
    var teamPickerData: [String] = [String]()
    
    // get X, Y cords from New_Game_Page View controller
    var xCords: Int!
    var yCords: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.teamPickerView.delegate = self
        self.teamPickerView.dataSource = self
        
        // Input the data into the array
        teamPickerData = ["Team 1", "Team 2", "Team 3", "Team 4", "Team 5", "Team 6"];
        
        // MUST SET ON EACH VIEW DEPENDENT ON ORIENTATION NEEDS
        // get rotation allowances of device
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // set auto rotation to false
        appDelegate.shouldRotate = true
        
        // Do any additional setup after loading the view.

    }
    
    @IBAction func saveMarkerDataButton(_ sender: UIBarButtonItem) {
        
        //----------------------------------------
        // Refrence to saving fucntion will be placed in relation to UIAlertAction
        //_________________________________________
        
        
        // create the alert
        let saveButtonAlert = UIAlertController(title: "Back to Dashboard", message: "Would you like to save this as a new game?", preferredStyle: UIAlertController.Style.alert)
        // add Cancel action (button)
        saveButtonAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        // add Save action (button)
        // redirect to dashboard on button click
        saveButtonAlert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: {action in self.performSegue(withIdentifier: "saveMarkerSeague", sender: nil); print("X Cord of Marker:", self.xCords); print("Y Cord of Marker:", self.yCords);}))
    
        // show the alert
        self.present(saveButtonAlert, animated: true, completion: nil)
        
        //----------------------------
        //Save Cords to COld Storage
        //________________________
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in teamPickerView: UIPickerView) -> Int  {
        return 1;
    }
    
    // The number of rows of data
    func pickerView(_ teamPickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teamPickerData.count;
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ teamPickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teamPickerData[row];
    }
    
    // Capture the picker view selection
    func pickerView(teamPickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
   
    }
    
}
