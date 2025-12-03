```mermaid
---
config:
    layout: elk
    elk: {
        considerModelOrder: "PREFER_NODES",
        forceNodeModelOrder: true
    }
---
flowchart TD

    PP[Principi di progettazione] --> gp[good practise] -- mirano --> manutenibilità & riusabilità
    manutenibilità --tipi--> correttiva[correttiva<br>20%] & migliorativa
    migliorativa --> perfettiva[perfettiva<br>60%] & adattiva[adattiva<br>20%]

    PP --> PG

    subgraph PG[Principi generali]
        IH[Information hiding] ~~~
        ADC[Astrazione di dati<br>e controllo] ~~~
        Coesione ~~~
        Disaccoppiamento
    end

    PP --> CP[Collezioni di principi] --> SOLID & GRASP
    subgraph SOLID
        S[Single Responsibility] ~~~
        O[Open Closed] ~~~
        L[Liskov Substitution] ~~~
        I[Interface Segregation] ~~~
        D[Dependency Inversion]
    end

    subgraph GRASP
        General ~~~
        Responsibility ~~~
        Assignment ~~~
        Software ~~~
        Patterns
    end

    PP --> DP

    subgraph DP[Design patterns]
        bo
    end
```

# Principi generali

## Information hiding

```mermaid
---
config:
    layout: elk
---
flowchart TD

    IH[Information hiding] --> separa --> Interfaccia["Interfaccia<br>(visibile)"] & Implementazione["Implementazione<br>(nascosta)"]
    IH --> vantaggi
    subgraph vantaggi
        Comprensibilità ~~~
        Manutenibilità ~~~
        UT[Unità per team<br>indipendenti] ~~~
        Sicurezza
    end
    IH -- diverso --> Incapsulamento --"permette ma<br>non garantisce"--> IH

```

## Astrazione

```mermaid
---
config:
    layout: elk
---
flowchart TD
    Astrazione --> dati & controllo
    controllo -- nasconde --> algoritmo
    controllo -- organizza --> librerie
    dati --> SD[Strutture dati] --> IS[Interfaccia stabile] & NF[Non puramente<br>funzionale]
```

## Coesione

```mermaid
---
config:
    layout: elk
---
flowchart LR
    Coesione -- delle --> funzionalità -- appartenenti --> Modulo
    Coesione -- per ogni --> modulo -- "uno ed<br>un solo" --> concetto
    Coesione --> tipi --> funzionale & comunicativa & procedurale & temporale & logica & accidentale
    funzionale --> fun[stessa<br>funzione]
    funzionale --> ideale
    comunicativa -- "stessi<br>dati" --> input & output
    comunicativa -- svantaggio --> sr[svavorisce<br>riuso]
    procedurale --> pp[passi di una<br>procedura]
    procedurale --> svantaggi --> cd[coesione<br>debole] & sr
    temporale --> et[eseguite nello stesso<br>arco di tempo]
    temporale --> svantaggi
    logica --> clnf[correlati logicamente ma<br>non funzionalmente]
    logica --> svantaggi
    accidentale --> peggiore
```

## Disaccoppiamento

```mermaid
---
config:
    layout: elk
---
graph TD

Disaccoppiamento -- non --> Accoppiamento
Accoppiamento --> daf_ac[legame tra unità<br>di progettazione]
Disaccoppiamento --> vantaggi --> imp_mod[impatto modifiche<br>limitato per ogni<br>componente] & man[migliore<br>manutenibilità]
```

## Mantra

```mermaid
---
config:
    layout: elk
---
graph TD

HCLC[HIGH COHESION<br>&<br>LOW COUPLING]
HCLC --> facilità --> riuso & manutenibilità
HCLC -- riduce --> interazioni -- tra --> sotto-sistemi
HCLC -- migliora --> comprensibilità
```

# Collezioni di principi

## SOLID

```mermaid
---
config:
    layout: elk
    elk: {
        forceNodeModelOrder: true
    }
---
graph LR
S[Single<br>Responsibility]
O[Open<br>Closed]
L[Liskov<br>Substitution]
I[Interface<br>Segregation]
D[Dependency<br>Inversion]

S --> CF["<a href="#coesione">Coesione<br>funzionale</a>"]
S --> Eccezioni --> RL[Responsabilità<br>legate]
RL --> NC[Cambiare una<br>responsabilità] -- comporterebbe --> ma[la modifica<br>delle altre]
RL --> Separarle -- introdurrebbe -->CNN[complessità<br>non necessaria]

O --> entità --> chiuse --per--> modifica
entità --> aperte --per--> estensione
O --> CR[cambiamento<br>requisito] --> estensione
L --> CD[classi<br>derivate] -- sostituzione --> CB[classi<br>base]
I --> Interfacce -- contengono --> MN[Solo i metodi<br>necessari]
I --> I_ent[entità] -- "non<br>dipendono" --> In[Interfacce]-- che --> nu[non<br>usano]
D --> astrazioni -- "non<br>dipendono" --> dettagli
```

## GRASP

```mermaid
---
config:
    layout: elk
    elk: {
        forceNodeModelOrder: true
    }
---
graph LR
    GRASP -- guidato dai -->CU[casi<br>d'uso]
    GRASP --> su[si usano] --> di[diagrammi<br>di interazione] & pattern
    GRASP -- si assegnano --> responsabilità -- alle --> classi
    responsabilità -- legate --> dominio
    responsabilità -- sono --> obblighi
    obblighi -- di un --> oggetto
    obblighi -- definiti --> comportamento
    responsabilità --> tipi --> fare & conoscere
    fare --> azione
    conoscere --> dati & OC[oggetti<br>collegati]
    metodi -- implementati<br>per soddisfare --> responsabilità
```

# Design Patterns
