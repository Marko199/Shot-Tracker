//
//  ViewController.swift
//  Shot Tracker
//
//  Created by Greg Brooks on 2019-01-07.
//  Copyright © 2019 Greg Brooks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let image = UIImage(named: "shot_marker.png");
    var imageView   : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 200));
        imageView.contentMode = .scaleAspectFill;
        imageView.image = image;
        view.addSubview(imageView);
}

}
