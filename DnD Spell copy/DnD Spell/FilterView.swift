//
//  FilterView.swift
//  DnD Spell
//
//  Created by Claudia Garofalo on 12/11/25.
//

import SwiftUI

struct FilterView: View {
    let levels = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let classes = ["Artificer", "Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
    let actions = ["1 action", "1 bonus action", "1 reaction", "1 minute", "10 minutes", "1 hour"]
    let durations = ["Instantaneous", "1 round", "10 minutes", "1 hour"]
    let ranges = ["Self", "Touch", "150 feet"]
    
    @Binding var level: Int
    @Binding var _class: String
    @Binding var castingTime: String
    @Binding var range: String
    @Binding var duration: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Clean All") {
                    level = 20
                    _class = ""
                    castingTime = ""
                    range = ""
                    duration = ""
                }.padding().accentColor(Color.brown).font(.title2)
                
                Form {
                    HStack {
                        Picker("Level", selection: $level) {
                            ForEach(levels, id: \.self) { level in
                                Text("\(level)")
                            }
                        }.padding().pickerStyle(.menu).accentColor(Color.brown)
                        
                        Spacer()
                        
                        Button("", systemImage: "x.circle") {
                            level = 20
                        }.accentColor(Color.brown).font(.title2)
                    }.contentShape(Rectangle())
                    
                    HStack {
                        Picker("Class", selection: $_class) {
                            ForEach(classes, id: \.self) { _class in
                                Text("\(_class)")
                            }
                        }.padding().pickerStyle(.menu).accentColor(Color.brown)
                        
                        Button("", systemImage: "x.circle") {
                            _class = ""
                        }.accentColor(Color.brown).font(.title2)
                    }
                    
                    HStack{
                        Picker("Action", selection: $castingTime) {
                            ForEach(actions, id: \.self) { action in
                                Text("\(action)")
                            }
                        }.padding().pickerStyle(.menu).accentColor(Color.brown)
                        
                        Button("", systemImage: "x.circle") {
                            castingTime = ""
                        }.accentColor(Color.brown).font(.title2)
                    }
                    
                    HStack{
                        Picker("Duration", selection: $duration) {
                            ForEach(durations, id: \.self) { duration in
                                Text("\(duration)")
                            }
                        }.padding().pickerStyle(.menu).accentColor(Color.brown)
                        
                        Button("", systemImage: "x.circle") {
                            range = ""
                        }.accentColor(Color.brown).font(.title2)
                    }
                    
                    HStack {
                        Picker("Range", selection: $range) {
                            ForEach(ranges, id: \.self) { range in
                                Text("\(range)")
                            }
                        }.padding().pickerStyle(.menu).accentColor(Color.brown)
                        
                        Button("", systemImage: "x.circle") {
                            duration = ""
                        }.accentColor(Color.brown).font(.title2)
                    }
                }.scrollContentBackground(.hidden)
                
                Button("Apply") {
                    dismiss()
                }.accentColor(Color.brown).font(.title2).padding()
            }
        }
    }
}

#Preview {
    @Previewable @State var filterLevel = 20
    @Previewable @State var filterDuration = ""
    @Previewable @State var filterCastingTime = ""
    @Previewable @State var filterRange = ""
    @Previewable @State var filterClass = ""
    FilterView(level: $filterLevel, _class: $filterDuration, castingTime: $filterRange, range: $filterCastingTime, duration: $filterClass)
}
