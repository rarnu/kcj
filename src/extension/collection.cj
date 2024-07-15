package kcj.extension

import std.collection.*
import std.collection.concurrent.*
import std.math.min
import kcj.common.*

public interface KtCollection<T> where T <: Hashable & Equatable<T> {

    prop indices: Range<Int>
    prop lastIndex: Int

    func joinToString(separator!: String, prefix!: String, postfix!: String, transform!: (T) -> String): String
    func find(predicate: (T) -> Bool): ?T
    func findLast(predicate: (T) -> Bool): ?T
    func firstOrNone(): ?T
    func lastOrNone(): ?T
    func firstOrNone(predicate: (T) -> Bool): ?T
    func lastOrNone(predicate: (T) -> Bool): ?T
    func firstOrDefault(def: () -> T): T
    func lastOrDefault(def: () -> T): T
    func getOrDefault(index: Int, def: () -> T): T
    func indexOfFirst(predicate: (T) -> Bool): Int
    func indexOfLast(predicate: (T) -> Bool): Int
    func all(predicate: (T) -> Bool): Bool
    func any(predicate: (T) -> Bool): Bool
    func none(predicate: (T) -> Bool): Bool
    func count(predicate: (T) -> Bool): Int
    func forEach(action: (T) -> Unit): Unit
    func forEachIndexed(action: (Int, T) -> Unit): Unit
    func reduce(operation: (T, T) -> T): T
    func reduceIndexed(operation: (Int, T, T) -> T): T
    func intersect(other: Collection<T>): HashSet<T>
    func subtract(other: Collection<T>): HashSet<T>
    func union(other: Collection<T>): HashSet<T>
}

public interface KtMap<K, V> where K <: Hashable & Equatable<K> {

    func getOrPut(key: K, defaultValue: () -> V): V
    func all(predicate: (K, V) -> Bool): Bool
    func any(predicate: (K, V) -> Bool): Bool
    func none(predicate: (K, V) -> Bool): Bool
    func count(predicate: (K, V) -> Bool): Int 
    func forEach(action: (K, V) -> Unit): Unit
    
}

extend<T> Array<T> <: KtCollection<T> where T <: Hashable & Equatable<T> {

    // 操作符
    public operator func +(right: Collection<T>): Array<T> {
        return plus(this, right).toArray()
    }

    public operator func -(right: Collection<T>): Array<T> {
        return minus(this, right).toArray()
    }
    
    public prop indices: Range<Int> {
        get() {
            return 0..this.size
        }
    }

    public prop lastIndex: Int {
        get() {
            return this.size - 1
        }
    }

    public func joinToString(separator!: String = ", ", prefix!: String = "", postfix!: String = "", transform!: (T) -> String): String {
        return joinToString(this, separator: separator, prefix: prefix, postfix: postfix, transform: transform)
    }

    public func find(predicate: (T) -> Bool): ?T {
        return find(this, predicate)
    }

    public func findLast(predicate: (T) -> Bool): ?T {
        return findLast(this, predicate)
    }

    public func firstOrNone(): ?T {
        return firstOrNone(this)
    }

    public func lastOrNone(): ?T {
        return lastOrNone(this)
    }

    public func firstOrNone(predicate: (T) -> Bool): ?T {
        return firstOrNone(this, predicate)
    }

    public func lastOrNone(predicate: (T) -> Bool): ?T {
        return lastOrNone(this, predicate)
    }

    public func first(): T {
        return this[0]
    }

    public func last(): T {
        return this[this.size - 1]
    }

    public func firstOrDefault(def: () -> T): T {
        return firstOrNone(this) ?? def()
    }

    public func lastOrDefault(def: () -> T): T {
        return lastOrNone(this) ?? def()
    }

    public func getOrDefault(index: Int, def: () -> T): T {
        return this.get(index) ?? def()
    }

    public func indexOfFirst(predicate: (T) -> Bool): Int {
        return indexOfFirst(this, predicate)
    }

    public func indexOfLast(predicate: (T) -> Bool): Int {
        return indexOfLast(this, predicate)
    }

    public func all(predicate: (T) -> Bool): Bool {
        return all(this, predicate)
    }

    public func any(predicate: (T) -> Bool): Bool {
        return any(this, predicate)
    }

    public func none(predicate: (T) -> Bool): Bool {
        return none(this, predicate)
    }

    public func count(predicate: (T) -> Bool): Int {
        return count(this, predicate)
    }

    public func fold<R>(initial: R, operation: (R, T) -> R): R {
        return fold(this, initial, operation)
    }

    public func foldIndexed<R>(initial: R, operation: (Int, R, T) -> R): R {
        return foldIndexed(this, initial, operation)
    }

    public func forEach(action: (T) -> Unit) {
        forEach(this, action)
    }

    public func forEachIndexed(action: (Int, T) -> Unit) {
        forEachIndexed(this, action)
    }

    public func reduce(operation: (T, T) -> T): T {
        return reduce(this, operation)
    }

    public func reduceIndexed(operation: (Int, T, T) -> T): T {
        return reduceIndexed(this, operation)
    }

    public func subList(startIndex: Int, endIndex: Int): Array<T> {
        let arr = ArrayList<T>()
        for (i in startIndex..endIndex) {
            arr.append(this[i])
        }
        return arr.toArray()
    }

    public func filter(predicate: (T) -> Bool): Array<T> {
        let arr = ArrayList<T>()
        for (e in this) {
            if (predicate(e)) {
                arr.append(e)
            }
        }
        return arr.toArray()
    }

    public func filterIndexed(predicate: (Int, T) -> Bool): Array<T> {
        let arr = ArrayList<T>()
        var index = 0
        for (e in this) {
            if (predicate(index, e)) {
                arr.append(e)
            }
            index++
        }
        return arr.toArray()
    }

    public func filterNot(predicate: (T) -> Bool): Array<T> {
        let arr = ArrayList<T>()
        for (e in this) {
            if (!predicate(e)) {
                arr.append(e)
            }
        }
        return arr.toArray()
    }

    public func filterNotIndexed(predicate: (Int, T) -> Bool): Array<T> {
        let arr = ArrayList<T>()
        var index = 0
        for (e in this) {
            if (!predicate(index, e)) {
                arr.append(e)
            }
            index++
        }
        return arr.toArray()
    }

    public func map<R>(transform: (T) -> R): Array<R> {
        let arr = ArrayList<R>()
        for (e in this) {
            arr.append(transform(e))
        }
        return arr.toArray()
    }

    public func mapIndexed<R>(transform: (Int, T) -> R): Array<R> {
        let arr = ArrayList<R>()
        var index = 0
        for (e in this) {
            arr.append(transform(index, e))
            index++
        }
        return arr.toArray()
    }

    public func drop(n: Int): Array<T> {
        return drop(this, n).toArray()
    }

    public func dropLast(n: Int): Array<T> {
        return dropLast(this, n).toArray()
    }

    public func dropWhile(predicate: (T) -> Bool): Array<T> {
        return dropWhile(this, predicate).toArray()
    }

    public func take(n: Int): Array<T> {
        return take(this, n).toArray()
    }

    public func takeLast(n: Int): Array<T> {
        return takeLast(this, n).toArray()
    }

    public func takeWhile(predicate: (T) -> Bool): Array<T> {
        return takeWhile(this, predicate).toArray()
    }

    public func flatMap<R>(transform: (T) -> Collection<R>): Array<R> {
        let arr = ArrayList<R>()
        for (e in this) {
            let l = transform(e)
            arr.appendAll(l)
        }
        return arr.toArray()
    }

    public func flatMapIndexed<R>(transform: (Int, T) -> Collection<R>): Array<R> {
        let arr = ArrayList<R>()
        var index = 0
        for (e in this) {
            let l = transform(index, e)
            arr.appendAll(l)
            index++
        }
        return arr.toArray()
    }

    public func associate<K, V>(transform: (T) -> (K, V)): Map<K, V> where K <: Hashable & Equatable<K> {
        return associate(this, transform)
    }

    public func associateBy<K>(keySelector: (T) -> K): Map<K, T> where K <: Hashable & Equatable<K> {
        return associateBy(this, keySelector)
    }

    public func associateWith<V>(valueSelector: (T) -> V): Map<T, V> {
        return associateWith(this, valueSelector)
    }

    public func groupBy<K>(keySelector: (T) -> K): Map<K, ArrayList<T>> where K <: Hashable & Equatable<K> {
        return groupBy(this, keySelector)
    }
    
    public func distinct(): Array<T> {
        return HashSet(this).toArray()
    }

    public func distinctBy<K>(selector: (T) -> K): Array<T> where K <: Hashable & Equatable<K> {
        let s = HashSet<K>()
        let list = ArrayList<T>()
        for (e in this) {
            let key = selector(e)
            if (s.put(key)) {
                list.append(e)
            }
        }
        return list.toArray()
    }

    public func intersect(other: Collection<T>): HashSet<T> {
        return intersect(this, other)
    }

    public func subtract(other: Collection<T>): HashSet<T> {
        return subtract(this, other)
    }

    public func union(other: Collection<T>): HashSet<T> {
        return union(this, other)
    }

    public func onEach(action: (T) -> Unit): Array<T> {
        for (e in this) {
            action(e)
        }
        return this
    }

    public func onEachIndexed(action: (Int, T) -> Unit): Array<T> {
        var index = 0
        for (e in this) {
            action(index, e)
            index++
        }
        return this
    }

    public func partition(predicate: (T) -> Bool): (Array<T>, Array<T>) {
        let first = ArrayList<T>()
        let second = ArrayList<T>()
        for (e in this) {
            if (predicate(e)) {
                first.append(e)
            } else {
                second.append(e)
            }
        }
        return (first.toArray(), second.toArray())
    }
    
    public func zip<R, V>(other: Collection<R>, transform: (a: T, b: R) -> V): Array<V> {
        let size = min(this.size, other.size)
        let mainIter = this.iterator()
        let otherIter = other.iterator()
        let list = ArrayList<V>()
        for (_ in 0..size) {
            let f = mainIter.next().getOrThrow()
            let s = otherIter.next().getOrThrow()
            list.append(transform(f, s))
        }
        return list.toArray()
    }

    public func zipWithNext(): Array<(T, T)> {
        return zipWithNext { a, b => (a, b) }
    }

    public func zipWithNext<R>(transform: (a: T, b: T) -> R): Array<R> {
        let result = ArrayList<R>()
        if (this.isEmpty()) {
            return result.toArray()
        }
        let iter = this.iterator()
        var current = iter.next().getOrThrow()
        while(let Some(next) <- iter.next()) {
            result.append(transform(current, next))
            current = next
        }
        return result.toArray()
    }
}

