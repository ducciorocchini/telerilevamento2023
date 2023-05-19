greet <- function() {
print("Hello world") 
}

greet_me <- function(name) {   
greet_string <- paste("Hello", name, sep = " ")   
print(greet_string) 
}

greet_me("duccio")

greet_me <- function(name = "Duccio") {   
greet_string <- paste("Hello", name, sep = " ")   
print(greet_string) 
}

greet_me()
greet_me("Elisa")

add_two <- function(num = 0) {   
n_plus_two <- num + 2   
return(n_plus_two) 
}

add_two("f") # an error will occurr
# putting a control: if
n <- 3 
if(n < 10) {
print("n è minore di 10")
}

n<-12
if(n < 10) {print("n è minore di 10")} else if(n > 10) 
{print("n è maggiore di 10")}

isten <- function(num = 0) {   if(num < 10) {     print("n è minore di 10")   } else if(num > 10) {     print("n è maggiore di 10")   } else {     print("n è uguale a 10")   } }

