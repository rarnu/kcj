package kcj

from std import console.*
from std import collection.*
from kcj import extension.*
from kcj import common.*
from std import regex.*

main(): Int64 {


    println("Hello {}, I'm using {}".format("world", "cangjie"))

    println("Hello {1}, I'm using {2}".format(hashMapOf<String, ToString>(("1", "world"), ("2", "cangjie"))))

    return 0
}

