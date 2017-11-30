Feature: Find car
  As a user, I want to use search filters, because they give a quick and easy way to find a car that suits me.

  Background:
    Given page with filters for search cars is opened

  Scenario Outline: Checking correct postcode
    When user fill in Postcode field with <postcode>
    And click the Search cars button
    Then all cars possible for purchase are shown
    And a Make filter is selected as Any
    And a Model filter is selected as Any
    And a Model Variant filter is selected as Any
    And a Price filter is selected as Any
    And an Year filter is selected as Any
    And a Mileage filter is selected as Any
    And a Body type filter is selected as Any
    And a Fuel type filter is selected as Any
    And an Engine size filter is selected as Any
    And a Fuel consumption filter is selected as Any
    And an Acceleration filter is selected as Any
    And a Gearbox filter is selected as Any
    And a Drivetrain filter is selected as Any
    And a Doors filter is selected as Any
    And a Seats filter is selected as Any
    And a Insurance Group filter is selected as Any
    And a Annual tax filter is selected as Any
    And a Colour filter is selected as Any
    And a Private & trade filter is selected as Any
    And filter CO2 emissions is selected as Any too

    Examples:
      | postcode |
      |  E203EL  |

  Scenario Outline: Checking incorrect postcode
    When user fill in Postcode field with <postcode>
    And click the Search cars button
    Then message 'Please enter a valid UK postcode' is shown

    Examples:
      | postcode |
      |  E203E1  |

  Scenario Outline: Checking 'Distance' filter
    When user fill in Postcode field with correct data
    And choose some <distance> from Distance filter
    And click the Search cars button
    Then all cars which possible for purchase in radius of <distance> are shown

    Examples:
      |     distance    |
      | Within 25 miles |

  Scenario: Checking 'Show' filter, 'Used' checkbox
    When user fill in Postcode field with correct data
    And uncheck Nearly new checkbox
    And uncheck New checkbox
    And click the Search cars button
    Then only Used cars are shown
    And the Nearly New checkbox is unchecked
    And the New checkbox is unchecked

  Scenario: Checking 'Show' filter, 'Nearly new' checkbox
    When user fill in Postcode field with correct data
    And uncheck Used checkbox
    And uncheck New checkbox
    And click the Search cars button
    Then only Nearly New cars are shown
    And the Used checkbox is unchecked
    And the New checkbox is unchecked

  Scenario: Checking 'Show' filter, 'New' checkbox
    When user fill in Postcode field with correct data
    And uncheck Used checkbox
    And uncheck Nearly new checkbox
    And click the Search cars button
    Then only New cars are shown
    And the Used checkbox is unchecked
    And the Nearly New checkbox is unchecked

  Scenario Outline: Checking 'Model' filter
    When user fill in Postcode field with correct data
    And choose some <make_option> from Make filter
    And choose some <model_option> from Model filter
    And click the Search cars button
    Then all cars which possible for purchase according to selected <brand> and <model> are shown

    Examples:
      | make_option  | brand | model_option |  model  |
      |     AUDI     | Audi  |    QUATTRO   | quattro |

  Scenario Outline: Checking 'Min price' filter
    When user fill in Postcode field with correct data
    And choose some <min_price_option> from Min price filter
    And click the Search cars button
    Then all cars which have <min_price> or more are shown

    Examples:
      | min_price_option | min_price |
      |      5000        |   £5,000  |

  Scenario Outline: Checking 'Max price' filter
    When user fill in Postcode field with correct data
    And choose some <max_price_option> from Max price filter
    And click the Search cars button
    Then all cars which have <max_price> or less are shown

    Examples:
      | max_price_option |  max_price |
      |      10000       |   £10,000  |

  Scenario Outline: Checking 'Min price' and 'Max price' filters together
    When user fill in Postcode field with correct data
    And choose some <min_price_option> from Min price filter
    And choose some <max_price_option> from Max price filter
    And click the Search cars button
    Then all cars which have price between <min_price> and <max_price> are shown

    Examples:
      | min_price_option | min_price | max_price_option |  max_price |
      |      5000        |   £5,000  |      10000       |   £10,000  |
