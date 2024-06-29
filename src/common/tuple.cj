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

