


.globl main
main:
# prologue
pushq %rbp
movq %rsp, %rbp
# make space for locals on stack, must be multiple of 16
subq $16, %rsp
# copy formals in registers to stack frame
movq %rdi, -8(%rbp)  # formal _main_x->-8(%rbp)
# initialize local variables to zero

movq $0, -16(%rbp)  # _main_c->-16(%rbp)

# 20 
pushq $20
#c =  20 ;

popq %rax
movq %rax, -16(%rbp)

# 10 
pushq $10
popq %rdi
# calling fibs
callq _fibs
pushq %rax
#c = fibs( 10 );

popq %rax
movq %rax, -16(%rbp)

# 1000 
pushq $1000
# c 
pushq -16(%rbp) #   c 
# times: 1000  *  c 
popq %rdx
popq %rax
imulq %rdx, %rax
pushq %rax
# print( 1000  *  c );
popq %rdi
movb	$0, %al
callq print

# 200 
pushq $200
# 100 
pushq $100
# 100 
pushq $100
popq %rdi
popq %rsi
popq %rdx
# calling test
callq _test
pushq %rax
#c = test( 100 , 100 , 200 );

popq %rax
movq %rax, -16(%rbp)

# 200 
pushq $200
# 150 
pushq $150
# 100 
pushq $100
popq %rdi
popq %rsi
popq %rdx
# calling test
callq _test
pushq %rax
#c = test( 100 , 150 , 200 );

popq %rax
movq %rax, -16(%rbp)

# 200 
pushq $200
# 10 
pushq $10
# 100 
pushq $100
popq %rdi
popq %rsi
popq %rdx
# calling test
callq _test
pushq %rax
#c = test( 100 , 10 , 200 );

popq %rax
movq %rax, -16(%rbp)

# 200 
pushq $200
# 300 
pushq $300
# 100 
pushq $100
popq %rdi
popq %rsi
popq %rdx
# calling test
callq _test
pushq %rax
#c = test( 100 , 300 , 200 );

popq %rax
movq %rax, -16(%rbp)
# calculate return value
# c 
pushq -16(%rbp) #   c 
# epilogue
popq %rax
addq $16, %rsp
popq %rbp
retq



.globl _test
_test:
# prologue
pushq %rbp
movq %rsp, %rbp
# make space for locals on stack, must be multiple of 16
subq $32, %rsp
# copy formals in registers to stack frame
movq %rdi, -8(%rbp)  # formal _test_a->-8(%rbp)
movq %rsi, -16(%rbp)  # formal _test_b->-16(%rbp)
movq %rdx, -24(%rbp)  # formal _test_c->-24(%rbp)
# initialize local variables to zero

movq $0, -32(%rbp)  # _test_d->-32(%rbp)

# conditional statement
# b 
pushq -16(%rbp) #   b 
# a 
pushq -8(%rbp) #   a 
popq %rdi
popq %rsi
# calling equal
callq _equal
pushq %rax
popq %rax
cmpq	$1, %rax
jne L14

# 0 
pushq $0
#d =  0 ;

popq %rax
movq %rax, -32(%rbp)
jmp L15
L14:
# conditional statement
#  a < b 
# a 
pushq -8(%rbp) #   a 
# b 
pushq -16(%rbp) #   b 
# compare rdx<rax and push 1 on stack if true, 0 else
popq %rdx
popq %rax
cmpq %rdx, %rax
jge L0
pushq $1
jmp L1
L0:
pushq $0
L1:
#  c < b 
# c 
pushq -24(%rbp) #   c 
# b 
pushq -16(%rbp) #   b 
# compare rdx<rax and push 1 on stack if true, 0 else
popq %rdx
popq %rax
cmpq %rdx, %rax
jge L2
pushq $1
jmp L3
L2:
pushq $0
L3:
# not:null
popq %rax
negq %rax
addq $1, %rax
pushq %rax
# and:null
popq %rax
popq %rcx
imulq %rcx, %rax
pushq  %rax
popq %rax
cmpq	$1, %rax
jne L12

# 111 
pushq $111
#d =  111 ;

popq %rax
movq %rax, -32(%rbp)
jmp L13
L12:
# conditional statement
#  a < b 
# a 
pushq -8(%rbp) #   a 
# b 
pushq -16(%rbp) #   b 
# compare rdx<rax and push 1 on stack if true, 0 else
popq %rdx
popq %rax
cmpq %rdx, %rax
jge L4
pushq $1
jmp L5
L4:
pushq $0
L5:
# not:null
popq %rax
negq %rax
addq $1, %rax
pushq %rax
popq %rax
cmpq	$1, %rax
jne L10

# 222 
pushq $222
#d =  222 ;

