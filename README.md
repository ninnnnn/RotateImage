# RotateImage

## Example

[<img src="https://media.giphy.com/media/hV1bIBJOXmTws3E0Lq/giphy.gif" width="" height="400" align=center>]()

```
let degree = CGFloat(Double.pi/2)
UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.4, delay: 0, options: .curveLinear, animations: {
            self.seletedImage.rotate(imageView: self.seletedImage, degree: degree)
        }, completion: nil)
        holderImage = holderImage?.rotate(radians: degree)
```
This displays right rotation for 90 degrees with animation.

**Important**: The function ```rotate(radians: CGFloat)``` will return a new image after rotate, and you should always use ```rotate(imageView: UIImageView, degree: CGFloat)``` in UIImageView.