extend<T> ArrayList<T> <: KtCollection<T> where T <: Hashable & Equatable<T> {

    // 操作符
    public operator func +(right: Collection<T>): ArrayList<T> {
        return plus(this, right)
    }

    public operator func -(right: Collection<T>): ArrayList<T> {
        return minus(this, right)
    }
    
    public prop indices: Range<Int> {
        get() {
            return 0..this.size
        }
    }

    public prop lastIndex: Int {
        get() {
            return this.size - 1
        }
    }

    public func joinToString(separator!: String = ", ", prefix!: String = "", postfix!: String = "", transform!: (T) -> String): String {
        return joinToString(this, separator: separator, prefix: prefix, postfix: postfix, transform: transform)
    }

    public func find(predicate: (T) -> Bool): ?T {
        return find(this, predicate)
    }

    public func findLast(predicate: (T) -> Bool): ?T {
        return findLast(this, predicate)
    }

    public func firstOrNone(): ?T {
        return firstOrNone(this)
    }

    public func lastOrNone(): ?T {
        return lastOrNone(this)
    }

    public func firstOrNone(predicate: (T) -> Bool): ?T {
        return firstOrNone(this, predicate)
    }

    public func lastOrNone(predicate: (T) -> Bool): ?T {
        return lastOrNone(this, predicate)
    }

    public func first(): T {
        return this[0]
    }

    public func last(): T {
        return this[this.size - 1]
    }

    public func firstOrDefault(def: () -> T): T {
        return firstOrNone(this) ?? def()
    }

    public func lastOrDefault(def: () -> T): T {
        return lastOrNone(this) ?? def()
    }

    public func getOrDefault(index: Int, def: () -> T): T {
        return this.get(index) ?? def()
    }

    public func indexOf(item: T): Int {
        return indexOf(this, item)
    }

    public func lastIndexOf(item: T): Int {
        return lastIndexOf(this, item)
    }

    public func indexOfFirst(predicate: (T) -> Bool): Int {
        return indexOfFirst(this, predicate)
    }

    public func indexOfLast(predicate: (T) -> Bool): Int {
        return indexOfLast(this, predicate)
    }

    public func all(predicate: (T) -> Bool): Bool {
        return all(this, predicate)
    }

    public func any(predicate: (T) -> Bool): Bool {
        return any(this, predicate)
    }

    public func none(predicate: (T) -> Bool): Bool {
        return none(this, predicate)
    }

    public func count(predicate: (T) -> Bool): Int {
        return count(this, predicate)
    }

    public func fold<R>(initial: R, operation: (R, T) -> R): R {
        return fold(this, initial, operation)
    }

    public func foldIndexed<R>(initial: R, operation: (Int, R, T) -> R): R {
        return foldIndexed(this, initial, operation)
    }

    public func forEach(action: (T) -> Unit) {
        forEach(this, action)
    }

    public func forEachIndexed(action: (Int, T) -> Unit) {
        forEachIndexed(this, action)
    }

    public func reduce(operation: (T, T) -> T): T {
        return reduce(this, operation)
    }

    public func reduceIndexed(operation: (Int, T, T) -> T): T {
        return reduceIndexed(this, operation)
    }

    public func subList(startIndex: Int, endIndex: Int): ArrayList<T> {
        let arr = ArrayList<T>()
        for (i in startIndex..endIndex) {
            arr.append(this[i])
        }
        return arr
    }

    public func filter(predicate: (T) -> Bool): ArrayList<T> {
        let arr = ArrayList<T>()
        for (e in this) {
            if (predicate(e)) {
                arr.append(e)
            }
        }
        return arr
    }

    public func filterIndexed(predicate: (Int, T) -> Bool): ArrayList<T> {
        let arr = ArrayList<T>()
        var index = 0
        for (e in this) {
            if (predicate(index, e)) {
                arr.append(e)
            }
            index++
        }
        return arr
    }

    public func filterNot(predicate: (T) -> Bool): ArrayList<T> {
        let arr = ArrayList<T>()
        for (e in this) {
            if (!predicate(e)) {
                arr.append(e)
            }
        }
        return arr
    }

    public func filterNotIndexed(predicate: (Int, T) -> Bool): ArrayList<T> {
        let arr = ArrayList<T>()
        var index = 0
        for (e in this) {
            if (!predicate(index, e)) {
                arr.append(e)
            }
            index++
        }
        return arr
    }

    public func map<R>(transform: (T) -> R): ArrayList<R> {
        let arr = ArrayList<R>()
        for (e in this) {
            arr.append(transform(e))
        }
        return arr
    }

    public func mapIndexed<R>(transform: (Int, T) -> R): ArrayList<R> {
        let arr = ArrayList<R>()
        var index = 0
        for (e in this) {
            arr.append(transform(index, e))
            index++
        }
        return arr
    }

    public func drop(n: Int): ArrayList<T> {
        return drop(this, n)
    }

    public func dropLast(n: Int): ArrayList<T> {
        return dropLast(this, n)
    }

    public func dropWhile(predicate: (T) -> Bool): ArrayList<T> {
        return dropWhile(this, predicate)
    }

    public func take(n: Int): ArrayList<T> {
        return take(this, n)
    }

    public func takeLast(n: Int): ArrayList<T> {
        return takeLast(this, n)
    }

    public func takeWhile(predicate: (T) -> Bool): ArrayList<T> {
        return takeWhile(this, predicate)
    }

    public func flatMap<R>(transform: (T) -> Collection<R>): ArrayList<R> {
        let arr = ArrayList<R>()
        for (e in this) {
            let l = transform(e)
            arr.appendAll(l)
        }
        return arr
    }

    public func flatMapIndexed<R>(transform: (Int, T) -> Collection<R>): ArrayList<R> {
        let arr = ArrayList<R>()
        var index = 0
        for (e in this) {
            let l = transform(index, e)
            arr.appendAll(l)
            index++
        }
        return arr
    }

    public func associate<K, V>(transform: (T) -> (K, V)): Map<K, V> where K <: Hashable & Equatable<K> {
        return associate(this, transform)
    }

    public func associateBy<K>(keySelector: (T) -> K): Map<K, T> where K <: Hashable & Equatable<K> {
        return associateBy(this, keySelector)
    }

    public func associateWith<V>(valueSelector: (T) -> V): Map<T, V> {
        return associateWith(this, valueSelector)
    }

    public func groupBy<K>(keySelector: (T) -> K): Map<K, ArrayList<T>> where K <: Hashable & Equatable<K> {
        return groupBy(this, keySelector)
    }

    public func distinct(): ArrayList<T> {
        return ArrayList(HashSet(this))
    }

    public func distinctBy<K>(selector: (T) -> K): ArrayList<T> where K <: Hashable & Equatable<K> {
        let s = HashSet<K>()
        let list = ArrayList<T>()
        for (e in this) {
            let key = selector(e)
            if (s.put(key)) {
                list.append(e)
            }
        }
        return list
    }

    public func intersect(other: Collection<T>): HashSet<T> {
        return intersect(this, other)
    }

    public func subtract(other: Collection<T>): HashSet<T> {
        return subtract(this, other)
    }

    public func union(other: Collection<T>): HashSet<T> {
        return union(this, other)
    }

    public func onEach(action: (T) -> Unit): ArrayList<T> {
        for (e in this) {
            action(e)
        }
        return this
    }

    public func onEachIndexed(action: (Int, T) -> Unit): ArrayList<T> {
        var index = 0
        for (e in this) {
            action(index, e)
            index++
        }
        return this
    }

    public func partition(predicate: (T) -> Bool): (ArrayList<T>, ArrayList<T>) {
        let first = ArrayList<T>()
        let second = ArrayList<T>()
        for (e in this) {
            if (predicate(e)) {
                first.append(e)
            } else {
                second.append(e)
            }
        }
        return (first, second)
    }
    
    public func zip<R, V>(other: Collection<R>, transform: (a: T, b: R) -> V): ArrayList<V> {
        let size = min(this.size, other.size)
        let mainIter = this.iterator()
        let otherIter = other.iterator()
        let list = ArrayList<V>()
        for (_ in 0..size) {
            let f = mainIter.next().getOrThrow()
            let s = otherIter.next().getOrThrow()
            list.append(transform(f, s))
        }
        return list
    }

    public func zipWithNext(): ArrayList<(T, T)> {
        return zipWithNext { a, b => (a, b) }
    }

    public func zipWithNext<R>(transform: (a: T, b: T) -> R): ArrayList<R> {
        let result = ArrayList<R>()
        if (this.isEmpty()) {
            return result
        }
        let iter = this.iterator()
        var current = iter.next().getOrThrow()
        while(let Some(next) <- iter.next()) {
            result.append(transform(current, next))
            current = next
        }
        return result
    }

}

