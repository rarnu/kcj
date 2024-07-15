package kcj.common

type S = ToString


public class Pair<A, B> <: S where A <: S, B <: S {
    
    public Pair(var first: A, var second: B) { }

    public func toString(): String {
        return "Pair(${first}, ${second})"
    }

    public func asTuple(): (A, B) {
        return (first, second)
    }
}

type T2<A, B> = Pair<A, B>

public class Triple<A, B, C> <: S where A <: S, B <: S, C <: S {

    public Triple(var first: A, var second: B, var third: C) { }

    public func toString(): String {
        return "Triple(${first}, ${second}, ${third})"
    }

    public func asTuple(): (A, B, C) {
        return (first, second, third)
    }
}

type T3<A, B, C> = Triple<A, B, C>

public class Quadruple<A, B, C, D> <: S where A <: S, B <: S, C <: S, D <: S {
    public Quadruple(var first: A, var second: B, var third: C, var forth: D) {}
    public func toString(): String {
        return "Quadruple(${first}, ${second}, ${third}, ${forth})"
    }

    public func asTuple(): (A, B, C, D) {
        return (first, second, third, forth)
    }

}

type T4<A, B, C, D> = Quadruple<A, B, C, D>

public class Pentuple<A, B, C, D, E> <: S where A <: S, B <: S, C <: S, D <: S, E <: S {
    public Pentuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E) {}
    public func toString(): String {
        return "Pentuple(${first}, ${second}, ${third}, ${forth}, ${fifth})"
    }

    public func asTuple(): (A, B, C, D, E) {
        return (first, second, third, forth, fifth)
    }
}

type T5<A, B, C, D, E> = Pentuple<A, B, C, D, E>


public class Hextuple<A, B, C, D, E, F> <: S where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S {

    public Hextuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E, var sixth: F) { }

    public func toString(): String {
        return "Hextuple(${first}, ${second}, ${third}, ${forth}, ${fifth}, ${sixth})"
    }

    public func asTuple(): (A, B, C, D, E, F) {
        return (first, second, third, forth, fifth, sixth)
    }
}

type T6<A, B, C, D, E, F> = Hextuple<A, B, C, D, E, F>


public class Septuple<A, B, C, D, E, F, G> <: S where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S {

    public Septuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E, var sixth: F, var seventh: G) {}

    public func toString(): String {
        return "Septuple(${first}, ${second}, ${third}, ${forth}, ${fifth}, ${sixth}, ${seventh})"
    }

    public func asTuple(): (A, B, C, D, E, F, G) {
        return (first, second, third, forth, fifth, sixth, seventh)
    }
    
}

type T7<A, B, C, D, E, F, G> = Septuple<A, B, C, D, E, F, G>


public class Octuple<A, B, C, D, E, F, G, H> <: S where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S {
    public Octuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E, var sixth: F, var seventh: G, var eighth: H) {}
    public func toString(): String {
        return "Octuple(${first}, ${second}, ${third}, ${forth}, ${fifth}, ${sixth}, ${seventh}, ${eighth})"
    }

    public func asTuple(): (A, B, C, D, E, F, G, H) {
        return (first, second, third, forth, fifth, sixth, seventh, eighth)
    }
}

type T8<A, B, C, D, E, F, G, H> = Octuple<A, B, C, D, E, F, G, H>

public class Nonuple<A, B, C, D, E, F, G, H, I> <: S where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S {
    public Nonuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E, var sixth: F, var seventh: G, var eighth: H, var ninth: I) {}
    public func toString(): String {
        return "Nonuple(${first}, ${second}, ${third}, ${forth}, ${fifth}, ${sixth}, ${seventh}, ${eighth}, ${ninth})"
    }

    public func asTuple(): (A, B, C, D, E, F, G, H, I) {
        return (first, second, third, forth, fifth, sixth, seventh, eighth, ninth)
    }
    
}

type T9<A, B, C, D, E, F, G, H, I> = Nonuple<A, B, C, D, E, F, G, H, I>


public class Decuple<A, B, C, D, E, F, G, H, I, J> <: S where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S {
    public Decuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E, var sixth: F, var seventh: G, var eighth: H, var ninth: I, var tenth: J) {}
    public func toString(): String {
        return "Decuple(${first}, ${second}, ${third}, ${forth}, ${fifth}, ${sixth}, ${seventh}, ${eighth}, ${ninth}, ${tenth})"
    }

    public func asTuple(): (A, B, C, D, E, F, G, H, I, J) {
        return (first, second, third, forth, fifth, sixth, seventh, eighth, ninth, tenth)
    }
    
}

type T10<A, B, C, D, E, F, G, H, I, J> = Decuple<A, B, C, D, E, F, G, H, I, J>

