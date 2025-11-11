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
            Tab("Character", systemImage: "person.fill") {
            }
            
            Tab("Spells", systemImage: "wand.and.sparkles.inverse") {
                SpellView()
            }

            Tab("Setting", systemImage: "gearshape.fill") {
            }
        }.accentColor(.brown)
    }
}

#Preview {
    ContentView()
}