extend<T> LinkedList<T> <: KtCollection<T> where T <: Hashable & Equatable<T> {

    // 操作符
    public operator func +(right: Collection<T>): LinkedList<T> {
        return LinkedList(plus(this, right))
    }

    public operator func -(right: Collection<T>): LinkedList<T> {
        return LinkedList(minus(this, right))
    }
    
    public prop indices: Range<Int> {
        get() {
            return 0..this.size
        }
    }

    public prop lastIndex: Int {
        get() {
            return this.size - 1
        }
    }

    public func joinToString(separator!: String = ", ", prefix!: String = "", postfix!: String = "", transform!: (T) -> String): String {
        return joinToString(this, separator: separator, prefix: prefix, postfix: postfix, transform: transform)
    }

    public func find(predicate: (T) -> Bool): ?T {
        return find(this, predicate)
    }

    public func findLast(predicate: (T) -> Bool): ?T {
        return findLast(this, predicate)
    }

    public func firstOrNone(): ?T {
        return firstOrNone(this)
    }

    public func lastOrNone(): ?T {
        return lastOrNone(this)
    }

    public func firstOrNone(predicate: (T) -> Bool): ?T {
        return firstOrNone(this, predicate)
    }

    public func lastOrNone(predicate: (T) -> Bool): ?T {
        return lastOrNone(this, predicate)
    }

    public func firstOrDefault(def: () -> T): T {
        return firstOrNone(this) ?? def()
    }

    public func lastOrDefault(def: () -> T): T {
        return lastOrNone(this) ?? def()
    }

    public operator func [](index: Int): T {
        return this.nodeAt(index).getOrThrow().value
    }

    public operator func [](index: Int, value!: T): Unit {
        match(this.nodeAt(index)) {
            case Some(o) => o.value = value
            case _ => ()
        }
    }

    public func get(index: Int): ?T {
        return match(this.nodeAt(index)) {
            case Some(o) => o.value
            case _ => None
        }
    }

    public func getOrDefault(index: Int, def: () -> T): T {
        return match(this.nodeAt(index)) {
            case Some(o) => o.value
            case _ => def()
        }
    }

    public func indexOf(item: T): Int {
        return indexOf(this, item)
    }

    public func lastIndexOf(item: T): Int {
        return lastIndexOf(this, item)
    }

    public func indexOfFirst(predicate: (T) -> Bool): Int {
        return indexOfFirst(this, predicate)
    }

    public func indexOfLast(predicate: (T) -> Bool): Int {
        return indexOfLast(this, predicate)
    }

    public func all(predicate: (T) -> Bool): Bool {
        return all(this, predicate)
    }

    public func any(predicate: (T) -> Bool): Bool {
        return any(this, predicate)
    }

    public func none(predicate: (T) -> Bool): Bool {
        return none(this, predicate)
    }

    public func count(predicate: (T) -> Bool): Int {
        return count(this, predicate)
    }

    public func fold<R>(initial: R, operation: (R, T) -> R): R {
        return fold(this, initial, operation)
    }

    public func foldIndexed<R>(initial: R, operation: (Int, R, T) -> R): R {
        return foldIndexed(this, initial, operation)
    }

    public func forEach(action: (T) -> Unit) {
        forEach(this, action)
    }

    public func forEachIndexed(action: (Int, T) -> Unit) {
        forEachIndexed(this, action)
    }

    public func reduce(operation: (T, T) -> T): T {
        return reduce(this, operation)
    }

    public func reduceIndexed(operation: (Int, T, T) -> T): T {
        return reduceIndexed(this, operation)
    }

    public func subList(startIndex: Int, endIndex: Int): LinkedList<T> {
        let arr = LinkedList<T>()
        for (i in startIndex..endIndex) {
            arr.append(this[i])
        }
        return arr
    }

    public func filter(predicate: (T) -> Bool): LinkedList<T> {
        let arr = LinkedList<T>()
        for (e in this) {
            if (predicate(e)) {
                arr.append(e)
            }
        }
        return arr
    }

    public func filterIndexed(predicate: (Int, T) -> Bool): LinkedList<T> {
        let arr = LinkedList<T>()
        var index = 0
        for (e in this) {
            if (predicate(index, e)) {
                arr.append(e)
            }
            index++
        }
        return arr
    }

    public func filterNot(predicate: (T) -> Bool): LinkedList<T> {
        let arr = LinkedList<T>()
        for (e in this) {
            if (!predicate(e)) {
                arr.append(e)
            }
        }
        return arr
    }

    public func filterNotIndexed(predicate: (Int, T) -> Bool): LinkedList<T> {
        let arr = LinkedList<T>()
        var index = 0
        for (e in this) {
            if (!predicate(index, e)) {
                arr.append(e)
            }
            index++
        }
        return arr
    }

    public func map<R>(transform: (T) -> R): LinkedList<R> {
        let arr = LinkedList<R>()
        for (e in this) {
            arr.append(transform(e))
        }
        return arr
    }

    public func mapIndexed<R>(transform: (Int, T) -> R): LinkedList<R> {
        let arr = LinkedList<R>()
        var index = 0
        for (e in this) {
            arr.append(transform(index, e))
            index++
        }
        return arr
    }

    public func drop(n: Int): LinkedList<T> {
        return LinkedList(drop(this, n))
    }

    public func dropLast(n: Int): LinkedList<T> {
        return LinkedList(dropLast(this, n))
    }

    public func dropWhile(predicate: (T) -> Bool): LinkedList<T> {
        return LinkedList(dropWhile(this, predicate))
    }

    public func take(n: Int): LinkedList<T> {
        return LinkedList(take(this, n))
    }

    public func takeLast(n: Int): LinkedList<T> {
        return LinkedList(takeLast(this, n))
    }

    public func takeWhile(predicate: (T) -> Bool): LinkedList<T> {
        return LinkedList(takeWhile(this, predicate))
    }

    public func flatMap<R>(transform: (T) -> Collection<R>): LinkedList<R> {
        let arr = LinkedList<R>()
        for (e in this) {
            let l = transform(e)
            for (item in l) {
                arr.append(item)
            }
        }
        return arr
    }

    public func flatMapIndexed<R>(transform: (Int, T) -> Collection<R>): LinkedList<R> {
        let arr = LinkedList<R>()
        var index = 0
        for (e in this) {
            let l = transform(index, e)
            for (item in l) {
                arr.append(item)
            }
            index++
        }
        return arr
    }

    public func associate<K, V>(transform: (T) -> (K, V)): Map<K, V> where K <: Hashable & Equatable<K> {
        return associate(this, transform)
    }

    public func associateBy<K>(keySelector: (T) -> K): Map<K, T> where K <: Hashable & Equatable<K> {
        return associateBy(this, keySelector)
    }

    public func associateWith<V>(valueSelector: (T) -> V): Map<T, V> {
        return associateWith(this, valueSelector)
    }

    public func groupBy<K>(keySelector: (T) -> K): Map<K, ArrayList<T>> where K <: Hashable & Equatable<K> {
        return groupBy(this, keySelector)
    }

    public func distinct(): LinkedList<T> {
        return LinkedList(HashSet(this))
    }

    public func distinctBy<K>(selector: (T) -> K): LinkedList<T> where K <: Hashable & Equatable<K> {
        let s = HashSet<K>()
        let list = LinkedList<T>()
        for (e in this) {
            let key = selector(e)
            if (s.put(key)) {
                list.append(e)
            }
        }
        return list
    }

    public func intersect(other: Collection<T>): HashSet<T> {
        return intersect(this, other)
    }

    public func subtract(other: Collection<T>): HashSet<T> {
        return subtract(this, other)
    }

    public func union(other: Collection<T>): HashSet<T> {
        return union(this, other)
    }

    public func onEach(action: (T) -> Unit): LinkedList<T> {
        for (e in this) {
            action(e)
        }
        return this
    }

    public func onEachIndexed(action: (Int, T) -> Unit): LinkedList<T> {
        var index = 0
        for (e in this) {
            action(index, e)
            index++
        }
        return this
    }

    public func partition(predicate: (T) -> Bool): (LinkedList<T>, LinkedList<T>) {
        let first = LinkedList<T>()
        let second = LinkedList<T>()
        for (e in this) {
            if (predicate(e)) {
                first.append(e)
            } else {
                second.append(e)
            }
        }
        return (first, second)
    }
    
    public func zip<R, V>(other: Collection<R>, transform: (a: T, b: R) -> V): LinkedList<V> {
        let size = min(this.size, other.size)
        let mainIter = this.iterator()
        let otherIter = other.iterator()
        let list = LinkedList<V>()
        for (_ in 0..size) {
            let f = mainIter.next().getOrThrow()
            let s = otherIter.next().getOrThrow()
            list.append(transform(f, s))
        }
        return list
    }

    public func zipWithNext(): LinkedList<(T, T)> {
        return zipWithNext { a, b => (a, b) }
    }

    public func zipWithNext<R>(transform: (a: T, b: T) -> R): LinkedList<R> {
        let result = LinkedList<R>()
        if (this.isEmpty()) {
            return result
        }
        let iter = this.iterator()
        var current = iter.next().getOrThrow()
        while(let Some(next) <- iter.next()) {
            result.append(transform(current, next))
            current = next
        }
        return result
    }

}