public class Undecuple<A, B, C, D, E, F, G, H, I, J, K> <: S where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S, K <: S {
    public Undecuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E, var sixth: F, var seventh: G, var eighth: H, var ninth: I, var tenth: J, var eleventh: K) {}
    public func toString(): String {
        return "Undecuple(${first}, ${second}, ${third}, ${forth}, ${fifth}, ${sixth}, ${seventh}, ${eighth}, ${ninth}, ${tenth}, ${eleventh})"
    }

    public func asTuple(): (A, B, C, D, E, F, G, H, I, J, K) {
        return (first, second, third, forth, fifth, sixth, seventh, eighth, ninth, tenth, eleventh)
    }
    
}

type T11<A, B, C, D, E, F, G, H, I, J, K> = Undecuple<A, B, C, D, E, F, G, H, I, J, K>


public class Duodecuple<A, B, C, D, E, F, G, H, I, J, K, L> <: S where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S, K <: S, L <: S {
    public Duodecuple(var first: A, var second: B, var third: C, var forth: D, var fifth: E, var sixth: F, var seventh: G, var eighth: H, var ninth: I, var tenth: J, var eleventh: K, var twelvth: L) {}
    public func toString(): String {
        return "Duodecuple(${first}, ${second}, ${third}, ${forth}, ${fifth}, ${sixth}, ${seventh}, ${eighth}, ${ninth}, ${tenth}, ${eleventh}, ${twelvth})"
    }

    public func asTuple(): (A, B, C, D, E, F, G, H, I, J, K, L) {
        return (first, second, third, forth, fifth, sixth, seventh, eighth, ninth, tenth, eleventh, twelvth)
    }

}

type T12<A, B, C, D, E, F, G, H, I, J, K, L> = Duodecuple<A, B, C, D, E, F, G, H, I, J, K, L>

extend<A, B> Pair<A, B> {
    public operator func +(c: ToString): Triple<A, B, ToString> {
        return Triple(this.first, this.second, c)
    }
}

extend<A, B, C> Triple<A, B, C> {
    public operator func +(d: ToString): Quadruple<A, B, C, ToString> {
        return Quadruple(this.first, this.second, this.third, d)
    }
}

extend<A, B, C, D> Quadruple<A, B, C, D> {
    public operator func +(e: ToString): Pentuple<A, B, C, D, ToString> {
        return Pentuple(this.first, this.second, this.third, this.forth, e)
    }
}

extend<A, B, C, D, E> Pentuple<A, B, C, D, E> {
    public operator func +(f: ToString): Hextuple<A, B, C, D, E, ToString> {
        return Hextuple(this.first, this.second, this.third, this.forth, this.fifth, f)
    }
}

extend<A, B, C, D, E, F> Hextuple<A, B, C, D, E, F> {
    public operator func +(g: ToString): Septuple<A, B, C, D, E, F, ToString> {
        return Septuple(this.first, this.second, this.third, this.forth, this.fifth, this.sixth, g)
    }
}

extend<A, B, C, D, E, F, G> Septuple<A, B, C, D, E, F, G> {
    public operator func +(h: ToString): Octuple<A, B, C, D, E, F, G, ToString> {
        return Octuple(this.first, this.second, this.third, this.forth, this.fifth, this.sixth, this.seventh, h)
    }
}

extend<A, B, C, D, E, F, G, H> Octuple<A, B, C, D, E, F, G, H> {
    public operator func +(i: ToString): Nonuple<A, B, C, D, E, F, G, H, ToString> {
        return Nonuple(this.first, this.second, this.third, this.forth, this.fifth, this.sixth, this.seventh, this.eighth, i)
    }
}

extend<A, B, C, D, E, F, G, H, I> Nonuple<A, B, C, D, E, F, G, H, I> {
    public operator func +(j: ToString): Decuple<A, B, C, D, E, F, G, H, I, ToString> {
        return Decuple(this.first, this.second, this.third, this.forth, this.fifth, this.sixth, this.seventh, this.eighth, this.ninth, j)
    }
}

extend<A, B, C, D, E, F, G, H, I, J> Decuple<A, B, C, D, E, F, G, H, I, J> {
    public operator func +(k: ToString): Undecuple<A, B, C, D, E, F, G, H, I, J, ToString> {
        return Undecuple(this.first, this.second, this.third, this.forth, this.fifth, this.sixth, this.seventh, this.eighth, this.ninth, this.tenth, k)
    }
}

extend<A, B, C, D, E, F, G, H, I, J, K> Undecuple<A, B, C, D, E, F, G, H, I, J, K> {
    public operator func +(l: ToString): Duodecuple<A, B, C, D, E, F, G, H, I, J, K, ToString> {
        return Duodecuple(this.first, this.second, this.third, this.forth, this.fifth, this.sixth, this.seventh, this.eighth, this.ninth, this.tenth, this.eleventh, l)
    }
}

public func pairOf<A, B>(a: A, b: B): Pair<A, B> where A <: S, B <: S {
    return Pair(a, b)
}

