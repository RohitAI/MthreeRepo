import math
# activity  1 

val =input("Enter an integer:")
print(type(val))
integer=float(val)
print(f'The value is : {integer} , with type : {type(integer)}')

# activity 2

result = (5 + 3) ** 2 * 9 
 
print(result)

# activity 3

val1 = float(input("enter a float value :"))
print(math.trunc(val1))

# activity 4

p=int(input("Enter a intial deposit:"))
r=float(input("Rate of interest :"))
n=int(input("No of times :"))
t=int(input("No of Years :"))
v=p*(1+(r/n))**(n*t) 
print("Current Val :",v)

# activity 5

principal=int(input("Enter the principal value :"))
rate=float(input("Rate of interest :"))
days= int(input("Enter no of days :"))
interest = (principal* rate * days )/365
print(interest)

# activity 6

a=0
b=1 
print(a>b)
print(a==b)
print(a==(a-b))

print(a<b)
print(a!=b)
print(b==(b-a))

# activity 7

num=input("Enter a no:")
print("You Selected value is :", num)
print(f'The boolean of your number is:{bool(int(num))}')
print(f'The binary equivalent of your number is:{bin(int(num))}')
print(f'The square root of your number is : {math.sqrt(int(num)):.2f}')


# activity 8 

n=5
a=[]
for i in range(5):
    value=int(input(f'Enter {i} values:'))
    a.append(value)
pro=1 
s=0
avg=0.0
for i in a:
    pro*=i 
    s+=i 
    avg=s/len(a)
print(f'values entered : {a}')
print(f'Product : {pro}')
print(f'sum : {s}')
print(f'avg: {avg}')

# activity 9

street_address=[]
house_no=input("enter house no:")
street_name=input("enter street name:")
street_type=input("enter street type:")
street_address.extend([house_no,street_name,street_type])
print(f'Full address: {street_address}')
print(f'The house no / building no is : {street_address[0]}')
print(f'The street name is : {street_address[1]}')
