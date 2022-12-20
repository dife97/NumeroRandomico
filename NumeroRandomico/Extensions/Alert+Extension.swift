import UIKit

struct AlertConfiguration {
    
    let title: String
    let message: String
    let actionTittle: String
    let actionStyle: UIAlertAction.Style
    let action: ((UIAlertAction) -> Void)?
}

extension UIViewController {
    
    func showAlert(with alertConfiguration: AlertConfiguration) {
        
        let alert = UIAlertController(
            title: alertConfiguration.title,
            message: alertConfiguration.message,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(
            title: alertConfiguration.actionTittle,
            style: alertConfiguration.actionStyle,
            handler: alertConfiguration.action
        )
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
}
