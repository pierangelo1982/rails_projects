# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* prezzo di vendità manuale o scelta del cliente

* tasse cliente non incluse in calcolo prodotto

*** rails g scaffold employee name:string role:string

*** rails g scaffold vehicle_card_acceptance date_vehicle_reception:datetime employee:belongs_to document_number:integer address_book:belongs_to km:integer serial_number:string vehicle_year:string vehicle_registered_in:datetime vehicle_model:string note:text

### unit_price lo salviamo, perchè il prezzo può cambiare in futuro ma non deve incidere sui vecchi prezzi emessi
rails g model SparePart vehicle_card_acceptance:belongs_to product:belongs_to quantity:integer unit_price:decimal discount:integer total_price:decimal