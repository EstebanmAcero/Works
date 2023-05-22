import sympy 
from sympy import symbols 
from sympy.solvers import solve 

x = symbols('x') 

# Put the equation here
eq = 2*x - 4

print("x = ", solve(eq,x))

# This program is for a equation equal to zero
