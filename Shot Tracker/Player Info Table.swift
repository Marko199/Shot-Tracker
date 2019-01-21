//
//  Player Info Table.swift
//  Shot Tracker
//
//  Created by Greg Brooks on 2019-01-21.
//  Copyright © 2019 Greg Brooks. All rights reserved.
//

import Foundation
import RealmSwift


class playerInfoTable: Object {
    
    @objc dynamic var playerID: Int = 0
    @objc dynamic var jerseyNum: Int = 0
    @objc dynamic var TeamID: Int = 0
    @objc dynamic var goalCount: Int = 0
    @objc dynamic var shotCount: Int = 0
    
}
