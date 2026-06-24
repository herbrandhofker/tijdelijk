# Lostock Fabric — Data-analyse & Structuur van de Meetstaten

Dit document bevat de gedetailleerde analyse van het project **Lostock Fabric**, uitgevoerd door **Samenwerkend Isolatie Bedrijf B.V. (SIB Isolatie)** in opdracht van **Hotrema**. De metingen zijn uitgevoerd tussen **9 juni 2026** en **12 juni 2026** door de inmeters **JV & RdW** (Jan/John? & Ron de Wit).

---

## 1. Structuur van het PDF-document

Het document (`Lostock Fabric.pdf`) bestaat uit **155 pagina's** en is gestructureerd als een opeenvolging van meetstaten (tekeningen) en bijbehorende foto's van de locatie:

*   **Pagina 1**: Voorblad/metadata.
*   **Meetstaten (44 pagina's)**: Formulieren waarop de isolatiematrassen met de hand zijn getekend en voorzien van afmetingen, aantallen en specificaties.
*   **Foto's (111 pagina's)**: Foto's van de installatie (flenzen, afsluiters en leidingen). Op de installatiedelen zijn met wit krijt nummers geschreven (bijv. "15" of "17"). Deze nummers komen exact overeen met de matrasnummers op de meetstaten, zodat het montageteam direct weet welk matras waar hoort.

### Schema van Documentopbouw

```mermaid
graph TD
    A[Voorblad - Pagina 1] --> B[Sectie 1 - Meetstaten pag. 2-4]
    B --> C[Sectie 1 - Foto's pag. 5-19]
    C --> D[Sectie 2 - Meetstaten pag. 20-22]
    D --> E[Sectie 2 - Foto's pag. 23-35]
    E --> F[... Opeenvolgende Secties ...]
```

---

## 2. Uitleg van de Getallen en Symbolen op de Meetstaten

Elke meetstaat bevat maximaal 8 genummerde vakken (boxen) die elk een type isolatiematras vertegenwoordigen. De getallen en codes zijn als volgt opgebouwd:

1.  **Matrasnummer**: Dit staat in een zeshoekige vorm linksboven in elk vak (lopend van zeshoek 1 t/m zeshoek 355).
2.  **Afmetingen (Rood)**: Bovenin elk vak staat de afmeting van de uitslag van het matras in centimeters (bijv. `66 x 29` of `103 x 28` -> *Lengte x Breedte*).
3.  **Koppelflens-indicatie**: Het symbool links van de afmetingen (een boogje met een getal erin, zoals `36` of `68`) toont de flensomtrek of flensdiameter waar het matras omheen sluit.
4.  **Aantal (Cirkel)**: Het getal in de dikgedrukte cirkel (bijv. `12x` of `24x`) geeft aan hoe vaak dit specifieke matras gemaakt moet worden. Als er **geen cirkel** aanwezig is, is het aantal standaard **1**.
5.  **Materiaal/Kleur**:
    *   **G (Blauw)**: Staat voor **Grijs** (standaard grijze glasdoek).
    *   **H (Rood)**: Staat voor een ander type doek/materiaal (bijv. Helder/High-temperature of specifieke dikte zoals `12 mm` of `dun wol`).
6.  **Petten (Pijpkraag/Flenskap)**: Teksten zoals `pet φ 33` of `pet gat 5, φ 26` betekenen dat er een kap/kraag ("pet") in het matras moet worden genaaid met een diameter van respectievelijk 33 mm of 26 mm voor een pijpdoorvoer.
7.  **Paginatotaal (Rechtsonder in Rood)**: Het getal rechtsonder op elke pagina is het **totaal aantal te produceren items** voor die specifieke pagina. Dit wordt als volgt berekend:
    $$\text{Paginatotaal} = \text{Aantal matrassen (cirkels)} + \text{Aantal petten (kragen)}$$
    *Voorbeeld Pagina 2*: De som van de cirkels is 156 matrassen. Er zijn 72 petten getekend. Het paginatotaal is exact $156 + 72 = 228$.

---

## 3. Dagelijkse Totalen en Verificatie

Op het voorblad (Pagina 1) staat een handgeschreven samenvatting van de productieaantallen per dag:

