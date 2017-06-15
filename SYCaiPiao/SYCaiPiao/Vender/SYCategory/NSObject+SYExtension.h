//
//  NSObject+SYExtension.h
//
//  Created by 唐绍禹 on 16/8/10.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  该字典转模型只针对于数据存储，不做普通字典转模型
 */
@interface NSObject (SYExtension)
/**
 *  模型转字典（模型中不能有字典属性，有字典属性的建议转化成模型属性）
 *
 *  @return 如果是模型的话返回字典，模型数组的话返回字典数组，否则返回self
 */
- (id)sy_keyValues;
/**
 *  字典转模型（已知模型类）
 *
 *  @param dict 模型字典
 *
 *  @return 模型
 */
+ (instancetype)sy_objectWithKeyValueDictionary:(NSDictionary *)dict;

/**
 通过字典数组来创建模型数组

 @param dicts 字典数组
 @return 模型数组
 */
+ (NSArray *)sy_objectArrayWithKeyValueArray:(NSArray *)dicts;
/**
 通过plist数组转化成模型数组

 @param plist plist文件名
 @return 模型数组
 */
+ (NSArray *)sy_objectArrayWithPlist:(NSString *)plist;
/**
 *  字典转模型 （前提是通过sy_keyValues转换的字典，否则不能使用）
 *
 *  @return 模型
 */
- (id)sy_objectWithKeyValue;
/**
 *  属性列表
 *
 *  @return 该类的所有属性的数组
 */
+ (NSArray *)sy_propertyList;

/**
 * 数组对象里面的类名
 *
 @return 数组对象里面的类名字典
 */
+ (NSDictionary *)sy_classNameInArrayProperty;

@end
/**
 *  字典对应的模型类类名
 */
extern NSString *const sy_keyForClassName;
