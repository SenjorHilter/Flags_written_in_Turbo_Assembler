.MODEL TINY  
.STACK 100h  
.CODE  

make_background proc

    mov cx, 0
    mov ah, 0Ch
    mov al, 1
    
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
    mov dx, 75      
print_rowWH:              
    int 10h              
    inc dx              
    cmp dx, 125             
    jne print_rowWH              
    inc cx              
    cmp cx, 320              
    jne row_alterationWH
     
    mov cx, 100
    
row_alterationWV:      
    mov dx, 0      
print_rowWV:              
    int 10h              
    inc dx              
    cmp dx, 200             
    jne print_rowWV             
    inc cx              
    cmp cx, 150             
    jne row_alterationWV
    
    ret
    
draw_white_cross endp

draw_blue_cross proc

    mov al, 4
    mov cx, 0
    
row_alterationBH:      
    mov dx, 85      
print_rowBH:              
    int 10h              
    inc dx              
    cmp dx, 115             
    jne print_rowBH              
    inc cx              
    cmp cx, 320              
    jne row_alterationBH
     
    mov cx, 110
    
row_alterationBV:      
    mov dx, 0      
print_rowBV:              
    int 10h              
    inc dx              
    cmp dx, 200             
    jne print_rowBV             
    inc cx              
    cmp cx, 140             
    jne row_alterationBV
    
    ret
    
draw_blue_cross endp   

begin:      
    mov Ah, 0h
    mov Al, 13h
    int 10h     
 
    call make_background
    
    call draw_white_cross    
    
    call draw_blue_cross
    
    mov ah, 01h       
    int 21h      
  
    mov ax, 4c00h       
    int 21h   
 
END begin
