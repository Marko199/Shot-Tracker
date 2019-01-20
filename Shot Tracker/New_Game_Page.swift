//
//  New_Game_Page.swift
//  Shot Tracker
//
//  Created by Greg Brooks on 2019-01-10.
//  Copyright © 2019 MAG Industries. All rights reserved.
//

import UIKit

class New_Game_Page: UIViewController {

    // declare image view vars
    let shot_marker_image = UIImage(named: "shot_marker.png");
    let goal_marker_image = UIImage(named: "goal_marker.png");
    let rinkImage = UIImage(named: "ice_rink_image.png");
    //var shot_marker_image: UIImage = UIImage(named: "shot_marker.png")!;
    
    var yLocationCords: Int = 0
    var xLocationCords: Int = 0
 
    var shotMarkerimageView   : UIImageView!
    var goalMarkerimageView   : UIImageView!
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        
        //print(location)
        
        yLocationCords = Int(location.y)
        xLocationCords = Int(location.x)

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // check Tap gestuires for a single tap
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapped));
        // number of taps require 1
        singleTap.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTap)
        
        // check Tap gestuires for a double tap
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(longTapped));
        //long tap must exceed 0.5 seconds
        longTap.minimumPressDuration = 0.5
        //longTap.delaysTouchesBegan = true
        view.addGestureRecognizer(longTap)
    
        // MUST SET ON EACH VIEW DEPENDENT ON ORIENTATION NEEDS
        // get rotation allowances of device
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // set auto rotation to false
        appDelegate.shouldRotate = false
    
    
    }
    
    
    func markerProcessing(markerType: UIImage){
        
        //---------------------------------------------
        // on each view controller load print all markers
        //______________________________________________
        
        goalMarkerimageView = UIImageView(frame: CGRect(x: xLocationCords - 25, y: yLocationCords - 25, width: 50, height: 50));
        print(goalMarkerimageView)
        goalMarkerimageView.contentMode = .scaleAspectFill;
        goalMarkerimageView.image = markerType;
        view.addSubview(goalMarkerimageView);
        print("Makerker Placed")
        
    }
    
    
    // single tap function applies black x to ice surface when gesture returns correct
    @objc func singleTapped() {
        print("Single Tap Detected")
        
        if (yLocationCords >= 73){
           
            
            markerAlert();
            //------------------------
            // Pass Cords to Maker INfo Page
            // __________________________
        }
            // if marker goes outisde ice surface zone in terms of IF statement restrictions
        else {
            
            boundaryAlert();
            
        }
    }
    // double tap function applies red x to ice surface when gesture returns correct
    @objc func longTapped() {
        print("Double Tap Detected")
        if (yLocationCords >= 73){

            markerAlert();
        }
            // if marker goes outisde ice surface zone in terms of IF statement restrictions
        else {
            
            boundaryAlert();
            
        }
    }
    
    // action when clicking done button
    @IBAction func doneButton(_ sender: Any) {
        
        // create the alert
        let doneButtonAlert = UIAlertController(title: "Back to Dashboard", message: "Would you like to save this as a new game?", preferredStyle: UIAlertController.Style.alert)
        // add Cancel action (button)
        doneButtonAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        // add Save action (button)
        // redirect to dashboard on button click
        doneButtonAlert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: {action in self.performSegue(withIdentifier: "newGameSegue", sender: nil);}))
        // show the alert
        self.present(doneButtonAlert, animated: true, completion: nil)
        
        
    }
    
    
    // bounbdary alert func displays error messagfe to user based on wrong marker placement
    func boundaryAlert(){
        
        // create the alert
        let navBarAlert = UIAlertController(title: "Placement Error", message: "Cannot Place Marker Outside of Ice Surface.", preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        navBarAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(navBarAlert, animated: true, completion: nil)
        
    }

    func markerAlert(){
        
        // create the alert
        let markerPlacementAlert = UIAlertController(title: "Ice Surface Interaction", message: "Please Select Corresponding Player Data Based on Ice Surface Interaction", preferredStyle: UIAlertController.Style.alert)
        // add Cancel action (button)
        markerPlacementAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        // add Save action (button)
        markerPlacementAlert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: {action in self.performSegue(withIdentifier: "newMarkerSegue", sender: nil);}))
        // show the alert
        self.present(markerPlacementAlert, animated: true, completion: nil);
        
    }
    // func used to pass varables on segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check is appropriate segue is being used
        if (segue.identifier == "saveMarkerSeague"){
            // set var vc as destination segue
            let vc = segue.destination as! Marker_Info_Page
            //let new_vc = segue.destination as! New_Game_Page
            vc.xCords = xLocationCords
            vc.yCords = yLocationCords
        }
    }
    
}




