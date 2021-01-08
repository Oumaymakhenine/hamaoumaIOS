import UIKit

struct ImageResponse: Decodable

{
    let status: Int?
    let message: String?
}

class PickImageViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let d = sender as! Analyse
        let dd = segue.destination as! SendAnalyseViewController
        dd.a = d
    }

    @IBAction func uploadaction(_ sender: Any) {
        UploadImage()
        }
    @IBOutlet weak var upload: UIButton!
    @IBOutlet var UIPickerr: UIPickerView!
    override func viewDidLoad() {
           super.viewDidLoad()
       }
    
    @IBOutlet weak var picture: UIImageView!
    @IBAction func pickme(_ sender: Any) {
        pick()
       }
   }
extension PickImageViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func pick() {
        let ipcontroller = UIImagePickerController()
        ipcontroller.delegate = self
        ipcontroller.allowsEditing = true
        ipcontroller.sourceType = .photoLibrary
        present(ipcontroller, animated: true, completion: nil)
    }
        
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.picture.image = editedImage.withRenderingMode(.alwaysOriginal)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.picture.image = originalImage.withRenderingMode(.alwaysOriginal)
        }
        dismiss(animated: true, completion: nil)
       
       }
        
        
        func UploadImage(){
           
            let image = picture.image
            let imageData = image?.jpegData(compressionQuality: 0.7)

             let url =  "http://192.168.1.102:3000/api/auth/uploadfile"
             var urlRequest = URLRequest(url: URL(string: url)!)

             urlRequest.httpMethod = "post"
             let bodyBoundary = "--------------------------\(UUID().uuidString)"
             urlRequest.addValue("multipart/form-data; boundary=\(bodyBoundary)", forHTTPHeaderField: "Content-Type")
           
             //attachmentKey is the api parameter name for your image do ask the API developer for this
            // file name is the name which you want to give to the file
             let requestData = createRequestBody(imageData: imageData!, boundary: bodyBoundary, attachmentKey: "file", fileName: "file.jpg")
             
             urlRequest.addValue("\(requestData.count)", forHTTPHeaderField: "content-length")
             urlRequest.httpBody = requestData

             URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

                 if(error == nil && data != nil && data?.count != 0)
                 {
                    DispatchQueue.main.async {
                     do {
                         let response = try JSONDecoder().decode(ImageResponse.self, from: data!)
                        print("bdgdgd")
                        var dataString = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)
                     var   dd = dataString! as String
                        print(dd)
                        let jsonData = Data(dd.utf8)
                        let decoder = JSONDecoder()
                        
                        do {
                            
                            
                            var analyse = try decoder.decode(Analyse.self, from: jsonData)
                            self.performSegue(withIdentifier: "sendanalyse", sender: analyse)

                            }
                            } catch {
                            print(error)
                        }
                        
                     catch let decodingError
                     {
                         debugPrint(decodingError)
                     }
                 }}
             }.resume()
         }
        
        
        func createRequestBody(imageData: Data, boundary: String, attachmentKey: String, fileName: String) -> Data{
                let lineBreak = "\r\n"
                var requestBody = Data()

                requestBody.append("\(lineBreak)--\(boundary + lineBreak)" .data(using: .utf8)!)
                requestBody.append("Content-Disposition: form-data; name=\"\(attachmentKey)\"; filename=\"\(fileName)\"\(lineBreak)" .data(using: .utf8)!)
                requestBody.append("Content-Type: image/jpeg \(lineBreak + lineBreak)" .data(using: .utf8)!) // you can change the type accordingly if you want to
                requestBody.append(imageData)
                requestBody.append("\(lineBreak)--\(boundary)--\(lineBreak)" .data(using: .utf8)!)

                return requestBody
            }
    
}
