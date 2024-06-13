//
//  ViewController.swift
//  swift_test
//
//  Created by datacap on 1/17/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var responseLbl: UILabel!
    @IBOutlet weak var ipField: UITextField!
    @IBOutlet weak var portField: UITextField!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func connect(_ sender: Any) {
        
        DispatchQueue.main.async {
            self.ipField.resignFirstResponder()
            self.portField.resignFirstResponder()
            self.responseLbl.text = ""
    
        
        // BEGIN TEST CODE
        var dsiEMV: dsiEMVApple
        var bIsBlueToothConnected: Bool
        var strDevicesInfo: String
        var strProcessTransactionInputXML: String
        var strProcessTransactionOutputXML: String
        
//        strProcessTransactionInputXML =
//            "<?xml version=\"1.0\"?>\r\n" +
//            "<TStream>\r\n" +
//                "<Admin>\r\n" +
//                    "<HostOrIP>192.168.0.79</HostOrIP>\r\n" +
//                    "<IpPort>8080</IpPort>\r\n" +
//                    "<MerchantID>EVOCRCHAL2GH</MerchantID>\r\n" +
//                    "<UserTrace>Jon</UserTrace>\r\n" +
//                    "<POSPackageID>EMVUSClient:1.27</POSPackageID>\r\n" +
//                    "<TranCode>ServerVersion</TranCode>\r\n" +
//                    "<SecureDevice>EMV_VP3300_DATACAP</SecureDevice>\r\n" +
//                    "<ComPort>1</ComPort>\r\n" +
//                    "<SequenceNo>0010010010</SequenceNo>\r\n" +
//                    "<BluetoothDeviceName>IDTECH-VP3300-79652</BluetoothDeviceName>\r\n" +
//                    "<OperationMode>CERT</OperationMode>\r\n" +
//                "</Admin>\r\n" +
//            "</TStream>"
        
        guard let ip_add = self.ipField.text else {
            return
        }
        
        guard let port_num = self.portField.text else {
            return
        }
        
        strProcessTransactionInputXML =
            "<?xml version=\"1.0\"?>\r\n" +
            "<TStream>\r\n" +
            "<Transaction>\r\n" +
        "<HostOrIP>127.0.0.1</HostOrIP>/r/n" +
        "<IpPort>12000</IpPort>/r/n" +
            "<BluetoothDeviceName>IDTECH-VP3300-79156</BluetoothDeviceName>\r\n" +
                "<OperationMode>CERT</OperationMode>\r\n" +
                "<MerchantID>CERTIGAIT2GP</MerchantID>\r\n" +
                "<TerminalID>001</TerminalID>\r\n" +
                "<POSPackageID>EMVUSClient:1.26</POSPackageID>\r\n" +
                "<OperatorID>TEST</OperatorID>\r\n" +
                "<UserTrace>Dev1</UserTrace>\r\n" +
                "<TranCode>EMVSale</TranCode>\r\n" +
                "<SecureDevice>EMV_LANE3000_DATACAP_E2E</SecureDevice>\r\n" +
                "<PinPadIpAddress>%@</PinPadIpAddress>\r\n" +
                "<PinPadIpPort>%@</PinPadIpPort>\r\n" +
                "<Amount>/r/n" +
                "<Purchase>3.00</Purchase>/r/n" +
                "</Amount>/r/n" +
                "<SequenceNo>0010010010</SequenceNo>\r\n" +
            "</Transaction>\r\n" +
            "</TStream>"
        
        let inputRequest = String(format: strProcessTransactionInputXML, ip_add, port_num)

        print( "var inputRequest: " + inputRequest )

        dsiEMV = dsiEMVApple( )
        
        bIsBlueToothConnected = dsiEMV.isBluetoothConnected( )
       // strDevicesInfo = dsiEMV.getDevicesInfo( )
        strProcessTransactionOutputXML = dsiEMV.processTransaction( inputRequest )
        
       // print( "var bIsBlueToothConnected: " + String( bIsBlueToothConnected ) )
       // print( "var strDevicesInfo: " + strDevicesInfo )
        print( "var strProcessTransactionOutputXML: " + strProcessTransactionOutputXML )
        // END TEST CODE
            self.responseLbl.text = strProcessTransactionOutputXML
        }
    
    }
}


extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
