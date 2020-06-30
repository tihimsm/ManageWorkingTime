// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#elseif os(tvOS) || os(watchOS)
import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
    internal enum Colors {
        internal static let primaryBlue = ColorAsset(name: "Primary Blue")
    }
    internal enum Images {
        internal static let charleyrivers = ImageAsset(name: "charleyrivers")
        internal static let chilkoottrail = ImageAsset(name: "chilkoottrail")
        internal static let chincoteague = ImageAsset(name: "chincoteague")
        internal static let hiddenlake = ImageAsset(name: "hiddenlake")
        internal static let icybay = ImageAsset(name: "icybay")
        internal static let lakemcdonald = ImageAsset(name: "lakemcdonald")
        internal static let rainbowlake = ImageAsset(name: "rainbowlake")
        internal static let silversalmoncreek = ImageAsset(name: "silversalmoncreek")
        internal static let stmarylake = ImageAsset(name: "stmarylake")
        internal static let turtlerock = ImageAsset(name: "turtlerock")
        internal static let twinlake = ImageAsset(name: "twinlake")
        internal static let umbagog = ImageAsset(name: "umbagog")
        internal static let yukonCharleyrivers = ImageAsset(name: "yukon_charleyrivers")
    }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
    internal fileprivate(set) var name: String

    #if os(macOS)
    internal typealias Color = NSColor
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Color = UIColor
    #endif

    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    internal private(set) lazy var color: Color = Color(asset: self)

    fileprivate init(name: String) {
        self.name = name
    }
}

internal extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init!(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        self.init(named: NSColor.Name(asset.name), bundle: bundle)
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

internal struct ImageAsset {
    internal fileprivate(set) var name: String

    #if os(macOS)
    internal typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Image = UIImage
    #endif

    internal var image: Image {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
        let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        let image = bundle.image(forResource: NSImage.Name(name))
        #elseif os(watchOS)
        let image = Image(named: name)
        #endif
        guard let result = image else {
            fatalError("Unable to load image named \(name).")
        }
        return result
    }
}

internal extension ImageAsset.Image {
    @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init!(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
        let bundle = BundleToken.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        Bundle(for: BundleToken.self)
    }()
}
// swiftlint:enable convenience_type
