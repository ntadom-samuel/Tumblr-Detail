import UIKit
import Nuke

class DetailViewController: UIViewController {

    var post: Post!

    @IBOutlet weak var posterimageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!

    
        override func viewDidLoad() {
            super.viewDidLoad()

            guard let post = post else {
                print("🚨 post is nil")
                return
            }

            if descriptionText == nil {
                print("❌ descriptionText outlet is not connected!")
                return
            }

            if posterimageView == nil {
                print("❌ posterimageView outlet is not connected!")
                return
            }

            descriptionText.text = post.caption.trimHTMLTags()

            if let photo = post.photos.first {
                Nuke.loadImage(with: photo.originalSize.url, into: posterimageView)
            }
        }
    }


