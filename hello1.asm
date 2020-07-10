global _start

; Onde as variáveis globais ficam;
section .data
message: db 'Hello ', 10, 'World!'

; Ao invés de letras, são armazenados os códigos ASCII de cada caractere de "Hello World!"
; O byte 10 refere-se a um caractere especial para iniciar uma nova linha (veja na tabela ASCII)

; A diretiva db é usada para criar bytes de dados. Outras opções:
; db: 1 byte (8 bits)
; dw: word de 2 bytes (16 bits)
; dd: word de 4 bytes (32 bits)
; dq: word de 8 bytes (64 bits)

; Onde as instruções são definidas
section .text
_start:                     ; O rótulo _start marca o ponto inicial de execução do programa
    mov     rax, 1          ; Escreve em rax (registrador) o número da syscall (chamada de sistema) a ser feita (1 = write)

                            ; rdi, rsi e rds são registradores que estão armazenando os argumentos da syscall
    mov     rdi, 1          ; Qual descritor de arquivo será usado (1 = stdout)
    mov     rsi, message    ; Endereço inicial da string
    mov     rdx, 13         ; Quantidade de bytes que serão escritos
    syscall                 ; Executa a chamada de sistema.

    mov     rax, 60         ; Código da chamada de sistema "exit" para finalizar a execução do programa;
    syscall

; ---------------------------------------------------------------------------------------------------------------------
;   Hello
;   World!
