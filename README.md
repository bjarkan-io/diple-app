# diple

A new Flutter project.

## Getting Started

**Important**: There are two flavors of the app.

- Development: `flutter run --flavor dev`
- Production: `flutter run --flavor prod`

These are made available as run configurations in VSCode ("Development" & "Production").

## Tests

All blocs should be tested to a certain extent. All widgets considered to be a 'screen' has to incldue widget-tests as well. Tests are run with `flutter test`

Note: states and events should extend the `Equatable` package to be compared by value and not by reference. Otherwise, the `expect` iterable will fail the comparisons.

### Example

Use mockito to create a mock repository

```dart
class MockExampleRepository extends Mock implements ExampleRepository {}
```

If loading mock data from external files, create a function (synchronous or asynchronous). `flutter test` runs tests from within the `test/` directory, so to get the correct working directory, run `flutter test test`.

```dart
Example fetchExample () => Example.fromJson(jsonDecode(File('mock/example.json').readAsStringSync()));
```

Now that these have been set up, we can create our main test group with some basic tests

```dart
void main() {
  group('ExampleBloc', () {
    ExampleRepository mockRepository;
    ExampleBloc bloc;

    // Set up the bloc with the repository
    setUp(() {
      mockRepository = MockExampleRepository();
      bloc = ExampleBloc(repository: mockRepository);
    });

    // Test that our assertion is working
    test('throws AssertionError if ExampleRepository is null', () {
      () => ExampleBloc(repository: null),
      throwsA(isAssertionError),
    });

    // Test that our initial state is correct
    blocTest(
      'initial state is [InitialExampleState]',
      build: () => bloc,
      expect: <ExampleState>[
        InitialExampleState(),
      ],
    );
    // Further groups..
    // group('AnotherOne', () {...});
  });
}
```

After we've created our base group, we can create separate groups for each event we'd like to test

```dart
group('LoadExample', () {
  // The data we will fetch and expect to be fetched
  Example mockExample = fetchExample();
  // Set up our mock response for our repository method
  build: () {
    when(mockRepository.fetchExample()).thenAnswer(
    (_) => Future.value(
      mockExample,
    ));
  },
  // The event we want to dispatch
  act: (bloc) => bloc.add(LoadExample()),
  // The expected sequence of states
  expect: [
    InitialExampleState(),
    ExampleLoading(),
    ExampleLoaded(
      data: mockExample,
    ),
  ],
});
```

And that's it. Create a new groups within the main group to test more events.

## Localization & translations

1. Install VSCode extension `ext install vscode-flutter-i18n-json`

- Localizations are generated from a set of resource files `i18n/<locale>.json`. The generated file resides in `lib/core/i18n/i18n.dart`. To update the generated file after translation changes, run the `Flutter I18n Json: Update` command.

- Placeholders are automatically detected and are enclosed in curly brackets (`{}`):

```json
{
  "greetTo": "Hello {name}"
}
```

- When using translated text, simply call your translation like this:

```dart
I18n.of(context).hello
```

- Nesting is supported which allows you to hiearchically structure the translations

```json
{
  "hello": "Hello!",
  "greeting": {
    "formal": "Hello",
    "informal": "Hi",
    "placeholder": {
      "formal": "Hello {name}",
      "informal": "Hi {name}"
    }
  }
}
```

The above content will generate the following Dart code

```dart
/// "hello!"
String get hello => "hello!";
/// "Hello"
String get greetingFormal => "Hello";
/// "Hi"
String get greetingInformal => "Hi";
/// "Hello ${name}"
String greetingPlaceholderFormal(String name) => "Hello ${name}";
/// "Hi ${name}"
String greetingPlaceholderInformal(String name) => "Hi ${name}";
```
