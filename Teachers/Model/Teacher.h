//
//  Teacher.h
//  Teachers
//
//  Created by Rodrigo Andrade on 2/28/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Teacher : NSObject

@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *professional;
@property (nonatomic, strong) NSURL     *linkedin;
@property (nonatomic, strong) UIImage   *photo;

@end
