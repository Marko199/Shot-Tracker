//
//  Goal Marker Table.swift
//  Shot Tracker
//
//  Created by Greg Brooks on 2019-01-21.
//  Copyright © 2019 Greg Brooks. All rights reserved.
//

import Foundation
import RealmSwift


class goalMarkersTable: Object {
    
    @objc dynamic var cordSetID: Int = 0
    @objc dynamic var xCordGoal: Int = 0
    @objc dynamic var yCordGoal: Int = 0
    @objc dynamic var TeamID: Int = 0
    @objc dynamic var playerID: Int = 0
    @objc dynamic var gameID: Int = 0
    
}
