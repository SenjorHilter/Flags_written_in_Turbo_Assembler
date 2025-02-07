.MODEL TINY  
.STACK 100h  
.CODE  
begin:      
    mov ah, 0h      
    mov al, 12h      
    int 10h       
 
    mov ah, 0ch      
    mov bh, 0      
    mov cx, 0      
 
row_alteration_1:      
    mov dx, 0      
    mov al, 9 
     
print_blue_line_1_1: 
    int 10h              
    inc dx              
    cmp dx, 200              
    jne print_blue_line_1_1 
     
    mov al, 14 
     
print_yellow_line_1: 
    int 10h 
    inc dx 
    cmp dx, 280 
    jne print_yellow_line_1 
     
    mov al, 15 
     
print_blue_line_2_1: 
    mov al, 9 
    int 10h  
    inc dx 
    cmp dx, 480 
    jne print_blue_line_2_1 
     
    inc cx              
    cmp cx, 240              
    jne row_alteration_1 
     
row_alteration_2:      
    mov dx, 0      
    mov al, 14 
 
print_yellow_line_2: 
    int 10h 
    inc dx 
    cmp dx, 480 
    jne print_yellow_line_2 
     
    inc cx              
    cmp cx, 320              
    jne row_alteration_2 
     
row_alteration_3:      
    mov dx, 0      
    mov al, 9 
     
print_blue_line_1_3: 
    int 10h              
    inc dx              
    cmp dx, 200              
    jne print_blue_line_1_3 
     
    mov al, 14 
     
print_yellow_line_3: 
    int 10h 
    inc dx 
    cmp dx, 280 
    jne print_yellow_line_3 
     
print_blue_line_2_3: 
    mov al, 9 
    int 10h  
    inc dx 
    cmp dx, 480 
    jne print_blue_line_2_3 
     
    inc cx              
    cmp cx, 640              
    jne row_alteration_3 
     
    mov ah, 01h       
    int 21h       
     
    mov ax, 3       
    int 10h        
  
    mov ax, 4c00h       
    int 21h   
 
END begin
