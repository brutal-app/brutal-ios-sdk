import UIKit

class PushedViewController: UIViewController {

    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
