import Foundation

enum UnitCategory: String, CaseIterable, Identifiable {
    case length = "Length"
    case weight = "Weight"
    case temperature = "Temperature"

    var id: String { rawValue }

    var units: [ConversionUnit] {
        switch self {
        case .length:
            return [.meters, .feet, .kilometers, .miles]
        case .weight:
            return [.kilograms, .pounds, .grams, .ounces]
        case .temperature:
            return [.celsius, .fahrenheit]
        }
    }
}

enum ConversionUnit: String, CaseIterable, Identifiable {
    case meters = "Meters"
    case feet = "Feet"
    case kilometers = "Kilometers"
    case miles = "Miles"
    case kilograms = "Kilograms"
    case pounds = "Pounds"
    case grams = "Grams"
    case ounces = "Ounces"
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"

    var id: String { rawValue }

    /// Converts a value from this unit to a target unit within the same category.
    func convert(_ value: Double, to target: ConversionUnit) -> Double {
        guard self != target else { return value }

        if self == .celsius || self == .fahrenheit {
            return convertTemperature(value, to: target)
        }

        let base = value * baseUnitsPerUnit
        return base / target.baseUnitsPerUnit
    }

    /// How many "base units" (meters or kilograms) one unit of this case equals.
    /// Lets any two units in the same category convert via a shared base instead
    /// of needing a conversion factor for every possible pair.
    private var baseUnitsPerUnit: Double {
        switch self {
        case .meters: return 1
        case .feet: return 0.3048
        case .kilometers: return 1000
        case .miles: return 1609.344
        case .kilograms: return 1
        case .pounds: return 0.45359237
        case .grams: return 0.001
        case .ounces: return 0.028349523125
        case .celsius, .fahrenheit: return 0
        }
    }

    private func convertTemperature(_ value: Double, to target: ConversionUnit) -> Double {
        switch (self, target) {
        case (.celsius, .fahrenheit):
            return value * 9 / 5 + 32
        case (.fahrenheit, .celsius):
            return (value - 32) * 5 / 9
        default:
            return value
        }
    }
}
