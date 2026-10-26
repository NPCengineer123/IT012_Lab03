# Ma nguon 6 - dien nang tieu thu giua hai chi so
.data
  prompt1:  .asciiz "Nhap chi so cu: "
  prompt2:  .asciiz "Nhap chi so moi: "
  label:    .asciiz "Dien nang (kWh): "
  newline:  .asciiz "\n"
   
  .text
  .globl main
  main:
      # --- ??c ch? s? c? vào $s0 ---
      li   $v0, 4
      la   $a0, prompt1
      syscall
      li   $v0, 5              # D?ch v? 5: ??c s? nguyên, k?t qu? ? $v0
      syscall
      add  $s0, $v0, $zero     # Gi? giá tr? ch? s? c? trong $s0
   
      # >>> ??c ch? s? m?i vào $s1 (in prompt2, r?i d?ch v? 5)
      li   $v0, 4
      la   $a0, prompt2
      syscall
      li   $v0, 5
      syscall
      add  $s1, $v0, $zero     # Gi? giá tr? ch? s? m?i trong $s1
   
      # >>> usage = current - previous, vào $t0
      sub  $t0, $s1, $s0
   
      # >>> In label, r?i usage (d?ch v? 1), r?i newline
      li   $v0, 4
      la   $a0, label
      syscall
      
      li   $v0, 1
      add  $a0, $t0, $zero
      syscall
   
      li   $v0, 4
      la   $a0, newline
      syscall
   
      # K?t thúc ch??ng trình
      li   $v0, 10
      syscall