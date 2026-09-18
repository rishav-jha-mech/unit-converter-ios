# Unit Converter

After 4+ years building apps in React Native and Flutter, time to go native. This is app 1 of 10, starting simple and working up to something genuinely complex by the end.

## Goal

Get comfortable with the absolute basics of SwiftUI: `@State`, `Picker`, `TextField`, layout with VStack/HStack/Form, and NavigationStack. No persistence, no networking, just enough to get a feel for how SwiftUI's declarative style compares to JSX and Flutter's widget tree.

## What it does

Converts values between units across three categories: length, weight, and temperature.

## Screenshots

<p float="left">
  <img src="screenshots/converter.png" width="250" />
</p>

## What I learned

- SwiftUI's `@State` feels closer to Flutter's `setState` than React's hooks. It's more implicit, the view just redraws when the backing value changes, no explicit re-render call.
- `Picker` with `.pickerStyle(.segmented)` and `.onChange` covers a lot of ground that would otherwise need custom components in RN/Flutter.
- Enums as the backbone for units/categories (`CaseIterable`, `Identifiable`) map well to how I'd model something like this with TypeScript enums, but Swift's pattern matching in `switch` makes the conversion logic cleaner than an if/else chain would've been.

## What I'd do differently

<!-- fill in after building -->

## License

MIT, see [LICENSE](LICENSE).

---

Built by [Rishav Jha](https://rishavjha.com)
