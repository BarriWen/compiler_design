


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

movq $0, -16(%rbp)  # _main_a->-16(%rbp)

# 3 
pushq $3
# 10 
pushq $10
popq %rdi
popq %rsi
# calling arrayDemo
callq _arrayDemo
pushq %rax
#a = arrayDemo( 10 , 3 );

popq %rax
movq %rax, -16(%rbp)
# calculate return value
# 1 
pushq $1
# epilogue
popq %rax
addq $16, %rsp
popq %rbp
retq



.globl _arrayDemo
_arrayDemo:
# prologue
pushq %rbp
movq %rsp, %rbp
# make space for locals on stack, must be multiple of 16
subq $32, %rsp
# copy formals in registers to stack frame
movq %rdi, -8(%rbp)  # formal _arrayDemo_s->-8(%rbp)
movq %rsi, -16(%rbp)  # formal _arrayDemo_t->-16(%rbp)
# initialize local variables to zero

movq $0, -24(%rbp)  # _arrayDemo_a->-24(%rbp)
movq $0, -32(%rbp)  # _arrayDemo_b->-32(%rbp)

# 0 
pushq $0
#a =  0 ;

popq %rax
movq %rax, -24(%rbp)

# s 
pushq -8(%rbp) #   s 
# 8 
pushq $8
# times: s  *  8 
popq %rdx
popq %rax
imulq %rdx, %rax
pushq %rax
# new array:null
popq %r8
movq %r8, %rdi
incq %rdi
shlq $3, %rdi
callq _malloc
movq %r8, (%rax)
pushq %rax
#b = null;

popq %rax
movq %rax, -32(%rbp)

# 0 
pushq $0
# 100 
pushq $100
# b[ 0 ] =  100 ;

popq %rax
popq %rcx
incq %rcx
movq -32(%rbp), %rdx
movq %rax,  (%rdx, %rcx, 8)

# t 
pushq -16(%rbp) #   t 
# 200 
pushq $200
# b[ t ] =  200 ;

popq %rax
popq %rcx
incq %rcx
movq -32(%rbp), %rdx
movq %rax,  (%rdx, %rcx, 8)

#null
# b 
pushq -32(%rbp) #   b 
# t 
pushq -16(%rbp) #   t 
popq %rcx
incq %rcx
popq %rax
movq (%rax,%rcx,8), %rax
pushq %rax
#a = null;

popq %rax
movq %rax, -24(%rbp)

# a 
pushq -24(%rbp) #   a 
# print( a );
popq %rdi
movb	$0, %al
callq print
# calculate return value
# a 
pushq -24(%rbp) #   a 
# epilogue
popq %rax
addq $32, %rsp
popq %rbp
retq