public func t2Of<A, B>(a: A, b: B): Pair<A, B> where A <: S, B <: S {
    return Pair(a, b)
}

public func tripleOf<A, B, C>(a: A, b: B, c: C): Triple<A, B, C> where A <: S, B <: S, C <: S {
    return Triple(a, b, c)
}

public func t3Of<A, B, C>(a: A, b: B, c: C): Triple<A, B, C> where A <: S, B <: S, C <: S {
    return Triple(a, b, c)
}

public func quadrupleOf<A, B, C, D>(a: A, b: B, c: C, d: D): Quadruple<A, B, C, D> where A <: S, B <: S, C <: S, D <: S {
    return Quadruple(a, b, c, d)
}
public func t4Of<A, B, C, D>(a: A, b: B, c: C, d: D): Quadruple<A, B, C, D> where A <: S, B <: S, C <: S, D <: S {
    return Quadruple(a, b, c, d)
}

public func pentupleOf<A, B, C, D, E>(a: A, b: B, c: C, d: D, e: E): Pentuple<A, B, C, D, E> where A <: S, B <: S, C <: S, D <: S, E <: S {
    return Pentuple(a, b, c, d, e)
}
public func t5Of<A, B, C, D, E>(a: A, b: B, c: C, d: D, e: E): Pentuple<A, B, C, D, E> where A <: S, B <: S, C <: S, D <: S, E <: S {
    return Pentuple(a, b, c, d, e)
}

public func hextupleOf<A, B, C, D, E, F>(a: A, b: B, c: C, d: D, e: E, f: F): Hextuple<A, B, C, D, E, F> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S {
    return Hextuple(a, b, c, d, e, f)
}
public func t6Of<A, B, C, D, E, F>(a: A, b: B, c: C, d: D, e: E, f: F): Hextuple<A, B, C, D, E, F> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S {
    return Hextuple(a, b, c, d, e, f)
}

public func septupleOf<A, B, C, D, E, F, G>(a: A, b: B, c: C, d: D, e: E, f: F, g: G): Septuple<A, B, C, D, E, F, G> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S {
    return Septuple(a, b, c, d, e, f, g)
}
public func t7Of<A, B, C, D, E, F, G>(a: A, b: B, c: C, d: D, e: E, f: F, g: G): Septuple<A, B, C, D, E, F, G> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S {
    return Septuple(a, b, c, d, e, f, g)
}

public func octupleOf<A, B, C, D, E, F, G, H>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H): Octuple<A, B, C, D, E, F, G, H> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S {
    return Octuple(a, b, c, d, e, f, g, h)
}
public func t8Of<A, B, C, D, E, F, G, H>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H): Octuple<A, B, C, D, E, F, G, H> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S {
    return Octuple(a, b, c, d, e, f, g, h)
}

public func nonupleOf<A, B, C, D, E, F, G, H, I>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I): Nonuple<A, B, C, D, E, F, G, H, I> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S {
    return Nonuple(a, b, c, d, e, f, g, h, i)
}
public func t9Of<A, B, C, D, E, F, G, H, I>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I): Nonuple<A, B, C, D, E, F, G, H, I> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S {
    return Nonuple(a, b, c, d, e, f, g, h, i)
}

public func decupleOf<A, B, C, D, E, F, G, H, I, J>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J): Decuple<A, B, C, D, E, F, G, H, I, J> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S {
    return Decuple(a, b, c, d, e, f, g, h, i, j)
}
public func t10Of<A, B, C, D, E, F, G, H, I, J>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J): Decuple<A, B, C, D, E, F, G, H, I, J> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S {
    return Decuple(a, b, c, d, e, f, g, h, i, j)
}

public func undecupleOf<A, B, C, D, E, F, G, H, I, J, K>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K): Undecuple<A, B, C, D, E, F, G, H, I, J, K> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S, K <: S {
    return Undecuple(a, b, c, d, e, f, g, h, i, j, k)
}
public func t11Of<A, B, C, D, E, F, G, H, I, J, K>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K): Undecuple<A, B, C, D, E, F, G, H, I, J, K> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S, K <: S {
    return Undecuple(a, b, c, d, e, f, g, h, i, j, k)
}

public func duodecupleOf<A, B, C, D, E, F, G, H, I, J, K, L>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K, l: L): Duodecuple<A, B, C, D, E, F, G, H, I, J, K, L> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S, K <: S, L <: S {
    return Duodecuple(a, b, c, d, e, f, g, h, i, j, k, l)
}
public func t12Of<A, B, C, D, E, F, G, H, I, J, K, L>(a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K, l: L): Duodecuple<A, B, C, D, E, F, G, H, I, J, K, L> where A <: S, B <: S, C <: S, D <: S, E <: S, F <: S, G <: S, H <: S, I <: S, J <: S, K <: S, L <: S {
    return Duodecuple(a, b, c, d, e, f, g, h, i, j, k, l)
}
