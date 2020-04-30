
import UIKit

class CalculateBill: UIViewController {
    
    
    @IBOutlet weak var BillAmount: UITextField!
    
    @IBOutlet weak var TipZeroPercent: UIButton!
    
    @IBOutlet weak var TipTenPercent: UIButton!
    
    @IBOutlet weak var TipTwentyPercent: UIButton!
    
    @IBOutlet weak var Split: UILabel!
    
    @IBOutlet weak var StepperButton: UIStepper!
    
    func CalculateTotalBill() -> (Double, String){
        let Percent = TipTenPercent.isSelected ? 0.1 : TipTwentyPercent.isSelected ? 0.2 : 0.0
        var FinalBill = 0.0
        if let bill = Double(BillAmount.text!) , let split = Double(Split.text!)
        {
            FinalBill = bill + (bill * Percent)
            return (FinalBill/split," Total Persons : \(split),    Tip Percent: \(Percent*100)")
        }
        return (FinalBill,"Tip: 0")
    }
    
    
    @IBAction func ChooseSplit(_ sender: UIStepper) {
        Split.text = Int(sender.value).description

    }
    
    @IBAction func TwentyPercentTip(_ sender: UIButton) {
        TipTwentyPercent.isSelected=false
        if sender == TipTwentyPercent{
            TipTwentyPercent.isSelected = true
        }
    }
    
    @IBAction func TenPercentTip(_ sender: UIButton) {
        TipTenPercent.isSelected = false
        if sender == TipTenPercent{
            TipTenPercent.isSelected = true
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        StepperButton.wraps = true
        StepperButton.autorepeat = true
        StepperButton.minimumValue = 1
        StepperButton.maximumValue = 10
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
                if let vc = segue.destination as? TotalBillView{
                    let (billValue,Statement) = CalculateTotalBill()
                    vc.SetBill = String(billValue)
                    vc.SetDetail = Statement
                }
            }      
}


