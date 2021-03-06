# StackViewTest

This project is designed to illustrate issues I'm having utilitizing a `UIStackView` in a custom `UITableViewCell` when the `UIUserInterfaceSizeClass` changes.

The layout issues arise when transitioning between a horizontally compact and regular environment, best illustrated by rotating from portrait to landscape and back again while running split screen on an iPad Air 2 / iPad Pro.

The table is populated with a set of `RowObjects` acting as the data, where each object specifies certain boolean values indicating whether or not certain subviews in the cell should show or hide. 

The `TableViewCell` utilizes a horizontal `UIStackView`, and uses the `RowObject` to configure itself. Certain `arrangedSubviews` of the `UIStackView` are set hidden or shown based on the configuration.

Ideally, the `UIStackView` should handle the appropriate layout of hiding/showing views and resizing the `arrangedSubviews`, but when rotating back and forth, toggling the `horizontalSizeClass`, issues arise.

## Issues

- Sometimes, the appropriate subviews do not appear.
  - To illustrate which subviews should appear, each cell has a label indicating which of the optional subviews should be shown.
- Sometimes, the subviews are laid out in the wrong position
  - To illustrate, a red background view exists behind the stack view. If any red shows through, the `UIStackView` is failing to layout the subviews appropriately.

## Attempts to fix

I've tried a number of methods to resolve the issues, with no avail:
- Overriding `viewWillTransitionToSize:transitionCoordinator` to force layout and/or reload the table view
- Overriding `willTransitionToTraitCollection:withTransitionCoordinator` to force layout and/or reload the table view
- Overriding `layoutSubviews` to reset the hidden/shown `arrangedSubviews`
- Forcing layout in many places
- Changing subview layout constraint priorities to 999
- Limiting `UILabel`s to 1 line, and setting a `preferredMaxLayoutWidth`
- Adjusting the `contentCompressionResistance` and `contentHuggingPriority` of subviews
- Using a static value for `rowHeight` instead of `UITableViewAutomaticDimension`
- Etc.

Issues on cells are not even always resolved after the cell has been scrolled off screen and configured again, and sometimes this introduces new issues on different cells.

At this point, I'm unsure if `UIStackView` is buggy or if I'm misusing it. Any input would be greatly appreciated!

## Screenshots

The initial setup, no issues
![initial setup](/Screenshots/1 Intial setup - no issues.png?raw=true "The initial layout, all is fine")

After first rotation, cells with invalid layout marked with red "X"
![first rotation](/Screenshots/2 First rotation.png?raw=true "First rotation")

After second rotation
![second rotation](/Screenshots/3 Second rotation.png?raw=true "Second rotation")

After scrolling - cells are prepared for reuse and re-configured, fixing some issues, introducting others
![scrolling](/Screenshots/4 Second rotation - after scrolling.png?raw=true "Scrolling")

After third rotation
![third rotation](/Screenshots/5 Third rotation.png?raw=true "Third rotation")

