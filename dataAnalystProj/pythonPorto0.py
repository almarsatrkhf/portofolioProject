#
# # string input
#
# name = input('What is your name? ')
# color = input('what is your fav color? ')
# print(name + ' likes ' + color)
#
# # Type conversion (weight conversion lbs to kg)
#
# weight = input('what is your weight(lbs)? ')
# conv = int(weight)*0.45
# print('So, your weight is '+ str(conv) +' Kg')
#
# # if statement
#
# price = 1000000
# custCred = input('do you have a good credit? True or False')
# if custCred == 'True':
#     total = price - (price*0.2)
# elif custCred == 'False':
#     total = price - (price*0.1)
# print(f'your total payment is {total}')
#
# name = input('enter your name: ')
# if len(name) <= 3:
#     print('Name lenght must be more than 3 character')
# elif len(name) >= 25:
#     print('Name lenght exceed the max character limit')
# else:
#     print(f'Hello there, {name}!')
#
# weight = input('what is your weight? ')
# satuan = input('Lbs or Kg? ')
# if satuan.capitalize() == 'Kg':
#     conv = int(weight)*2.2
#     print(f'So, your weight is {conv} lbs')
# elif satuan.capitalize() == 'Lbs':
#     conv = int(weight)*0.45
#     print(f'So, your weight is {conv} Kg')
#
# # Car game
#
# start_car = 'Car started, lets go!'
# stop_car = 'Car stopped.'
# quit_game = 'quitting game...'
# menu = '''
# start - to start the car
# stop - to stop the car
# quit - to exit'''
# user = ''
# while user != 'quit':
#     user = input("Type 'menu' for main menu: ").lower()
#     if user == 'menu':
#         print(menu)
#         break
#     elif user == 'quit':
#         break
#     else:
#         print('I dont understand..')
#
# command = ''
# carIgnition = False
#
# while command != 'quit':
#    command = input('>>> ').lower()
#    if command == 'start':
#        if carIgnition:
#            print('Car already started.')
#        else:
#            carIgnition = True
#            print(start_car)
#    elif command == 'stop':
#        if not carIgnition:
#            print('Car already stopped.')
#        else:
#            carIgnition = False
#            print(stop_car)
#    elif command == 'quit':
#        print('quitting game...')
#        break
#    else:
#        print('I dont understand...')

# #for loops
#
# prices = [10,20,30]
# total = 0
# for item in prices:
#     total += item
# print(f'total: {total}')

# numbers = [5,2,5,2,2]
# for item in numbers:
#     print('x'*item)

# numbers = [2,3,1,44,5,3,6,34,10]
# max = numbers[0]
# for number in numbers:
#     if number > max:
#         max = number
# print(max)

# dictionary
phonekey = {
'1':'One',
'2':'Two',
'3':'Three'
}
usernumber = input('number: ')
output = ''
for number in usernumber:
    output += phonekey.get(number,'!')+' '
print(output)