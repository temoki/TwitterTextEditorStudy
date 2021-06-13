//
//  EmojiListViewController.swift
//  TwitterTextEditorStudy
//
//  Created by Tomoki Kobayashi on 2021/01/31.
//

import UIKit

class EmojiListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var emojiList: [Emoji] = [] {
        didSet { tableView.reloadData() }
    }
    
    var emojiDidSelect: ((Emoji) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "emoji-cell")
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
        
        view.layer.borderWidth = 1 / UIScreen.main.scale
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private let tableView = HeightSelfSizingTableView(frame: .zero, style: .plain)
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emoji-cell", for: indexPath)
        let emoji = emojiList[indexPath.item]
        cell.textLabel?.text = "\(emoji.character) :\(emoji.shortCode):"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        emojiDidSelect?(emojiList[indexPath.item])
    }
}
