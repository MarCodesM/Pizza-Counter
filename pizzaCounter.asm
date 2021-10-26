.data

#messages
askCircle:      .asciiz     "Number of round pizzas sold: "
askSqaure:	    .asciiz     "Number of sqaure pizzas sold: "
userGuess:	    .asciiz     "Estimate total pizzas sold in square feet: "
allTotal:       .asciiz     "\nTotal number of pizzas sold: "
onlySquare:     .asciiz     "\n\nTotal square pizzas sold: "
sqrFeet:        .asciiz     "ft^2"
onlyCircle:     .asciiz     "\nTotal circle pizzas sold: "
badGuess:       .asciiz     "\n\n\nBummer!"
goodGuess:      .asciiz     "\n\n\nYeah!"


#consant areas for pizzas
sqaureArea:	.float	0.56
circleArea:	.float	0.54


.text
 	main:
 
    #load constant areas
    l.s $f14, sqaureArea
    l.s $f10, circleArea
    
    #prompt to enter round pizzas
    li $v0, 4
    la $a0, askCircle
    syscall
    
    #get int from user
    li $v0, 6
    syscall
    
    #store round pizza sold in $f4
    #multiply round pizza * $f10 stor in $f16
    mov.s $f4, $f0
    mul.s $f16, $f4, $f10
 	
 	
 	#prompt to enter square pizzas
 	li $v0, 4
 	la $a0, askSqaure
 	syscall
 	
 	#get int from user 
 	li $v0, 6
 	syscall
 	
 	#store square pizzas sold in $f6
 	#multiply square pizza * $f14 stor in $f18
 	mov.s $f6, $f0
 	mul.s $f18, $f6, $f14
 	
    #prompt to enter guess
    li $v0, 4
    la $a0, userGuess
    syscall

    #get user float guess
    li $v0, 6
    syscall
 	 
 	#store user guess in $f8
 	mov.s $f8, $f0
 	 
 	#print total number of sqaure feet for sqaure pizzas
 	li $v0, 4
 	la $a0, onlySquare
 	syscall
 	
 	li $v0, 2
 	mov.s $f12, $f18
 	syscall
 	
 	li $v0, 4
 	la $a0, sqrFeet
 	syscall
 	
 	
 	#print total number of sqaure  feet  for circle pizzas
 	li $v0, 4
 	la $a0, onlyCircle
 	syscall
 	
 	li $v0, 2
 	mov.s $f12, $f16
 	syscall
 	
 	li $v0, 4
 	la $a0, sqrFeet
 	syscall
 	
 	
 	#print total number of square feet for both
 	add.s $f20, $f16, $f18
 	
 	li $v0, 4
 	la $a0, allTotal
 	syscall
 	
 	li $v0, 2
 	mov.s $f12, $f20
 	syscall
 	
	li $v0, 4
 	la $a0, sqrFeet
 	syscall

	#checks to see if guess what high or low
	c.lt.s $f8, $f20
	bc1f theirGuessLow
	

	#prints Yeah
 	li $v0, 4
 	la $a0, goodGuess
 	syscall
 	
	li $v0, 10
	syscall

#prints bummer
    theirGuessLow:
  	li $v0, 4
 	la $a0, badGuess
 	syscall
 	

