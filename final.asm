;Student Number 2018556005
;Student Name and Surname Elif Gökçe Arslan
;Github Username gkcars

.model small
.stack 100h

.data
    studentNumber DB '2', '0', '1', '8', '5', '5', '6', '0', '0', '5', '$'
    morningMsg DB ' Morning', 0Dh, 0Ah, '$'
    eveningMsg DB ' Evening', 0Dh, 0Ah, '$'

.code
    mov ax, @data
    mov ds, ax
    
    
    mov bx, 0100h
    mov es, bx
    mov di, 2000h
    mov si, offset studentNumber
    mov cx, 11  
    rep movsb
    
    mov si, offset studentNumber
    mov di, 0200h 
    mov es, di 
    mov di, 2000h 
    mov cx, 11 
    cld 
    rep movsb 

    mov ah, 09h
    lea dx, [0200h:2000h]
    int 21h
    
    
    mov bx, 0200h
    mov es, bx
    mov si, 2006h
    mov al, es:[si]
    cmp al, '5'
    je morning
    cmp al, '6'
    je evening
    
    mov ah, 09h
    lea dx, morningMsg
    int 21h
    jmp end
    
morning:
    mov ah, 09h
    lea dx, morningMsg
    int 21h
    jmp end

evening:    
    mov ah, 09h
    lea dx, eveningMsg
    int 21h
    
end:
    mov ah, 4Ch
    int 21h

end
