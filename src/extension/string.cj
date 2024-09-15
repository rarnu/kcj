package kcj.extension

import std.convert.Parsable
import std.time.*
import std.regex.*
import std.collection.*


public interface KtString {

    prop indices: Range<Int>
    prop lastIndex: Int

    func ifEmpty(def: () -> String): String
    func ifBlank(def: () -> String): String
    func substring(r: Range<Int>): String
    func substring(startIndex: Int, endIndex: Int): String
    func substring(startIndex: Int): String
    func substringBefore(delimiter: String, missingDelimiterValue!: String): String
    func substringAfter(delimiter: String, missingDelimiterValue!: String): String
    func substringBeforeLast(delimiter: String, missingDelimiterValue!: String): String
    func substringAfterLast(delimiter: String, missingDelimiterValue!: String): String
    func replaceRange(startIndex: Int, endIndex: Int, replacement: String): String 
    func replaceRange(r: Range<Int>, replacement: String): String
    func removeRange(startIndex: Int, endIndex: Int): String
    func removeRange(r: Range<Int>): String
    func replaceBefore(delimiter: String, replacement: String, missingDelimiterValue!: String): String
    func replaceAfter(delimiter: String, replacement: String, missingDelimiterValue!: String): String 
    func replaceAfterLast(delimiter: String, replacement: String, missingDelimiterValue!: String): String 
    func replaceBeforeLast(delimiter: String, replacement: String, missingDelimiterValue!: String): String
    func indexOfAny(strs: Collection<String>, startIndex!: Int): Int
    func lastIndexOfAny(strs: Array<String>, startIndex!: Int): Int
    func toBool(): ?Bool
    func toInt(): ?Int
    func toFloat(): ?Float64
    func toDateTime(): ?DateTime
    func take(n: Int): String 
    func takeLast(n: Int): String
    func drop(n: Int): String
    func dropLast(n: Int): String 
    func format(args: Array<ToString>): String
    func format(args: Map<String, ToString>): String
    func trimMargin(marginPrefix!: String): String
    func trimIndent(): String
    func toRegex(): Regex
    func indexOfFirst(predicate: (Rune) -> Bool): Int
    func indexOfLast(predicate: (Rune) -> Bool): Int
    func replaceTag(tag: String, replacement: () -> String): String

    func toRuneArray(): Array<Rune>
    func takeWhile(predicate: (Rune) -> Bool): String
    func takeLastWhile(predicate: (Rune) -> Bool): String
    func dropWhile(predicate: (Rune) -> Bool): String
    func dropLastWhile(predicate: (Rune) -> Bool): String
    func filter(predicate: (Rune) -> Bool): String
    func filterIndexed(predicate: (Int, Rune) -> Bool): String
    func filterNot(predicate: (Rune) -> Bool): String
    func filterNotIndexed(predicate: (Int, Rune) -> Bool): String
    func reversed(): String
    func all(predicate: (Rune) -> Bool): Bool
    func any(predicate: (Rune) -> Bool): Bool
    func none(predicate: (Rune) -> Bool): Bool
    func count(predicate: (Rune) -> Bool): Int
    func forEach(action: (Rune) -> Unit): Unit
    func forEachIndexed(action: (Int, Rune) -> Unit): Unit

    // override with prefix "k"
    func kIndexOf(str: String, startIndex!: Int): Int
    func kLastIndexOf(str: String, startIndex!: Int): Int
}

