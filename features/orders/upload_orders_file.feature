Feature: Upload a file containing orders
  As a system user,
  In order to store order information from an external source,
  I need to be able to upload the information in a tab-delimited file

  @wip
  Scenario: A user uploads a file containing order information
    When I am on the orders page
    And I attach file "example_input.tab" for "File"
    And I click "Upload"
    Then I should see the following orders table
      | Purchase name  | Item description       | Item price | Purchase count | Purchase amount | Merchant name          | Merchant address |
      | Snake Plissken | $10 off $20 of food    |      10.00 |              2 |           20.00 | Bob's Pizza            | 987 Fake St      |
      | Amy Pond       | $30 of awesome for $10 |      10.00 |              5 |           50.00 | Tom's Awesome Shop     | 456 Unreal Rd    |
      | Marty McFly    | $20 Sneakers for $5    |       5.00 |              1 |            5.00 | Sneaker Store Emporium | 123 Fake St      |
      | Snake Plissken | $20 Sneakers for $5    |       5.00 |              4 |           20.00 | Sneaker Store Emporium | 123 Fake St      |
      | Total          |                        |            |                |           95.00 |                        |                  |
