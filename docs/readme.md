# Processo software

```mermaid
---
config:
  layout: elk
---
flowchart LR
    PS(Processo software) -->|definizione| def_PS(sequenza di attività necessarie a sviluppare un sistema software)
    PS --> fasi
    subgraph fasi
        direction TB
        AR(Analisi dei requisiti) ~~~
        Specifica ~~~
        Progettazione ~~~
        Implementazione ~~~
        Integrazione ~~~
        Mantenimento ~~~
        Ritiro
    end
    PS --> modelli -->|definizione| def_mod(rappresentazione astratta del processo stesso)
    modelli --> tipi --> prescrittivi
    subgraph prescrittivi
        subgraph sequenziali
            direction TB
            Cascata ~~~
            ModV(Modello a V)
        end
        sequenziali ~~~ iterativi
        subgraph iterativi
        direction TB
            RP(Rapid Prototyping) ~~~
            Incrementale ~~~
            Spirale
        end
    end
    tipi --> agili
    subgraph agili
        EP(Extreme Programming) ~~~
        Scrum ~~~
        CD(Continuos Delivery)
    end
```

# Analisi dei requisiti

```mermaid
---
config:
  layout: elk
---
flowchart TB
    AR(Analisi dei requisiti) --> Dominio
    Dominio --> modello
    modello --> statico
    modello --> dinamico
    Dominio --> Glossario

    AR --> Requisiti
    Requisiti --> tipi
    tipi --> fn(funzionali)
    tipi --> nfn(non funzionali)
    Requisiti --> descrizione
    descrizione --> lin_nat(linguaggio naturale)
    lin_nat --> Glossario
    lin_nat --> spec_req(Specifica dei requisiti)
    descrizione --> lin_graf(linguaggi grafici)
    lin_graf --> dominio(modello del dominio)
    lin_graf --> casi_uso(casi d'uso)

    AR --> fasi
    subgraph fasi
        Acquisizione ~~~
        Elaborazione ~~~
        Convalida ~~~
        Negoziazione ~~~
        Gestione
    end
```

## Fasi

### Acquisizione

```mermaid
graph TD
    Acquisizione --> Interviste
    Acquisizione --> Questionari
    Acquisizione --> Prototipi
    Acquisizione --> Osservazione
```

---

### Elaborazione

```mermaid
---
config:
  layout: elk
---
graph TB
    Elaborazione --> doc_req[documento dei requisiti] --> Contratto(precede la stipula del contratto, e ne è parte integrante)
    doc_req --> parti
    subgraph parti
    direction TB
        Introduzione ~~~
        *Glossario ~~~
        R0(*Requisiti) ~~~
        Architettura ~~~
        specifica -->|sui| R0
        specifica ~~~ mod_ast(Modelli astratti) ~~~
        ev_sis(Evoluzione del sistema) ~~~
        Appendici ~~~
        Indici
    end
    doc_req[documento dei requisiti] --> evitare
    subgraph evitare
    direction TB
        Omissioni ~~~
        Inconsistenze ~~~ Sinonimi
        subgraph Ambiguità
        direction TB
            Quantificatori ~~~
            Disgiunzioni ~~~
            Coordinazione ~~~
            Referenziale ~~~
            Vaghezza
        end
        Sinonimi ~~~
        Tecnicismi ~~~
        Ridondanza
    end
```

---

### Convalida

```mermaid
---
config:
  layout: elk
---
graph TB
    Convalida --> evitare
    Convalida --> tecniche --> Deskcheck --> Walkthrough --> let_seq(lettura sequenziale)
    Deskcheck --> Ispezione --> let_strut(lettura strutturata)
    tecniche --> lemmario --> def_lem(Utilizzo di termini del glossario con puntatori ai requisiti che li nominano)
    tecniche --> NLP --> def_NLP(Utilizzo di strumenti di analisi lessicale e sintattica del linguaggio naturale)
```

---

### Negoziazione

