# Snabbstart - Box Inventory App

## Enklaste sättet att komma igång

### Steg 1: Öppna Xcode
Starta Xcode på din Mac.

### Steg 2: Skapa nytt projekt
1. Välj **File** > **New** > **Project**
2. Välj **iOS** > **App**
3. Klicka **Next**

### Steg 3: Projektinställningar
Fyll i följande:
- **Product Name**: `BoxInventoryApp`
- **Team**: Välj ditt team (eller None)
- **Organization Identifier**: `com.dindomän` (valfritt)
- **Interface**: `SwiftUI`
- **Language**: `Swift`
- **Use Core Data**: Avmarkerad ☐
- **Include Tests**: Avmarkerad ☐

Klicka **Next** och välj var du vill spara projektet.

### Steg 4: Ersätt och lägg till filer

I Xcode, i projektnavigatorn (vänster sida), kommer du se dessa filer:
- `BoxInventoryApp.swift`
- `ContentView.swift`

**Gör så här:**

1. **Öppna** `BoxInventoryApp.swift` i Xcode
2. **Ta bort** allt innehåll
3. **Kopiera** innehållet från `BoxInventoryApp/BoxInventoryApp/BoxInventoryApp.swift`
4. **Klistra in** i Xcode

5. **Öppna** `ContentView.swift` i Xcode
6. **Ta bort** allt innehåll
7. **Kopiera** innehållet från `BoxInventoryApp/BoxInventoryApp/ContentView.swift`
8. **Klistra in** i Xcode

9. **Högerklicka** på mappen `BoxInventoryApp` (den gula mappen i Xcode)
10. Välj **New File...**
11. Välj **Swift File**, klicka **Next**
12. Namnge filen `Models`, klicka **Create**
13. **Kopiera** innehållet från `BoxInventoryApp/BoxInventoryApp/Models.swift`
14. **Klistra in** i Xcode

15. Upprepa steg 9-13 för:
    - `DataStore.swift`
    - `BoxDetailView.swift`

### Steg 5: Kör appen!
1. Välj en simulator högst upp (t.ex. "iPhone 15 Pro")
2. Tryck på **Play-knappen** (▶) eller **⌘R**
3. Vänta medan appen bygger och startar

## Första användningen

När appen startar:
1. **Lägg till din första låda**: Tryck på **+** uppe till höger
2. **Ange nummer**: T.ex. `1`
3. **Ge den ett namn**: T.ex. "Vinterkläder" (valfritt)
4. **Tryck Spara**
5. **Tryck på lådan** för att öppna den
6. **Lägg till items**: Tryck på **+**
7. Fyll i namn, antal och beskrivning

## Testdata att prova

Du kan testa med dessa exempel:

**Låda 1 - Vinterkläder**
- Vinterjacka, 2 st, Storlek M och L
- Mössa, 5 st, Olika färger
- Vantar, 3 par, Skidvantar

**Låda 2 - Julpynt**
- Julkulor, 30 st, Röda och gröna
- Julljus, 12 st, LED
- Julgransfot, 1 st, Metallstativ

**Låda 3 - Sommar**
- Badhandduk, 6 st
- Solstol, 2 st, Hopfällbara
- Parasoll, 1 st, Blå

## Tips

- **Swipe åt vänster** på en låda eller item för att ta bort den
- All data sparas automatiskt
- Du kan ge lådor beskrivande namn eller bara använda nummer
- Appen fungerar offline - all data sparas lokalt på din iPhone

## Problem?

Om appen inte kompilerar:
1. Kontrollera att alla 5 Swift-filer är tillagda i projektet
2. Se till att alla filer ligger i samma Target (BoxInventoryApp)
3. Prova **Product** > **Clean Build Folder** (⇧⌘K)
4. Starta om Xcode
