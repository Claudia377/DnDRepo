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
                        if(filterLevel == 20) {
                            NavigationLink(destination: DescriptionView(spell: spell)) {
                                Text(spell.name).bold()
                            }
                        }
                        else {
                            if(spell.level == filterLevel) {
                                
                                NavigationLink(destination: DescriptionView(spell: spell)) {
                                    Text(spell.name).bold()
                                }
                            }
                        }
                    }
                } header: {
                    Text("5e Spells").bold().foregroundStyle(Color.brown)
                }
                
                Section {
                    ForEach(customSpells) { spell in
                        NavigationLink(destination: DescriptionView(spell: spell)) {
                            Text(spell.name)
                        }
                    }.onDelete { indexSet in delete(at: indexSet) }
                }header: {
                    Text("Custom Spells").bold().foregroundStyle(Color.brown)
                }
            }.navigationTitle("Spells")
            
                .searchable(text: $searchText, placement: .toolbar)
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
