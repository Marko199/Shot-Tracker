//
//  New Game Table.swift
//  Shot Tracker
//
//  Created by Greg Brooks on 2019-01-21.
//  Copyright © 2019 Greg Brooks. All rights reserved.
//

import Foundation
import RealmSwift


class newGameTable: Object {
    
    @objc dynamic var gameID: Int = 0
    @objc dynamic var dateGamePlayed: String = ""
    @objc dynamic var cordsID: Int = 0
    @objc dynamic var opposingTeamID: Int = 0
    @objc dynamic var homeTeamID: Int = 0
    
}
