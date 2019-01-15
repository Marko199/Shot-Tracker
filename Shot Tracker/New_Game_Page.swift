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
    let rinkImage = UIImage(named: "ice_rink_image.png");
    // _______________future values to be used________________
    //let rinkMiniImage = UIImage(named: "mini_ice_rink_image.png");
   // let RinkimageView = UIImageView(image: #imageLiteral(resourceName: "ice_rink_image"))
    //let MiniRinkimageView = UIImageView(image: #imageLiteral(resourceName: "mini_ice_rink_image"))
    //_________________________________________________________
    var shotMarkerimageView   : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    // testing orientation of device for uiimage view rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            
            //return UIDevice.current.orientation.isLandscape = true;
            print("Device is in Landscape")
            
        } else {
            
            print("Device is in Portrait")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        
        print(location)
        
        //let iceRinkMargins = RinkimageView.layoutMarginsGuide

        // check to see placement of marker is inside ice surface
        if (location.y >= 73.00){
            // set imageview location and size along with aspect type
            // subtrac - 50 from cord to center image under user click
            shotMarkerimageView = UIImageView(frame: CGRect(x: location.x - 50, y: location.y - 50, width: 100, height: 100));
            print(shotMarkerimageView)
            shotMarkerimageView.contentMode = .scaleAspectFill;
            shotMarkerimageView.image = shot_marker_image;
            view.addSubview(shotMarkerimageView);
            // log location in terms of x, y cords of useer touch
            print(location);
        }
        // if marker goes outisde ice surface zone in terms of IF statement restrictions
        else {
            
            boundaryAlert();

        }
            
            
    }
    

}




