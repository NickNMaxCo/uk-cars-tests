Feature: Help me choose
  As a user, I want to use search filters, because they give a quick and easy way to find a car that suits me.

  Background:
    Given help me choose page is opened

  @bodystyle
  Scenario Outline: Browse by body style
    When user choose <body_style> filter
    Then user is redirected to a search page with selected <body_style> filter

    Examples:
      | body_style  |
      | Hatchback   |
      | Saloon      |
      | Estate      |
      | MPV         |
      | SUV         |
      | Convertible |
      | Coupe       |

  @lifestyle
  Scenario Outline: Browse by lifestyle
    When user choose <lifestyle> filter
    Then user is redirected to a search page with selected <body_type> filter
    And a Price range filter is seted as <price_range>
    And a Seats filter is seted as <seats>
    And a Doors filter is seted as <doors>
    And a Boot size filter is seted as <boot_size>
    And a Gearbox filter is seted as <gearbox>
    And a Fuel consumption filter is seted as <fuel_consumption>
    And an Acceleration filter is seted as <acceleration>
    And an Insurance filter is seted as <insurance>
    And a First year tax from filter is seted as <first_year_tax_from>

    Examples:
      | lifestyle     | price_range       | body_type | seats              | doors                 | boot_size                    | gearbox | fuel_consumption     | acceleration             | insurance               | first_year_tax_from |
      | First car     | £500 to £15,000   | Hatchback | From 2 to 7+ seats |                       | Small (up to 300 litres)     |         | Minimal (over 60mpg) | Steady (over 12 seconds) | Lowest (up to group 10) | Medium (up to £200) |
      | City car      | £500 to £20,000   | Hatchback | From 2 to 7+ seats |                       |                              |         | Minimal (over 60mpg) | Steady (over 12 seconds) | Low (up to group 20)    | Medium (up to £200) |
      | Family car    | £500 to £20,000   | Hatchback | From 2 to 7+ seats | Front & rear (4 or 5) | Large (500 litres and above) |         | Any                  |                          | Medium (up to group 30) | Medium (up to £200) |
      | Towing        | £5,000 to £60,000 | Estate    | From 2 to 7+ seats |                       | Large (500 litres and above) |         | Minimal (over 60mpg) |                          | Medium (up to group 30) | Any                 |
      | Towing        | £5,000 to £60,000 | SUV       | From 2 to 7+ seats |                       | Large (500 litres and above) |         | Minimal (over 60mpg) |                          | Medium (up to group 30) | Any                 |
      | Long distance | £5,000 to £60,000 | Saloon    | From 2 to 7+ seats |                       | Large (500 litres and above) |         | Medium (over 40mpg)  |                          | Any                     | Medium (up to £200) |
      | Long distance | £5,000 to £60,000 | Estate    | From 2 to 7+ seats |                       | Large (500 litres and above) |         | Medium (over 40mpg)  |                          | Any                     | Medium (up to £200) |
      | Performance   | £5,000 to £1m     | Coupe     | From 2 to 7+ seats | Front (2 or 3)        | Small (up to 300 litres)     |         | Any                  | Fast (under 8 seconds)   | Any                     | Any                 |
      | Off road      | £0 to £1m         | SUV       | From 2 to 7+ seats |                       |                              | Manual  | Any                  | Steady (over 12 seconds) | Any                     | Any                 |

  @video
  Scenario: Checking tutorial video
    When user clicks the link Which body type is right for you.
    Then user is redirected to page with tutorial video
