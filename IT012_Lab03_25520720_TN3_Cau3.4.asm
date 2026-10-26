.data
  prompt: .asciiz "Nhap chi so (kWh): "
  m1:     .asciiz "Thang 1: "
  m2:     .asciiz "Thang 2: "
  m3:     .asciiz "Thang 3: "
  tot:    .asciiz "Tong:    "
  nl:     .asciiz "\n"

  .text
  .globl main
  main:
      # --- ??c b?n ch? s? công t? (reading0 ??n reading3) ---
      # ??c reading0 vào $s0
      li   $v0, 4
      la   $a0, prompt
      syscall
      li   $v0, 5
      syscall
      move $s0, $v0

      # ??c reading1 vào $s1
      li   $v0, 4
      la   $a0, prompt
      syscall
      li   $v0, 5
      syscall
      move $s1, $v0

      # ??c reading2 vào $s2
      li   $v0, 4
      la   $a0, prompt
      syscall
      li   $v0, 5
      syscall
      move $s2, $v0

      # ??c reading3 vào $s3
      li   $v0, 4
      la   $a0, prompt
      syscall
      li   $v0, 5
      syscall
      move $s3, $v0

      # --- Tính ?i?n n?ng tiêu th? t?ng tháng và t?ng ---
      sub  $t0, $s1, $s0    # usage1 = reading1 - reading0
      sub  $t1, $s2, $s1    # usage2 = reading2 - reading1
      sub  $t2, $s3, $s2    # usage3 = reading3 - reading2

      add  $t3, $t0, $t1    # total = usage1 + usage2
      add  $t3, $t3, $t2    # total = total + usage3

      # --- In k?t qu? theo ?úng ??nh d?ng yêu c?u ---
      # In Tháng 1
      li   $v0, 4
      la   $a0, m1
      syscall
      li   $v0, 1
      move $a0, $t0
      syscall
      li   $v0, 4
      la   $a0, nl
      syscall

      # In Tháng 2
      li   $v0, 4
      la   $a0, m2
      syscall
      li   $v0, 1
      move $a0, $t1
      syscall
      li   $v0, 4
      la   $a0, nl
      syscall

      # In Tháng 3
      li   $v0, 4
      la   $a0, m3
      syscall
      li   $v0, 1
      move $a0, $t2
      syscall
      li   $v0, 4
      la   $a0, nl
      syscall

      # In T?ng
      li   $v0, 4
      la   $a0, tot
      syscall
      li   $v0, 1
      move $a0, $t3
      syscall
      li   $v0, 4
      la   $a0, nl
      syscall

      # --- K?t thúc ch??ng trình ---
      li   $v0, 10
      syscall