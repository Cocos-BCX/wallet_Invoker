//
//  CocosRequestObj+Private.h
//  WalletInvoker
//
//  Created by 邵银岭 on 2020/1/7.
//  Copyright © 2020 邵银岭. All rights reserved.
//

#import "CocosRequestObj.h"

NS_ASSUME_NONNULL_BEGIN

/**  链接category文件，避免使用-ObjC */
FOUNDATION_EXPORT void CocosApiLinkObjCategoryFile(void);

@interface CocosRequestObj (Private)

/**  生成json对象 */
- (NSDictionary *)cocos_toJSONObject;

@end

NS_ASSUME_NONNULL_END
