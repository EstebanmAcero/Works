fruit = 'banana'
index = 0
len (fruit) # devuelve la longitud de la palabra o frase
while index < len (fruit)
	letter = fruit[index]
	print (index, letter)
	index = index + 1

	
	stuff = "Hello World"
type(stuff)
dir (stuff)  # da los metodos
# lo que sucede aca es que da todo lo que se puede hacer
# que otras funciones se le puede aplicar al tipo de dato

s = 'Monty Python'
print (s[0:4]) #Mont
print (s[6:7]) #P
print (s[6:20])#Python
print (s[:2])  #Mo
print (s[8:])  #thon
print (s[:])   #Monty Python

fruit = 'banana'
'n' in fruit #True
'm' in fruit #False

greet = 'Hello Bob'
zap = greet.lower()
print (zap)	#hello bob
print ('HI There'.lower())	#hi there


fruit = 'banana'
pos = fruit.find('na')
print (pos) #the result is 2 because is for posicions 


greet = 'Hello Bob'
zap = greet.upper()
print (zap)	#HELLO BOB


greet = 'Hello Bob'
zap = greet.replace('Bob','Jane')
print (zap)	#Hello Jane
zap = greet.replace('o','X')
print (zap) # HellX Jane


#if we want to delete the white-space

greet = '    Hello Bob    '
greet.lstrip()	# 'Hello Bob	'
greet.rstrip()  # '	Hello Bob'
greet.srip ()	# 'Hello Bob'

line  = 'Please have a nice day '
line.startswith('Please') #True
line.stratswith('p') 	#False


data = 'From stepeh.marque@uct.az.a Sat Jan'
atpos = data.find('@')
print(atpos)
sppos = data.find(' ', atpos) # esto dice encontrar espacio despues de que encontro @
host = data [ atpos+1: sppos] 
print(host)
