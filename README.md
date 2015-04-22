## about
chicago-trains is THE official app for editing chicago train schedule documents. Used by Mayor Emanuel's very own administration, the application allows importing and exporting CSV files, and supports validations for all four train lines in the Chicagoland area: trolley, el, metra, and amtrak.

This is a Rails 4.2.0 app that uses a Postgresql database. To get it up and running, simply clone the repo and run

```
bundle
rake db:create
rake db:migrate
rails server
```

and navigate to localhost:3000

## data

From the command line, random data can be generated using the <tt>rake db:seed</tt> command. CSVs must be uploaded from the app itself. CSV data is presumed to be in the standard chicago-train format with a header row of four columns in the order: train_line, route_name, run_number, operator_id.

## testing

Testing is a combination of capybara and rspec testing. Headed testing (for javascript DOM manipulation) requires selenium webdriver and a local installation of the firefox browser.

All tests are run with the rspec library. They can be run with
```
rspec spec/
```
