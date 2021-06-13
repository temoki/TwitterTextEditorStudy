import UIKit
import KeyboardGuide
import TwitterTextEditor

class EditorViewController: UIViewController {
    private let textEditorView = TextEditorView()
    private let emojiListViewController = EmojiListViewController()
    private static let regularFont = UIFont.systemFont(ofSize: 15)
    private static let boldFont = UIFont.boldSystemFont(ofSize: 15)

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().backgroundColor = .white

        textEditorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textEditorView)
        NSLayoutConstraint.activate([
            textEditorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textEditorView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            textEditorView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            textEditorView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        textEditorView.editingDelegate = self
        textEditorView.textInputObserver = self
        textEditorView.editingContentDelegate = self
        textEditorView.textAttributesDelegate = self
        textEditorView.changeObserver = self
        //textEditorView.pasteObservers.append(self)
        
        textEditorView.font = Self.regularFont
        textEditorView.keyboardType = .default
        textEditorView.placeholderText = "メッセージを入力"
        textEditorView.textContentInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        addChild(emojiListViewController)
        view.addSubview(emojiListViewController.view)
        emojiListViewController.view.isHidden = true
        emojiListViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiListViewController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            emojiListViewController.view.bottomAnchor.constraint(equalTo: view.keyboardSafeArea.layoutGuide.bottomAnchor),
            emojiListViewController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            emojiListViewController.view.heightAnchor.constraint(lessThanOrEqualToConstant: 176)
        ])
        emojiListViewController.didMove(toParent: self)
        emojiListViewController.view.isHidden = true
    }
}

extension EditorViewController: TextEditorViewEditingDelegate {
    func textEditorViewShouldBeginEditing(_ textEditorView: TextEditorView) -> Bool {
        print("🍓", "TextEditorViewEditingDelegate", #function)
        return true
    }
    
    func textEditorViewDidBeginEditing(_ textEditorView: TextEditorView) {
        print("🍓", "TextEditorViewEditingDelegate", #function)
    }
    
    func textEditorViewDidEndEditing(_ textEditorView: TextEditorView) {
        print("🍓", "TextEditorViewEditingDelegate", #function)
    }
}

extension EditorViewController: TextEditorViewTextInputObserver {
    func textEditorView(_ textEditorView: TextEditorView, didChangeInputPrimaryLanguage inputPrimaryLanguage: String?) {
        print("🍏", "TextEditorViewTextInputObserver", #function, inputPrimaryLanguage ?? "nil")
    }
    
    func textEditorView(_ textEditorView: TextEditorView, didChangeBaseWritingDirection writingDirection: NSWritingDirection) {
        print("🍏", "TextEditorViewTextInputObserver", #function, writingDirection)
    }
}

struct EditingContent: TextEditorViewEditingContent {
    var text: String
    var selectedRange: NSRange
}

extension EditorViewController: TextEditorViewEditingContentDelegate {
    func textEditorView(_ textEditorView: TextEditorView, updateEditingContent editingContent: TextEditorViewEditingContent) -> TextEditorViewEditingContent? {
        print("🍉", "TextEditorViewEditingContentDelegate", #function, editingContent)
        return nil
    }
}

extension EditorViewController: TextEditorViewTextAttributesDelegate {
    func textEditorView(_ textEditorView: TextEditorView, updateAttributedString attributedString: NSAttributedString, completion: @escaping (NSAttributedString?) -> Void) {
        print("🍊", "TextEditorViewTextAttributesDelegate", #function, attributedString)

        // バックグラウンドでテキストを解析して属性を更新する
        DispatchQueue.global().async {
            let regex = try! NSRegularExpression(pattern: "(\\*+)(\\s*\\b)([^\\*]*)(\\b\\s*)(\\*+)", options: [])
            let stringRange = NSRange(location: 0, length: attributedString.length)
            let matches = regex.matches(in: attributedString.string, options: [], range: stringRange)
            
            let newAttributedString = NSMutableAttributedString(attributedString: attributedString)
            newAttributedString.removeAttribute(.font, range: stringRange)
            newAttributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: stringRange)
            for match in matches {
                newAttributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: match.range)
            }

            // メインスレッドで更新結果を返す
            DispatchQueue.main.async {
                completion(newAttributedString)
            }
        }
    }
}

extension EditorViewController: TextEditorViewChangeObserver {
    func textEditorView(_ textEditorView: TextEditorView, didChangeWithChangeResult changeResult: TextEditorViewChangeResult) {
        print("🍇", "TextEditorViewChangeObserver", #function, changeResult)
    }
}
