abstract class SideBarStates {
  const SideBarStates();
}

class SideBarInitialState extends SideBarStates {}

class ChangeCurrentIndex extends SideBarStates {}

class ChangeSideBarSizeState extends SideBarStates {
  const ChangeSideBarSizeState();
}
