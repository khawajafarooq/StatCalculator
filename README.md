# StatCalculator
Statistical Calculator App (Swift)

Following is covered in this app:
- Autolayouts
- Xcode Unit Testing
- Test Driven Development

The application is build on TDD concept. Below are test cases considered:

# Backlog

<Version 1>
- As a user I need a statistical calculator
  - As a user I would like to enter an arbitrary large series of real numbers on a keypad
    - As a user I would like to add numbers to the list
    - As a user I would like to clear the complete list
    - As a user I would like to clear the number which is currently in the display
    -- <Version 2>
    - As a user I would like to change individual numbers in the series
    - As a user I would like to remove individual numbers from the list
  - As a user I would like to perform statistical operations on the number series I entered and see the result in the display
    - As a user I would like to compute the sum of the number series
    - As a user I would like to compute the mean value of the number series
    - As a user I would like to compute the mean value of the sum of the numbers squared in the series
    - As a user I would like to negate individual numbers in the series
    - As a user I would like to compute the variance of the numbers in the series
    -- <Version 2>
    - As a user I would like to compute the standard deviation of the numbers in the series
    - As a user I would like to compute the median of the numbers in the series
    - As a user I would like to compute the 75% quantile of the numbers in the series
  -- <Version 3>
  - As a user I would like to see a nice chart of the number series
    - As a user I would like to see a bar chart of the numbers in the series
<Version 2>
- As a product designer I would like to put the calculating logic into a REST service so I can offer the same calculating logic to all my users
  - As a product designer I would like to move the sum of number series to the server (Implement a REST-API url to add a series of numbers)
  - As a product designer I would like to move the mean value of number series to the server (Implement a REST-API url to compute the mean of a series of numbers)

I have completed this at least 70% (before charts), rest is still under development.
