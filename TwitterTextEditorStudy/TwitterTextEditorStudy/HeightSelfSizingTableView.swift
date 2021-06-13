//
//  HeightSelfSizingTableView.swift
//  TwitterTextEditorStudy
//
//  Created by Tomoki Kobayashi on 2021/01/31.
//

import UIKit

class HeightSelfSizingTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        construct()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        construct()
    }

    override public var contentSize: CGSize {
        didSet { invalidateIntrinsicContentSize() }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

    private func construct() {
        isScrollEnabled = false
        setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

