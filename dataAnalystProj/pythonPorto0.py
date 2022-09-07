
# string input

# name = input('What is your name? ')
# color = input('what is your fav color? ')
# print(name + ' likes ' + color)

# Type conversion (weight conversion lbs to kg)

# weight = input('what is your weight(lbs)? ')
# conv = int(weight)*0.45
# print('So, your weight is '+ str(conv) +' Kg')

#if statement
price = 1000000
custCred = input('do you have a good credit? True or False')
if custCred == 'True':
    total = price - (price*0.2)
    print(f'your total payment is {total}')
elif custCred == 'False':
    total = price- (price*0.1)
    print(f'your total payment is {total}')
