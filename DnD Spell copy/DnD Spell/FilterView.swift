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
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Clean All") {
                    level = 20
                    _class = ""
                    castingTime = ""
                    range = ""
                    duration = ""
                }
                
                HStack {
                    Text("Level").padding()
                    Spacer()
                    Picker("Level", selection: $level) {
                        ForEach(levels, id: \.self) { level in
                            Text("\(level)")
                        }
                    }
                }.border(Color.gray, width: 2).padding()
                
                HStack {
                    Text("Class").padding()
                    Spacer()
                    Picker("Class", selection: $_class) {
                        ForEach(classes, id: \.self) { _class in
                            Text("\(_class)")
                        }
                    }
                }.border(Color.gray, width: 2).padding()
                
                HStack {
                    Text("Action").padding()
                    Spacer()
                    Picker("Action", selection: $castingTime) {
                        ForEach(actions, id: \.self) { action in
                            Text("\(action)")
                        }
                    }
                }.border(Color.gray, width: 2).padding()
                
                HStack {
                    Text("Duration").padding()
                    Spacer()
                    Picker("Duration", selection: $duration) {
                        ForEach(durations, id: \.self) { duration in
                            Text("\(duration)")
                        }
                    }
                }.border(Color.gray, width: 2).padding()
                
                HStack {
                    Text("Range").padding()
                    Spacer()
                    Picker("Range", selection: $range) {
                        ForEach(ranges, id: \.self) { range in
                            Text("\(range)")
                        }
                    }
                }.border(Color.gray, width: 2).padding()
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
