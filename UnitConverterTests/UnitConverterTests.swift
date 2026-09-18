import Testing
@testable import UnitConverter

struct UnitConverterTests {
    @Test func metersToFeet() {
        let result = ConversionUnit.meters.convert(1, to: .feet)
        #expect(abs(result - 3.28084) < 0.001)
    }

    @Test func celsiusToFahrenheit() {
        let result = ConversionUnit.celsius.convert(0, to: .fahrenheit)
        #expect(result == 32)
    }

    @Test func sameUnitReturnsInputUnchanged() {
        let result = ConversionUnit.kilograms.convert(42, to: .kilograms)
        #expect(result == 42)
    }
}
