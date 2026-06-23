# Werkrapportage: Project Lostock Fabric
**Voor:** Ron de Wit  
**Datum:** 23 juni 2026  
**Status:** Afgerond en gecontroleerd  

> [!NOTE]
> Dit rapport geeft een beknopt overzicht van de werkzaamheden die zijn uitgevoerd om de inmeetdata van het project **Lostock Fabric** (isolatiematrassen) te structureren, te controleren en te verrijken op basis van de originele PDF-tekeningen.

---

## 1. Data-analyse & Kwaliteitscontrole
Er is een automatische audit uitgevoerd op de 168 ingevulde regels in het Excel-bestand [Lostock Fabric JV+RdW.xlsx](file:///home/herbrand/sibisolatie/Lostock%20Fabric%20JV%2BRdW.xlsx):
* **Berekeningen:** Alle bestaande Excel-formules (oppervlakte in m², gewichten en prijzen) zijn gecontroleerd. Er zijn **geen rekenfouten** of afrondingsverschillen geconstateerd.
* **Integriteit:** Er zijn geen foutmeldingen (`#VALUE!`, `#REF!`, enz.) of dubbel ingevoerde regels (dezelfde maatvoering onder hetzelfde nummer) gevonden.
* **Completheid:** Alle **48 technische tekenpagina's** uit de PDF [Lostock Fabric.pdf](file:///home/herbrand/sibisolatie/Lostock%20Fabric.pdf) zijn gecontroleerd tegen de Excel. **Alle** getekende matrassen zijn reeds verwerkt in de Excel-lijst.

---

## 2. Dataverrijking uit PDF-tekeningen
De Excel-lijst bevatte oorspronkelijk veel regels met de locatie `N/A`. Op basis van de tekeningen hebben we de Excel-lijst verrijkt met **5 nieuwe kolommen** (Kolom Q t/m U) om de herkomst en het type materiaal beter te registreren:

| Nieuwe Kolom | Omschrijving | Bron in PDF |
| :--- | :--- | :--- |
| **Verdieping** | De exacte verdieping/locatie (*Ground Floor, 2nd Floor, 2 1/2 Floor, Dak* of *Turbine Hall*). | Tekeningtitel & Sectiekop |
| **Datum** | De inmeetdatum (*09-06-2026, 10-06-2026, 11-06-2026* of *12-06-2026*). | Stempelveld / Titelblok |
| **Inmeter** | De persoon die de meting heeft uitgevoerd (zoals *Peter* of *Ron*). | Inmeet-handtekeningveld |
| **Bovendoek** | Specificatie van de bovenzijde stof (*bijv. /56, be, /0, log, YS*). | Inmeetnotities op de schets |
| **Onderdoek** | Specificatie van de onderzijde stof (*bijv. /56, J iy*). | Inmeetnotities op de schets |

### Hoe de koppeling tot stand is gekomen:
* Elk matrasnummer in de Excel (kolom C) is automatisch gematcht met de PDF-pagina waarop deze is getekend (bijvoorbeeld: matrasreeks `1` t/m `22` staat op de pagina's 2 t/m 22, de reeks `278` t/m `333` op pagina's 107 t/m 116, enz.).
* De specifieke kop- en randgegevens van die PDF-pagina's zijn vervolgens direct ingevuld in de nieuwe kolommen voor de desbetreffende matrassen.

---

## 3. Voorgestelde Vervolgstappen
1. **Snijmaten berekenen:** We kunnen de SIB-formules (zoals de overlap voor sluitingen en krimpcorrecties) via een Python-script toepassen op de Excel-data om automatisch de productiematen (binnenlengte, buitenlengte en snijhoogte) te genereren.
2. **Productiedocumenten genereren:** Op basis van de Excel-data kunnen we labels of barcodes voorbereiden voor de productieafdeling.
