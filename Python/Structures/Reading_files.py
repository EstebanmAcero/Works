
# Reading files 
handle = open (filename, mode) #mode read or write, open or close
fhand = open ('mbox.txt', 'r')

fhand = open ('mbox.txt')
couent = 0
for line in fhand
	count = count + 1
print ('Line Count:', count)

fhand = open ('mbox-short.txt')
inp = fhand.read()
print(len(inp))

print(inp[:20])


fhand = open ('mbox-short.txt')
for line in fhand:
	if line.startswith("From:  '):
		print (line)



fhand = open ('mbox-short.txt')
for line in fhand:
	line = line.rstrip()
	if not  '@uct.ac.za' in line :
		continue  # Skips to the next iteration of the loop.
	print(line)


fname = input('Enter the file name: ')
try:
	fhand = open (fname)
except:
	print('File cannot be opened: ', fname)
	quit()

count = 0
for line in fhand
	if line.startswith ('Subject:'):
		count = count + 1
print('There were ', count, 'subject lines in', fname)

