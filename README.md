# DnDRepo

📖 Spellbook – 5e Spells & Custom Manager
Spellbook is an app developed in SwiftUI and SwiftData that allows you to browse, filter and create spells for Dungeons & Dragons 5e.
It includes a built-in list of official spells and lets you add, save and view custom spells through a simple and intuitive interface.

✨ Main Features
🔍 Spell Browsing
Complete list of base spells provided by SpellModel.
A separate section for Custom Spells, saved via SwiftData.
Quick navigation to each spell’s detail page through NavigationLink.

🪄 Creating Custom Spells
The CustomSpellView allows you to:
    >Enter name, level, class, casting time, range, duration, and description.
    >Save the spell in the local database (modelContext).
    >Ensure all fields are filled, showing an alert otherwise:
        "Empty entries! Please make sure to fill in all of them."

🎛️ Advanced Filtering System
The FilterView allows you to filter spells by:
    >Level
    >Class
    >Casting Time
    >Duration
    >Range
Filters can be:
    >Reset through the Clean All button or the dedicated (X) button
    >Applied to update the main spell list

📝 Spell Detail Page
The DescriptionView shows:
    >Name
    >Level
    >Class
    >Casting Time
    >Range
    >Duration
    >Description
It also includes an Edit button that navigates to the creation screen (currently not connected to editing an existing spell, but planned as a future improvement).

🗑️ Deleting Custom Spells
In the “Custom Spells” section you can:
    >Delete a spell using swipe-to-delete
    >Remove it from the database using modelContext.delete

🧩 Project Structure
SpellView.swift          → main screen with list + filters  
CustomSpellView.swift    → creation of new custom spells  
DescriptionView.swift    → detail view for a single spell  
FilterView.swift         → multi-parameter filter system  
Spell.swift              → SwiftData model for spells  
SpellModel.swift         → static model with predefined spells

🚀 Technologies Used
SwiftUI – modern and reactive UI
SwiftData – local persistence for custom spells
NavigationStack / NavigationView – smooth navigation
Form, Picker, List, Alert – modern UI components

🛠️ Future Improvements
    >Actual editing of custom spells (modify saved fields)
    >Search bar to filter spells by name
