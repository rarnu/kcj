package common

type S = ToString

public struct Pair<A, B> <: S where A <: S, B <: S {
    public var first: A
    public var second: B

    public Pair(a: A, b: B) {
        this.first = a
        this.second = b
    }

    public func toString(): String {
        return "Pair(${first}, ${second})"
    }
}

type T2<A, B> = Pair<A, B>

public struct Triple<A, B, C> <: S where A <: S, B <: S, C <: S {
    public var first: A
    public var second: B
    public var third: C

    public Triple(a: A, b: B, c: C) {
        this.first = a
        this.second = b
        this.third = c
    }

    public func toString(): String {
        return "Triple(${first}, ${second}, ${third})"
    }
}

type T3<A, B, C> = Triple<A, B, C>

// TODO
