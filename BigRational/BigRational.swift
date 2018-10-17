import BigInt

// Represents an arbitrary-precision number
public struct BigRational {
    private let numerator: BigInt
    private let denominator: BigInt

    /// Constructor using `BigInt`
    public init(_ value: BigInt) {
        numerator = value
        denominator = .one
    }

    /// Constructor using `Int`
    public init(_ value: Int) {
        self.init(BigInt(value))
    }

    /// Constructor using `NSDecimalNumber`
    public init?(
        _ value: NSDecimalNumber,
        decimalSeparator: String
    ) {
        self.init(value.stringValue, decimalSeparator: decimalSeparator)
    }

    /// Constructor for creating a `BigRational` based on a string. The string can be a decimal or a whole number.
    ///
    /// - Parameters:
    ///     - value:            Number represented as a string
    ///     - decimalSeparator: Decimal separator used to parse the decimal number
    public init?(
        _ value: String,
        decimalSeparator: String
    ) {
        if let index = value.index(of: Character(decimalSeparator)) {
            /// Value is a decimal number
            let numeratorString = value.replacingOccurrences(of: decimalSeparator, with: "")
            let decimalPoints = value.count - index.encodedOffset - 1

            guard let numerator = BigInt(numeratorString) else { return nil }

            denominator = BigInt.ten.power(decimalPoints)
            self.numerator = numerator
        } else if let numerator = BigInt(value) {
            // Value is an integer
            self.numerator = numerator
            denominator = .one
        } else {
            // Value is not a valid integer
            return nil
        }
    }

    /// Constructor using numerator and denominator
    public init(numerator: BigInt, denominator: BigInt) {
        self.numerator = numerator
        self.denominator = denominator
    }

    // Equality check using the following formula: a/b = c/d, iff ad = bc
    ///
    /// - Parameters:
    ///     - lhs: Left hand side value
    ///     - rhs: Right hand side value
    ///
    /// - Returns: A boolean indicating if the two BigRationals are equal
    public static func == (lhs: BigRational, rhs: BigRational) -> Bool {
        return lhs.numerator * rhs.denominator == lhs.denominator * rhs.numerator
    }

    // Multiplication using the following formula: a/b * c/d  == (ac)/(bd)
    ///
    /// - Parameters:
    ///     - lhs: Left hand side value
    ///     - rhs: Right hand side value
    ///
    /// - Returns: Result of the multiplication operation
    public static func * (lhs: BigRational, rhs: BigRational) -> BigRational {
        let numerator = lhs.numerator * rhs.numerator
        let denominator = lhs.denominator * rhs.denominator

        return BigRational(numerator: numerator, denominator: denominator)
    }

    // Addition using the following formula: a/b + c/d  == (ad + bc)/bd
    ///
    /// - Parameters:
    ///     - lhs: Left hand side value
    ///     - rhs: Right hand side value
    ///
    /// - Returns: Result of the addition operation
    public static func + (lhs: BigRational, rhs: BigRational) -> BigRational {
        let numerator = lhs.numerator * rhs.denominator + lhs.denominator * rhs.numerator
        let denominator = lhs.denominator * rhs.denominator

        return BigRational(numerator: numerator, denominator: denominator)
    }

    // Subtraction using the following formula: a/b - c/d  == (ad - bc)/bd
    ///
    /// - Parameters:
    ///     - lhs: Left hand side value
    ///     - rhs: Right hand side value
    ///
    /// - Returns: Result of the subtraction operation
    public static func - (lhs: BigRational, rhs: BigRational) -> BigRational {
        let numerator = lhs.numerator * rhs.denominator - lhs.denominator * rhs.numerator
        let denominator = lhs.denominator * rhs.denominator

        return BigRational(numerator: numerator, denominator: denominator)
    }

    // Division using the following formula: a/b / c/d  == (ad)/(bc)
    ///
    /// - Parameters:
    ///     - lhs: Left hand side value
    ///     - rhs: Right hand side value
    ///
    /// - Returns: Result of the division operation
    public static func / (lhs: BigRational, rhs: BigRational) -> BigRational {
        let numerator = lhs.numerator * rhs.denominator
        let denominator = lhs.denominator * rhs.numerator

        return BigRational(numerator: numerator, denominator: denominator)
    }

    // Mod using the following formula: a/b % c/d  == (ad % bc)/bd
    ///
    /// - Parameters:
    ///     - lhs: Left hand side value
    ///     - rhs: Right hand side value
    ///
    /// - Returns: Result of the mod operation
    public static func % (lhs: BigRational, rhs: BigRational) -> BigRational {
        let numerator = (lhs.numerator * rhs.denominator) % (lhs.denominator * rhs.numerator)
        let denominator = lhs.denominator * rhs.denominator

        return BigRational(numerator: numerator, denominator: denominator)
    }

    /// Converts the current `BigRational` to a decimal number using provided precision. i.e. 1/2 => 0.5
    ///
    /// - Parameters:
    ///     - precision:        Some divisons are infinite like PI. This prevents the infinite loop
    ///     - decimalSeparator: Decimal separator used in the decimal string
    ///
    /// - Returns: A decimal string that represents the BigRational
    public func asDecimalString(
        precision: Int,
        decimalSeparator: String
    ) -> String {
        let isNegative = numerator.isNegative != denominator.isNegative
        var (quotient, remainder) = numerator.absoluteValue
            .quotientAndRemainder(dividingBy: denominator.absoluteValue)

        var result = String(quotient)

        // If it's a whole number, return the result
        if remainder == .zero {
            return isNegative ? "-\(result)" : result
        }

        // It's a decimal. Lets calculate up to supplied precision
        result += decimalSeparator
        var currentPrecision = 0

        repeat {
            (quotient, remainder) = (remainder * .ten).quotientAndRemainder(dividingBy: denominator)
            result += String(quotient)
            currentPrecision += 1
        } while remainder != .zero && currentPrecision <= precision

        return isNegative ? "-\(result)" : result
    }
}