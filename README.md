<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Slot Machine Roller 
The easiest way to control slot machine. You just use `setState` to pass to `target` parameter to deterministic value to stop rolling. Otherwise pass `null` to `target` parameter to start rolling until no null. 
## Features
- Easy way to start/stop rolling.
- Customized build items in roller.
- Deterministic value to stop in anytime.
- The rolling animation involved damping. 
- Enable rolling delay at start time. 
- With up or down rolling direction.

## Getting started
```sh
flutter pub add slot_machine_roller
```

## Usage
You can see [example](page) for more details.

```dart
SlotMachineRoller(
    height: 170,
    width: 300,
    delay: Duration(seconds: 1)
    reverse: true,
    target: target,
    itemBuilder: (e) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.blue),
        child: Text(
            '$e',
            style: Theme.of(context)
                .primaryTextTheme
                .headlineLarge,
        ),
    )),
// To stop roller and suspend 4
setState(){
    target = 4;
}
// To start rolling until determination of target
setState(){
    target = null; 
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