extend<T> HashSet<T> <: KtCollection<T> where T <: Equatable<T> {

    // 操作符
    public operator func +(right: Collection<T>): HashSet<T> {
        return HashSet(plus(this, right))
    }

    public operator func -(right: Collection<T>): HashSet<T> {
        return HashSet(minus(this, right))
    }

    public prop indices: Range<Int> {
        get() {
            return 0..this.size
        }
    }

    public prop lastIndex: Int {
        get() {
            return this.size - 1
        }
    }

    public func joinToString(separator!: String = ", ", prefix!: String = "", postfix!: String = "", transform!: (T) -> String): String {
        return joinToString(this, separator: separator, prefix: prefix, postfix: postfix, transform: transform)
    }

    public func find(predicate: (T) -> Bool): ?T {
        return find(this, predicate)
    }

    public func findLast(predicate: (T) -> Bool): ?T {
        return findLast(this, predicate)
    }

    public func firstOrNone(): ?T {
        return firstOrNone(this)
    }

    public func lastOrNone(): ?T {
        return lastOrNone(this)
    }

    public func firstOrNone(predicate: (T) -> Bool): ?T {
        return firstOrNone(this, predicate)
    }

    public func lastOrNone(predicate: (T) -> Bool): ?T {
        return lastOrNone(this, predicate)
    }

    public func first(): T {
        return firstOrNone(this).getOrThrow()
    }
    public func last(): T {
        return lastOrNone(this).getOrThrow()
    }

    public func firstOrDefault(def: () -> T): T {
        return firstOrNone(this) ?? def()
    }

    public func lastOrDefault(def: () -> T): T {
        return lastOrNone(this) ?? def()
    }

    public operator func [](index: Int): T {
        var i = 0
        for (e in this) {
            if (i == index) {
                return e
            }
            i++
        }
        throw IndexOutOfBoundsException()
    }

    public func get(index: Int): ?T {
        var i = 0
        for (e in this) {
            if (i == index) {
                return e
            }
            i++
        }
        return None
    }

    public func getOrDefault(index: Int, def: () -> T): T {
        return get(index) ?? def()
    }

    public func indexOf(item: T): Int {
        return indexOf(this, item)
    }

    public func lastIndexOf(item: T): Int {
        return lastIndexOf(this, item)
    }

    public func indexOfFirst(predicate: (T) -> Bool): Int {
        return indexOfFirst(this, predicate)
    }

    public func indexOfLast(predicate: (T) -> Bool): Int {
        return indexOfLast(this, predicate)
    }

    public func all(predicate: (T) -> Bool): Bool {
        return all(this, predicate)
    }

    public func any(predicate: (T) -> Bool): Bool {
        return any(this, predicate)
    }

    public func none(predicate: (T) -> Bool): Bool {
        return none(this, predicate)
    }

    public func count(predicate: (T) -> Bool): Int {
        return count(this, predicate)
    }

    public func fold<R>(initial: R, operation: (R, T) -> R): R {
        return fold(this, initial, operation)
    }

    public func foldIndexed<R>(initial: R, operation: (Int, R, T) -> R): R {
        return foldIndexed(this, initial, operation)
    }

    public func forEach(action: (T) -> Unit) {
        forEach(this, action)
    }

    public func forEachIndexed(action: (Int, T) -> Unit) {
        forEachIndexed(this, action)
    }

    public func reduce(operation: (T, T) -> T): T {
        return reduce(this, operation)
    }

    public func reduceIndexed(operation: (Int, T, T) -> T): T {
        return reduceIndexed(this, operation)
    }

    public func filter(predicate: (T) -> Bool): HashSet<T> {
        let arr = HashSet<T>()
        for (e in this) {
            if (predicate(e)) {
                arr.put(e)
            }
        }
        return arr
    }

    public func filterIndexed(predicate: (Int, T) -> Bool): HashSet<T> {
        let arr = HashSet<T>()
        var index = 0
        for (e in this) {
            if (predicate(index, e)) {
                arr.put(e)
            }
            index++
        }
        return arr
    }

    public func filterNot(predicate: (T) -> Bool): HashSet<T> {
        let arr = HashSet<T>()
        for (e in this) {
            if (!predicate(e)) {
                arr.put(e)
            }
        }
        return arr
    }

    public func filterNotIndexed(predicate: (Int, T) -> Bool): HashSet<T> {
        let arr = HashSet<T>()
        var index = 0
        for (e in this) {
            if (!predicate(index, e)) {
                arr.put(e)
            }
            index++
        }
        return arr
    }

    public func map<R>(transform: (T) -> R): HashSet<R> where R <: Hashable & Equatable<R> {
        let arr = HashSet<R>()
        for (e in this) {
            arr.put(transform(e))
        }
        return arr
    }

    public func mapIndexed<R>(transform: (Int, T) -> R): HashSet<R> where R <: Hashable & Equatable<R> {
        let arr = HashSet<R>()
        var index = 0
        for (e in this) {
            arr.put(transform(index, e))
            index++
        }
        return arr
    }

    public func drop(n: Int): HashSet<T> {
        return HashSet(drop(this, n))
    }

    public func dropLast(n: Int): HashSet<T> {
        return HashSet(dropLast(this, n))
    }

    public func dropWhile(predicate: (T) -> Bool): HashSet<T> {
        return HashSet(dropWhile(this, predicate))
    }

    public func take(n: Int): HashSet<T> {
        return HashSet(take(this, n))
    }

    public func takeLast(n: Int): HashSet<T> {
        return HashSet(takeLast(this, n))
    }

    public func takeWhile(predicate: (T) -> Bool): HashSet<T> {
        return HashSet(takeWhile(this, predicate))
    }

    public func flatMap<R>(transform: (T) -> Collection<R>): HashSet<R> where R <: Hashable & Equatable<R> {
        let arr = HashSet<R>()
        for (e in this) {
            let l = transform(e)
            for (item in l) {
                arr.put(item)
            }
        }
        return arr
    }

    public func flatMapIndexed<R>(transform: (Int, T) -> Collection<R>): HashSet<R> where R <: Hashable & Equatable<R> {
        let arr = HashSet<R>()
        var index = 0
        for (e in this) {
            let l = transform(index, e)
            for (item in l) {
                arr.put(item)
            }
            index++
        }
        return arr
    }

    public func associate<K, V>(transform: (T) -> (K, V)): Map<K, V> where K <: Hashable & Equatable<K> {
        return associate(this, transform)
    }

    public func associateBy<K>(keySelector: (T) -> K): Map<K, T> where K <: Hashable & Equatable<K> {
        return associateBy(this, keySelector)
    }

    public func associateWith<V>(valueSelector: (T) -> V): Map<T, V> {
        return associateWith(this, valueSelector)
    }

    public func groupBy<K>(keySelector: (T) -> K): Map<K, ArrayList<T>> where K <: Hashable & Equatable<K> {
        return groupBy(this, keySelector)
    }

    public func intersect(other: Collection<T>): HashSet<T> {
        return intersect(this, other)
    }

    public func subtract(other: Collection<T>): HashSet<T> {
        return subtract(this, other)
    }

    public func union(other: Collection<T>): HashSet<T> {
        return union(this, other)
    }

    public func onEach(action: (T) -> Unit): HashSet<T> {
        for (e in this) {
            action(e)
        }
        return this
    }

    public func onEachIndexed(action: (Int, T) -> Unit): HashSet<T> {
        var index = 0
        for (e in this) {
            action(index, e)
            index++
        }
        return this
    }

    public func partition(predicate: (T) -> Bool): (HashSet<T>, HashSet<T>) {
        let first = HashSet<T>()
        let second = HashSet<T>()
        for (e in this) {
            if (predicate(e)) {
                first.put(e)
            } else {
                second.put(e)
            }
        }
        return (first, second)
    }
}


