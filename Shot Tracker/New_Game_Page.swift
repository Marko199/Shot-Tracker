//
//  New_Game_Page.swift
//  Shot Tracker
//
//  Created by Greg Brooks on 2019-01-10.
//  Copyright © 2019 Greg Brooks. All rights reserved.
//

import UIKit

class New_Game_Page: UIViewController {

    // declare image view vars

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        let shot_marker_image = UIImage(named: "shot_marker.png");
        var imageView   : UIImageView!
        print(location)
        // set imageview location and size along with aspect type
        // subtrac - 50 from cord to center image under user click
        imageView = UIImageView(frame: CGRect(x: location.x - 50, y: location.y - 50, width: 100, height: 100));
        imageView.contentMode = .scaleAspectFill;
        imageView.image = shot_marker_image;
        view.addSubview(imageView);
        // log location in terms of x, y cords of useer touch
        print(location);
    }

}
