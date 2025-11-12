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
    
    @Environment(\.modelContext) var modelContext
    @Query var customSpells: [Spell]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(spellModel.spells) { spell in
                        NavigationLink(destination: DescriptionView(spell: spell)) {
                            Text(spell.name).bold()
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
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button("Filter", systemImage: "slider.horizontal.3") {
                            }
                            NavigationLink {
                                CustomSpellView()
                            }label: {
                                Label("Add", systemImage: "plus.circle.fill")
                            }
                            
                        }
                    }
                }
        }//.searchable(text: $searchText, prompt: "Search by name")
        
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