extend<K, V> HashMap<K, V> <: KtMap<K, V> where K <: Hashable & Equatable<K> {

    // 操作符
    public operator func +(right: Map<K, V>): HashMap<K, V> {
        return plus(this, right)
    }

    public operator func -(right: Map<K, V>): HashMap<K, V> {
        return minus(this, right)
    }

    public func getOrPut(key: K, defaultValue: () -> V): V {
        return match(this.get(key)) {
            case Some(value) => value
            case _ => 
                let ans = defaultValue()
                this.put(key, ans)
                ans
        }
    }

    public func all(predicate: (K, V) -> Bool): Bool {
        return all(this, predicate)
    }

    public func any(predicate: (K, V) -> Bool): Bool {
        return any(this, predicate)
    }

    public func none(predicate: (K, V) -> Bool): Bool {
        return none(this, predicate)
    }

    public func count(predicate: (K, V) -> Bool): Int {
        return count(this, predicate)
    }

    public func forEach(action: (K, V) -> Unit): Unit {
        for ((k, v) in this) {
            action(k, v)
        }
    }

    public func flatMap<R>(transform: (K, V) -> ArrayList<R>): ArrayList<R> {
        return flatMap(this, transform)
    }

    public func map<R>(transform: (K, V) -> R): ArrayList<R> {
        return map(this, transform)
    }

    public func mapKeys<R>(transform: (K, V) -> R): HashMap<R, V> where R <: Hashable & Equatable<R> {
        return mapKeys(this, transform)
    }
    
    public func mapValues<R>(transform: (K, V) -> R): HashMap<K, R> {
        return mapValues(this, transform)
    }
    
    public func filterKeys(predicate: (K) -> Bool): HashMap<K, V> {
        return filterKeys(this, predicate)
    }

    public func filterValues(predicate: (V) -> Bool): HashMap<K, V> {
        return filterValues(this, predicate)
    }

    public func filter(predicate: (K, V) -> Bool): HashMap<K, V> {
        return filter(this, predicate)
    }

    public func filterNot(predicate: (K, V) -> Bool): HashMap<K, V> {
        return filterNot(this, predicate)
    }
    
    public func onEach(action: (K, V) -> Unit): HashMap<K, V> {
        return onEach(this, action)
    }

    public func onEachIndexed(action: (Int, K, V) -> Unit): HashMap<K, V> {
        return onEachIndexed(this, action)
    }
    
}


