import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var lblOrigen: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://httpbin.org/get").responseJSON {
            response in
            switch response.result{
            case .success(let datos):
                if let diccionarioRespuesta = datos as? NSDictionary{
                    if let origen = diccionarioRespuesta.value(forKey: "origin") as? String {
                        self.lblOrigen.text = origen
                    }
                }
                
            case .failure(let datos):
                print(datos)
            
        }
    }

    }
}

