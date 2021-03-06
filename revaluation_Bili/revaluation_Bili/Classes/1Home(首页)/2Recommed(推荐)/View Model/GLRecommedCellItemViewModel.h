//
//  GLRecommedCellItemViewModel.h
//  revaluation_Bili
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GLRecommedCellModel;

@interface GLRecommedCellItemViewModel : NSObject

- (instancetype)initWithModel:(GLRecommedCellModel *)model;

/* 类型 **/
@property(nonatomic , strong)NSString *style;

/* 图片URL **/
@property(nonatomic , strong)NSString *cover; 

/* 评论 **/
@property(nonatomic , strong)NSString *danmaku;

/* 视频详情界面请求需要用到的aid **/
@property(nonatomic , strong)NSString *param;

/* 播放量 **/
@property(nonatomic , strong)NSString *play;

/* 番剧更新日期 **/
@property(nonatomic , strong)NSString *desc1;

/* 标题 **/
@property(nonatomic , strong)NSString *title;

/* up主 **/
@property(nonatomic , strong)NSString *up;

/* up主头像 **/
@property(nonatomic , strong)NSString *up_face;

/* 高度 **/
@property(nonatomic , strong)NSString *height;

/* 宽度 **/
@property(nonatomic , strong)NSString *width;

/* 在线人数 **/
@property(nonatomic , strong)NSString *online;

@end
