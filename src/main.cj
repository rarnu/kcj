package kcj

from std import console.*
from std import collection.*
from kcj import extension.*
from kcj import common.*
from std import regex.*

main(): Int64 {
    let s = """
    |arg
    |bb
    |    cccc
    |    dddd
    |eee
""".trimMargin()
    println(s)


    let p1 = Pair(1, "s")
    let p2 = p1 + 0.5
    println(p2)
    let (a, b, c) = p2.asTuple()
    println("a = ${a}, b = ${b}, c = ${c}")

    let px = pairOf(1, 2) + "x" + 5.0 + true + arrayOf("r", "s", "t")
    println(px)

    // println("Hello {}, I'm using {}".format("world", "cangjie"))

    // println("Hello {1}, I'm using {2}, {2} is good.".format(hashMapOf<String, ToString>(("1", "world"), ("2", "cangjie"))))

    return 0
}

