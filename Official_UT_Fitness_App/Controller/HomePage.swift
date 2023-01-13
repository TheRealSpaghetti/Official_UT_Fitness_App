
import UIKit
import Firebase

class HomePage: UIViewController {

    override func viewDidLoad() {
        
        //Login and Register
        //save user defaults to skip
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func leftSwipe(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        print("wowee!")
        self.performSegue(withIdentifier: "goToNutrition", sender: self)
    }
        
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("swipe detected")
        self.performSegue(withIdentifier: "goToNutrition", sender: self)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: "1@2.com", password: "123456"){ authResult, error in
            
            print("noice one")
        }
        
        
        self.performSegue(withIdentifier: "goToTimer", sender: self)
    }
    
}

