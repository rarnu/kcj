package extension

from std import convert.Parsable

public interface KtInt {
    func coerceAtMost(maximumValue: Int): Int
    func coerceAtLeast(minimumValue: Int): Int
    func coerceIn(minimumValue: Int, maximumValue: Int): Int
    func coerceIn(r: Range<Int>): Int

    func toFloat(): Float64
    func toBool(): Bool
    func toDateTimeMs(): DateTime
    func toDateTime(): DateTime
    func toChar(): Char
}

public interface KtFloat {
    func toInt(): Int
    func coerceAtMost(maximumValue: Float64): Float64
    func coerceAtLeast(minimumValue: Float64): Float64
    func coerceIn(minimumValue: Float64, maximumValue: Float64): Float64
}

public interface KtBool {
    func toInt(): Int
}

public interface KtChar {
    prop code: Int
    func coerceAtMost(maximumValue: Char): Char
    func coerceAtLeast(minimumValue: Char): Char
    func upper(): Char
    func lower(): Char
    func isWhitespace(): Bool
}

extend Int <: KtInt {

    public func coerceAtMost(maximumValue: Int): Int {
        return if (this > maximumValue) { maximumValue } else { this }
    }

    public func coerceAtLeast(minimumValue: Int): Int {
        return if (this < minimumValue) { minimumValue } else { this }
    }

    public func coerceIn(minimumValue: Int, maximumValue: Int): Int {
        if (minimumValue > maximumValue) {
            throw IllegalArgumentException("Cannot coerce value to an empty range: maximum ${maximumValue} is less than minimum ${minimumValue}.")
        }
        if (this < minimumValue) {
            return minimumValue
        }
        if (this > maximumValue) {
            return maximumValue
        }
        return this
    }

    public func coerceIn(r: Range<Int>): Int {
        if (r.isEmpty()) {
            throw IllegalArgumentException("Cannot coerce value to an empty range.")
        }
        return match {
            case this < r.start => r.start
            case this > r.end => r.end
            case _ => this
        }
    }

    public func toFloat(): Float64 {
        return Float64(this)
    }

    public func toBool(): Bool {
        return if (this == 0) { false } else { true }
    }

    public func toDateTimeMs(): DateTime {
        return DateTime.fromUnixTimeStamp(this * Duration.millisecond).inTimeZone(TimeZone.Local)
    }

    public func toDateTime(): DateTime {
        return DateTime.fromUnixTimeStamp(this * Duration.second).inTimeZone(TimeZone.Local)
    }

    public func toChar(): Char {
        return Char(this)
    }

}

extend Float64 <: KtFloat {

    public func toInt(): Int {
        return Int64(this)
    }

    public func coerceAtMost(maximumValue: Float64): Float64 {
        return if (this > maximumValue) { maximumValue } else { this }
    }

    public func coerceAtLeast(minimumValue: Float64): Float64 {
        return if (this < minimumValue) { minimumValue } else { this }
    }

    public func coerceIn(minimumValue: Float64, maximumValue: Float64): Float64 {
        if (minimumValue > maximumValue) {
            throw IllegalArgumentException("Cannot coerce value to an empty range: maximum ${maximumValue} is less than minimum ${minimumValue}.")
        }
        if (this < minimumValue) {
            return minimumValue
        }
        if (this > maximumValue) {
            return maximumValue
        }
        return this
    }
}

extend Bool <: KtBool {
    public func toInt(): Int {
        return if (this) { 1 } else { 0 }
    }
}

extend Char <: KtChar {

    public prop code: Int {
        get() {
            return Int64(this.toString()[0])
        }
    }

    public func coerceAtMost(maximumValue: Char): Char {
        return if (this > maximumValue) { maximumValue } else { this }
    }

    public func coerceAtLeast(minimumValue: Char): Char {
        return if (this < minimumValue) { minimumValue } else { this }
    }

    public func upper(): Char {
        return Char(this.toString().toAsciiUpper()[0])
    }

    public func lower(): Char {
        return Char(this.toString().toAsciiLower()[0])
    }

    public func isWhitespace(): Bool {
        return (this == ' ' || this == '\n' || this == '\t' || this == '\r' || this == '\b' || this == '\f')
    }
}