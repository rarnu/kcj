package kcj.common

import std.collection.*
import std.fs.*
import std.collection.concurrent.*

public func run<R>(block: () -> R): R {
    return block()
}

public func repeat(times: Int, action: (Int) -> Unit) {
    for (i in 0..times) {
        action(i)
    }
}

public func arrayOf<T>(arr: Array<T>): Array<T> {
    return arr.clone()
}

public func arrayListOf<T>(arr: Array<T>): ArrayList<T> {
    return ArrayList(arr)
}

public func hashSetOf<T>(arr: Array<T>): HashSet<T> where T <: Hashable & Equatable<T> {
    return HashSet(arr)
}

public func linkedListOf<T>(arr: Array<T>): LinkedList<T> {
    return LinkedList(arr)
}

public func hashMapOf<K, V>(tu: Array<(K, V)>): HashMap<K, V> where K <: Hashable & Equatable<K> {
    return HashMap(tu)
}

public func concurrentHashMapOf<K, V>(tu: Array<(K, V)>): ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K> {
    return ConcurrentHashMap(tu)
}

public class NotImplementedError <: Exception {
    public NotImplementedError(message!: String = "An operation is not implemented.") {
        super(message)
    }
}

public func TODO() {
    throw NotImplementedError()
}

public func TODO(reason: String) {
    throw NotImplementedError(message: "An operation is not implemented: ${reason}")
}