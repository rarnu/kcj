package kcj.extension

public interface KAddable<T> {
    operator func +(other: T): T
}

public interface KSubtractable<T> {
    operator func -(other: T): T
}

public interface KMultipiable<T> {
    operator func *(other: T): T
}

public interface KDividable<T> {
    operator func /(other: T): T
}

public interface KModdable<T> {
    operator func %(other: T): T
}

public interface KNumber<T> <: KAddable<T> & KSubtractable<T> & KMultipiable<T> & KDividable<T> & Less<T> & LessOrEqual<T> & Greater<T> & GreaterOrEqual<T> & Equal<T> & NotEqual<T>  { }

public interface KWholeNumber<T> <: KNumber<T> & KModdable<T> { }

extend Int64 <: KWholeNumber<Int64> { 
    public operator func +(right: Int32): Int64 {
        return this + Int64(right)
    }
    public operator func +(right: Int16): Int64 {
        return this + Int64(right)
    }
    public operator func +(right: Int8): Int64 {
        return this + Int64(right)
    }
    public operator func -(right: Int32): Int64 {
        return this - Int64(right)
    }
    public operator func -(right: Int16): Int64 {
        return this - Int64(right)
    }
    public operator func -(right: Int8): Int64 {
        return this - Int64(right)
    }
    public operator func *(right: Int32): Int64 {
        return this * Int64(right)
    }
    public operator func *(right: Int16): Int64 {
        return this * Int64(right)
    }
    public operator func *(right: Int8): Int64 {
        return this * Int64(right)
    }
    public operator func /(right: Int32): Int64 {
        return this / Int64(right)
    }
    public operator func /(right: Int16): Int64 {
        return this / Int64(right)
    }
    public operator func /(right: Int8): Int64 {
        return this / Int64(right)
    }
    public operator func %(right: Int32): Int64 {
        return this % Int64(right)
    }
    public operator func %(right: Int16): Int64 {
        return this % Int64(right)
    }
    public operator func %(right: Int8): Int64 {
        return this % Int64(right)
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend Int32 <: KWholeNumber<Int32> { 
    public operator func +(right: Int64): Int64 {
        return Int64(this) + right
    }
    public operator func +(right: Int16): Int32 {
        return this + Int32(right)
    }
    public operator func +(right: Int8): Int32 {
        return this + Int32(right)
    }
    public operator func -(right: Int64): Int64 {
        return Int64(this) - right
    }
    public operator func -(right: Int16): Int32 {
        return this - Int32(right)
    }
    public operator func -(right: Int8): Int32 {
        return this - Int32(right)
    }
    public operator func *(right: Int64): Int64 {
        return Int64(this) * right
    }
    public operator func *(right: Int16): Int32 {
        return this * Int32(right)
    }
    public operator func *(right: Int8): Int32 {
        return this * Int32(right)
    }
    public operator func /(right: Int64): Int64 {
        return Int64(this) / right
    }
    public operator func /(right: Int16): Int32 {
        return this / Int32(right)
    }
    public operator func /(right: Int8): Int32 {
        return this / Int32(right)
    }
    public operator func %(right: Int64): Int64 {
        return Int64(this) % right
    }
    public operator func %(right: Int16): Int32 {
        return this % Int32(right)
    }
    public operator func %(right: Int8): Int32 {
        return this % Int32(right)
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend Int16 <: KWholeNumber<Int16> { 
    public operator func +(right: Int64): Int64 {
        return Int64(this) + right
    }
    public operator func +(right: Int32): Int32 {
        return Int32(this) + right
    }
    public operator func +(right: Int8): Int16 {
        return this + Int16(right)
    }
    public operator func -(right: Int64): Int64 {
        return Int64(this) - right
    }
    public operator func -(right: Int32): Int32 {
        return Int32(this) - right
    }
    public operator func -(right: Int8): Int16 {
        return this - Int16(right)
    }
    public operator func *(right: Int64): Int64 {
        return Int64(this) * right
    }
    public operator func *(right: Int32): Int32 {
        return Int32(this) * right
    }
    public operator func *(right: Int8): Int16 {
        return this * Int16(right)
    }
    public operator func /(right: Int64): Int64 {
        return Int64(this) / right
    }
    public operator func /(right: Int32): Int32 {
        return Int32(this) / right
    }
    public operator func /(right: Int8): Int16 {
        return this / Int16(right)
    }
    public operator func %(right: Int64): Int64 {
        return Int64(this) % right
    }
    public operator func %(right: Int32): Int32 {
        return Int32(this) % right
    }
    public operator func %(right: Int8): Int16 {
        return this % Int16(right)
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend Int8 <: KWholeNumber<Int8> { 
    public operator func +(right: Int64): Int64 {
        return Int64(this) + right
    }
    public operator func +(right: Int32): Int32 {
        return Int32(this) + right
    }
    public operator func +(right: Int16): Int16 {
        return Int16(this) + right
    }
    public operator func -(right: Int64): Int64 {
        return Int64(this) - right
    }
    public operator func -(right: Int32): Int32 {
        return Int32(this) - right
    }
    public operator func -(right: Int16): Int16 {
        return Int16(this) - right
    }
    public operator func *(right: Int64): Int64 {
        return Int64(this) * right
    }
    public operator func *(right: Int32): Int32 {
        return Int32(this) * right
    }
    public operator func *(right: Int16): Int16 {
        return Int16(this) * right
    }
    public operator func /(right: Int64): Int64 {
        return Int64(this) / right
    }
    public operator func /(right: Int32): Int32 {
        return Int32(this) / right
    }
    public operator func /(right: Int16): Int16 {
        return Int16(this) / right
    }
    public operator func %(right: Int64): Int64 {
        return Int64(this) % right
    }
    public operator func %(right: Int32): Int32 {
        return Int32(this) % right
    }
    public operator func %(right: Int16): Int16 {
        return Int16(this) % right
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend UInt64 <: KWholeNumber<UInt64> { 
    public operator func +(right: UInt32): UInt64 {
        return this + UInt64(right)
    }
    public operator func +(right: UInt16): UInt64 {
        return this + UInt64(right)
    }
    public operator func +(right: UInt8): UInt64 {
        return this + UInt64(right)
    }
    public operator func -(right: UInt32): UInt64 {
        return this - UInt64(right)
    }
    public operator func -(right: UInt16): UInt64 {
        return this - UInt64(right)
    }
    public operator func -(right: UInt8): UInt64 {
        return this - UInt64(right)
    }
    public operator func *(right: UInt32): UInt64 {
        return this * UInt64(right)
    }
    public operator func *(right: UInt16): UInt64 {
        return this * UInt64(right)
    }
    public operator func *(right: UInt8): UInt64 {
        return this * UInt64(right)
    }
    public operator func /(right: UInt32): UInt64 {
        return this / UInt64(right)
    }
    public operator func /(right: UInt16): UInt64 {
        return this / UInt64(right)
    }
    public operator func /(right: UInt8): UInt64 {
        return this / UInt64(right)
    }
    public operator func %(right: UInt32): UInt64 {
        return this % UInt64(right)
    }
    public operator func %(right: UInt16): UInt64 {
        return this % UInt64(right)
    }
    public operator func %(right: UInt8): UInt64 {
        return this % UInt64(right)
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend UInt32 <: KWholeNumber<UInt32> { 
    public operator func +(right: UInt64): UInt64 {
        return UInt64(this) + right
    }
    public operator func +(right: UInt16): UInt32 {
        return this + UInt32(right)
    }
    public operator func +(right: UInt8): UInt32 {
        return this + UInt32(right)
    }
    public operator func -(right: UInt64): UInt64 {
        return UInt64(this) - right
    }
    public operator func -(right: UInt16): UInt32 {
        return this - UInt32(right)
    }
    public operator func -(right: UInt8): UInt32 {
        return this - UInt32(right)
    }
    public operator func *(right: UInt64): UInt64 {
        return UInt64(this) * right
    }
    public operator func *(right: UInt16): UInt32 {
        return this * UInt32(right)
    }
    public operator func *(right: UInt8): UInt32 {
        return this * UInt32(right)
    }
    public operator func /(right: UInt64): UInt64 {
        return UInt64(this) / right
    }
    public operator func /(right: UInt16): UInt32 {
        return this / UInt32(right)
    }
    public operator func /(right: UInt8): UInt32 {
        return this / UInt32(right)
    }
    public operator func %(right: UInt64): UInt64 {
        return UInt64(this) % right
    }
    public operator func %(right: UInt16): UInt32 {
        return this % UInt32(right)
    }
    public operator func %(right: UInt8): UInt32 {
        return this % UInt32(right)
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend UInt16 <: KWholeNumber<UInt16> { 
    public operator func +(right: UInt64): UInt64 {
        return UInt64(this) + right
    }
    public operator func +(right: UInt32): UInt32 {
        return UInt32(this) + right
    }
    public operator func +(right: UInt8): UInt16 {
        return this + UInt16(right)
    }
    public operator func -(right: UInt64): UInt64 {
        return UInt64(this) - right
    }
    public operator func -(right: UInt32): UInt32 {
        return UInt32(this) - right
    }
    public operator func -(right: UInt8): UInt16 {
        return this - UInt16(right)
    }
    public operator func *(right: UInt64): UInt64 {
        return UInt64(this) * right
    }
    public operator func *(right: UInt32): UInt32 {
        return UInt32(this) * right
    }
    public operator func *(right: UInt8): UInt16 {
        return this * UInt16(right)
    }
    public operator func /(right: UInt64): UInt64 {
        return UInt64(this) / right
    }
    public operator func /(right: UInt32): UInt32 {
        return UInt32(this) / right
    }
    public operator func /(right: UInt8): UInt16 {
        return this / UInt16(right)
    }
    public operator func %(right: UInt64): UInt64 {
        return UInt64(this) % right
    }
    public operator func %(right: UInt32): UInt32 {
        return UInt32(this) % right
    }
    public operator func %(right: UInt8): UInt16 {
        return this % UInt16(right)
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend UInt8 <: KWholeNumber<UInt8> { 
    public operator func +(right: UInt64): UInt64 {
        return UInt64(this) + right
    }
    public operator func +(right: UInt32): UInt32 {
        return UInt32(this) + right
    }
    public operator func +(right: UInt16): UInt16 {
        return UInt16(this) + right
    }
    public operator func -(right: UInt64): UInt64 {
        return UInt64(this) - right
    }
    public operator func -(right: UInt32): UInt32 {
        return UInt32(this) - right
    }
    public operator func -(right: UInt16): UInt16 {
        return UInt16(this) - right
    }
    public operator func *(right: UInt64): UInt64 {
        return UInt64(this) * right
    }
    public operator func *(right: UInt32): UInt32 {
        return UInt32(this) * right
    }
    public operator func *(right: UInt16): UInt16 {
        return UInt16(this) * right
    }
    public operator func /(right: UInt64): UInt64 {
        return UInt64(this) / right
    }
    public operator func /(right: UInt32): UInt32 {
        return UInt32(this) / right
    }
    public operator func /(right: UInt16): UInt16 {
        return UInt16(this) / right
    }
    public operator func %(right: UInt64): UInt64 {
        return UInt64(this) % right
    }
    public operator func %(right: UInt32): UInt32 {
        return UInt32(this) % right
    }
    public operator func %(right: UInt16): UInt16 {
        return UInt16(this) % right
    }
    
    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return Float64(this) + Float64(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return Float64(this) - Float64(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return Float64(this) * Float64(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }

    public operator func /(right: Float32): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return Float64(this) / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend Float64 <: KNumber<Float64> { 
    public operator func +(right: Int64): Float64 {
        return this + Float64(right)
    }
    public operator func +(right: Int32): Float64 {
        return this + Float64(right)
    }
    public operator func +(right: Int16): Float64 {
        return this + Float64(right)
    }
    public operator func +(right: Int8): Float64 {
        return this + Float64(right)
    }
    public operator func -(right: Int64): Float64 {
        return this - Float64(right)
    }
    public operator func -(right: Int32): Float64 {
        return this - Float64(right)
    }
    public operator func -(right: Int16): Float64 {
        return this - Float64(right)
    }
    public operator func -(right: Int8): Float64 {
        return this - Float64(right)
    }
    public operator func *(right: Int64): Float64 {
        return this * Float64(right)
    }
    public operator func *(right: Int32): Float64 {
        return this * Float64(right)
    }
    public operator func *(right: Int16): Float64 {
        return this * Float64(right)
    }
    public operator func *(right: Int8): Float64 {
        return this * Float64(right)
    }
    public operator func /(right: Int64): Float64 {
        return this / Float64(right)
    }
    public operator func /(right: Int32): Float64 {
        return this / Float64(right)
    }
    public operator func /(right: Int16): Float64 {
        return this / Float64(right)
    }
    public operator func /(right: Int8): Float64 {
        return this / Float64(right)
    }

    public operator func +(right: Float32): Float64 {
        return this + Float64(right)
    }

    public operator func +(right: Float16): Float64 {
        return this + Float64(right)
    }

    public operator func -(right: Float32): Float64 {
        return this - Float64(right)
    }
    public operator func -(right: Float16): Float64 {
        return this - Float64(right)
    }

    public operator func *(right: Float32): Float64 {
        return this * Float64(right)
    }

    public operator func *(right: Float16): Float64 {
        return this * Float64(right)
    }

    public operator func /(right: Float32): Float64 {
        return this / Float64(right)
    }
    public operator func /(right: Float16): Float64 {
        return this / Float64(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}

extend Float32 <: KNumber<Float32> {

    public operator func +(right: Int64): Float64 {
        return Float64(this) + Float64(right)
    }
    public operator func +(right: Int32): Float32 {
        return this + Float32(right)
    }
    public operator func +(right: Int16): Float32 {
        return this + Float32(right)
    }
    public operator func +(right: Int8): Float32 {
        return this + Float32(right)
    }
    public operator func -(right: Int64): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Int32): Float32 {
        return this - Float32(right)
    }
    public operator func -(right: Int16): Float32 {
        return this - Float32(right)
    }
    public operator func -(right: Int8): Float32 {
        return this - Float32(right)
    }
    public operator func *(right: Int64): Float64 {
        return Float64(this) * Float64(right)
    }
    public operator func *(right: Int32): Float32 {
        return this * Float32(right)
    }
    public operator func *(right: Int16): Float32 {
        return this * Float32(right)
    }
    public operator func *(right: Int8): Float32 {
        return this * Float32(right)
    }
    public operator func /(right: Int64): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Int32): Float32 {
        return this / Float32(right)
    }
    public operator func /(right: Int16): Float32 {
        return this / Float32(right)
    }
    public operator func /(right: Int8): Float32 {
        return this / Float32(right)
    }

    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float16): Float32 {
        return this + Float32(right)
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float16): Float32 {
        return this - Float32(right)
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float16): Float32 {
        return this * Float32(right)
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }
    public operator func /(right: Float16): Float32 {
        return this / Float32(right)
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }

 }

extend Float16 <: KNumber<Float16> { 
    public operator func +(right: Int64): Float64 {
        return Float64(this) + Float64(right)
    }
    public operator func +(right: Int32): Float32 {
        return Float32(this) + Float32(right)
    }
    public operator func +(right: Int16): Float16 {
        return this + Float16(right)
    }
    public operator func +(right: Int8): Float16 {
        return this + Float16(right)
    }
    public operator func -(right: Int64): Float64 {
        return Float64(this) - Float64(right)
    }
    public operator func -(right: Int32): Float32 {
        return Float32(this) - Float32(right)
    }
    public operator func -(right: Int16): Float16{
        return this - Float16(right)
    }
    public operator func -(right: Int8): Float16 {
        return this - Float16(right)
    }
    public operator func *(right: Int64): Float64 {
        return Float64(this) * Float64(right)
    }
    public operator func *(right: Int32): Float32 {
        return Float32(this) * Float32(right)
    }
    public operator func *(right: Int16): Float16 {
        return this * Float16(right)
    }
    public operator func *(right: Int8): Float16 {
        return this * Float16(right)
    }
    public operator func /(right: Int64): Float64 {
        return Float64(this) / Float64(right)
    }
    public operator func /(right: Int32): Float32 {
        return Float32(this) / Float32(right)
    }
    public operator func /(right: Int16): Float16 {
        return this / Float16(right)
    }
    public operator func /(right: Int8): Float16 {
        return this / Float16(right)
    }

    public operator func +(right: Float64): Float64 {
        return Float64(this) + right
    }

    public operator func +(right: Float32): Float32 {
        return Float32(this) + right
    }

    public operator func -(right: Float64): Float64 {
        return Float64(this) - right
    }
    public operator func -(right: Float32): Float32 {
        return Float32(this) - right
    }

    public operator func *(right: Float64): Float64 {
        return Float64(this) * right
    }

    public operator func *(right: Float32): Float32 {
        return Float32(this) * right
    }

    public operator func /(right: Float64): Float64 {
        return Float64(this) / right
    }
    public operator func /(right: Float32): Float32 {
        return Float32(this) / right
    }

    public operator func +(right: String): String {
        return "${this}${right}"
    }
}