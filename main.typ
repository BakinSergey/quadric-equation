#set page(margin: (left: 3cm, right: 1cm, y: 2cm))
#set text(size: 14pt, font: "Times New Roman", lang: "ru")
#set par(justify: true)

#import "@preview/suiji:0.3.0": *
#import "quadric.typ": quadric_solution

#let N = 2000


#grid(
  columns: (1fr, 1fr), gutter: 20pt,
  align(left)[
    #for i in range(0, calc.floor(N/2)) {
      let rng = gen-rng-f(i)
      let a = ()
      let (rng, a) = integers-f(rng, low: -20, high: 20, size: 4)
      let (A, B, C, E) = a
      [== Уравнение #i]
      quadric_solution(A:A,  B:B,  C:C,  E:E)
    }
  ],
  align(left)[
    #for i in range(calc.ceil(N/2), N) {
      let rng = gen-rng-f(i)
      let a = ()
      let (rng, a) = integers-f(rng, low: -20, high: 20, size: 4)
      let (A, B, C, E) = a
      [== Уравнение  #i]
      quadric_solution(A:A,  B:B,  C:C,  E:E)
    }
  ]
)


// == Полное D > 0
// #quadric_solution(
//   A:1,
//   B:5,
//   C:-12,
//   E:-2
//   )

// == Полное D = 0
// #quadric_solution(
//   A: 2,
//   B: 4,
//   C: 2,
//   E: 0
// )

// == Полное D < 0
// #quadric_solution(
//   A: 2,
//   B: 4,
//   C: 12,
//   E: 0
// )

// == Неполное С = 0
// #quadric_solution(
//   A: -4,
//   B: 4,
//   C: 4,
//   E:2
// )

// == Неполное B = 0 (2 корня)
// #quadric_solution(
//   A: 20,
//   B: 0,
//   C: -2,
//   E:0
// )

// == Неполное B = 0 (нет корней)
// #quadric_solution(
//   A: -20,
//   B: 0,
//   C: -2,
//   E:0
// )

// == Неполное B = 0,
// #quadric_solution(
//   A: -3,
//   B: 0,
//   C: 0,
//   E:-27
// )
