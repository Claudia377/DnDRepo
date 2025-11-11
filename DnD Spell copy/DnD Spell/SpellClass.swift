//
//  SpellClass.swift
//  DnD Spell
//
//  Created by Claudia Garofalo on 07/11/25.
//

import Foundation
import SwiftData

@Model
class Spell: Identifiable {
    var id: UUID = UUID()
    public var name: String
    public var _class: String
    var range: String
    public var level: Int
    var desc: String
    var duration: String
    var castingTime: String
    
    init(id: UUID = UUID(), name: String, _class: String, range: String, level: Int, desc: String, duration: String, castingTime: String) {
        self.id = id
        self.name = name
        self._class = _class
        self.range = range
        self.level = level
        self.desc = desc
        self.duration = duration
        self.castingTime = castingTime
    }
}


