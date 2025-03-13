# activity 1 
inp=int(input("enter amount:"))
if inp >=20:
    print("You're rich!")
else:
    print("You're broke!")
    
    
#activity 2 

cats = input("Do you own any cats? (Yes/No): ").strip().lower()
dogs = input("Do you own any dogs? (Yes/No): ").strip().lower()
    
if cats == "yes" and dogs == "yes":
    print("You must really love pets!")
if cats == "no" or dogs == "no":
    print("Maybe you need more pets.")

if cats == "yes" and dogs == "yes":
    print("You must really love pets!")
else:
    print("Maybe you need more pets.")
print("You must really love pets!" if cats == "yes" and dogs == "yes" else "Maybe you need more pets." )


#activity  3

questions = {
        "The Earth is flat.": False,
        "Python is a programming language.": True,
        "The capital of France is Paris.": True,
        "Water boils at 100 degrees Celsius at sea level.": True,
        "Humans can breathe underwater without equipment.": False,
}

user_answers = {}
correct_count = 0

print("Welcome to the True or False Quiz!")
print("Please answer with 'True' or 'False'.\n")

for question, correct_answer in questions.items():
    user_response = input(f"{question} (True/False): ").strip().capitalize()

        
    if user_response == 'True':
        user_answers[question] = True
    elif user_response == 'False':
        user_answers[question] = False
    else:
        print("Invalid input. Please answer with 'True' or 'False'.")
        continue  

        
    if user_answers[question] == correct_answer:
        correct_count += 1

    
print("\nQuiz Results:")
for question, correct_answer in questions.items():
    print(f"{question} - Your answer: {user_answers[question]}, Correct answer: {correct_answer}")

total_questions = len(questions)
correct_rate = (correct_count / total_questions) * 100
print(f"\nYou answered {correct_count} out of {total_questions} questions correctly.")
print(f"Your correct response rate is: {correct_rate:.2f}%")


# activity 4

usr_rspn=input("what season it is (fall/autumn, winter, spring, or summer)?").strip().lower()
if usr_rspn=="fall" or usr_rspn=="autumn":
    print("I bet the leaves are pretty there!")
elif usr_rspn=="winter":
    print("I hope you're ready for snow!")
elif usr_rspn=="spring":
    print("I can smell the flowers!")
elif usr_rspn=="summer":
    print("Make sure your AC is working!")
else:
    print("I don't recognize that season.")
