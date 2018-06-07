BITS 16 

start;

cli 
mov ax, 0
mov ss, ax
mov sp, 0FFFh
sti
cld


mov ax, 2000h
mov ds, ax
mov es, ax
mov fs, ax
mov gs, ax


mov si, success_msg ;  
call print_string ;

mov si , press_any_key_msg ;
 
call print_string ;

mov ax, 0 
int 16h ; 

int 19h 

;****** End of the main program
;***********

success_msg db "The bootloader successfully loaded a binary file!", 10,13,0
press_any_key_msg db "press a keyy...", 0


;***** print the string pointed

print_string;

load_char_to_al;
lodsb ;



cmp al,0
jne print_char


ret ;

print_char;
mov ah, 0Eh ; 
int 10h;
jmp short load_char_to_al ;





