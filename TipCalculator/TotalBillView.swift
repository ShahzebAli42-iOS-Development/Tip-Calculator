
import UIKit

class TotalBillView: UIViewController {

    @IBOutlet weak var BillAmountPerPerson: UILabel!
    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var PersonLabel: UILabel!
    
    var SetBill: String = " "
    
    var SetDetail: String = " "
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        PersonLabel.text = "Total per person"
        BillAmountPerPerson.text = SetBill
        TextLabel.text = SetDetail
        
    }
    
    @IBAction func Recalculate(_ sender: UIButton) {self.navigationController?.popViewController(animated: true)
    }
}
