int getGridViewCountDesktop(double width) {
  if (width < 800) {
    return 1 + width ~/ 280;
  } else if (width < 800) {
    return 1 + width ~/ 260;
  } else {
    return 1 + width ~/ 240;
  }
}
