//
//  PhotoPickerControllerProtocol.swift
//  HXPHPicker
//
//  Created by Slience on 2021/3/9.
//

import UIKit

public protocol PhotoPickerControllerDelegate: AnyObject {
    
    /// 选择完成之后调用
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - result: 选择的结果
    ///     result.photoAssets  选择的资源数组
    ///     result.isOriginal   是否选中原图
    func pickerController(_ pickerController: PhotoPickerController, didFinishSelection result: PickerResult)
    
    /// 点击取消时调用
    /// - Parameter pickerController: 对应的 PhotoPickerController
    func pickerController(didCancel pickerController: PhotoPickerController)
    
    /// 点击了原图按钮
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - isOriginal: 是否选中的原图
    func pickerController(_ pickerController: PhotoPickerController, didOriginalButton isOriginal: Bool)
    
    /// 将要点击cell，允许的话点击之后会跳转预览界面
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - photoAsset: 对应的 PhotoAsset 数据
    ///   - atIndex: indexPath.item
    func pickerController(_ pickerController: PhotoPickerController, shouldClickCell photoAsset: PhotoAsset, atIndex: Int) -> Bool
    
    /// 将要选择cell 不能选择时需要自己手动弹出提示框
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - photoAsset: 对应的 PhotoAsset 数据
    ///   - atIndex: 将要添加的索引
    func pickerController(_ pickerController: PhotoPickerController, shouldSelectedAsset photoAsset: PhotoAsset, atIndex: Int) -> Bool

    /// 即将选择 cell 时调用
    func pickerController(_ pickerController: PhotoPickerController, willSelectAsset photoAsset: PhotoAsset, atIndex: Int)

    /// 选择了 cell 之后调用
    func pickerController(_ pickerController: PhotoPickerController, didSelectAsset photoAsset: PhotoAsset, atIndex: Int)

    /// 即将取消了选择 cell
    func pickerController(_ pickerController: PhotoPickerController, willUnselectAsset photoAsset: PhotoAsset, atIndex: Int)

    /// 取消了选择 cell
    func pickerController(_ pickerController: PhotoPickerController, didUnselectAsset photoAsset: PhotoAsset, atIndex: Int)
    
    /// 是否能够推出相机界面，点击相机cell时调用
    /// 可以跳转其他相机界面然后调用 addedCameraPhotoAsset
    func pickerController(shouldPresentCamera pickerController: PhotoPickerController) -> Bool
    
    /// 将要编辑 Asset，不允许的话可以自己跳转其他编辑界面
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - photoAsset: 对应的 PhotoAsset 数据
    func pickerController(_ pickerController: PhotoPickerController, shouldEditAsset photoAsset: PhotoAsset, atIndex: Int) -> Bool
    
    /// Asset 编辑完后调用
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - photoAsset: 对应的 PhotoAsset 数据
    ///   - atIndex: 对应的下标
    func pickerController(_ pickerController: PhotoPickerController, didEditAsset photoAsset: PhotoAsset, atIndex: Int)
    
    /// 预览界面更新当前显示的资源，collectionView滑动了就会调用
    /// - Parameters:
    ///   - pikcerController: 对应的 PhotoPickerController
    ///   - photoAsset: 对应显示的 PhotoAsset 数据
    ///   - index: 对应显示的位置
    func pickerController(_ pikcerController: PhotoPickerController, previewUpdateCurrentlyDisplayedAsset photoAsset: PhotoAsset, atIndex: Int)
    
    /// 预览界面将要删除 Asset
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - photoAsset: 对应被删除的 PhotoAsset 数据
    func pickerController(_ pickerController: PhotoPickerController, previewShouldDeleteAsset photoAsset: PhotoAsset, atIndex: Int) -> Bool
    
    /// 预览界面已经删除了 Asset
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - photoAsset: 对应被删除的 PhotoAsset 数据
    ///   - atIndex: 资源对应的位置索引
    func pickerController(_ pickerController: PhotoPickerController, previewDidDeleteAsset photoAsset: PhotoAsset, atIndex: Int)
    
    /// 视图控制器即将显示
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - viewController: 对应的控制器 [AlbumViewController, PhotoPickerViewController, PhotoPreviewViewController]
    func pickerController(_ pickerController: PhotoPickerController, viewControllersWillAppear viewController: UIViewController)
    
    /// 视图控制器已经显示
    func pickerController(_ pickerController: PhotoPickerController, viewControllersDidAppear viewController: UIViewController)
    
    /// 视图控制器即将消失
    func pickerController(_ pickerController: PhotoPickerController, viewControllersWillDisappear viewController: UIViewController)
    
    /// 视图控制器已经消失
    func pickerController(_ pickerController: PhotoPickerController, viewControllersDidDisappear viewController: UIViewController)
    
    /// dismiss后调用
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - localCameraAssetArray: 相机拍摄存在本地的 PhotoAsset 数据
    ///     可以在下次进入选择时赋值给localCameraAssetArray，列表则会显示
    func pickerController(_ pickerController: PhotoPickerController, didDismissComplete localCameraAssetArray: [PhotoAsset])
    
    
    // MARK: 单独预览时的自定义转场动画
    /// present预览时展示的image
    /// - Parameters:
    ///   - pickerController: 对应的 PhotoPickerController
    ///   - index: 预览资源对应的位置
    func pickerController(_ pickerController: PhotoPickerController, presentPreviewImageForIndexAt index: Int) -> UIImage?
    
