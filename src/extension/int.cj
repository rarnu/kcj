package extension

public interface KtInt {
    func coerceAtMost(maximumValue: Int): Int
    func coerceAtLeast(minimumValue: Int): Int
    func coerceIn(minimumValue: Int, maximumValue: Int): Int
    func coerceIn(r: Range<Int>): Int
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
}