extend String <: KtString {

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

    public func ifEmpty(def: () -> String): String {
        return if (this.isEmpty()) { def() } else { this }
    }

    public func ifBlank(def: () -> String): String {
        return if (this.isAsciiBlank()) { def() } else { this }
    }

    public func substring(r: Range<Int>): String {
        substring(r.start, r.end + 1)
    }

    public func substring(startIndex: Int, endIndex: Int): String {
        if (startIndex < 0) {
            throw IndexOutOfBoundsException("${startIndex}")
        }
        if (endIndex > this.size) {
            throw IndexOutOfBoundsException("${endIndex}")
        }
        let subLen = endIndex - startIndex
        if (subLen < 0) {
            throw IndexOutOfBoundsException("${subLen}")
        }
        if (startIndex == 0 && endIndex == this.size) {
            return this
        }
        var str = ""
        for (i in startIndex..endIndex) {
            str += "${Rune(this[i])}"
        }
        return str
    }

    public func substring(startIndex: Int): String {
        if (startIndex < 0) {
            throw IndexOutOfBoundsException("${startIndex}")
        }
        if (startIndex == 0) {
            return this
        }
        var str = ""
        for (i in startIndex..this.size) {
            str += "${Rune(this[i])}"
        }
        return str
    }

    public func substringBefore(delimiter: String, missingDelimiterValue!: String = this): String {
        let index = this.indexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { substring(0, index) }
    }

    public func substringAfter(delimiter: String, missingDelimiterValue!: String = this): String {
        let index = this.indexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { substring(index + delimiter.size, this.size) }
    }

    public func substringBeforeLast(delimiter: String, missingDelimiterValue!: String = this): String {
        let index = this.lastIndexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { substring(0, index) }
    }

    public func substringAfterLast(delimiter: String, missingDelimiterValue!: String = this): String {
        let index = this.lastIndexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { substring(index + delimiter.size, this.size) }
    }

    public func replaceRange(startIndex: Int, endIndex: Int, replacement: String): String {
        if (endIndex < startIndex) {
            throw IndexOutOfBoundsException("End index (${endIndex}) is less than start index (${startIndex}).")
        }
        var str = this.substring(0, startIndex)
        str += replacement
        str += this.substring(endIndex, this.size)
        return str
    }

    public func replaceRange(r: Range<Int>, replacement: String): String {
        return replaceRange(r.start, r.end + 1, replacement)
    }

    public func removeRange(startIndex: Int, endIndex: Int): String {
        if (endIndex < startIndex) {
            throw IndexOutOfBoundsException("End index (${endIndex}) is less than start index (${startIndex}).")
        }
        if (endIndex == startIndex) {
            return this.substring(0, this.size)
        }
        var str = this.substring(0, startIndex)
        str += this.substring(endIndex, this.size)
        return str
    }

    public func removeRange(r: Range<Int>): String {
        return removeRange(r.start, r.end + 1)
    }

    public func replaceBefore(delimiter: String, replacement: String, missingDelimiterValue!: String = this): String {
        let index = indexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { replaceRange(0, index, replacement) }
    }

    public func replaceAfter(delimiter: String, replacement: String, missingDelimiterValue!: String = this): String {
        let index = indexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { replaceRange(index + 1, this.size, replacement) }
    }

    public func replaceAfterLast(delimiter: String, replacement: String, missingDelimiterValue!: String = this): String {
        let index = lastIndexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { replaceRange(index + delimiter.size, this.size, replacement) }
    }

    public func replaceBeforeLast(delimiter: String, replacement: String, missingDelimiterValue!: String = this): String {
        let index = lastIndexOf(delimiter).getOrDefault { -1 }
        return if (index == -1) { missingDelimiterValue } else { replaceRange(0, index, replacement) }
    }

    public func indexOfAny(strs: Collection<String>, startIndex!: Int = 0): Int {
        var index = -1
        for (s in strs) {
            let i = this.indexOf(s, startIndex).getOrDefault { -1 }
            if (i != -1) {
                index = i
                break
            }
        }
        return index
    }

    public func lastIndexOfAny(strs: Array<String>, startIndex!: Int = lastIndex): Int {
        var index = -1
        for (s in strs) {
            let i = this.lastIndexOf(s, startIndex).getOrDefault { -1 }
            if (i != -1) {
                index = i
                break
            }
        }
        return index
    }

    public func toBool(): ?Bool {
        return Bool.tryParse(this)
    }

    public func toInt(): ?Int {
        return Int.tryParse(this)
    }

    public func toFloat(): ?Float64 {
        return Float64.tryParse(this)
    }

    public func take(n: Int): String {
        if (n < 0) {
            throw IllegalArgumentException("Requested character count ${n} is less than zero.")
        }
        return substring(0, n.coerceAtMost(this.size))
    }

    public func takeLast(n: Int): String {
        if (n < 0) {
            throw IllegalArgumentException("Requested character count ${n} is less than zero.")
        }
        return substring(this.size - n.coerceAtMost(this.size), this.size)
    }

    public func drop(n: Int): String {
        if (n < 0) {
            throw IllegalArgumentException("Requested character count ${n} is less than zero.")
        }
        return substring(n.coerceAtMost(this.size))
    }

    public func dropLast(n: Int): String {
        if (n < 0) {
            throw IllegalArgumentException("Requested character count ${n} is less than zero.")
        }
        return take((this.size - n).coerceAtLeast(0))
    }

    public func toDateTime(): ?DateTime {
        const FORMAT_DATETIME = "yyyy-MM-dd HH:mm:ss"
        let tmp = this.replace("T", " ").replace("Z", "")
        return try {
            DateTime.parse(tmp, FORMAT_DATETIME)    
        } catch(e: Exception) {
            println(e)
            None
        }
    }

    public func format(args: Array<ToString>): String {
        return Formatter.format(this, args)
    }

    public func format(args: Map<String, ToString>): String {
        return Formatter.format(this, args)
    }

    public func indexOfFirst(predicate: (Rune) -> Bool): Int {
        for (i in 0..this.size) {
            if (predicate(Rune(this[i]))) {
                return i
            }
        }
        return -1
    }

    public func indexOfLast(predicate: (Rune) -> Bool): Int {
        for (i in (this.size - 1)..=0) {
            if (predicate(Rune(this[i]))) {
                return i
            }
        }
        return -1
    }

    public func trimMargin(marginPrefix!: String = "|"): String {
        return stringTrimMargin(this, marginPrefix: marginPrefix)
    }

    public func trimIndent(): String {
        return stringTrimIndent(this)
    }

    public func toRegex(): Regex {
        return Regex(this)
    }

    public func replaceTag(tag: String, replacement: () -> String): String {
        return this.replace(tag, replacement())
    }

    public func takeWhile(predicate: (Rune) -> Bool): String {
        for (index in 0..this.size) {
            if (!predicate(Rune(this[index]))) {
                return this.substring(0, index)
            }
        }
        return this
    }

    public func takeLastWhile(predicate: (Rune) -> Bool): String {
        for (index in lastIndex..=0) {
            if (!predicate(Rune(this[index]))) {
                return this.substring(index + 1)
            }
        }
        return this
    }

    public func dropWhile(predicate: (Rune) -> Bool): String {
        for (index in this.indices) {
            if (!predicate(Rune(this[index]))) {
                return this.substring(index)
            }
        }
        return ""
    }

    public func dropLastWhile(predicate: (Rune) -> Bool): String {
        for (index in lastIndex..=0) {
            if (!predicate(Rune(this[index]))) {
                return this.substring(0, index + 1)
            }
        }
        return ""
    }

    public func filter(predicate: (Rune) -> Bool): String {
        let sb = StringBuilder()
        for (item in this) {
            if (predicate(Rune(item))) {
                sb.append(Rune(item))
            }
        }
        return sb.toString()
    }

    public func filterIndexed(predicate: (Int, Rune) -> Bool): String {
        let sb = StringBuilder()
        var index = 0
        for (item in this) {
            if (predicate(index, Rune(item))) {
                sb.append(Rune(item))
            }
            index++
        }
        return sb.toString()
    }

    public func filterNot(predicate: (Rune) -> Bool): String {
        let sb = StringBuilder()
        for (item in this) {
            if (!predicate(Rune(item))) {
                sb.append(Rune(item))
            }
        }
        return sb.toString()
    }

    public func filterNotIndexed(predicate: (Int, Rune) -> Bool): String {
        let sb = StringBuilder()
        var index = 0
        for (item in this) {
            if (!predicate(index, Rune(item))) {
                sb.append(Rune(item))
            }
            index++
        }
        return sb.toString()
    }

    public func reversed(): String {
        let sb = StringBuilder()
        for (i in lastIndex..=0) {
            sb.append(Rune(this[i]))
        }
        return sb.toString()
    }

    public func all(predicate: (Rune) -> Bool): Bool {
        if (this.isEmpty()) {
            return true
        }
        for (e in this) {
            if (!predicate(Rune(e))) {
                return false
            }
        }
        return true
    }

    public func any(predicate: (Rune) -> Bool): Bool {
        if (this.isEmpty()) {
            return false
        }
        for (e in this) {
            if (predicate(Rune(e))) {
                return true
            }
        }
        return false
    }

    public func none(predicate: (Rune) -> Bool): Bool {
        if (this.isEmpty()) {
            return true
        }
        for (e in this) {
            if (predicate(Rune(e))) {
                return false
            }
        }
        return true
    }

    public func count(predicate: (Rune) -> Bool): Int {
        if (this.isEmpty()) {
            return 0
        }
        var count = 0
        for (e in this) {
            if (predicate(Rune(e))) {
                count++
            }
        }
        return count
    }

    public func forEach(action: (Rune) -> Unit): Unit {
        for (e in this) {
            action(Rune(e))
        }
    }

    public func forEachIndexed(action: (Int, Rune) -> Unit): Unit {
        var index = 0
        for (e in this) {
            action(index, Rune(e))
            index++
        }
    }

    public func kIndexOf(str: String, startIndex!: Int): Int {
        let ret = this.indexOf(str, startIndex)
        return ret.getOrDefault { -1 }
    }

    public func kLastIndexOf(str: String, startIndex!: Int): Int {
        let ret = this.lastIndexOf(str, startIndex)
        return ret.getOrDefault { -1 }   
    }

    public func map<R>(transform: (Rune) -> R): ArrayList<R> {
        let ret = ArrayList<R>()
        for (e in this) {
            ret.append(transform(Rune(e)))
        }
        return ret
    }

    public func mapIndexed<R>(transform: (Int, Rune) -> R): ArrayList<R> {
        var index = 0
        let ret = ArrayList<R>()
        for (e in this) {
            ret.append(transform(index, Rune(e)))
            index++
        }
        return ret
    }
}

