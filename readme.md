# Reusable Bottom Sheet View Controller

The Reusable Bottom Sheet View Controller is a reusable component that allows you to present a draggable bottom sheet with dynamic content height in your iOS app. It provides a customizable top view that can be dragged to dismiss, and a content view that can adjust its height based on its subviews.

## Features

- Draggable top view for dismissing the bottom sheet.
- Dynamic content height based on the subviews of the content view.
- Reusable and customizable for various use cases.
- Smooth and interactive presentation and dismissal animations.

## Requirements

- iOS 13.0+
- Swift 5.0+

## Installation

You can add the Reusable Bottom Sheet View Controller to your project by following these steps:

1. Download the source files for the Reusable Bottom Sheet View Controller.
2. Drag and drop the files (`BottomSheetViewController.swift`) into your Xcode project.
3. Make sure to select the option to **Copy items if needed** and add the files to your app's target.

## Usage

To use the Reusable Bottom Sheet View Controller in your app, follow these steps:

1. Create a new view controller subclass and make it inherit from `BottomSheetViewController`.
2. Customize the content of the bottom sheet by set the content when calling the `setContent(content:)` method. Add your desired views and layout constraints within this method.

Here's an example of how to use the Reusable Bottom Sheet View Controller:

```swift
import UIKit

class ExampleBottomSheetViewController: BottomSheetViewController {
    // create your labels and views here
    // add those into stack view
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        // Main content to be added in bottom sheet
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addArrangedSubview(headerImageView)
        contentStackView.addArrangedSubview(dismissButton)
        // Call bottom sheet function to set the intended content
        self.setContent(content: contentStackView)
    }
}
```

3. Present the bottom sheet view controller provided `presentBottomSheet(viewController:)` method. You may custom your own and using transition delegate.

```swift
let vc = ExampleBottomSheetViewController()
    presentBottomSheet(viewController: vc)
```

## Customization

You can customize the Reusable Bottom Sheet View Controller according to your app's specific requirements. Here are a few possible customizations:

- Modify the appearance and layout of the top view and content view in the main class called `BottomSheetViewController`.
- Customize the presentation and dismissal animations.
- Add additional subviews and functionality to the content view.

Feel free to modify the provided source code to suit your needs and add any desired customizations.

## License

This project is licensed under the MIT License.

## Credits

The Reusable Bottom Sheet View Controller is developed and maintained by xmhafiz.
