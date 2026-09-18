import SwiftUI

struct ContentView: View {
    @State private var category: UnitCategory = .length
    @State private var fromUnit: ConversionUnit = .meters
    @State private var toUnit: ConversionUnit = .feet
    @State private var inputValue: String = "1"

    private var result: Double? {
        guard let value = Double(inputValue) else { return nil }
        return fromUnit.convert(value, to: toUnit)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Category") {
                    Picker("Category", selection: $category) {
                        ForEach(UnitCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: category) { _, newCategory in
                        fromUnit = newCategory.units[0]
                        toUnit = newCategory.units[1]
                    }
                }

                Section("Convert") {
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)

                    Picker("From", selection: $fromUnit) {
                        ForEach(category.units) { unit in
                            Text(unit.rawValue).tag(unit)
                        }
                    }

                    Picker("To", selection: $toUnit) {
                        ForEach(category.units) { unit in
                            Text(unit.rawValue).tag(unit)
                        }
                    }
                }

                Section("Result") {
                    if let result {
                        Text(formatted(result))
                            .font(.title2)
                            .fontWeight(.semibold)
                    } else {
                        Text("Enter a valid number")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Unit Converter")
        }
    }

    private func formatted(_ value: Double) -> String {
        String(format: "%.4g %@", value, toUnit.rawValue)
    }
}

#Preview {
    ContentView()
}
