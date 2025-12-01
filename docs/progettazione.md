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

```mermaid
---
config:
  layout: elk
---
flowchart TD
    PF(Pipes & Filter) -->|consiste|fe[flusso di<br>elaborazione dati]
    fe -->|viaggiano| Pipe
    fe -->|processati| Filter
    PF -->|componenti| Filter
    PF -->|connettori| Pipe

    Filter -->|ingresso| fl[flusso di dati]
    Filter -->|uscita| flt[flusso di dati<br>trasformati]

    Pipe --> unidirezionale & bufferizzato & po(preserva ordine<br>dati)
```

## Client-Server

```mermaid
classDiagram
direction LR
    Client "*"-->"1" Server: Invia richiesta
```

### Server

```mermaid
---
config:
  layout: elk
  theme: "base"
  themeVariables:
    noteBkgColor: "#fff45669"
---
classDiagram
direction LR
    class RH["Request<br>Handler"]
    note for RH "elabora la richiesta e invia<br>la risposta al client"
    class SfH["Statefull<br>Handler"]
    note for SfH "consente richieste composite tramite sessione<br>(record delle richieste di un client)"
    class SlH["Stateless<br>Handler"]
    note for SlH "gestisce ogni richiesta in modo indipendente"
    class RL["Request<br>Listener"]
    note for RL "in attesa di richieste"
    RL "1" --> "*" RH
    RH <|-- SfH
    RH <|-- SlH
```

## Master-Slave

```mermaid
classDiagram
direction LR
    Master "1"-->"*" Slave: Invia richiesta
```

## P2P

```mermaid
---
config:
  layout: elk
---
classDiagram
direction LR
    class Peer
    class PeerInterface
    <<Interface>> PeerInterface
    Peer ..> PeerInterface: Input port
    Peer ..|> PeerInterface: Output port
```

## Publish-Subscriber

```mermaid
---
config:
  layout: elk
  theme: "base"
  themeVariables:
    noteBkgColor: "#fff45669"
---
classDiagram
direction LR
    class Publisher-Subscriber
    <<component>> Publisher-Subscriber
    note for Publisher-Subscriber "Publisher: produce classi di eventi<br><br>Subscriber: si abbona alle classi di<br>eventi che ritiene rilevanti"
    class Broker
    <<component>> Broker
    note for Broker "Smista gli eventi pubblicati"
    class SubscriberInterface{
        +notify()
    }
    <<interface>> SubscriberInterface
    class BrokerInterface{
        +subscribe()
        +remove_subscription()
        +publish()
    }
    <<interface>> BrokerInterface

    Publisher-Subscriber -- Broker: Richiesta sottoscrizione/pubblicazione
    Publisher-Subscriber -- Broker: dati
    BrokerInterface <.. Publisher-Subscriber
    SubscriberInterface <|.. Publisher-Subscriber
    BrokerInterface <|.. Broker
    SubscriberInterface <.. Broker
```

### Publisher e Subscriber distinti (PUSH)

```mermaid
---
config:
  layout: elk
  theme: "base"
  themeVariables:
    noteBkgColor: "#fff45669"
---
classDiagram
direction LR
    class Publisher
    <<component>> Publisher
    class Subscriber
    <<component>> Subscriber
    class Broker
    <<component>> Broker
    class SubscriberInterface{
        +subscribe()
        +remove_subscription()
    }
    <<interface>> SubscriberInterface
    class PublishInterface{
        +publish()
    }
    <<interface>> PublishInterface
    class NotifyInterface{
        +notify()
    }
    <<interface>> NotifyInterface

    SubscriberInterface <|.. Broker
    SubscriberInterface <.. Subscriber
    Subscriber ..|> NotifyInterface
    Broker ..> NotifyInterface
    Broker ..|> PublishInterface
    PublishInterface <.. Publisher
```

## Model-View-Controller

```d2
    grid-columns: 2
    style{
        fill: transparent
    }
    *{
        style{
            fill: transparent
        }
    }
    classes {
        *{
            style{
                fill: transparent
                stroke-width: 0
            }
        }
        empty {
            label: ""
            style: {
                fill: transparent
            }
        }
        User{
            shape: person
            style.stroke-width: 3
            height: 120
        }
        View{
            style{
                fill: lightgreen
                font-color: green
            }
        }
        Model{
            style{
                fill: yellow
                font-color: darkorange
            }
        }
    }
    model-view-controller{
        grid-rows: 3
        grid-columns: 3
        vertical-gap: 80
        style.stroke-width: 0
        empty1.class:empty
        user.class: User
        empty2.class:empty
        empty3.class:empty
        view.class:View
        empty4.class:empty
        Controller{
            style{
                fill: orange
                font-color: darkred
                stroke: transparent
            }
        }
        empty5.class:empty
        model.class:Model
        user -> view: user interaction
        view -> controller: passes calls to
        controller -> model: manipulates
        model -> view: fire events {
            style{
                stroke-dash: 3
            }
        }
    }
    model-view-presenter {
        style.stroke-width: 0
        user.class: User
        view.class:View
        Presenter{
            style{
                fill: lightblue
                font-color: blue
                stroke: transparent
            }
        }
        model.class:Model

        user -> view: user interaction
        view -> Presenter: passes calls to
        Presenter -> model: manipulates
        Presenter -> view: updates
        model -> Presenter: fire events {
            style{
                stroke-dash: 3
            }
        }
    }
```

## Process coordinator

```mermaid
---
config:
    layout: elk
---
classDiagram
direction LR
Coordinator "1"-->"1..*" Component:Invoca
```