extend<K, V> TreeMap<K, V> <: KtMap<K, V> where K <: Hashable & Equatable<K> {
    // 操作符
    public operator func +(right: Map<K, V>): TreeMap<K, V> {
        return TreeMap(plus(this, right))
    }

    public operator func -(right: Map<K, V>): TreeMap<K, V> {
        return TreeMap(minus(this, right))
    }
    
    public func getOrPut(key: K, defaultValue: () -> V): V {
        return match(this.get(key)) {
            case Some(value) => value
            case _ => 
                let ans = defaultValue()
                this.put(key, ans)
                ans
        }
    }

    public func all(predicate: (K, V) -> Bool): Bool {
        return all(this, predicate)
    }

    public func any(predicate: (K, V) -> Bool): Bool {
        return any(this, predicate)
    }

    public func none(predicate: (K, V) -> Bool): Bool {
        return none(this, predicate)
    }

    public func count(predicate: (K, V) -> Bool): Int {
        return count(this, predicate)
    }

    public func forEach(action: (K, V) -> Unit): Unit {
        for ((k, v) in this) {
            action(k, v)
        }
    }

    public func flatMap<R>(transform: (K, V) -> ArrayList<R>): ArrayList<R> {
        return flatMap(this, transform)
    }

    public func map<R>(transform: (K, V) -> R): ArrayList<R> {
        return map(this, transform)
    }

    public func mapKeys<R>(transform: (K, V) -> R): HashMap<R, V> where R <: Hashable & Equatable<R> {
        return mapKeys(this, transform)
    }
    
    public func mapValues<R>(transform: (K, V) -> R): HashMap<K, R> {
        return mapValues(this, transform)
    }
    
    public func filterKeys(predicate: (K) -> Bool): HashMap<K, V> {
        return filterKeys(this, predicate)
    }

    public func filterValues(predicate: (V) -> Bool): HashMap<K, V> {
        return filterValues(this, predicate)
    }

    public func filter(predicate: (K, V) -> Bool): HashMap<K, V> {
        return filter(this, predicate)
    }

    public func filterNot(predicate: (K, V) -> Bool): HashMap<K, V> {
        return filterNot(this, predicate)
    }
    
    public func onEach(action: (K, V) -> Unit): HashMap<K, V> {
        return onEach(this, action)
    }

    public func onEachIndexed(action: (Int, K, V) -> Unit): HashMap<K, V> {
        return onEachIndexed(this, action)
    }

}

extend<K, V> ConcurrentHashMap<K, V> <: KtMap<K, V> where K <: Hashable & Equatable<K> {
    // 操作符
    public operator func +(right: ConcurrentHashMap<K, V>): ConcurrentHashMap<K, V> {
        return plus(this, right)
    }

    public operator func -(right: ConcurrentHashMap<K, V>): ConcurrentHashMap<K, V> {
        return minus(this, right)
    }
    
    public func getOrPut(key: K, defaultValue: () -> V): V {
        return match(this.get(key)) {
            case Some(value) => value
            case _ => 
                let ans = defaultValue()
                this.put(key, ans)
                ans
        }
    }

    public func all(predicate: (K, V) -> Bool): Bool {
        return all(this, predicate)
    }

    public func any(predicate: (K, V) -> Bool): Bool {
        return any(this, predicate)
    }

    public func none(predicate: (K, V) -> Bool): Bool {
        return none(this, predicate)
    }

    public func count(predicate: (K, V) -> Bool): Int {
        return count(this, predicate)
    }

    public func forEach(action: (K, V) -> Unit): Unit {
        for ((k, v) in this) {
            action(k, v)
        }
    }

    public func flatMap<R>(transform: (K, V) -> ArrayList<R>): ArrayList<R> {
        let dest = ArrayList<R>()
        for ((k, v) in this) {
            let list = transform(k, v)
            dest.appendAll(list)
        }
        return dest
    }

    public func map<R>(transform: (K, V) -> R): ArrayList<R> {
        let dest = ArrayList<R>()
        for ((k, v) in this) {
            dest.append(transform(k, v))
        }
        return dest
    }

    public func mapKeys<R>(transform: (K, V) -> R): ConcurrentHashMap<R, V> where R <: Hashable & Equatable<R> {
        let dest = ConcurrentHashMap<R, V>()
        for ((k, v) in this) {
            dest[transform(k, v)] = v
        }
        return dest
    }
    
    public func mapValues<R>(transform: (K, V) -> R): ConcurrentHashMap<K, R> {
        let dest = ConcurrentHashMap<K, R>()
        for ((k, v) in this) {
            dest[k] = transform(k, v)
        }
        return dest
    }
    
    public func filterKeys(predicate: (K) -> Bool): ConcurrentHashMap<K, V> {
        let dest = ConcurrentHashMap<K, V>()
        for ((k, v) in this) {
            if (predicate(k)) {
                dest[k] = v
            }
        }
        return dest
    }

    public func filterValues(predicate: (V) -> Bool): ConcurrentHashMap<K, V> {
        let dest = ConcurrentHashMap<K, V>()
        for ((k, v) in this) {
            if (predicate(v)) {
                dest[k] = v
            }
        }
        return dest
    }

    public func filter(predicate: (K, V) -> Bool): ConcurrentHashMap<K, V> {
        let dest = ConcurrentHashMap<K, V>()
        for ((k, v) in this) {
            if (predicate(k, v)) {
                dest[k] = v
            }
        }
        return dest
    }

    public func filterNot(predicate: (K, V) -> Bool): ConcurrentHashMap<K, V> {
        let dest = ConcurrentHashMap<K, V>()
        for ((k, v) in this) {
            if (!predicate(k, v)) {
                dest[k] = v
            }
        }
        return dest
    }
    
    public func onEach(action: (K, V) -> Unit): ConcurrentHashMap<K, V> {
        for ((k, v) in this) {
            action(k, v)
        }
        return this
    }

    public func onEachIndexed(action: (Int, K, V) -> Unit): ConcurrentHashMap<K, V> {
        var index = 0
        for ((k, v) in this) {
            action(index, k, v)
            index++
        }
        return this
    }
}