```mermaid
---
config:
  layout: elk
---
graph TB
    Negoziazione --> priorità -->|sui| R1(*Requisiti)
    priorità --> basata_su(basata su) --> es_com(esigenze del committente)
    priorità --> MoSCoW
    subgraph MoSCoW
    direction TB
        MH("<center>Must have<br>(Requisiti obbligatori)</center>")
        MH ~~~ SH
        SH("<center>Should have<br>(Requisiti desiderabili)</center>")
        SH ~~~ CH
        CH("<center>Could have<br>(Requisiti opzionali)</center>")
        CH ~~~ WH
        WH("<center>Want to have<br>(Requisiti differibili)</center>")
    end
    basata_su --> tempicosti(analisi costi e tempi di produzione)
```

---

### Gestione

```mermaid
---
config:
  layout: elk
---
graph TB
    Gestione --> IU(Identificatore unico) --> R2(*Requisito)
    Gestione --> attributi --> R2 & indicano
    subgraph indicano
    direction TB
        Stato ~~~
        Priorità ~~~
        Effort
        Rischio ~~~
        Stabilità ~~~
        VD(Versione destinazione)
    end
    Tracciabilità -->|definizione| T_Def(capacità di descrivere e seguire la vita di un requisito del processo di sviluppo)
    Gestione --> Tracciabilità --> mappa
    subgraph mappa
    direction TB
        R3(*Requisiti) ~~~
        comp_sis(componenti del sistema) ~~~
        Codice ~~~
        Test
    end
```

# Progettazione

```mermaid
---
config:
  layout: elk
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
        PP[Pipes & Filter] ~~~
        Client-Server ~~~
        Master-Slave ~~~
        P2P ~~~
        Publish-Subscribe ~~~ Model-View
        subgraph Model-View
            Controller ~~~
            Presenter
        end
        Model-View ~~~ PC[Process Coordinator]
    end
```

## Viste

### Comportamentale

```mermaid
---
config:
  layout: elk
---
flowchart TD
    VC(Comportamentale) -->|definisce| VSSE(struttura sistema<br>a runtime) --> VC_tramite
    subgraph VC_tramite [tramite]
        subgraph componenti
            comp_des[unità software<br>indipendente e riusabile] ~~~
            incapsula --> funzionalità & dati
            fornisce -->|punti di<br>interazione|porti
        end
        interfacce --> componenti
        subgraph interfacce
            int_def[restringe<br>accesso]
        end
        interfacce ~~~ VCC(connettori) -->|collegano| porti
    end
    VC(Comportamentale) --> VC_utile
    subgraph VC_utile [utile]
        VU1[analisi delle caratteristiche<br>di qualità a runtime] ~~~
        VU2[documentare lo<br>stile dell’architettura]
    end
```

---

### Strutturale

```mermaid
---
config:
  layout: elk
---
graph TB
    VS(Strutturale) -->|definisce| UR[Unità di<br>realizzazione]
    VS --> VS_utile
    subgraph VS_utile [utile]
        VSAD[analisi<br>dipendenze] ~~~
        VSPD[progettazione<br>test] ~~~
        VSVP[valutazione<br>portabilità]
    end
    UR --> VS_tramite
    subgraph VS_tramite [tramite]
        subgraph moduli
        URM[unità software] -->|contenenti| ICR[insieme coerente<br>di responsabilità]
        end
        r1[relazioni] --> moduli
    end
```

---

### Deploymenti

```mermaid
---
config:
  layout: elk
---
graph TB
    VL["Logistica<br>(Deployment)"]
    VL -->|definisce| VLD[l'allocazione del software<br>su ambinti di esecuzione]
    VL -->|utile| valutazione
    subgraph valutazione
        prestazioni ~~~ affidabilità
    end
    VLD --> VL_tramite
    subgraph VL_tramite [tramite]
        subgraph Artefatti
            VLP{prodotti} --> VL_proc[processo di<br>sviluppo software] & VL_fun[funzionamento<br>di un sistema]
        end
        AE[Ambienti<br>esecuzione] ~~~ Artefatti
        dislocazione -->|degli| Artefatti
        dislocazione -->|negli| AE
        Artefatti -->|interconnessi| Artefatti
    end
```

## stili

### Pipes & Filter
