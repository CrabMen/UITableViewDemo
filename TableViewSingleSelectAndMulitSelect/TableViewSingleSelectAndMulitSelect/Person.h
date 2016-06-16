//
//  Person.h
//  TableViewSingleSelectAndMulitSelect
//
//  Created by CrabMan on 16/6/15.
//  Copyright © 2016年 CrabMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) BOOL isSelected;
@property (nonatomic,strong) NSString *detailTitle;
@end
