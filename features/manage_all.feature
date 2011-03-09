Feature: Manage All
 In order to make an cardsite
 As a author
 I want to create and manage cardholders and their cards
 

         Scenario Outline: add a new cardholder
    Then I should have 0 "cardholder"
    Given I am on the new cardholder page
    Then I should see "New cardholder"
    Given I am filling cardholder form with Firstname "<cardholder_firstname>", Lastname "<cardholder_lastname>", Phonenumber "<cardholder_phonenumber>", Country "<cardholder_country>", City "<cardholder_city>", Address "<cardholder_address>", Passportnumber "<cardholder_passportnumber>"
    Then I should see "Show cardholder"
    Then I should have 1 "cardholder"
    Examples:
      | cardholder_firstname | cardholder_lastname | cardholder_phonenumber | cardholder_country | cardholder_city | cardholder_address | cardholder_passportnumber |
      | Sidor | Ivanov | +12341234 | Ukraine | Kiev | ulLenina | pa1234512346 |
      
         Scenario Outline: add a new card
    Then I should have 0 "card"
    Given I am on the new card page
    Then I should see "New card"
    Given I am filling card form with Cardnumber "<card_cardnumber>"
    Then I should see "Show card"
    Then I should have 1 "card"
    Examples:
      | card_cardnumber |
      |1234512346|
      
    
         Scenario Outline: add and destroy a cardholder
    Then I should have 0 "cardholder"
    Given I am on the new cardholder page
    Then I should see "New cardholder"
    Given I am filling cardholder form with Firstname "<cardholder_firstname>", Lastname "<cardholder_lastname>", Phonenumber "<cardholder_phonenumber>", Country "<cardholder_country>", City "<cardholder_city>", Address "<cardholder_address>", Passportnumber "<cardholder_passportnumber>"
    Then I should see "Show cardholder"
    Then I should have 1 "cardholder"
    Given I follow "Destroy"
    #Then I should have 0 "cardholder"
    Examples:
      | cardholder_firstname | cardholder_lastname | cardholder_phonenumber | cardholder_country | cardholder_city | cardholder_address | cardholder_passportnumber |
      | Sidor | Ivanov | +12341234 | Ukraine | Kiev | ulLenina | pa1234512346 |
      
         Scenario Outline: add and destroy a card
    Then I should have 0 "card"
    Given I am on the new card page
    Then I should see "New card"
    Given I am filling card form with Cardnumber "<card_cardnumber>"
    Then I should see "Show card"
    Then I should have 1 "card"
    Given I follow "Destroy"
    #Then I should have 0 "card"
    Examples:
      | card_cardnumber |
      |1234512346|
      
         Scenario Outline: assign card to cardholder and remove card from cardholder
    Then I should have 0 "cardholder"
    Given I am on the new cardholder page
    Then I should see "New cardholder"
    Given I am filling cardholder form with Firstname "<cardholder_firstname>", Lastname "<cardholder_lastname>", Phonenumber "<cardholder_phonenumber>", Country "<cardholder_country>", City "<cardholder_city>", Address "<cardholder_address>", Passportnumber "<cardholder_passportnumber>"
    Then I should see "Show cardholder"
    Then I should have 1 "cardholder" 
    Then I should have 0 "card"
    Given I am on the new card page
    Then I should see "New card"
    Given I am filling card form with Cardnumber "<card_cardnumber>"
    Then I should see "Show card"
    Then I should have 1 "card"
    Given I am on the cardholders page
	And I should see "<cardholder_firstname> <cardholder_lastname>"
	Then I follow "<cardholder_firstname> <cardholder_lastname>"
    And I should see "<cardholder_passportnumber>"
    And I should see "empty"
    Then I follow "empty"
    And I should see "<card_cardnumber>"
   Then I follow "<card_cardnumber>"
	Given I am on the cardholders page
	And I should see "<cardholder_firstname> <cardholder_lastname>"
	Then I follow "<cardholder_firstname> <cardholder_lastname>"
    And I should see "<cardholder_passportnumber>"
    And I should see "<card_cardnumber> (clear)"
	Then I follow "clear"
	Given I am on the cardholders page
	And I should see "<cardholder_firstname> <cardholder_lastname>"
	Then I follow "<cardholder_firstname> <cardholder_lastname>"
    And I should see "<cardholder_passportnumber>"
	And I should not see "<card_cardnumber> (clear)"
     
    Examples:
      | cardholder_firstname | cardholder_lastname | cardholder_phonenumber | cardholder_country | cardholder_city | cardholder_address | cardholder_passportnumber | card_cardnumber |
      | Sidor | Ivanov | +12341234 | Ukraine | Kiev | ulLenina | pa12345ss | 1234512347|
      
      
         Scenario: Count cardholders and cards
    Then I count "cardholder"
    Then I count "card"
