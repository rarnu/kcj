package common

from std import collection.*
from std import fs.*

public func run<R>(block: () -> R): R {
    return block()
}

public func repeat(times: Int, action: (Int) -> Unit) {
    for (i in 0..times) {
        action(i)
    }
}

public func listToMap<T, K, V>(col: Collection<T>): HashMap<K, V> where K <: Hashable & Equatable<K>, V <: Hashable & Equatable<V>, T <: Pair<K, V> {
    let m = HashMap<K, V>()
    for (e in col) {
        m[e.first] = e.second
    }
    return m
}

public func mapToList<K, V>(map: Map<K, V>): ArrayList<Pair<K, V>> where K <: Hashable & Equatable<K> & ToString, V <: Hashable & Equatable<V> & ToString {
    let l = ArrayList<Pair<K, V>>()
    for ((k, v) in map) {
        l.append(Pair(k, v))
    }
    return l
}