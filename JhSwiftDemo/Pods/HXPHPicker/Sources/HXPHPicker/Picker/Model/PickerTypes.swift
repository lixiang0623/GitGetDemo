//
//  PickerTypes.swift
//  HXPHPicker
//
//  Created by Slience on 2021/1/7.
//

import Foundation
import Photos

/// 资源类型可选项
public struct PickerAssetOptions: OptionSet {
    /// Photo 静态照片
    public static let photo = PickerAssetOptions(rawValue: 1 << 0)
    /// Video 视频
    public static let video = PickerAssetOptions(rawValue: 1 << 1)
    /// Gif 动图
    public static let gifPhoto = PickerAssetOptions(rawValue: 1 << 2)
    /// LivePhoto 实况照片
    public static let livePhoto = PickerAssetOptions(rawValue: 1 << 3)
    
    public var isPhoto: Bool {
        contains(.photo) || contains(.gifPhoto) || contains(.livePhoto)
    }
    public var isVideo: Bool {
        contains(.video)
    }
    
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

public enum PickerSelectMode: Int {
    case single = 0         //!< 单选模式
    case multiple = 1       //!< 多选模式
}

/// 资源列表Cell点击动作
public enum SelectionTapAction: Equatable {
    
    /// 进入预览界面
    case preview
    
    /// 快速选择
    /// - 点击资源时会直接选中，不会进入预览界面
    case quickSelect
    
    /// 打开编辑器
    /// - 点击资源时会进入编辑界面
    case openEditor
}

public extension PickerResult {
    struct Options: OptionSet {
        public static let photo = Options(rawValue: 1 << 0)
        public static let video = Options(rawValue: 1 << 0)
        public static let any: Options = [.photo, .video]
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

public extension PhotoAsset {
    enum MediaType: Int {
        case photo = 0      //!< 照片
        case video = 1      //!< 视频
    }

    enum MediaSubType: Int {
        case image = 0          //!< 手机相册里的图片
        case imageAnimated = 1  //!< 手机相册里的动图
        case livePhoto = 2      //!< 手机相册里的LivePhoto
        case localImage = 3     //!< 本地图片
        case video = 4          //!< 手机相册里的视频
        case localVideo = 5     //!< 本地视频
    }
    enum DownloadStatus: Int {
        case unknow         //!< 未知，不用下载或还未开始下载
        case succeed        //!< 下载成功
        case downloading    //!< 下载中
        case canceled       //!< 取消下载
        case failed         //!< 下载失败
    }
}

public enum AlbumShowMode: Int {
    case normal = 0         //!< 正常展示
    case popup = 1          //!< 弹出展示
}

public extension PhotoPickerViewController {
    enum CancelType {
        case text   //!< 文本
        case image  //!< 图片
    }
    enum CancelPosition {
        case left   //!< 左边
        case right  //!< 右边
    }
}

public extension PhotoPickerSelectBoxView {
    enum Style: Int {
        case number //!< 数字
        case tick   //!< √
    }
}

public extension PhotoPreviewViewController {
    enum VideoPlayType {
        case normal     //!< 正常状态，不自动播放
        case auto       //!< 自动播放
        case once       //!< 自动播放一次
    }
}

extension PhotoManager {
    enum CameraAlbumLocal: String {
        case identifier = "HXCameraAlbumLocalIdentifier"
        case identifierType = "HXCameraAlbumLocalIdentifierType"
        case language = "HXCameraAlbumLocalLanguage"
    }
}
extension PickerAssetOptions {
    
    var mediaTypes: [PHAssetMediaType] {
        var result: [PHAssetMediaType] = []
        if contains(.photo) || contains(.gifPhoto) || contains(.livePhoto) {
            result.append(.image)
        }
        if contains(.video) {
            result.append(.video)
        }
        return result
    }
}
