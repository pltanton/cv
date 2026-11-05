#let accent = rgb("#1F5F8B")
#let muted = luma(100)
#let gutter = 20mm
#let rail = 5mm

#set document(title: "Anton Plotnikov CV", author: "Anton Plotnikov")
#set page(paper: "a4", margin: (x: 14mm, y: 12mm))
#set text(font: "Inter", size: 9.5pt)
#set par(justify: true, leading: 0.6em)
#show link: set text(fill: accent)
#set list(indent: 0.2em, spacing: 0.8em, marker: text(fill: accent, sym.bullet))

#let section(title, rest) = block(above: 1.6em, below: 1em, grid(
  columns: (auto, 1fr),
  column-gutter: 0.8em,
  align: horizon,
  text(size: 11pt, weight: "bold", tracking: 0.08em, fill: accent, upper(title)),
  rest,
))
#show heading: it => section(it.body, line(length: 100%, stroke: 0.5pt + accent))

#let fa(code, brand: false) = text(
  font: if brand { "Font Awesome 7 Brands" } else { "Font Awesome 7 Free" },
  weight: if brand { "regular" } else { "black" },
  fill: accent,
  str.from-unicode(code),
)

#let row(label, body, timeline: false, dot: true) = block(breakable: false, below: 0pt, grid(
  columns: (gutter, 1fr),
  align(if timeline { left } else { right }, pad(right: rail, top: 0.1em, text(size: 8pt, fill: muted, label))),
  block(
    width: 100%,
    inset: (left: rail, bottom: 1.1em),
    stroke: if timeline { (left: 0.6pt + accent.lighten(50%)) },
    {
      if timeline {
        let r = if dot { 2.5pt } else { 1.6pt }
        place(dx: -rail - r, dy: 0.25em, circle(radius: r, fill: if dot { accent } else { white }, stroke: 0.6pt + accent))
      }
      body
    },
  ),
))

#let job(period, company, location, role, body, compact: false) = row(period, timeline: true, dot: not compact, {
  text(size: 10.5pt, weight: "bold", company)
  if role != none [ · #emph(role)]
  h(0.6em)
  text(size: 8pt, fill: muted, location)
  if body != none { v(0.4em, weak: true); body }
})

#grid(
  columns: (auto, 1fr),
  column-gutter: 8mm,
  align: horizon,
  box(clip: true, radius: 50%, image("portrait.jpg", width: 3cm, height: 3cm)),
  [
    #text(font: "Inter Display", size: 24pt, weight: "semibold", fill: accent, tracking: 0.18em, upper[Anton Plotnikov])
    #v(0.8em, weak: true)
    #text(size: 11pt, fill: muted)[Engineering Team Lead, Transactions Platform · Paphos, Cyprus]
    #v(1em, weak: true)
    #set text(size: 8.5pt)
    #let sep = h(1.2em)
    #fa(0xf0e0) #link("mailto:plotnikovanton@gmail.com")[plotnikovanton\@gmail.com] #sep
    #fa(0xf2c6, brand: true) #link("https://t.me/pltanton")[\@pltanton] #sep
    #fa(0xf09b, brand: true) #link("https://github.com/pltanton")[github.com/pltanton] #sep
    #fa(0xf0ac) #link("https://pltanton.dev")[pltanton.dev]
  ],
)

= Key technologies

#row[I][Go, Java/Kotlin/Spring, Linux, Docker, Kafka, Git]
#row[II][AWS, K8S, Nix (NixOS), LaTeX, JS/TS]
#row[III][Ruby, Python, Bash, C++, C, Lua, Haskell]

= Experience

#job[2026--][Wallet][Paphos, Cyprus][Engineering Team Lead, Transactions Platform][
  Development of a TON wallet, exchange and trading platform aka Telegram's \@wallet.

  - *P2P exchange* [Kotlin, Postgres].
    Development of P2P exchange platform, analytic system, KYC, accounting.

  - *Event management system* [Go, Kafka, Postgres].
    I designed and built a real-time, high-availability analytics system that enables
    business event definition management for automatic type-strict code generation
    in multiple programming languages.
]

#job[2021--2022][Ozon Bank][St. Petersburg, Russia][Lead software engineer][
  Development of bank processing systems.

  - *Processing* [Go, Postgres, ClickHouse, Kafka, K8S].
    Development of bank processing system: system design,
    cryptography layer compatible with PCI DSS. Mentoring interns.
]

#job(compact: true)[2020--2021][Intellectokids][Remote][Software engineer][
  Backend and AWS infrastructure for a kids education platform (Go, Kotlin, AWS).
]

#job[2018--2020][DSX Technologies][St. Petersburg, Russia][Software engineer][
  Development of cryptocurrency exchange/trade platform.

  - *DSX* [Kotlin, Java, Angular, Docker]: trade and exchange platform.
    Development of platform backend, including:
    KYC/KYB system, exchange API, public UI API, authentication process,
    database and application design for clients' personal data;
    administration site for the support/AML team.

  - *Student projects*: mentoring of student projects.
    _Subtyping system_: compile-time advanced extension for Java.
    _Rhea_: library for reactive reload of configuration properties with various data sources.

  - *DSXT Hackathon*: participating in organisation and mentoring.
]

#job[2017--2018][Openway][St. Petersburg, Russia][Software engineer][
  Developing infrastructure components for build registration
  system and workflow processes.

  - *Releng* [Kotlin, Java, Python, Docker, Jira, TeamCity]: support and development of automatic release registration system
    (build registration, release/upgrade notes reports, Jira plugin,
    CI support with TeamCity).

  - *DMS* [Kotlin, Docker, Spring, React.js]: support and full stack development of distribution management system. The system stores and distributes
    business-specific product builds with their release/upgrade notes.
]

#job[2016--2017][T-Systems RUS][St. Petersburg, Russia][Intern][
  Full stack development of web micro-services mostly based on Ruby on Rails framework and PL/SQL.
  Java development. Technologies: PL/SQL, Oracle, Ruby on Rails, MySQL, Sinatra, CoffeeScript.
]

= Projects

#row[Open source][
  - *Autobrowser* (#link("https://github.com/pltanton/autobrowser")[github.com/pltanton/autobrowser]):
    an efficient cross-platform tool to automatically open hyperlinks in different
    browsers depending on context (target app, etc.) with a flexible and easy-to-use custom
    configuration DSL.
  - *DDC Sync* (#link("https://github.com/pltanton/ddcsync")[github.com/pltanton/ddcsync]):
    a utility to synchronise brightness of monitors in a multi-head setup by DDC protocol.
  - *Network Widgets* (#link("https://github.com/pltanton/net_widgets")[github.com/pltanton/net_widgets]):
    a bunch of widgets which indicate the state of the current network connection
    without NetworkManager dependency, written in Lua for the
    _awesome_ window manager.
]

#row[Freelance][
  - *Ruby on Rails course for Geekbrains*:
    basic course of Ruby on Rails framework, designed for 8 lectures, which
    includes a presentation for a lecturer and a book with detailed course.
]

= Education

#job[2016--2018][ITMO University][St. Petersburg, Russia][Master of Applied Math and Computer Science][
  Chair of Advanced Mathematics. Mathematical modeling.
]

#job[2012--2016][ITMO University][St. Petersburg, Russia][Bachelor of Applied Math and Computer Science][
  Chair of Advanced Mathematics.
]

#section[Languages][Russian · English · Greek]

#v(1fr)
#align(center, text(size: 8pt, fill: muted, datetime.today().display("[month repr:long] [year]")))
