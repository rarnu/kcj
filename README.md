# kcj

Kotlin集合操作的仓颉移植，已适配仓颉 0.53.4

使用方法: 在```[dependencies]``` 段内通过 github url 直接引用

```toml
[dependencies]
kcj = { git = "https://github.com/rarnu/kcj" }

```

使用示例:

```cangjie
package sample

import kcj.extension.*
import kcj.common.*
import std.collection.*

main(): Int64 {
    let str = "abcdefg"
    println(str.substring(2, 4))    // cd
    println(str.take(3))  // abc

    let l1 = [1,2,3,4]
    let l2 = [3,4,5,6]
    println(l1 + l2)    // [1,2,3,4,3,4,5,6]
    println(l1 - l2)    // [1,2]
    println(l1.intersect(l2))   // [3,4]

    let m1 = hashMapOf(("a", 1), ("b", 2), ("c", 3))
    let m2 = hashMapOf(("x", 10), ("y", 20), ("z", 30))
    println(m1 + m2)    // [(a, 1), (b, 2), (c, 3), (x, 10), (y, 20), (z, 30)]
    println(mapToList(m1))  // [Pair(a, 1), Pair(b, 2), Pair(c, 3)]

    return 0
}
```

具体的扩展函数可以通过字符串对象、Array对象、Map对象等在后面以 "." 直接选择和访问，或者通过阅读源码来获知具体扩展函数。

### 更多Kotlin扩展移植中......