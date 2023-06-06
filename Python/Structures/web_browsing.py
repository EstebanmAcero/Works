#Network whit pyhton
# There is an book Introduction of networking
# socket enchufe encaje llamada para conectar

import socket
mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect (( 'data.pr4e.org', 80))
# here 80 is the port 
# data.pr4e.org is the host

import socket
mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect (( 'data.pr4e.org', 80))
cmd = 'GET http://data.pr4e.org/romeo.txt HTTP/1.0\n\n'.encode()
mysock.send(cmd)

while True:
	data = mysock.recv(512) # recibir 512 caracteres
	if (len(data) < 1):
		break
	print(data.decode())
mysock.close()


#order numeric representation
print(ord('H'))

print(ord('e'))

print(ord('\n'))



#let's go with the library urllib

import urllib.request, urllib.parse, urllib.error

fhand = urllib.request.urlopen('http://data.pr4e.org/romeo.txt')
for line in fhand:
	print(line.decode(),strip())


import urllib.request, urllib.parse, urllib.error

fhand = urllib.request.urlopen('http://data.pr4e.org/romeo.txt')
counts = dict()
for line in fhand:
	words = line.decode().split()
	for word in words:
		counts [word] = counts.get(word,0) + 1
print(counts)



# instalacion of beutiful soup 
#this can mix html or show the headers
import urllib.request, urllib.parse, urllib.error


from bs4 import BeautifulSoup

url = input ('Enter - ')
html = urllib.request.urlopen(url).read()
soup = BeautifulSoup(html, 'html.parser')

tags = soup ('a')
for tag in tags:
	print( tag.get('href', None))


