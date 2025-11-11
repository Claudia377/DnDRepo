//
//  CustomSpellView.swift
//  DnD Spell
//
//  Created by Claudia Garofalo on 10/11/25.
//

import SwiftUI
import SwiftData

struct CustomSpellView: View {
    let levels = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let classes = ["Artificer", "Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
    
    @State private var name = ""
    @State private var level = ""
    @State private var _class = ""
    @State private var castingTime = ""
    @State private var range = ""
    @State private var duration = ""
    @State private var desc = ""
    
    @Environment(\.modelContext) var modelContext
    @Query var spells: [Spell]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                }
                
                Section {
                    Picker("Level", selection: $level) {
                        ForEach(levels, id: \.self) { level in
                            Text(level)
                        }
                    }
                }
                
                Section {
                    Picker("Class", selection: $_class) {
                        ForEach(classes, id: \.self) { _class in
                            Text(_class)
                        }
                    }
                }
                
                Section {
                     TextField("Casting Time", text: $castingTime)
                }
                
                Section {
                    TextField("Range", text: $range)
                }
                
                Section {
                    TextField("Duration", text: $duration)
                }
                
                Section {
                    TextField("Description", text: $desc)
                }
                
                Button("Save") {
                    if(!name.isEmpty ) {
                        
                    }
                }
            }.navigationTitle("Custom Spell")
        }
    }
}

#Preview {
    CustomSpellView()
}
