package extension

from std import convert.Parsable

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
    func lines(): Array<String>
    func toBool(): ?Bool
    func toInt(): ?Int
    func toFloat(): ?Float64
    func take(n: Int): String 
    func takeLast(n: Int): String
    func drop(n: Int): String
    func dropLast(n: Int): String 
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
            str += "${Char(this[i])}"
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
            str += "${Char(this[i])}"
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

    public func lines(): Array<String> {
        return this.split("\n", removeEmpty: true)
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
}