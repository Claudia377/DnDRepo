//
//  DescriptionView.swift
//  DnD Spell
//
//  Created by Claudia Garofalo on 11/11/25.
//

import SwiftUI

struct DescriptionView: View {
    var spell: Spell
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(spell.name).bold().font(.title).foregroundStyle(Color.brown)
                Text("Level: ").bold() + Text("\(spell.level)")
                Text("Casting Time: ").bold() + Text(spell.castingTime)
                Text("Range: ").bold() + Text(spell.range)
                Text("Duration: ").bold() + Text(spell.duration)
                Text("Class: ").bold() + Text(spell._class)
                Text("")
                Text(spell.desc)
            }.padding()
        }
    }
}

#Preview {
    DescriptionView(spell: Spell(name: "Fire Bolt", _class: "Wizard", range: "120 feet", level: 0, desc: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn’t being worn or carried. This spell’s damage increases by 1d10 when you reach 5th level (2d10), 11th level (3d10), and 17th level (4d10).", duration: "Instantaneous", castingTime: "1 action"))
}
