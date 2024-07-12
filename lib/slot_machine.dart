part of slot_machine_roller;

class SlotMachine extends StatelessWidget {
  const SlotMachine({
    super.key,
    required this.targets,
  });

  final List<int?> targets;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = (constraints.maxWidth).clamp(.0, 533.0);
        final screenSize = Size(width / 1.5, width / 3.6);
        return Stack(
          children: [
            Image.asset(
              "assets/machine.png",
              width: width,
              package: 'slot_machine',
            ),
            Transform.translate(
              offset: Offset(screenSize.width / 6.4, screenSize.height * 0.94),
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                // color: Colors.amber.withOpacity(0.5),
                child: Row(
                  children: List.generate(
                      3,
                      (index) => Container(
                            decoration: index < 2
                                ? const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(color: Colors.grey)))
                                : null,
                            child: SlotMachineRoller(
                              height: screenSize.height,
                              width: screenSize.width / 3 - 1,
                              itemBuilder: (number) => Image.asset(
                                'assets/slot$number.png',
                                height: screenSize.height,
                                width: screenSize.width / 3 - 1,
                                package: 'slot_machine',
                              ),
                              target: targets[index],
                              delay: Duration(milliseconds: 250 * (2 - index)),
                              reverse: index & 1 > 0,
                            ),
                          )),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
