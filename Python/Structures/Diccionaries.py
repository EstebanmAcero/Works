# Dictionaries the orden doesn't matter
# key and value exampel {'course': 182}
# key = course and value = 123

# in list is by posicions

purse = dict()
purse['money'] = 12
purse['candy'] = 3
purse['tissaue'] = 75

print(purse)

purse['candy'] = purse['candy ']+2
print(purse)

jjj = { 'chuch': 1, 'fred': 42, 'jane': 100}
print (jjj)

### common applications
# count the frecuency of the things is an histogram

ccc = dict()
ccc ['csev'] = 1
ccc ['cwen'] = 1
print(ccc)
ccc ['csev'] = ccc ['csev'] + 1
print(ccc)

'csev' in ccc

counts = dict()
names = [ 'csev', 'cwen', 'csev', 'zqian,'cwien']
for nam in names:
	if name not in counts:
		counts[nam]=1
	else :
		counts[nam] = counts[nam] +1
print(counts)



counts = dict()
names = [ 'csev', 'cwen', 'csev', 'zqian,'cwien']
for nam in names:
	counts[nam] = counts.get(nam,0) +1 
# the get provide a default value of zero when the key is not yet in the dictionary

print(counts)


count = dict ()
line = input ('Enter a line of text: ')

words = line.split()

print('Words: ', words)
print('Counting...')

for word in workds:	
	counts[word] = counts.get(word,0) + 1
print('Counts', counts)


counts = {'chuck] : 1, 'fred':42, 'jan':100}
for key in counts:
	print(key, counts[key])


jjj= {'chuck] : 1, 'fred':42, 'jan':100}
print(list(jjj))

print(jjj.keys())  # here we get the keys 
print(jjj.values())# here we get the values

print(jjj.items()) # get the values and keys from the dictionaries

# this is an iteracion in both keys and values 
jjj= {'chuck] : 1, 'fred':42, 'jan':100}

for aaa, bbb in jjj.items()
	print(aaa,bbb)


name = input ('Enter file:')
handle = open (name)

counts = dict()
for line in handle:
	words = line.split()
	for word in words:
		counts[words] = counts.get(word,0) + 1

bigcount = None
bigword = None
for word, count in count.items():
	if bifcount is None or count > bigcount:
		bigword = word
		bigcount = count

print (bigword,bigcount)


counts = { 'chuck' : 1 , 'annie' : 42, 'jan': 100}
for key in counts:
    if counts[key] > 10:
        print(key, counts[key])