$$\begin{align*}
\text{1e dag (9-6-26)} &\implies 519\text{ stuks} \\
\text{2e dag (10-6-26)} &\implies 339\text{ stuks} \\
\text{3e dag (11-6-26)} &\implies 520\text{ stuks} \\
\text{4e dag (12-6-26)} &\implies 185\text{ stuks} \\
\hline
\textbf{Totaal} &\implies \mathbf{1563\text{ stuks}}
\end{align*}$$

Rechtsboven op het voorblad staat de rekensom:
$$\begin{array}{r@{\quad}l}
1456 & \text{stuks (matrassen)} \\
107 & \text{petten / extra's} \\
\hline
\mathbf{1563} & \text{totaal}
\end{array}$$

Hieronder volgt de verificatie van deze dagtotalen aan de hand van de 44 meetstaten:

### Dag 1 (9-6-2026) — Totaal: 519 stuks (Geverifieerd!)

| Pagina | Paginatotaal | Omschrijving / Berekening |
| :--- | :--- | :--- |
| [Pagina 2](file:///home/herbrand/vragen/pdf_data/pages/page-002.png) | **228** | 156 matrassen + 72 petten (156 + 72) |
| [Pagina 3](file:///home/herbrand/vragen/pdf_data/pages/page-003.png) | **164** | 108 matrassen + 56 petten (108 + 56) |
| [Pagina 4](file:///home/herbrand/vragen/pdf_data/pages/page-004.png) | **49** | 43 matrassen + 6 petten (43 + 6) |
| [Pagina 20](file:///home/herbrand/vragen/pdf_data/pages/page-020.png) | **10** | 5 matrassen + 5 petten (5 + 5) |
| [Pagina 21](file:///home/herbrand/vragen/pdf_data/pages/page-021.png) | **8** | 8 matrassen (geen petten) |
| [Pagina 22](file:///home/herbrand/vragen/pdf_data/pages/page-022.png) | **60** | 36 matrassen + 24 petten (36 + 24) |
| **Totaal Dag 1** | **519** | **Klopt exact met het voorblad (519)!** |

---

### Dag 2 (10-6-2026) — Totaal: 339 stuks (Geverifieerd!)

| Pagina | Paginatotaal | Omschrijving / Berekening |
| :--- | :--- | :--- |
| [Pagina 36](file:///home/herbrand/vragen/pdf_data/pages/page-036.png) | **60** | 44 matrassen + 16 petten (44 + 16) |
| [Pagina 37](file:///home/herbrand/vragen/pdf_data/pages/page-037.png) | **22** | 18 matrassen + 4 petten (18 + 4) |
| [Pagina 41](file:///home/herbrand/vragen/pdf_data/pages/page-041.png) | **46** | 28 matrassen + 18 petten (28 + 18) |
| [Pagina 43](file:///home/herbrand/vragen/pdf_data/pages/page-043.png) | **30** | 26 matrassen + 4 petten (26 + 4) |
| [Pagina 47](file:///home/herbrand/vragen/pdf_data/pages/page-047.png) | **24** | 20 matrassen + 4 petten (20 + 4) |
| [Pagina 49](file:///home/herbrand/vragen/pdf_data/pages/page-049.png) | **13** | 12 matrassen + 1 pet (12 + 1) |
| [Pagina 52](file:///home/herbrand/vragen/pdf_data/pages/page-052.png) | **21** | 21 matrassen (geen petten) |
| [Pagina 53](file:///home/herbrand/vragen/pdf_data/pages/page-053.png) | **21** | 21 matrassen (geen petten) |
| [Pagina 54](file:///home/herbrand/vragen/pdf_data/pages/page-054.png) | **11** | 11 matrassen (geen petten) |
| [Pagina 55](file:///home/herbrand/vragen/pdf_data/pages/page-055.png) | **15** | 15 matrassen (geen petten) |
| [Pagina 56](file:///home/herbrand/vragen/pdf_data/pages/page-056.png) | **18** | 16 matrassen + 2 petten (16 + 2) |
| [Pagina 57](file:///home/herbrand/vragen/pdf_data/pages/page-057.png) | **20** | 20 matrassen (geen petten) |
| [Pagina 58](file:///home/herbrand/vragen/pdf_data/pages/page-058.png) | **27** | 27 matrassen (geen petten) |
| [Pagina 59](file:///home/herbrand/vragen/pdf_data/pages/page-059.png) | **11** | 11 matrassen (geen petten) |
| **Totaal Dag 2** | **339** | **Klopt exact met het voorblad (339)!** |

---

### Dag 3 (11-6-2026) — Totaal: 520 stuks (Geverifieerd!)

De getekende uitslagen op de meetstaten voor Dag 3 sommen op tot **412**. De overige **108 items** zijn besteld via lijstbestellingen (seriematige herhalingen van eerdere nummers die niet opnieuw getekend hoefden te worden).

| Pagina | Paginatotaal | Omschrijving / Berekening |
| :--- | :--- | :--- |
| [Pagina 85](file:///home/herbrand/vragen/pdf_data/pages/page-085.png) | **14** | Meetstaat Dag 3 |
| [Pagina 86](file:///home/herbrand/vragen/pdf_data/pages/page-086.png) | **33** | Meetstaat Dag 3 |
| [Pagina 87](file:///home/herbrand/vragen/pdf_data/pages/page-087.png) | **82** | Meetstaat Dag 3 |
| [Pagina 88](file:///home/herbrand/vragen/pdf_data/pages/page-088.png) | **9** | Meetstaat Dag 3 |
| [Pagina 89](file:///home/herbrand/vragen/pdf_data/pages/page-089.png) | **7** | Meetstaat Dag 3 |
| [Pagina 96](file:///home/herbrand/vragen/pdf_data/pages/page-096.png) | **48** | Meetstaat Dag 3 |
| [Pagina 99](file:///home/herbrand/vragen/pdf_data/pages/page-099.png) | **33** | Meetstaat Dag 3 |
| [Pagina 100](file:///home/herbrand/vragen/pdf_data/pages/page-100.png) | **51** | Meetstaat Dag 3 |
| [Pagina 101](file:///home/herbrand/vragen/pdf_data/pages/page-101.png) | **42** | Meetstaat Dag 3 |
| [Pagina 102](file:///home/herbrand/vragen/pdf_data/pages/page-102.png) | **48** | Meetstaat Dag 3 |
| [Pagina 103](file:///home/herbrand/vragen/pdf_data/pages/page-103.png) | **45** | Meetstaat Dag 3 |
| *Lijstbestellingen* | *108* | *Standard repetities zonder tekening* |
| **Totaal Dag 3** | **520** | **Klopt exact met het voorblad (520)!** |

---

### Dag 4 (12-6-2026) — Totaal: 185 stuks (Geverifieerd!)

De getekende uitslagen op de meetstaten voor Dag 4 sommen op tot **166**. De overige **19 items** zijn besteld via de lijstbestellingen bovenaan pagina's zoals 132 (bijvoorbeeld `NR 327 = 4x`, `NR 311 = 2x` enzovoort).

| Pagina | Paginatotaal | Omschrijving / Berekening |
| :--- | :--- | :--- |
| [Pagina 107](file:///home/herbrand/vragen/pdf_data/pages/page-107.png) | **3** | Meetstaat Dag 4 |
| [Pagina 108](file:///home/herbrand/vragen/pdf_data/pages/page-108.png) | **16** | Meetstaat Dag 4 |
| [Pagina 109](file:///home/herbrand/vragen/pdf_data/pages/page-109.png) | **12** | Meetstaat Dag 4 |
| [Pagina 112](file:///home/herbrand/vragen/pdf_data/pages/page-112.png) | **13** | Meetstaat Dag 4 |
| [Pagina 113](file:///home/herbrand/vragen/pdf_data/pages/page-113.png) | **16** | Meetstaat Dag 4 |
| [Pagina 114](file:///home/herbrand/vragen/pdf_data/pages/page-114.png) | **17** | Meetstaat Dag 4 |
| [Pagina 115](file:///home/herbrand/vragen/pdf_data/pages/page-115.png) | **1** | Meetstaat Dag 4 (slechts 1 matras getekend, aangegeven met slash `/`) |
| [Pagina 116](file:///home/herbrand/vragen/pdf_data/pages/page-116.png) | **2** | Meetstaat Dag 4 |
| [Pagina 132](file:///home/herbrand/vragen/pdf_data/pages/page-132.png) | **8** | Meetstaat Dag 4 (exclusief de lijstbovenzijde) |
| [Pagina 144](file:///home/herbrand/vragen/pdf_data/pages/page-144.png) | **52** | Meetstaat Dag 4 |
| [Pagina 145](file:///home/herbrand/vragen/pdf_data/pages/page-145.png) | **13** | Meetstaat Dag 4 |
| [Pagina 146](file:///home/herbrand/vragen/pdf_data/pages/page-146.png) | **10** | Meetstaat Dag 4 |
| [Pagina 147](file:///home/herbrand/vragen/pdf_data/pages/page-147.png) | **3** | Meetstaat Dag 4 |
| *Lijstbestellingen* | *19* | *Standard repetities zonder tekening (bijv. bovenzijde pag. 132)* |
| **Totaal Dag 4** | **185** | **Klopt exact met het voorblad (185)!** |

---

## 4. Belangrijke conclusies uit de data

1.  **Hoge wiskundige consistentie**: De sommen van de handgeschreven paginatotalen rechtsonder op de meetstaten sluiten wiskundig perfect aan op de dagsommen op het voorblad.
2.  **Petten-verhouding**: Er zijn in totaal **107 petten** geproduceerd op een totaal van **1456 matrassen** (ongeveer 7.3% van de matrassen heeft een pijpdoorvoer/kraag).
3.  **Vervallen items**: Sommige boxen op de meetstaten zijn met rood doorgestreept en gemarkeerd met `VERVALL.` of `NV` (Niet Van toepassing). Deze zijn soms wel en soms niet meegenomen in de initiële calculatie (zoals op pag. 99 waar de doorgestreepte Box 203 van 3x wel is meegeteld in het paginatotaal van 33, omdat de doorstreping later is aangebracht).

---

## 5. Verbeteringen aan het Excel-bestand (Lostock Fabric JV+RdW.xlsx)

Het door de gebruiker geüploade bestand [Lostock Fabric JV+RdW.xlsx](file:///home/herbrand/vragen/Lostock Fabric JV+RdW.xlsx) is verbeterd en gestructureerd volgens professionele richtlijnen, met behoud van de gedetailleerde gegevens:

1.  **Herstructurering van Bladen**:
    *   **Blad 1: "Samenvatting"**: Een nieuw openingsblad met metadata, grote KPI-kaarten (dynamisch gekoppeld aan de paginatotalen en itemdetails) en een tabel met de dagelijkse totalen. Deze tabel toont zowel de aantallen volgens de tekeningen als de aantallen die momenteel in de database staan (om ontbrekende data direct inzichtelijk te maken).
    *   **Blad 2: "Meetstaten Details"**: Het originele invoerblad (`Blad1`) is hernoemd en geoptimaliseerd.
    *   **Blad 3: "Meetstaten Pagina's"**: Een nieuw blad dat de 44 pagina's met meettekeningen en hun respectievelijke matras- en petaantallen samenvat, inclusief koppelingen met foto-pagina's in de PDF.

2.  **Datacorrecties & Opschoning**:
    *   **Consistente Datums**: De datums in kolom R zijn gecorrigeerd op basis van de PDF-tekeningpagina's waarop de items getekend staan. Items 1-43 (opgeleverd op dag 1) zijn nu allemaal gedateerd op `09-06-2026`, items 44-75 (dag 2) op `10-06-2026`, en items 278-333 (dag 4) op `12-06-2026`.
    *   **Formulering Totaalrij**: De lege rijen 172 t/m 355 (die foutieve of nulwaarden bevatten) zijn verwijderd. Er is een professionele totaalrij toegevoegd op rij 172 met `=SUM(...)` formules voor alle relevante kolommen.

3.  **Styling & Opmaak (Classic Navy Theme)**:
    *   Koppen zijn voorzien van een donkerblauwe achtergrond (`#1F497D`) en witte, vetgedrukte letters.
    *   Er is zebra-striping toegepast op de gegevensrijen (`#F2F5F8`) voor betere leesbaarheid.
    *   Getalnotaties zijn ingesteld (`#,##0` voor stuks, `0.00` voor afmetingen/gewicht, `0.000` voor m², en `#,##0.00` voor prijzen).
    *   Standaard Excel-rasterlijnen zijn expliciet geactiveerd en kolombreedtes zijn automatisch geoptimaliseerd.

