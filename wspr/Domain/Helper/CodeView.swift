//
//  CodeView.swift
//  wspr
//
//  Created by Pinto Junior, William James on 25/01/22.
//

import Foundation

protocol CodeView {
    func setupView()
    func buildHierarchy()
    func buildConstraints()
}

extension CodeView {
    func setupView() {
        buildHierarchy()
        buildConstraints()
    }
}
