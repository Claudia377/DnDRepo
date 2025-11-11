//
//  DnD_SpellApp.swift
//  DnD Spell
//
//  Created by Claudia Garofalo on 07/11/25.
//

import SwiftUI
import SwiftData

@main
struct DnD_SpellApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Spell.self)
    }
}
