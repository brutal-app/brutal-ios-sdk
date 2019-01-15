import UIKit

class FloatingButtonController: UIViewController {

    private (set) var button: UIButton!

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        window.windowLevel = UIWindow.Level(rawValue: CGFloat.greatestFiniteMagnitude)
        window.isHidden = false
        window.rootViewController = self
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillShow),
                                       name: UIResponder.keyboardWillShowNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillHide),
                                       name: UIResponder.keyboardWillHideNotification,
                                       object: nil)
    }

    private let window = FloatingButtonWindow()

    override func loadView() {
        let view = UIView()
        let button = UIButton(type: .custom)
        button.setTitle("Record", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize.zero
        button.sizeToFit()
        button.frame = CGRect(origin: CGPoint(x: 10, y: 10), size: button.bounds.size)
        button.autoresizingMask = []
        view.addSubview(button)
        self.view = view
        self.button = button
        window.button = button
        let panner = UIPanGestureRecognizer(target: self, action: #selector(panDidFire(panner:)))
        button.addGestureRecognizer(panner)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        snapButtonToSocket()
    }

    @objc func panDidFire(panner: UIPanGestureRecognizer) {
        let offset = panner.translation(in: view)
        panner.setTranslation(CGPoint.zero, in: view)
        var center = button.center
        center.x += offset.x
        center.y += offset.y
        button.center = center

        if panner.state == .ended || panner.state == .cancelled {
            UIView.animate(withDuration: 0.3) {
                self.snapButtonToSocket()
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        keyboardHeight = 0.0
        snapButtonToSocket()
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        keyboardHeight = keyboardSize.height
        snapButtonToSocket()
    }

    private func snapButtonToSocket() {
        var bestSocket = CGPoint.zero
        var distanceToBestSocket = CGFloat.infinity
        let center = button.center
        for socket in sockets {
            let distance = hypot(center.x - socket.x, center.y - socket.y)
            if distance < distanceToBestSocket {
                distanceToBestSocket = distance
                bestSocket = socket
            }
        }
        button.center = bestSocket
    }

    private var keyboardHeight: CGFloat = 0.0
    private var sockets: [CGPoint] {
        let buttonSize = button.bounds.size
        let rect = view.bounds.insetBy(dx: 4 + buttonSize.width / 2, dy: 4 + buttonSize.height / 2)
        let sockets: [CGPoint] = [
            CGPoint(x: rect.minX + 20, y: rect.maxY - 20 - keyboardHeight),
            CGPoint(x: rect.maxX - 20, y: rect.maxY - 20 - keyboardHeight),
        ]
        return sockets
    }
}
