/*:
 ## App Exercise - Fitness Calculations
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Your fitness tracker keeps track of users' heart rate, but you might also want to display their average heart rate over the last hour. Create three constants, `heartRate1`, `heartRate2`, and `heartRate3`. Give each constant a different value between 60 and 100. Create a constant `addedHR` equal to the sum of all three heart rates. Now create a constant called `averageHR` that equals `addedHR` divided by 3 to get the average. Print the result.
 */
let hearRate1 = 80
let hearRate2 = 45
let hearRate3 = 77
let averageHR = (hearRate1 + hearRate2 + hearRate3) / 3
print(averageHR)
/*:
 Now create three more constants, `heartRate1D`, `heartRate2D`, and `heartRate3D`, equal to the same values as `heartRate1`, `heartRate2`, and `heartRate3`. These new constants should be of type `Double`. Create a constant `addedHRD` equal to the sum of all three heart rates. Create a constant called `averageHRD` that equals the `addedHRD` divided by 3 to get the average of your new heart rate constants. Print the result. Does this differ from your previous average? Why or why not?
 */
let hearRate1D = 80.0
let hearRate2D = 45.0
let hearRate3D = 77.0
let averageHRD = (hearRate1D + hearRate2D + hearRate3D) / 3
//The playground won't run so I can't see the answers
/*:
 Imagine that partway through the day a user has taken 3,467 steps out of the 10,000 step goal. Create constants `steps` and `goal`. Both will need to be of type `Double` so that you can perform accurate calculations. `steps` should be assigned the value 3,467, and `goal` should be assigned 10,000. Create a constant `percentOfGoal` that equals an expression that evaluates to the percent of the goal that has been achieved so far.
 */
let steps: Double = 3_467
let goal: Double = 10_000
let percentOfGoal = steps / goal
//: [Previous](@previous)  |  page 2 of 8  |  [Next: Exercise - Compound Assignment](@next)
