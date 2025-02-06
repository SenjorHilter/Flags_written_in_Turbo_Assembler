.MODEL TINY 
.STACK 100h 
.CODE 
begin:     
    mov ah, 0h     
    mov al, 12h     
    int 10h      

    mov ah, 0ch     
    mov al, 4     
    mov bh, 0     
    mov cx, 0     

row_alteration:     
    mov dx, 0     
    
print_red_line_1:             
    int 10h             
    inc dx             
    cmp dx, 160             
    jne print_red_line_1
    
    mov al, 15
    
print_white_line:
    int 10h
    inc dx
    cmp dx, 320
    jne print_white_line
    
    mov al, 4 
    
print_red_line_2:
    int 10h 
    inc dx
    cmp dx, 480
    jne print_red_line_2
    
    inc cx             
    cmp cx, 640             
    jne row_alteration          

    mov al, 15     
    mov cx, 0
    
    mov ah, 01h      
    int 21h      
    
    mov ax, 3      
    int 10h       
 
    mov ax, 4c00h      
    int 21h
