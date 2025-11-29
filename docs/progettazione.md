```mermaid
---
config:
  layout: elk
  elk: {
    nodePlacementStrategy: "NETWORK_SIMPLEX"
  }
---
graph TB
    P[Progettazione] --> Pon[Ponte]
    Pon --> Specifica
    Pon --> Codifica
    Pon ~~~ A ~~~ Div

    P -->|produce| A[Architettura]

    P --> Div[Si divide in]
    Div --> PA[Progettazione<br>architetturale]
    PA --> PA_Des1[scompone<br>in sottosistemi]
    PA -->|identifica| PRPV
    PA --> specifica --> PRPV
    Div --> PD[Progettazione<br>di dettaglio]
    PD -->|dettaglia| specifica

    A --> Def[definizione]
    Def -->|è la|SS[struttura<br>del sistema]
    Def -->|costituita| PRPV
    subgraph PRPV [ ]
        parti & relazioni --> PV(proprietà<br>visibili)
    end
    Def --> ca(considera<br>aspetti)
    ca --> funzionali
    ca -->|non| funzionali
    A -->|descritta| viste
    subgraph viste
    direction TB
        Comportamentale ~~~
        Strutturale ~~~
        Deployment
    end
    A -->|si divide in| famiglie -->|con| car_com[caratteristiche<br>comuni]
    famiglie -->|seguono| stili
    subgraph stili
    direction LR
    subgraph 1 [ ]
    direction TB
        PP[Pipes & Filter] ~~~
        Client-Server ~~~
        Master-Slave ~~~
        P2P
    end
    subgraph 2 [ ]
    direction TB
        Publish-Subscribe ~~~
        Model-View-->Controller & Presenter ~~~
        PC[Process Coordinator]
    end
    1 ~~~ 2
    end
```

# Viste

## Comportamentale

```mermaid
---
config:
  layout: elk
---
flowchart TD
    VC(Comportamentale) -->|definisce| VSSE(struttura sistema<br>a runtime) --> tramite
    subgraph tramite
    direction LR
        interfacce ~~~ componenti ~~~ connettori
        componenti -->|sono| comp_des[unità software<br>indipendente e riusabile]
        componenti --> incapsula --> funzionalità & dati
        componenti -->|fornisce punti di<br>interazione|porti
        interfacce -->|restringe<br>accesso| funzionalità
        connettori -->|collegano| porti
    end
    VC(Comportamentale) --> utile --> VU1[analisi delle caratteristiche<br>di qualità a runtime] & VU2[documentare lo<br>stile dell’architettura]
```

---

## Strutturale

```mermaid
---
config:
  layout: elk
---
graph TB
    VS(Strutturale) -->|definisce| UR[Unità di<br>realizzazione]
    VS --> utile --> AD[analisi<br>dipendenze] & PD[progettazione<br>test] & VP[valutazione<br>portabilità]
    UR --> tramite
    subgraph tramite
    direction LR
        subgraph moduli
        URM[unità software] -->|contenenti| ICR[insieme coerente<br>di responsabilità]
        end
        relazioni --> moduli
    end
```

---

## Deploymenti

```mermaid
---
config:
  layout: elk
---
graph TB
    VL["Logistica<br>(Deployment)"]
    VL -->|definisce| VLD[l'allocazione del software<br>su ambinti di esecuzione]
    VL -->|utile| valutazione --> prestazioni & affidabilità
    VLD --> tramite
    subgraph tramite
    direction LR
        subgraph Artefatti
            VLP{prodotti} --> proc[processo di<br>sviluppo software] & fun[funzionamento<br>di un sistema]
        end
        AE[Ambienti<br>esecuzione] ~~~ Artefatti
        dislocazione -->|degli| Artefatti
        dislocazione -->|negli| AE
        Artefatti -->|interconnessi| Artefatti
    end
```

# stili

## Pipes & Filter