func joinToString<T>(col: Collection<T>, separator!: String = ", ", prefix!: String = "", postfix!: String = "", transform!: (T) -> String): String {
    var s = ""
    for (item in col) {
        s += (transform(item) + separator)
    }
    s = s.trimRight(separator)
    return "${prefix}${s}${postfix}"
}

func firstOrNone<T>(col: Collection<T>): ?T {
    return col.iterator().next()
}

func firstOrNone<T>(col: Collection<T>, predicate: (T) -> Bool): ?T {
    for (item in col) {
        if (predicate(item)) {
            return item
        }
    }
    return None
}

func lastOrNone<T>(col: Collection<T>): ?T {
    if (col.isEmpty()) {
        return None
    }
    var iter = col.iterator()
    var item: ?T = None
    while (let Some(o) <- iter.next()) {
        item = o
    }
    return item.getOrThrow()
}

func lastOrNone<T>(col: Collection<T>, predicate: (T) -> Bool): ?T {
    if (col.isEmpty()) {
        return None
    }
    var iter = col.iterator()
    var item: ?T = None
    while (let Some(o) <- iter.next()) {
        if (predicate(o)) {
            item = o
        }
    }
    return item
}


func find<T>(col: Collection<T>, predicate: (T) -> Bool): ?T {
    return firstOrNone(col, predicate)
}

func findLast<T>(col: Collection<T>, predicate: (T) -> Bool): ?T {
    return lastOrNone(col, predicate)
}

func indexOf<T>(col: Collection<T>, item: T): Int where T <: Equatable<T> {
    if (col.isEmpty()) {
        return -1
    }
    var i = 0
    var index = -1
    for (e in col) {
        if (e == item) {
            index = i
            break
        }
        i++
    }
    return index
}

func lastIndexOf<T>(col: Collection<T>, item: T): Int where T <: Equatable<T> {
    if (col.isEmpty()) {
        return -1
    }
    var i = 0
    var index = -1
    for (e in col) {
        if (e == item) {
            index = i
        }
        i++
    }
    return index
}

func indexOfFirst<T>(col: Collection<T>, predicate: (T) -> Bool): Int {
    if (col.isEmpty()) {
        return -1
    }
    var i = 0
    var index = -1
    for (e in col) {
        if (predicate(e)) {
            index = i
            break
        }
        i++
    }
    return index
}

func indexOfLast<T>(col: Collection<T>, predicate: (T) -> Bool): Int {
    if (col.isEmpty()) {
        return -1
    }
    var i = 0
    var index = -1
    for (e in col) {
        if (predicate(e)) {
            index = i
        }
        i++
    }
    return index
}


func all<T>(col: Collection<T>, predicate: (T) -> Bool): Bool {
    if (col.isEmpty()) {
        return true
    }
    for (e in col) {
        if (!predicate(e)) {
            return false
        }
    }
    return true
}

func any<T>(col: Collection<T>, predicate: (T) -> Bool): Bool {
    if (col.isEmpty()) {
        return false
    }
    for (e in col) {
        if (predicate(e)) {
            return true
        }
    }
    return false
}

func none<T>(col: Collection<T>, predicate: (T) -> Bool): Bool {
    if (col.isEmpty()) {
        return true
    }
    for (e in col) {
        if (predicate(e)) {
            return false
        }
    }
    return true
}

func count<T>(col: Collection<T>, predicate: (T) -> Bool): Int {
    if (col.isEmpty()) {
        return 0
    }
    var count = 0
    for (e in col) {
        if (predicate(e)) {
            count++
        }
    }
    return count
}

func fold<T, R>(col: Collection<T>, initial: R, operation: (R, T) -> R): R {
    var acc = initial
    for (e in col) {
        acc = operation(acc, e)
    }
    return acc
}

func foldIndexed<T, R>(col: Collection<T>, initial: R, operation: (Int, R, T) -> R): R {
    var acc = initial
    var index = 0
    for (e in col) {
        acc = operation(index, acc, e)
        index++
    }
    return acc
}

func forEach<T>(col: Collection<T>, action: (T) -> Unit) {
    for (e in col) {
        action(e)
    }
}

func forEachIndexed<T>(col: Collection<T>, action: (Int, T) -> Unit) {
    var index = 0
    for (e in col) {
        action(index, e)
        index++
    }
}

func reduce<T>(col: Collection<T>, operation: (T, T) -> T): T {
    let iter = col.iterator()
    var acc = iter.next().getOrThrow()
    while(let Some(e) <- iter.next()) {
        acc = operation(acc, e)
    }
    return acc
}

func reduceIndexed<T>(col: Collection<T>, operation: (Int, T, T) -> T): T {
    let iter = col.iterator()
    var acc = iter.next().getOrThrow()
    var index = 1
    while(let Some(e) <- iter.next()) {
        acc = operation(index, acc, e)
        index++
    }
    return acc
}

func drop<T>(col: Collection<T>, n: Int): ArrayList<T> {
    let arr = ArrayList<T>()
    var index = 0
    for (e in col) {
        if (index < n) {
            index++
            continue
        }
        arr.append(e)
        index++
    }
    return arr
}

func dropLast<T>(col: Collection<T>, n: Int): ArrayList<T> {
    let arr = ArrayList<T>()
    var index = 0
    var size = col.size
    for (e in col) {
        if (index >= (size - n)) {
            break
        }
        arr.append(e)
        index++
    }
    return arr
}

func dropWhile<T>(col: Collection<T>, predicate: (T) -> Bool): ArrayList<T> {
    let arr = ArrayList<T>()
    for (e in col) {
        if (!predicate(e)) {
            arr.append(e)
        }
    }
    return arr
}

func take<T>(col: Collection<T>, n: Int): ArrayList<T> {
    let arr = ArrayList<T>()
    var index = 0
    for (e in col) {
        if (index >= n) {
            break
        }
        arr.append(e)
        index++
    }
    return arr
}

func takeLast<T>(col: Collection<T>, n: Int): ArrayList<T> {
    let arr = ArrayList<T>()
    var index = 0
    let size = col.size
    for (e in col) {
        if (index < (size - n)) {
            index++
            continue
        }
        arr.append(e)
        index++
    }
    return arr
}

func takeWhile<T>(col: Collection<T>, predicate: (T) -> Bool): ArrayList<T> {
    let arr = ArrayList<T>()
    for (e in col) {
        if (predicate(e)) {
            arr.append(e)
        }
    }
    return arr
}

func associate<T, K, V>(col: Collection<T>, transform: (T) -> (K, V)): Map<K, V> where K <: Hashable & Equatable<K> {
    let m = HashMap<K, V>()
    for (e in col) {
        let (k, v) = transform(e)
        m[k] = v
    }
    return m
}

func associateBy<K, T>(col: Collection<T>, keySelector: (T) -> K): Map<K, T> where K <: Hashable & Equatable<K> {
    let m = HashMap<K, T>()
    for (e in col) {
        let key = keySelector(e)
        m[key] = e
    }
    return m
}

func associateWith<T, V>(col: Collection<T>, valueSelector: (T) -> V): Map<T, V> where T <: Hashable & Equatable<T> {
    let m = HashMap<T, V>()
    for (e in col) {
        let value = valueSelector(e)
        m[e] = value
    }
    return m
}

