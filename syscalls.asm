
syscall_reboot:
int 19h

syscall_power_off:

mov ax, 5307h
mov cx, 003h
int 15h
