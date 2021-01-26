import UIKit
import TwitterTextEditor

class ViewController: UIViewController {
    private let textEditorView = TextEditorView()

    override func viewDidLoad() {
        super.viewDidLoad()
 
        textEditorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textEditorView)
        NSLayoutConstraint.activate([
            textEditorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textEditorView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            textEditorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textEditorView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
        
        textEditorView.editingDelegate = self
        textEditorView.textInputObserver = self
        textEditorView.editingContentDelegate = self
        textEditorView.textAttributesDelegate = self
        
        textEditorView.placeholderText = "Placeholder"
    }
}

extension ViewController: TextEditorViewEditingDelegate {
    func textEditorViewShouldBeginEditing(_ textEditorView: TextEditorView) -> Bool {
        print("TextEditorViewEditingDelegate", #function)
        return true
    }
    
    func textEditorViewDidBeginEditing(_ textEditorView: TextEditorView) {
        print("TextEditorViewEditingDelegate", #function)
    }
    
    func textEditorViewDidEndEditing(_ textEditorView: TextEditorView) {
        print("TextEditorViewEditingDelegate", #function)
    }
}

extension ViewController: TextEditorViewTextInputObserver {
    func textEditorView(_ textEditorView: TextEditorView, didChangeInputPrimaryLanguage inputPrimaryLanguage: String?) {
        print("TextEditorViewTextInputObserver", #function, inputPrimaryLanguage ?? "nil")
    }
    
    func textEditorView(_ textEditorView: TextEditorView, didChangeBaseWritingDirection writingDirection: NSWritingDirection) {
        print("TextEditorViewTextInputObserver", #function, writingDirection)
    }
}

extension ViewController: TextEditorViewEditingContentDelegate {
    func textEditorView(_ textEditorView: TextEditorView, updateEditingContent editingContent: TextEditorViewEditingContent) -> TextEditorViewEditingContent? {
        print("TextEditorViewEditingContentDelegate", #function, editingContent)
        return editingContent
    }
}

extension ViewController: TextEditorViewTextAttributesDelegate {
    func textEditorView(_ textEditorView: TextEditorView, updateAttributedString attributedString: NSAttributedString, completion: @escaping (NSAttributedString?) -> Void) {
        print("TextEditorViewTextAttributesDelegate", #function, attributedString)
        completion(attributedString)
    }
}
