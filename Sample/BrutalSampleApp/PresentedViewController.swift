import UIKit

class PresentedViewController: UIViewController {

    @IBAction func dismissViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
