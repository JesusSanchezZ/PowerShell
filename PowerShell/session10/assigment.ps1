cls
# Script: Loan_Simple_Interest

# User Inputs
[ValidateRange(1000,1000000)]$principle = [double] (Read-Host "Principle amount you are looking for? 1000-100000")
[ValidateRange(2, 5)]$time = [double] (Read-Host "Tenure? 2-5 years")