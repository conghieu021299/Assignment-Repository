import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int,  alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    convenience init(rgb: UInt, a: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(a)
        )
    }
    
    public convenience init?(hexColor: String) {
        var red: CGFloat?
        var green: CGFloat?
        var blue: CGFloat?
        var alpha: CGFloat = 1.0
        if hexColor.hasPrefix("#") {
            let index = hexColor.index(hexColor.startIndex, offsetBy: 1)
            let hex = String(hexColor[index...hexColor.endIndex])
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexInt64(&hexValue) {
                switch hex.lengthOfBytes(using: String.Encoding.utf8) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    break
                }
            }
        }
        if let r = red, let g = green, let b = blue {
            self.init(red: r, green: g, blue: b, alpha: alpha)
        } else {
            self.init()
            return nil
        }
    }
//    convenience init(hex: String) {
//        self.init(hex: hex, alpha: 1)
//    }

//    convenience init(hex: String, alpha: CGFloat) {
//        var hexWithoutSymbol = hex
//        if hexWithoutSymbol.hasPrefix("#") {
//            hexWithoutSymbol = hex.substring(startTo: 1)
//        }
//        let scanner = Scanner(string: hexWithoutSymbol)
//        var hexInt: UInt32 = 0x0
//        scanner.scanHexInt32(&hexInt)
//        var red: UInt32 = 0xff, green: UInt32 = 0xff, blue: UInt32 = 0xff
//        switch hexWithoutSymbol.count {
//        case 3: // #RGB
//            red = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
//            green = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
//            blue = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
//        case 6: // #RRGGBB
//            red = (hexInt >> 16) & 0xff
//            green = (hexInt >> 8) & 0xff
//            blue = hexInt & 0xff
//        default:
//            break
//        }
//        self.init(
//            red: (CGFloat(red)/255),
//            green: (CGFloat(green)/255),
//            blue: (CGFloat(blue)/255),
//            alpha: alpha)
//    }
    class func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        let color = UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        return color
    }
    class func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        let color = UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
        return color
    }
    class func rgb(by color: CGFloat) -> UIColor {
        let color = UIColor.init(red: color/255, green: color/255, blue: color/255, alpha: 1.0)
        return color
    }
    
//    class func directionButtonColor(isEnable: Bool) -> UIColor {
//        return isEnable ? UIColor(hex: "#009688") :  UIColor(hex: "#75c6bf")
//    }
//
//    class func dircetionColorTextButton(isEnable: Bool) -> UIColor {
//        return isEnable ? UIColor(hex: "#009688") :  UIColor.lightGray
//    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
