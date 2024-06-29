package kcj

from std import console.*
from std import collection.*
from kcj import extension.*

class MySample1 {

    public var a: String = "aaa"
    public var b: Int = 1
    public var c: Float64 = 1.0
    public var d: Array<Int> = [1,2,3,4,5]
    public var e: ArrayList<Int> = ArrayList(1, 2, 3, 4, 5)
    public var f: HashSet<String> = HashSet("a", "b", "c", "d", "e")
    public var g: HashMap<String, String> = HashMap(("name", "isyscore"), ("age", "5"))
    public var h: MySample2 = MySample2(1, "aaa")
    public var i: Array<MySample2> = [MySample2(2, "bbb"), MySample2(3, "ccc")]
    // public var i: HashMap<String, String> = HashMap(("name", "isyscore"), ("age", "5"))
}

class MySample2 {
    public var xxx: Int = 999
    public var yyy: String = "hello"

    public MySample2(x: Int, y: String) {
        this.xxx = x
        this.yyy = y
    }
}

// extend HashMap<K, V> where K <: Hashable & Equatable<K> {

//     operator func +(right: HashMap<K, V>): HashMap<K, V> {
//         let m = HashMap(this)
//         m.putAll(right)
//         return m
//     }

// }


main(): Int64 {

    let l1 = [1, 2, 3, 4]
    let l2 = [5 ,6, 7, 8]
    println(l1 + l2)

    let l3 = ["a", "b", "c", "d"]
    let l4 = ["h", "i", "j", "k"]
    println(l3 + l4)


    let m = HashMap(("a", 1), ("b", 2), ("c", 3))

    let n = HashMap(("b", 10), ("c", 20), ("d", 30))

    println(m + n)
    println(m - n)

    

    return 0
}