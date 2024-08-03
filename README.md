
# Store Checkout

This is a Ruby application for managing checkout processes in a store. It allows users to scan items, apply pricing rules, and calculate the total amount to be paid based on those rules.

## Installation Instructions

1. You will require [Ruby](https://www.ruby-lang.org/en/downloads/) installed to use this program.
  
   Require `ruby '2.7.5'`

2. Clone down from github, cd into the directory.

```
$ cd store_checkout
$ bundle install
```

## Usage Instructions

### Running the Application

To run the application and perform a checkout, execute the following command:

```ruby
ruby main.rb
```

## Running Tests

To run the test suite, simply run rspec from the root directory.

```
$ rspec
```
## Structure
The project directory is organized as follows:

- main.rb: Entry point of the application.
- models/: Contains Ruby classes representing various entities in the application.
  - product.rb: Definition of the Product class.
  - checkout.rb: Definition of the Checkout class.
  - pricing/: Contains modules defining pricing rules for products.
    - pricing_rules.rb: Definition of pricing rules methods.
- spec/: Contains RSpec tests for the application.
  - product_spec.rb: Tests for the Product class.
  - checkout_spec.rb: Tests for the Checkout class.
  - pricing/: Contains tests for pricing rules.
    - pricing_rules_spec.rb: Tests for the pricing rules methods.

JSON `data.json` file present to add Products