func groupBy<T, K>(col: Collection<T>, keySelector: (T) -> K): Map<K, ArrayList<T>> where K <: Hashable & Equatable<K> {
    let m = HashMap<K, ArrayList<T>>()
    for (e in col) {
        let key = keySelector(e)
        let l = m.getOrPut(key) { ArrayList<T>() }
        l.append(e)
    }
    return m
}

func intersect<T>(col: Collection<T>, other: Collection<T>): HashSet<T> where T <: Hashable & Equatable<T> {
    let mainArr = Array(col)
    let otherArr = Array(other)
    return HashSet(mainArr.filter { it => otherArr.contains(it) })
}

func subtract<T>(col: Collection<T>, other: Collection<T>): HashSet<T> where T <: Hashable & Equatable<T> {
    let mainArr = ArrayList(col)
    let otherArr = Array(other)
    mainArr.removeIf { it => otherArr.contains(it)}
    return HashSet(mainArr)
}

func union<T>(col: Collection<T>, other: Collection<T>): HashSet<T> where T <: Hashable & Equatable<T> {
    let mainArr = ArrayList(col)
    mainArr.appendAll(other)
    return HashSet(mainArr)
}

func plus<T>(col1: Collection<T>, col2: Collection<T>): ArrayList<T> {
    let arr = ArrayList(col1)
    arr.appendAll(col2)
    return arr
}

func minus<T>(col1: Collection<T>, col2: Collection<T>): ArrayList<T> where T <: Equatable<T> {
    let arr = ArrayList(col1)
    let other = ArrayList(col2)
    arr.removeIf { it => other.contains(it) }
    return arr
}

func plus<K, V>(m1: Map<K, V>, m2: Map<K, V>): HashMap<K, V> where K <: Hashable & Equatable<K> {
    let map = HashMap(m1)
    map.putAll(m2)
    return map
}

func minus<K, V>(m1: Map<K, V>, m2: Map<K, V>): HashMap<K, V> where K <: Hashable & Equatable<K> {
    let map = HashMap(m1)
    let other = HashMap(m2)
    map.removeIf { k, _ => other.contains(k) }
    return map
}

func plus<K, V>(m1: ConcurrentHashMap<K, V>, m2: ConcurrentHashMap<K, V>): ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K> {
    let map = ConcurrentHashMap(m1)
    for ((k, v) in m2) {
        map[k] = v
    }
    return map
}

func minus<K, V>(m1: ConcurrentHashMap<K, V>, m2: ConcurrentHashMap<K, V>): ConcurrentHashMap<K, V> where K <: Hashable & Equatable<K> {
    let map = ConcurrentHashMap(m1)
    for ((k, _) in m2) {
        map.remove(k)
    }
    return map
}

func all<K, V>(m: Map<K, V>, predicate: (K, V) -> Bool): Bool where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return true
    }
    for ((k, v) in m) {
        if (!predicate(k, v)) {
            return false
        }
    }
    return true
}

func any<K, V>(m: Map<K, V>, predicate: (K, V) -> Bool): Bool where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return false
    }
    for ((k, v) in m) {
        if (predicate(k, v)) {
            return true
        }
    }
    return false
}

func none<K, V>(m: Map<K, V>, predicate: (K, V) -> Bool): Bool where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return true
    }
    for ((k, v) in m) {
        if (predicate(k, v)) {
            return false
        }
    }
    return true
}

func count<K, V>(m: Map<K, V>, predicate: (K, V) -> Bool): Int where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return 0
    }
    var count = 0
    for ((k, v) in m) {
        if (predicate(k, v)) {
            count++
        }
    }
    return count
}

func all<K, V>(m: ConcurrentHashMap<K, V>, predicate: (K, V) -> Bool): Bool where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return true
    }
    for ((k, v) in m) {
        if (!predicate(k, v)) {
            return false
        }
    }
    return true
}

func any<K, V>(m: ConcurrentHashMap<K, V>, predicate: (K, V) -> Bool): Bool where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return false
    }
    for ((k, v) in m) {
        if (predicate(k, v)) {
            return true
        }
    }
    return false
}

func none<K, V>(m: ConcurrentHashMap<K, V>, predicate: (K, V) -> Bool): Bool where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return true
    }
    for ((k, v) in m) {
        if (predicate(k, v)) {
            return false
        }
    }
    return true
}

func count<K, V>(m: ConcurrentHashMap<K, V>, predicate: (K, V) -> Bool): Int where K <: Hashable & Equatable<K> {
    if (m.isEmpty()) {
        return 0
    }
    var count = 0
    for ((k, v) in m) {
        if (predicate(k, v)) {
            count++
        }
    }
    return count
}

func flatMap<K, V, R>(m: Map<K, V>, transform: (K, V) -> ArrayList<R>): ArrayList<R> where K <: Hashable & Equatable<K> {
    let dest = ArrayList<R>()
    for ((k, v) in m) {
        let list = transform(k, v)
        dest.appendAll(list)
    }
    return dest
}

public func map<K, V, R>(m: Map<K, V>, transform: (K, V) -> R): ArrayList<R> where K <: Hashable & Equatable<K> {
    let dest = ArrayList<R>()
    for ((k, v) in m) {
        dest.append(transform(k, v))
    }
    return dest
}

public func mapKeys<K, V, R>(m: Map<K, V>, transform: (K, V) -> R): HashMap<R, V> where R <: Hashable & Equatable<R>, K <: Hashable & Equatable<K> {
    let dest = HashMap<R, V>()
    for ((k, v) in m) {
        dest[transform(k, v)] = v
    }
    return dest
}

public func mapValues<K, V, R>(m: Map<K, V>, transform: (K, V) -> R): HashMap<K, R> where K <: Hashable & Equatable<K> {
    let dest = HashMap<K, R>()
    for ((k, v) in m) {
        dest[k] = transform(k, v)
    }
    return dest
}

public func filterKeys<K, V>(m: Map<K, V>, predicate: (K) -> Bool): HashMap<K, V> where K <: Hashable & Equatable<K> {
    let dest = HashMap<K, V>()
    for ((k, v) in m) {
        if (predicate(k)) {
            dest[k] = v
        }
    }
    return dest
}

public func filterValues<K, V>(m: Map<K, V>, predicate: (V) -> Bool): HashMap<K, V> where K <: Hashable & Equatable<K> {
    let dest = HashMap<K, V>()
    for ((k, v) in m) {
        if (predicate(v)) {
            dest[k] = v
        }
    }
    return dest
}

public func filter<K, V>(m: Map<K, V>, predicate: (K, V) -> Bool): HashMap<K, V> where K <: Hashable & Equatable<K> {
    let dest = HashMap<K, V>()
    for ((k, v) in m) {
        if (predicate(k, v)) {
            dest[k] = v
        }
    }
    return dest
}

public func filterNot<K, V>(m: Map<K, V>, predicate: (K, V) -> Bool): HashMap<K, V> where K <: Hashable & Equatable<K> {
    let dest = HashMap<K, V>()
    for ((k, v) in m) {
        if (!predicate(k, v)) {
            dest[k] = v
        }
    }
    return dest
}

public func onEach<K, V>(m: Map<K, V>, action: (K, V) -> Unit): HashMap<K, V> where K <: Hashable & Equatable<K> {
    for ((k, v) in m) {
        action(k, v)
    }
    return HashMap(m)
}

public func onEachIndexed<K, V>(m: Map<K, V>, action: (Int, K, V) -> Unit): HashMap<K, V> where K <: Hashable & Equatable<K> {
    var index = 0
    for ((k, v) in m) {
        action(index, k, v)
        index++
    }
    return HashMap(m)
}