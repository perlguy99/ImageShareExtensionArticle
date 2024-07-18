//
//  TestableView.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/18/24.
//

import SwiftUI

protocol ViewInspectorHook {
    var viewInspectorHook: ((Self) -> Void)? { get set }
}

typealias TestableView = View & ViewInspectorHook