    /// present 预览时起始的视图，用于获取位置大小。与 presentPreviewFrameForIndexAt 一样
    func pickerController(_ pickerController: PhotoPickerController, presentPreviewViewForIndexAt index: Int) -> UIView?
    
    /// dismiss 结束时对应的视图，用于获取位置大小。与 dismissPreviewFrameForIndexAt 一样
    func pickerController(_ pickerController: PhotoPickerController, dismissPreviewViewForIndexAt index: Int) -> UIView?
    
    /// present 预览时对应的起始位置大小
    func pickerController(_ pickerController: PhotoPickerController, presentPreviewFrameForIndexAt index: Int) -> CGRect
    
    /// dismiss 结束时对应的位置大小
    func pickerController(_ pickerController: PhotoPickerController, dismissPreviewFrameForIndexAt index: Int) -> CGRect
    
    /// 外部预览自定义 present 完成
    func pickerController(_ pickerController: PhotoPickerController, previewPresentComplete atIndex: Int)
    
    /// 外部预览自定义 dismiss 完成
    func pickerController(_ pickerController: PhotoPickerController, previewDismissComplete atIndex: Int)
}

public extension PhotoPickerControllerDelegate {
    
    func pickerController(_ pickerController: PhotoPickerController, didFinishSelection result: PickerResult) { }
    
    func pickerController(_ pickerController: PhotoPickerController, didOriginalButton isOriginal: Bool) { }
    
    func pickerController(_ pickerController: PhotoPickerController, shouldClickCell photoAsset: PhotoAsset, atIndex: Int) -> Bool { true }
    
    func pickerController(_ pickerController: PhotoPickerController, shouldSelectedAsset photoAsset: PhotoAsset, atIndex: Int) -> Bool { true }

    func pickerController(_ pickerController: PhotoPickerController, willSelectAsset photoAsset: PhotoAsset, atIndex: Int) { }

    func pickerController(_ pickerController: PhotoPickerController, didSelectAsset photoAsset: PhotoAsset, atIndex: Int) { }

    func pickerController(_ pickerController: PhotoPickerController, willUnselectAsset photoAsset: PhotoAsset, atIndex: Int) { }

    func pickerController(_ pickerController: PhotoPickerController, didUnselectAsset photoAsset: PhotoAsset, atIndex: Int) { }
    
    func pickerController(shouldPresentCamera pickerController: PhotoPickerController) -> Bool { true }
    
    func pickerController(_ pickerController: PhotoPickerController, shouldEditAsset photoAsset: PhotoAsset, atIndex: Int) -> Bool { true }
    
    func pickerController(_ pickerController: PhotoPickerController, didEditAsset photoAsset: PhotoAsset, atIndex: Int) { }
    
    func pickerController(_ pikcerController: PhotoPickerController, previewUpdateCurrentlyDisplayedAsset photoAsset: PhotoAsset, atIndex: Int) { }
    
    func pickerController(_ pickerController: PhotoPickerController, previewShouldDeleteAsset photoAsset: PhotoAsset, atIndex: Int) -> Bool { true }
    
    func pickerController(_ pickerController: PhotoPickerController, previewDidDeleteAsset photoAsset: PhotoAsset, atIndex: Int) { }
    
    func pickerController(_ pickerController: PhotoPickerController, viewControllersWillAppear viewController: UIViewController) { }
    
    func pickerController(_ pickerController: PhotoPickerController, viewControllersDidAppear viewController: UIViewController) { }
    
    func pickerController(_ pickerController: PhotoPickerController, viewControllersWillDisappear viewController: UIViewController) { }
    
    func pickerController(_ pickerController: PhotoPickerController, viewControllersDidDisappear viewController: UIViewController) { }
    
    func pickerController(didCancel pickerController: PhotoPickerController) { }
    
    func pickerController(_ pickerController: PhotoPickerController, didDismissComplete localCameraAssetArray: [PhotoAsset]) { }
    
    func pickerController(_ pickerController: PhotoPickerController, presentPreviewImageForIndexAt index: Int) -> UIImage? { nil }
    
    func pickerController(_ pickerController: PhotoPickerController, presentPreviewViewForIndexAt index: Int) -> UIView? { nil }
    
    func pickerController(_ pickerController: PhotoPickerController, dismissPreviewViewForIndexAt index: Int) -> UIView? { nil }
    
    func pickerController(_ pickerController: PhotoPickerController, presentPreviewFrameForIndexAt index: Int) -> CGRect { .zero }
    
    func pickerController(_ pickerController: PhotoPickerController, dismissPreviewFrameForIndexAt index: Int) -> CGRect { .zero }
    
    func pickerController(_ pickerController: PhotoPickerController, previewPresentComplete atIndex: Int) { }
    
    func pickerController(_ pickerController: PhotoPickerController, previewDismissComplete atIndex: Int) { }
}
