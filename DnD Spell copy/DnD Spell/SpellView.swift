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
                ForEach(spellModel.spells) { spell in
                    NavigationLink {
                        DescriptionView()
                    } label: {
                        Text(spell.name)
                    }
                }
                ForEach(customSpells) { spell in
                    NavigationLink {
                        DescriptionView()
                    } label: {
                        Text(spell.name)
                    }
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
}

#Preview {
    SpellView()
}
