# -*- coding: utf-8 -*-
"""
Created on Mon Jun 12 17:59:45 2023

@author: Usuario
"""

# objects

class PartyAnimal():
	x = 0
# def is an method because it's inside of a class
	def party (self):
		self.x = self.x + 1
		print("So far", self.x)

an = PartyAnimal()
PartyAnimal.party(an)
an.party()
an.party() # an is taked a parameter 
an.party()


x = list()
type(x)

dir(x) # it's to define the directory or all the things that can do


class PartyAnimal():
	x = 0
# def is an method because it's inside of a class
	def party (self):
		self.x = self.x + 1
		print("So far", self.x)

an = PartyAnimal()

print('TYpe', type(an))
print('Dir', dir(an))


## there is a constructor and a destructor 
# the constructor inicialize the variables
# the destructor ends or rewrite the variable

class PartyAnimal:
    x = 0
    
    def __init__(self):
        print('i am constructed')
        
    def party (self):
        self.x = self.x + 1
        print('So far', self.x)
        
    def __del__ (self):
        print ('I am destructed' , self.x)
        
an = PartyAnimal()

an.party()
an.party()
an = 43
print ('an contains', an)



class PartyAnimal:
    x = 0
    name = ""
    
    def __init__(self,z):
        self.name = z
        print(self.name, "xonstructed")
        
    def party(self):
        self.x = self.x + 1
        print (self.name, "party count" , self.x)


s = PartyAnimal("sally")
s.party()

j = PartyAnimal("Jim")
j.party()
s.party()



class PartyAnimal:
    x = 0
    name = ""
    
    def __init__(self,z):
        self.name = z
        print(self.name, "xonstructed")
        
    def party(self):
        self.x = self.x + 1
        print (self.name, "party count" , self.x)

class FootballFan(PartyAnimal):
    points = 0
    def touchdown(self):
        self.points = self.points + 7
        self.party()
        print(self.name, "points", self.points)
        
s = PartyAnimal("sally")
s.party()

j = FootballFan("Jim")
j.party()

j.touchdown()      


