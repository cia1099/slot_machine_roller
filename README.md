# Slot Machine Roller 
The easiest way to control slot machine.\
You just use `setState` to pass to `target` parameter to deterministic value to stop rolling.\
Otherwise pass `null` to `target` parameter to start rolling until no null.

Here is the [demo](https://cia1099.github.io/slot_machine_roller/) page.
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
You can see [example](https://github.com/cia1099/slot_machine_roller/blob/main/example/lib/main.dart) for more details.

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
// To start rolling until deterministic target
setState(){
    target = null; 
}
```
__Please Note the height of item should as equal as the height of SlotMachineRoller. Because we expect the view only one item in roller.__ 

## Additional information

The assets images are referred from\
https://github.com/josex2r/jQuery-SlotMachine.
