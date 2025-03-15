#let numbered-env(string, c) = {
  set enum(numbering: (..i) => {
    raw(if i.pos().len() == 1 {
      "/" + string + str(i.pos().at(0)) + "0/"
    } else {
      "/" + string + str(i.pos().at(0)) + str(i.pos().at(1)) + "/"
    })
  }, full: true)

  c
}

#[
  #set align(center + horizon)

  = Introduction to Software Engineering
  == Assignment 1

  Dimitri Tabatadze, #datetime.today().display()
  #pagebreak()
]

#set page(width: 18cm, height: auto, margin: 2cm)

// ^^^^^^^^^^

// #show emoji.person.stand: set text(size: 30pt)

// #set text(size: 18pt)
== Goal of the Development

My company should have a website where customers will be able to purchase the product and it's plugins.

== Operating Environment

- Target audience: Co-workers and customers of my company.
- Platform: 
  - User end: an Up-to-spec web browser running on any device (mobile, desktop).
  - Server: debian 18^.

== Functional Requirements

#numbered-env("FR")[
  + The store shall offer the basic package iMage-Basics, as well as 
    individual plug-ins and plug-in packages.
    
  + Employees of the sales department should be able to manage products
    + they shall be able to enter new plug-ins and plug-in packages into 
      the online system.
    + they shall also be able to define prices and time-limited special 
      offers.
  + Employees of the marketing departments shall be able
    to enter a product description, which will be displayed to 
    customers after approval. This description shall contain the 
    functionality of the package offered and a listing of the plug-ins 
    included.
  + The store should display the price savings compared to purchasing the 
    included plug-ins individually, for plug-in packages.
  + After registration, the user should receive a confirmation message to 
    their e-mail address.
  + The customers should be able to  purchase software products in the online 
    store only if they have confirmed registration.
  + Customers can choose to pay their invoices by direct debit or 
    credit card. 
    + Customers should be able to define their preferred 
      payment method in the account information.
]

== Product Data

#numbered-env("PD")[
  + The system should store and serve products that are available for sale,  
    along with their prices and their descriptions.

  + The system should keep track of time-limited special offers.

  + The system should store customers' names, addresses, telephone numbers, 
    e-mail addresses, preferred payment method and a confirmation status.

  + Customers shall be able to see the products they have already purchased.
]

== Non-functional (Quality) Requirements

#numbered-env("QR")[
  + The product iMage-Basics is to be available at the opening 
    of the online store.

  + \/FR70\/ should happen with a delay of at most 5s.

  + The online platform shall support at least 1,000 simultaneous users 
    and be able scale to 10,000 simultaneous users.
]

== System Models

=== Scenarios

#table(columns: (1fr,3fr), stroke: gray + 0.1pt, align: (right, left))[
  Scenario name][Amanda buys the whole package][
  Participating actor instances][Amanda: customer][
  Flow of events][
    #set par(justify: true)
    1. Amanda, being a professional graphic designer, knows that the online store 
      for _iMage_ is launching today. She goes to the website `buy.image.com`. 
      After browsing, she decides to buy the product.
    2. Amanda sees that before she can buy the software, she has to register. She 
      clicks "Register" and is taken to a page where she enters her name, adress, 
      telephone number and e-mail address. She is also asked to set her preferred
      payment method.
    3. After clicking register, she recieves a confirmation message to her e-mail 
      address. After confirming her e-mail, she can finally purchase _iMage_.
    4. She goes to the page where she can click "buy iMage", clicking on which 
      opens a modal which suggests _iMage Basiscs_ --- a package containing _iMage_ and a few basic plugins.
    5. Amanda buys _iMage Basics_.
  ]

