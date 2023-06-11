//
//  PageConfig.swift
//  BottomSheetViewControllerExample
//
//  Created by Mohd Hafiz on 07/06/2023.
//

import UIKit

struct PageSettings {
    var longText = false
    var hasImage = false
}

struct MockData {
    static let pageTitle = "Your title here"
    static let pageSubtitle = "Lorem ipsum dolor sit amet"
    static let shortText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    static let longText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit"
    static let headerImage = UIImage(named: "sampleImage")
}
