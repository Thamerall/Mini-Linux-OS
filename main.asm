kernel_init:

cli  ; Disable Interrupts
mov ax, StackSegmentStart 
mov ss, ax
mov sp, StackPointerStart
sti 

cld

;initailze all other segement Registers

mov ax, DataSegmentStar
mov ds, ax
mov es, ax
mov fs, ax
mov gs, ax

;Main Kernel code 

; print the welcome message 

call print_welcome_messages
call bios_print_newline

; Main Kernel Loop 

kernel_main_loop:

call bios_print_newline
call print_menu
call bios_print_newline
call print_prompt
call bios_wait_for_key
mov word [saveword], ax
call bios_print_char
call bios_print_newline
call perform_menu_action
jmp kernel_main_loop

; End of the kernal program 

; Subroutines

print_welcome_messages;

mov si, welcome_msg
call bios_print_string
mov si, written_by_msg
call bios_print_string
ret

print_menu;

mov si, menul 
call bios_print_string
mov si, menu2
call bioa_print_string
mov si, menu3
call bios_print_string
mov si, menu4
call bios_print_string
ret

print_prompt;
mov si, prompt_string
call bios_print_string
ret

perform_menu_action; 
mov word ax, [saveword]

cmp al, '1'
je print_hello
cmp al, '2'
je bios_clear_screen
cmp al, '3'
je syscall-reboot
cmp al, '4'
je syscall_power_off
ret
print_hello:

call bios_print_newline
mov si, hello_msg
call bios_print_string
ret
