#Tuples they can not be modified
# you cannot alter its contens 
x = ('Cleen', 'Sally', 'Yosep')
print(x[2])

y = (1, 45, 534)
print(y)

print(max(y))

for iter in y :
	print (iter)

t= tuple()
dir(t)

# only have count and index

(x, y)= (4, 'Fred')
print(y)
# Fred

(a, b) = (99, 97)
print(a)
# 99


d = dict()
d['csev'] = 2
d['cwen'] = 4

for (k, v) in d.items():
	print(k,v)

tups= d.items()
print(tups)
# dict_items([('csev',2), ('cwen',4)])


### sorting lists of tuples
d= { 'a': 10, 'b': 1, 'c':22}
d.items()

t=sorted(d.items())


for k, v in sorted(d.items()):
	print(k,v)




d= { 'a': 10, 'b': 1, 'c':22}
tmp = list()
for k, v in c.items():
	tmp.append((v,k))

print(tmp)

tmp = sorted(tmp, reverser = True)
print(tmp)


fhand = open('romeo.txt')
counts = dict()
for line in fhand:
	words = line.split()
	for word in words
		counts[word] = counts.get(word, 0) +1 
		# remember this is a dicctionary

lst = list()
for key,val in counts.items():
	newtup = (val,key)
	lst.append(newtup)

lst = sorted(lst, reverse = True)

for val, key in list [:10]
	print(key, val)



# they do exactly the same
lst = []
for key, val in counts.items():
    newtup = (val, key)
    lst.append(newtup)
lst = sorted(lst, reverse=True)
print(lst)
print( sorted( [ (v,k) for k,v in counts.items() ], reverse=True ) )
