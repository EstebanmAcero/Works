# list  they are modificable
friends = [ 'Josehp', 'Glen', 'sail']
carryon = [ 'socks', 'shirt', 'perfume']

for i in [ 5,4,3,2,1] :
	print(i)
print('Blasstoff')

z = [ 'Josehp', 'Glen', 'sail']
for x in z:
	print('Happy new year:',x)
print('Done!')

friends = [ 'Josehp', 'Glen', 'sail']
print(friends[1])

print(len(friends))

# ranfe funtions returns a list of numbers
#that range from zero to one less than the paramenter

print (range(len(friends))

a = [1,2,3]
b = [4,5,6]
c = a + b
print(c)
a[1:2]
a[:1]
a[1:]
a[:]

x = list()
type (x)
dir (x) # that indicades all that can do or th methods

stuff = list()
stuff.append('book')
stuff.append('00')
# append adds elements
some = [1,5,345,62,3,9]
9 in some
#true

friends = [ 'Josehp', 'Glen', 'sail']
friends.sort()
print(friends)


# function apply to list
# len , max, min, sum


numlist = list()
while True:
	inp = input ('Enter a number')
	if inp == 'Done': break
	value = float (inp)
	numlist.append(value)

average = sum(numlist)/len(numlist)
print('Average: ', average)



########### String with list
abc = 'With three words'
stuff = abc.split() 
# this methodt separates the words by space and convert in a list
# but also can send another paramether
print(stuff)
print(len(stuff)


line = 'first;second;third'
thing = line.split(';')
print(thing)
      
      
      
words = 'His e-mail is q-lar@freecodecamp.org'
pieces = words.split()
parts = pieces[3].split('-')
n = parts[1]      
