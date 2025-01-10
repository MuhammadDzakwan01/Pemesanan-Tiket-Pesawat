.model small
.stack 100h

.data
    menu db 'Daftar Rute Penerbangan:$', 0
    item1 db '1. Jakarta - Bali (Rp 100000)$', 0
    item2 db '2. Jakarta - Surabaya (Rp 80000)$', 0
    item3 db '3. Jakarta - Medan (Rp 90000)$', 0
    prompt db 'Pilih nomor rute penerbangan (1-3): $', 0
    promptJumlah db 'Masukkan jumlah tiket: $', 0
    totalPrompt db 'Total yang harus dibayar: $', 0
    endMessage db 'Terima kasih telah menggunakan layanan booking tiket!$', 0
    menuChoices db 3 dup('$')  ; tempat untuk menyimpan pilihan rute penerbangan
    jumlahPesanan db 2 dup('$') ; tempat untuk menyimpan jumlah tiket
    total db 5 dup('$')  ; ruang untuk hasil perhitungan total

    hargaJakartaBali dw 10000      ; Harga tiket Jakarta - Bali
    hargaJakartaSurabaya dw 8000   ; Harga tiket Jakarta - Surabaya
    hargaJakartaMedan dw 9000      ; Harga tiket Jakarta - Medan

.code
main:
    ; Inisialisasi segment data
    mov ax, @data
    mov ds, ax

    ; Menampilkan daftar rute penerbangan
    mov ah, 09h
    lea dx, menu
    int 21h

    ; Menampilkan item pertama (Jakarta - Bali)
    mov ah, 09h
    lea dx, item1
    int 21h

    ; Menampilkan item kedua (Jakarta - Surabaya)
    mov ah, 09h
    lea dx, item2
    int 21h

    ; Menampilkan item ketiga (Jakarta - Medan)
    mov ah, 09h
    lea dx, item3
    int 21h

    ; Meminta pilihan rute penerbangan dari user
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; Input pilihan rute penerbangan
    lea dx, menuChoices
    mov ah, 0Ah
    int 21h

    ; Meminta jumlah tiket yang dipesan
    mov ah, 09h
    lea dx, promptJumlah
    int 21h

    ; Input jumlah tiket
    lea dx, jumlahPesanan
    mov ah, 0Ah
    int 21h

    ; Mengambil pilihan rute penerbangan (pilihan ada di menuChoices + 2)
    lea si, menuChoices
    mov al, [si + 2]      ; Ambil input pilihan rute penerbangan
    sub al, '0'           ; Konversi ke angka (misalnya '1' jadi 1)

    ; Cek pilihan rute penerbangan
    cmp al, 1         