popq %rax
movq %rax, -32(%rbp)
jmp L11
L10:
# conditional statement
#  b < c 
# b 
pushq -16(%rbp) #   b 
# c 
pushq -24(%rbp) #   c 
# compare rdx<rax and push 1 on stack if true, 0 else
popq %rdx
popq %rax
cmpq %rdx, %rax
jge L6
pushq $1
jmp L7
L6:
pushq $0
L7:
# not:null
popq %rax
negq %rax
addq $1, %rax
pushq %rax
popq %rax
cmpq	$1, %rax
jne L8

# 333 
pushq $333
#d =  333 ;

popq %rax
movq %rax, -32(%rbp)
jmp L9
L8:

# 444 
pushq $444
#d =  444 ;

popq %rax
movq %rax, -32(%rbp)
L9:
L11:
L13:
L15:

# d 
pushq -32(%rbp) #   d 
# print( d );
popq %rdi
movb	$0, %al
callq print
# calculate return value
# d 
pushq -32(%rbp) #   d 
# epilogue
popq %rax
addq $32, %rsp
popq %rbp
retq



.globl _equal
_equal:
# prologue
pushq %rbp
movq %rsp, %rbp
# make space for locals on stack, must be multiple of 16
subq $16, %rsp
# copy formals in registers to stack frame
movq %rdi, -8(%rbp)  # formal _equal_a->-8(%rbp)
movq %rsi, -16(%rbp)  # formal _equal_b->-16(%rbp)
# initialize local variables to zero

# calculate return value
#  a < b 
# a 
pushq -8(%rbp) #   a 
# b 
pushq -16(%rbp) #   b 
# compare rdx<rax and push 1 on stack if true, 0 else
popq %rdx
popq %rax
cmpq %rdx, %rax
jge L16
pushq $1
jmp L17
L16:
pushq $0
L17:
# not:null
popq %rax
negq %rax
addq $1, %rax
pushq %rax
#  b < a 
# b 
pushq -16(%rbp) #   b 
# a 
pushq -8(%rbp) #   a 
# compare rdx<rax and push 1 on stack if true, 0 else
popq %rdx
popq %rax
cmpq %rdx, %rax
jge L18
pushq $1
jmp L19
L18:
pushq $0
L19:
# not:null
popq %rax
negq %rax
addq $1, %rax
pushq %rax
# and:null
popq %rax
popq %rcx
imulq %rcx, %rax
pushq  %rax
# epilogue
popq %rax
addq $16, %rsp
popq %rbp
retq



.globl _fibs
_fibs:
# prologue
pushq %rbp
movq %rsp, %rbp
# make space for locals on stack, must be multiple of 16
subq $48, %rsp
# copy formals in registers to stack frame
movq %rdi, -8(%rbp)  # formal _fibs_n->-8(%rbp)
# initialize local variables to zero

movq $0, -16(%rbp)  # _fibs_i->-16(%rbp)
movq $0, -24(%rbp)  # _fibs_a->-24(%rbp)
movq $0, -32(%rbp)  # _fibs_b->-32(%rbp)
movq $0, -40(%rbp)  # _fibs_temp->-40(%rbp)

# 0 
pushq $0
#a =  0 ;

popq %rax
movq %rax, -24(%rbp)

# 1 
pushq $1
#b =  1 ;

popq %rax
movq %rax, -32(%rbp)

# 1 
pushq $1
#i =  1 ;

popq %rax
movq %rax, -16(%rbp)

# while: null
L22:
#  i < n 
# i 
pushq -16(%rbp) #   i 
# n 
pushq -8(%rbp) #   n 
# compare rdx<rax and push 1 on stack if true, 0 else
popq %rdx
popq %rax
cmpq %rdx, %rax
jge L20
pushq $1
jmp L21
L20:
pushq $0
L21:
popq %rax
cmpq	$1, %rax
jne L23

# a 
pushq -24(%rbp) #   a 
# b 
pushq -32(%rbp) #   b 
# plus: a  +  b 
popq %rdx
popq %rax
addq %rdx, %rax
pushq %rax
#temp =  a  +  b ;

popq %rax
movq %rax, -40(%rbp)

# b 
pushq -32(%rbp) #   b 
#a =  b ;

popq %rax
movq %rax, -24(%rbp)

# temp 
pushq -40(%rbp) #   temp 
#b =  temp ;

popq %rax
movq %rax, -32(%rbp)

# b 
pushq -32(%rbp) #   b 
# print( b );
popq %rdi
movb	$0, %al
callq print

# i 
pushq -16(%rbp) #   i 
# 1 
pushq $1
# plus: i  +  1 
popq %rdx
popq %rax
addq %rdx, %rax
pushq %rax
#i =  i  +  1 ;

popq %rax
movq %rax, -16(%rbp)
jmp L22
L23:
# calculate return value
# b 
pushq -32(%rbp) #   b 
# epilogue
popq %rax
addq $48, %rsp
popq %rbp
retq

