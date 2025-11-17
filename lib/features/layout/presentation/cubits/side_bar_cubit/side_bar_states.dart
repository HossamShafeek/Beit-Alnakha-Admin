abstract class SideBarStates {
  const SideBarStates();
}

class SideBarInitialState extends SideBarStates {}

class ChangeCurrentIndex extends SideBarStates {}

class SideBarChangeVisibilityState extends SideBarStates {
  final bool isVisible;
  const SideBarChangeVisibilityState(this.isVisible);
}
