import BigInt

public extension BigInt {
    public static let one = BigInt(1)
    public static let zero = BigInt(0)
    public static let ten = BigInt(10)
    public static let negativeOne = BigInt(-1)

    /// Determine whether a value is negative
    public var isNegative: Bool {
        return self < .zero
    }

    /// Get the absolute value
    public var absoluteValue: BigInt {
        return isNegative ? .negativeOne * self : self
    }
}
