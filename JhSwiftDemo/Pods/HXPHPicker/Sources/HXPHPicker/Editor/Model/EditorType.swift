//
//  EditorType.swift
//  HXPHPicker
//
//  Created by Slience on 2021/1/14.
//

import UIKit

public extension EditorController {
    enum EditorType {
        case photo
        case video
    }
}

/// 照片编辑控制器的状态
public extension PhotoEditorViewController {
    enum State: Int {
        case normal     //!< 正常状态
        case cropping   //!< 裁剪状态
    }
}

/// 视频编辑控制器的状态
public extension VideoEditorViewController {
    enum State: Int {
        case normal     //!< 正常状态
        case cropping   //!< 裁剪状态
    }
}

/// 编辑工具模型
public extension EditorToolOptions {
    enum `Type` {
        case cropping   //!< 裁剪
    }
}

/// 裁剪时遮罩类型
public extension EditorImageResizerMaskView {
    enum MaskType {
        /// 半透明黑色
        case blackColor
        /// 深色毛玻璃
        case darkBlurEffect
        /// 浅色毛玻璃
        case lightBlurEffect
    }
}

/// 默认宽高比类型
public extension PhotoCroppingConfiguration {
    enum AspectRatioType: Equatable {
        /// 原始宽高比
        case original
        /// 1:1
        case ratio_1x1
        /// 2:3
        case ratio_2x3
        /// 3:2
        case ratio_3x2
        /// 3:4
        case ratio_3x4
        /// 4: 3
        case ratio_4x3
        /// 9:16
        case ratio_9x16
        /// 16:9
        case ratio_16x9
        /// 自定义宽高比
        case custom(CGSize)
    }
}

extension PhotoEditorView {
    enum State {
        case normal
        case cropping
    }
}

extension EditorImageResizerView {
    enum MirrorType {
        case none
        case horizontal
    }
}

