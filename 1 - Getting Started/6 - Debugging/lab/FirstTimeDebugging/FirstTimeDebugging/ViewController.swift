import UIKit

class ViewController: UIViewController {
    
    func someMethod() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var sample = "sample"
        print(sample)
        
        
        print("Will this line of code ever be reached?")
        someMethod()
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    }
    
}
