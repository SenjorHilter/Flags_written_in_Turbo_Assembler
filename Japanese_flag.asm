.MODEL TINY  
.STACK 100h
.DATA
    eror dw ?
    x dw ?
    y dw ?
    x0 dw ?
    y0 dw ?
    delta dw ?
    radius dw ?

.CODE

Plot proc
    mov Ah, 0Ch
    mov al, 4
    int 10h
    
    ret
Plot endp

draw_circle proc
    mov x, 0
    mov ax, radius
    
    mov y, ax
    mov delta, 2
    mov ax, 2
    mov dx, 0
    
    imul y
    sub delta, ax
    mov eror, 0
    jmp ccicle
    
finally: 
    
    ret
    
ccicle:
    mov ax, y
    cmp ax, 0
    jl finally
    
    mov cx, x0
    add cx, x
    
    mov dx, y0
    add dx, y
    
    call Plot
    
    mov cx, x0
    add cx, x
    
    mov dx, y0
    sub dx, y
    
    call Plot
    
    mov cx, x0
    sub cx, x
    
    mov dx, y0
    add dx, y
    
    call Plot
    
    mov cx, x0
    sub cx, x
    
    mov dx, y0
    sub dx, y
    
    call Plot
    
    mov ax, delta
    mov eror, ax
    
    mov ax, y
    add eror, ax
    mov ax, eror
    
    mov dx, 0
    mov bx, 2
    
    imul bx
    sub ax, 1
    mov eror, ax
    
    cmp delta, 0
    jg sstep
    je sstep
    
    cmp eror, 0
    jg sstep
    
    inc x
    mov ax, 2
    mov dx, 0
    
    imul x
    add ax, 1
    add delta, ax
    jmp ccicle
    
sstep:
    mov ax, delta
    sub ax, x
    
    mov bx, 2
    mov dx, 0
    
    imul bx
    sub ax, 1
    mov eror, ax
    
    cmp delta, 0
    jg tstep
    
    cmp eror, 0
    jg tstep
    
    inc x
    mov ax, x
    
    sub ax, y
    mov bx, 2
    mov dx, 0
    
    imul bx
    add delta, ax
    
    dec y
    jmp ccicle
    
tstep:
    dec y
    mov ax, 2
    mov dx, 0
    
    imul y
    mov bx, 1
    
    sub bx, ax
    add delta, bx
    jmp ccicle
draw_circle endp

make_background proc

    mov cx, 0
    mov ah, 0Ch
    mov al, 15
    
row_alteration:      
    mov dx, 0      
print_row1:              
    int 10h              
    inc dx              
    cmp dx, 200              
    jne print_row1              
    inc cx              
    cmp cx, 320              
    jne row_alteration
    
    ret
make_background endp

begin:
    mov ax, @data
    mov ds, ax
    
    mov Ah, 0h
    mov Al, 13h
    int 10h
    
    call make_background
    
    mov radius, 50
    mov x0, 160
    mov y0, 90
   
radius_reduction:
    call draw_circle
    dec radius
    cmp radius, 1
    jg radius_reduction
    
    mov ah, 1
    int 21h
    
    mov ah, 4Ch
    int 21h
END begin
