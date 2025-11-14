//
//  SpellView.swift
//  DnD Spell
//
//  Created by Claudia Garofalo on 07/11/25.
//

import SwiftUI
import SwiftData

struct SpellView: View {
    @State var isPresented: Bool = false
    var spellModel: SpellModel = SpellModel()
    @State var searchText: String = ""
    
    @State var filterLevel: Int = 20
    @State var filterDuration: String = ""
    @State var filterCastingTime: String = ""
    @State var filterClass: String = ""
    @State var filterRange: String = ""
    
    @Environment(\.modelContext) var modelContext
    @Query var customSpells: [Spell]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(spellModel.spells) { spell in
                        if((spell.level == filterLevel || filterLevel == 20)
                           && (spell._class == filterClass || filterClass == "")
                           && (spell.castingTime == filterCastingTime || filterCastingTime == "")
                           && (spell.duration == filterDuration || filterDuration == "")
                           && (spell.range == filterRange || filterRange == "")) {
                            NavigationLink(destination: DescriptionView(spell: spell)) {
                                VStack(alignment: .leading) {
                                    Text(spell.name).font(.title2).bold()
                                    Text("Level: \(spell.level)")
                                }
                            }
                        }
                    }
                } header: {
                    Text("5e Spells").foregroundStyle(Color.brown).font(.system(size: 25, weight: .bold))
                }
                
                Section {
                    ForEach(customSpells) { spell in
                        if((spell.level == filterLevel || filterLevel == 20)
                           && (spell._class == filterClass || filterClass == "")
                           && (spell.castingTime == filterCastingTime || filterCastingTime == "")
                           && (spell.duration == filterDuration || filterDuration == "")
                           && (spell.range == filterRange || filterRange == "")) {
                            NavigationLink(destination: DescriptionView(spell: spell)) {
                                VStack(alignment: .leading) {
                                    Text(spell.name).font(.title).bold()
                                    Text("Level: \(spell.level)")
                                }
                            }
                        }
                    }.onDelete { indexSet in delete(at: indexSet) }
                }header: {
                    Text("Custom Spells").foregroundStyle(Color.brown).font(.system(size: 25, weight: .bold))
                }
            }.navigationTitle("Spells")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            NavigationLink {
                                FilterView(level: $filterLevel, _class: $filterClass, castingTime: $filterRange, range: $filterDuration, duration: $filterCastingTime)
                            }label: {
                                Label("Filter", systemImage: "slider.horizontal.3")
                            }
                            
                            NavigationLink {
                                CustomSpellView()
                            }label: {
                                Label("Add", systemImage: "plus.circle.fill")
                            }
                        }
                    }
 
                }
        }
        
    }
    
    func delete (at offset: IndexSet) {
        for index in offset {
            let spell = customSpells[index]
            modelContext.delete(spell)
        }
    }
}

#Preview {
    SpellView()
}
