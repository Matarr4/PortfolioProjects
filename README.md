BMI Calculator
https://mercer-health.com/services/weight-management-center/bmi-calculator#:~:text=Body%20Mass%20Index%2C%20or%20BMI,inches%20x%20height%20in%20inches

name = input("Please enter your full name: ")

weight = int(input("Please enter your weight in pounds: "))

height = int(input("Please enter your height in inches: "))

BMI = (weight * 703) / (height * height)

print(BMI)

if BMI>0:
    if(BMI<18.5):
        print(name +", you are underweight. Eat more to maitain a healty body.")
    elif (BMI<=24.9):
        print(name +", you are normal weight. You are doing great, keep up the good work.")
    elif (BMI<29.9):
        print(name +", you are overweight. You need to exercise more often.")
    elif (BMI<34.9):
        print(name +", you are obese. You need to exercise at least 3x a week.")
    elif (BMI<39.9):
        print(name +", you are severely obese. You need to change your diet in other to lose weight")
    else:
        print(name +", you are morbidly obese. You are at extremely high risk and need to see a weight doctor")
else:
    print("Enter valid input")
Enter you name: Sering
Enter your weight in pounds: 170
Enter your height in inches: 69
25.101869355177485
Sering, you are overweight. You need to exercise more often.
 
 
 
#BMI = (weight in pounds x 703) / (height in inches x height in inches)
print(weight)
Under 18.5	Underweight	Minimal
18.5 - 24.9	Normal Weight	Minimal
25 - 29.9	Overweight	Increased
30 - 34.9	Obese	High
35 - 39.9	Severely Obese	Very High
40 and over	Morbidly Obese	Extremely High
if BMI>0:
    if(BMI<18.5):
        print(name +", you are underwight.")
    elif (BMI<=24.9):
        print(name +", you are normal weight.")
    elif (BMI<29.9):
        print(name +", you are overweight.")
    elif (BMI<34.9):
        print(name +", you are obese.")
    elif (BMI<39.9):
        print(name +", you are severely obese.")
    else:
        print(name +", you are morbidly obese.")
else:
    print("Enter valid input")
Sering, you are overweight. You need to exercise more often.
 
 
 
 
 
 
 
 
 
 
 
 
 
