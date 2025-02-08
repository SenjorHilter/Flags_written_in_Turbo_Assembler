.MODEL TINY  
.STACK 100h   
.CODE  

draw_v_line_y proc

    mov cx, 108
    mov ah, 0Ch
    mov al, 14
    
row_alteration:      
    mov dx, 0      
print_row:              
    int 10h              
    inc dx              
    cmp dx, 200              
    jne print_row              
    inc cx              
    cmp cx, 216              
    jne row_alteration
    
    ret
    
draw_v_line_y endp

draw_v_line_r proc

    mov cx, 216
    mov ah, 0Ch
    mov al, 4
    
row_alteration1:      
    mov dx, 0      
print_row1:              
    int 10h              
    inc dx              
    cmp dx, 200              
    jne print_row1              
    inc cx              
    cmp cx, 320              
    jne row_alteration1
    
    ret
    
draw_v_line_r endp

begin:      
    mov Ah, 0h
    mov Al, 13h
    int 10h     
 
    call draw_v_line_y
    call draw_v_line_r
    
    mov ah, 01h       
    int 21h      
  
    mov ax, 4c00h       
    int 21h   
 
END begin
