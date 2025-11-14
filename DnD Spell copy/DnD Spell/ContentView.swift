//
//  ContentView.swift
//  DnD Spell
//
//  Created by Claudia Garofalo on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Spells", systemImage: "wand.and.sparkles.inverse") {
                SpellView()
            }

            Tab("Character", systemImage: "person.fill") {
            }
            
            Tab("Setting", systemImage: "gearshape.fill") {
            }
            
            Tab(role: .search) {
                SpellView()
            }
        }.accentColor(.brown)
        
    }
}

#Preview {
    ContentView()
}
