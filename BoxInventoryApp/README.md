# Box Inventory App för iOS

En enkel iOS-app för att hålla reda på innehållet i numrerade lådor på vinden.

## Funktioner

- ✅ Lägg till och ta bort numrerade lådor
- ✅ Ge lådor beskrivande namn (valfritt)
- ✅ Registrera items i varje låda med namn, antal och beskrivning
- ✅ Se alla lådor sorterade efter nummer
- ✅ Automatisk sparning med UserDefaults

## Så här använder du appen

### Skapa ett Xcode-projekt

1. Öppna Xcode
2. Välj "Create a new Xcode project"
3. Välj "iOS" > "App"
4. Fyll i:
   - Product Name: `BoxInventoryApp`
   - Interface: `SwiftUI`
   - Language: `Swift`
5. Spara projektet

### Lägg till filerna

Kopiera följande filer till ditt Xcode-projekt:
- `BoxInventoryApp.swift` (ersätt den befintliga)
- `ContentView.swift` (ersätt den befintliga)
- `Models.swift`
- `DataStore.swift`
- `BoxDetailView.swift`

### Kör appen

1. Välj en simulator eller din iPhone som target
2. Tryck på Run (⌘R)

## Användning

### Lägga till en låda

1. Tryck på "+" i övre högra hörnet
2. Ange lådnummer (t.ex. 1, 2, 3...)
3. Lägg till ett namn (valfritt, t.ex. "Vinterkläder", "Julpynt")
4. Tryck "Spara"

### Registrera innehåll

1. Tryck på en låda i listan
2. Tryck på "+" för att lägga till ett item
3. Fyll i:
   - Namn (t.ex. "Julkula", "Vinterjacka")
   - Antal (t.ex. 12, 2)
   - Beskrivning (valfritt, t.ex. "Röda och gröna", "Storlek M")
4. Tryck "Spara"

### Ta bort

- Svep åt vänster på en låda eller item för att ta bort

## Tekniska detaljer

- **Platform**: iOS 14.0+
- **Framework**: SwiftUI
- **Datalagring**: UserDefaults (via Codable)
- **Språk**: Swift

## Framtida förbättringar

Möjliga tillägg om du vill utveckla appen vidare:
- Export till CSV
- Sökfunktion
- Bilder på items
- Delning mellan enheter via iCloud
- QR-koder på lådor
- Statistik och översikt
