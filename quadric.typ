// решение уравнения Ax2 + Bx + C = E
#let quadric_solution(
  A: float,
  B: float,
  C: float,
  E: float
  ) = [

#let _as = if A < 0 [$minus$]
#let _asi = if A < 0 [$plus$]

#let _bs = if B < 0 [$minus$] else [$plus$]
#let _bsi = if B < 0 [$plus$] else [$minus$]

#let _cs = if C < 0 [$minus$] else [$plus$]
#let _csi = if C < 0 [$plus$] else [$minus$]

#let _es = if E < 0 [$minus$]
#let _esi = if E < 0 [$plus$] else [$minus$]


#let _A = calc.abs(A)
#let _B = calc.abs(B)
#let _C = calc.abs(C)
#let _E = calc.abs(E)

#let a_0 = A==0
#let b_0 = B==0
#let c_0 = C==0
#let e_0 = E==0

#let a_part = { if a_0 [] else [$ #_as #_A x^2$]}
#let b_part = { if b_0 [] else [$ #_bs #_B x$]}
#let c_part = { if c_0 [] else [$ #_cs #_C $] }
#let e_part = { if e_0 [0] else [$ #_es #_E $] }

#let c_part_calc = { if c_0 [#_esi #_E] else [$ #_cs #_C #_esi #_E $] }

#let quadric_no_e = $ #a_part #b_part #c_part_calc = 0 $

#let quadric = $ #a_part #b_part #c_part = #e_part$

#if not e_0 {
   [$inline(#quadric)$ \
   приравниваем правую часть к нулю: \
   $inline(#quadric_no_e)$ \ ]
   let C_or = C
   C += -E
   c_0 = C==0

   if not c_0  {
    _cs = if C < 0 [$minus$] else [$plus$]
    _C = calc.abs(C)
   [получаем значение свободного члена: $c = #C$ ]
   } else [$inline(#a_part #b_part =0) $]

} else [
  $inline(#quadric) $
]

// определяем вид уравнения
#let case = int(not a_0) * 1 + int(not b_0) * 2 + int(not c_0) * 4

#if case == 1 [ // Неполное, B,C равны нулю: Ах2 = 0
  т.к. B, C равны нулю
  то уравнение имеет один корень x=0

]

#if case == 3 [ // Неполное, C равно нулю: Ах2 + Вх = 0
  вынесем x за скобки:\
  $x(#_as#_A x#_bs#_B)=0$, \
  приравнивая множители к нулю найдем корни уравнения \
  #let sol = (-B/A)
  $x_1=0, \ x_2=#_bsi #_B \/ #_as #_A=#sol$

]

#if case == 5 { // Неполное, B равно нулю: Ах2 + С = 0

  let v = -C/A
  if v < 0 [ $minus$ C/A = $minus$(#C/#A) = #v < 0 - действительных корней нет]
  else {
    let vv = $#v$
    let v_root = calc.round(calc.sqrt(v), digits: 5 )
    [ $minus$ C/A= $minus$(#C/#A)= #v > 0 \
    корни уравнения: \
    $x_(1,2)=sqrt((minus #C)/#A)= sqrt(vv) = plus.minus #v_root$ ]
    }

}

#if case == 7 { // Полное: Ах2 + Вх + С = 0
  let D = B*B - 4*A*C

  [имеем полное квадратное уравнение, вычисляем дискриминант: \
  $ D = b^2 - 4 dot a dot c = #B^2 - 4 dot #A dot #C = #D$ \ ]

  if D < 0 [
    дискриминант меньше нуля - уравнение не имеет действительных корней
  ]

  if D == 0 {
    let x1 = calc.round(-B/(2*A), digits: 3)
    [дискриминант равен нулю - уравнение имеет один корень: \ ]
    $x_1 = frac(-b, 2 dot a ) = frac(-#B,2 dot #A ) = x1 $
  }

  if D > 0 {
    let sqrtD =  calc.round(calc.sqrt(D), digits: 3)
    [$sqrt(D)=#sqrtD, $ ]

    let x1 = calc.round((-B + calc.sqrt(D))/(2*A), digits: 3)
    let x2 = calc.round((-B - calc.sqrt(D))/(2*A), digits: 3)

    [дискриминант положительный - уравнение имеет два корня: \
    $x_1 = frac(-"b"+sqrt("D"),2 dot "a") = frac(-(#B)+ sqrtD,2 dot #A) = #x1 \
     x_2 = frac(-"b"-sqrt("D"),2 dot "a") = frac(-(#B)- sqrtD,2 dot #A) = #x2$

    ]
  }
}
]
