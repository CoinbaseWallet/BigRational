import BigInt

extension BigInt {
    static let one = BigInt(1)
    static let zero = BigInt(0)
    static let ten = BigInt(10)
    static let negativeOne = BigInt(-1)

    /// Determine whether a value is negative
    var isNegative: Bool {
        return self < .zero
    }

    /// Get the absolute value
    var absoluteValue: BigInt {
        return isNegative ? .negativeOne * self : self
    }
}
