.MODEL TINY  
.STACK 100h  
.CODE  

make_background proc

    mov cx, 0
    mov ah, 0Ch
    mov al, 4
    
row_alteration:      
    mov dx, 0      
print_row:              
    int 10h              
    inc dx              
    cmp dx, 200              
    jne print_row              
    inc cx              
    cmp cx, 320              
    jne row_alteration
    
    ret
make_background endp

draw_white_cross proc

    mov al, 15
    mov cx, 0
    
row_alterationWH:      
    mov dx, 85      
print_rowWH:              
    int 10h              
    inc dx              
    cmp dx, 115             
    jne print_rowWH              
    inc cx              
    cmp cx, 320              
    jne row_alterationWH
     
    mov cx, 110
    
row_alterationWV:      
    mov dx, 0      
print_rowWV:              
    int 10h              
    inc dx              
    cmp dx, 200             
    jne print_rowWV             
    inc cx              
    cmp cx, 140             
    jne row_alterationWV
    
    ret
    
draw_white_cross endp    

begin:      
    mov Ah, 0h
    mov Al, 13h
    int 10h     
 
    call make_background
    
    call draw_white_cross    
    
    mov ah, 01h       
    int 21h      
  
    mov ax, 4c00h       
    int 21h   
 
END begin