@test
  Scenario Outline: Checking 'Body type' filter
    When user fill in Postcode field with correct data
    And choose some <body_type> from Body type filter
    And click the Search cars button
    Then all <body_type> cars are shown

    Examples:
      |body_type|
      | MPV     |

  Scenario Outline: Checking 'Year from' filter
    When user fill in Postcode field with correct data
    And choose some <year_from> from Year from filter
    And click the Search cars button
    Then all cars with <year_from> production are shown

    Examples:
      | year_from |
      |   2013    |

  Scenario Outline: Checking 'Make', 'Fuel consumption', 'Doors', 'Annual tax', 'Acceleration', 'Colour', 'Fuel type',
    'Gearbox', 'Private & trade', 'CO2 emissions', 'Insurance Group' filters
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_name> filter
    And click the Search cars button
    Then with respect to selected <filter_option> from <filter_name> filter all cars are shown

    Examples:
      | filter_name        | filter_value_option | filter_option   |
      | make               | AUDI                | Audi            |
      | fuel-consumption   | OVER_40             | 40+ mpg         |
      | quantity-of-doors  | 3                   | 3 doors         |
      | annual-tax-cars    | TO_210              | Up to £210      |
      | zero-to-60         | TO_8                | 0-8s (0-60mph)  |
      | colour             | Orange              | Orange          |
      | fuel-type          | Diesel              | Diesel          |
      | transmission       | Manual              | Manual          |
      | seller-type        | private             | Private adverts |
      | insuranceGroup     | 20U                 | Up to 20        |

  Scenario Outline: Checking 'Max engine size' filter
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_name> filter
    And click the Search cars button
    Then all cars with <filter_text> <filter_option> or less are shown

    Examples:
      | filter_name               | filter_value_option |  filter_text    | filter_option   |
      | maximum-badge-engine-size | 1.4                 | Engine size     | 1.4L            |

  Scenario Outline: Checking 'Mileage' filter
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_name> filter
    And click the Search cars button
    Then cars with <filter_text> no more than <filter_option> are shown

    Examples:
      | filter_name     | filter_value_option | filter_text | filter_option      |
      | maximum-mileage | 15000               | Mileage     | Up to 15,000 miles |

  Scenario Outline: Checking 'Min seats' filter
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_name> filter
    And click the Search cars button
    Then cars which have <filter_text> no less than <filter_option> are shown

    Examples:
      | filter_name   | filter_value_option | filter_text | filter_option   |
      | minimum-seats | 5                   | Seats       | 5               |

  Scenario Outline: Checking 'Max seats' filter
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_name> filter
    And click the Search cars button
    Then cars which have <filter_text> no more than <filter_option> are shown

    Examples:
      | filter_name   | filter_value_option | filter_text | filter_option   |
      | maximum-seats | 5                   | Seats       | 5               |

  Scenario Outline: Checking 'Min seats' and 'Max seats' filters together
    When user fill in Postcode field with correct data
    And select <filter_min_value_option> from <filter_min_name> filter
    And select <filter_max_value_option> from <filter_max_name> filter
    And click the Search cars button
    Then cars with number of <filter_text> no less than <filter_min_option>
    And number of <filter_text> no more than <filter_max_option> are shown

    Examples:
      | filter_min_name | filter_max_name | filter_min_value_option | filter_max_value_option | filter_text | filter_min_option | filter_max_option |
      | minimum-seats   | maximum-seats   | 5                       | 7                       | Seats       | 5                 | 7                 |

  Scenario Outline: Checking 'Reset search' link
    When user clck the Reset search link
    Then filter <filter_name> is reseted

    Examples:
      | filter_name               |
      | make                      |
      | model                     |
      | price-from                |
      | price-to                  |
      | year-from                 |
      | colour                    |
      | fuel-consumption          |
      | quantity-of-doors         |
      | annual-tax-cars           |
      | co2-emissions-cars        |
      | zero-to-60                |
      | fuel-type                 |
      | transmission              |
      | seller-type               |
      | insuranceGroup            |
      | maximum-badge-engine-size |
      | minimum-seats             |
      | maximum-seats             |
      | maximum-mileage           |

  Scenario Outline: Checking dependence brtween 'Min price' and 'Max price' filters
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_min_price> filter
    Then options in the <filter_max_price> filter must be no less than <filter_value_option>

    Examples:
      | filter_min_price | filter_max_price | filter_value_option |
      | price-from       | price-to         | 4000                |

  Scenario Outline: Checking dependence brtween 'Min price' and 'Max price' filters
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_max_price> filter
    Then options in the <filter_min_price> filter must be no more than <filter_value_option>

    Examples:
      | filter_min_price | filter_max_price | filter_value_option |
      | price-from       | price-to         | 4000                |

  Scenario Outline: Checking dependence brtween 'Min seats' and 'Max seats' filters
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_min_seats> filter
    Then number of seats in the <filter_max_seats> filter must be no less than <filter_value_option>

    Examples:
      | filter_min_seats | filter_max_seats | filter_value_option |
      | minimum-seats    | maximum-seats    | 4                   |

  Scenario Outline: Checking dependence brtween 'Min seats' and 'Max seats' filters
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_max_seats> filter
    Then number of seats in the <filter_min_seats> filter must be no more than <filter_value_option>

    Examples:
      | filter_min_seats | filter_max_seats | filter_value_option |
      | minimum-seats    | maximum-seats    | 4                   |

  Scenario Outline: Checking 'CO2 emissions' filter
    When user fill in Postcode field with correct data
    And select <filter_value_option> from <filter_name> filter
    And click the Search cars button
    Then all cars with <filter_option> or less <filter_name> are shownnn

    Examples:
      | filter_name        | filter_value_option | filter_option        |
      | co2-emissions-cars | TO_100              | Up to 100 g / km CO2 |