#table(columns: (1fr,3fr), stroke: gray + 0.1pt, align: (right, left))[
  Scenario name][Release of an AI inpainting plugin][
  Participating actor instances][Becca: employee, Chuck: head of sales][
  Flow of events][
    #set par(justify: true)
    1. After the team has worked on it for 5 months, the AI image inpainting
      plugin is ready for release. Becca was tasked with creating a product 
      entry on the online store for this plugin. She goes to the page 
      accessible only to the employees and clicks "Create new entry".
    2. Becca is prompted to enter the name of the product and select the
      type. She enters the name and selects "plugin" as the type, after which
      she is asked to upload the software. Then she is asked to provide the 
      description of the product After uploading, she clicks "submit for 
      approval".
    3. Chuck, head of sales departament sees the product listing submitted by
      Becca. He reviews and approves it publishing it to the online store.
  ]

=== Use Cases

#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge
#import fletcher.shapes: ellipse, pill

#figure(diagram(
  spacing: (10mm, 5mm), // wide columns, narrow rows
  node-stroke: 1pt, // outline node shapes
  edge-stroke: 1pt, // make lines thicker
  mark-scale: 60%, // make arrowheads smaller
  node((-2, -2), [#emoji.person.stand \ Sales \ employee], stroke: none),
  node((-2, -1), [#emoji.person.stand \ Marketing \ employee], stroke: none),
  node((-2, 0), [#emoji.person.stand \ Customer], stroke: none),

  node((0, -3), text(white)[Publish products], fill: green.mix(teal).darken(20%), stroke: none, shape: pill),
  edge((-2, -2), (0, -3), bend: 15deg),
  
  node((0, -2), text(white)[Approve product descriptions], fill: green.mix(teal).darken(20%), stroke: none, shape: pill),
  edge((-2, -2), (0, -2)),
  
  node((0, -1), text(white)[Enter product descriptions], fill: green.mix(teal).darken(20%), stroke: none, shape: pill),
  edge((-2, -1), (0, -1)),


  node((0, 0), text(white)[Register], fill: green.mix(teal).darken(20%), stroke: none, shape: pill),
  edge((-2, 0), (0, 0)),

  node((0, 1), text(white)[Define prefered payment method], fill: green.mix(teal).darken(20%), stroke: none, shape: pill),
  edge((-2, 0), (0, 1), bend: -14deg),

  node((0, 2), text(white)[Purchase products], fill: green.mix(teal).darken(20%), stroke: none, shape: pill),
  edge((-2, 0), (0, 2), bend: -25deg),

  node((0, 3), text(white)[View purchased products], fill: green.mix(teal).darken(20%), stroke: none, shape: pill),
  edge((-2, 0), (0, 3), bend: -35deg),
  
  node(enclose: ((-1,-5), (1.1,5)), stroke: blue, inset: 0pt, snap: false),
  node((0, -5), [Store_Dimitri_Tabatadze], fill: white, stroke: blue)
), caption: [Use case diagram.]) <ucd>


== Glossary

/ Package: A collection of plugins.
/ Plugin: A piece of software (A) which can only be used together with a
  different piece of software (B) to enhance the capabilities of (B).
/ _iMage-Basics_: A package containing some basic plugins.

#pagebreak(weak: true)

= Feasibility study

== Technical Feasibility

- *Server application*: We have great .NET developers in our team, they can 
  spin up a server in a couple weeks.
- *Client application*: We may have to struggle a bit but everything is doable
  in two months.

== Alternative Solutions

Publish on an already existing online software store (play store, app store, 
microsoft store).

== Availability of Personnel

Back-end developers are available. Need to do training for front-end.

== Risks

Implementing authorization is a security risk. There's a need to secure user
data.

== Economic Feasibility

- *Development costs*: Back-end can be developed at fixed-price (without any 
  additional costs that may arrise during developement). Front-end may suffer, 
  since in-house training may take longer than expected.
- *Maintanance costs*: Most likely very low.
- *Hosting costs*: The servers will be run in-house, only electricity and 
  internet bills to worry about.

== Legal Considerations

- *Data security*: User data (name, adress, mobile phone number, e-mail) should
  remain secure. The users should be asked for permission for storing this data.
- *Licenses*: Will only use MIT and GPLv3 licensed software for prouction.
