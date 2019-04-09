
// Prime Number Checker
import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var LblA: UILabel!
    @IBOutlet weak var textA: UITextField!
    
    @IBAction func Check(_ sender: Any) {
        
        // optional binding(Conditional unwraping)을 사용하여 숫자값을 제외함
        if let number = Int(textA.text!) {
           
            var isPrime = true
            
            // 입력 값이 0이거나 음수 일때 처리...
            if number <= 0 {
                LblA.text = "input correct value!"
                textA.text = ""
                return
            }
            
            if number == 1 {
                isPrime = false
            }
        
            if number != 1 && number != 2 {
                for i in 2 ..< number {
                    if number % i == 0 {
                        isPrime = false
                    }
                }
            }
        
            if isPrime == true {
                LblA.text = "prime number"
            } else {
                LblA.text = "Not Prime number"
            }
            textA.text = ""
        } else {
            //숫자값이 입력됐을때...
            print("nil 발생")
            LblA.text = "input numeric value!"
            textA.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textA.delegate = self
        textA.placeholder = "ex) 7"
        textA.clearButtonMode = UITextField.ViewMode.always
    }
    
    // background view를 누르면 키패드가 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // return 키를 누르면 키패드가 내려감
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textA.resignFirstResponder()
        return true
    }
}


