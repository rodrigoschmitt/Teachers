//
//  Util.m
//  TwitterParse
//
//  Created by Rodrigo Andrade on 2/16/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

#import "Util.h"

@implementation Util

#pragma mark - Archive Objects in NSUserDefaults

+ (void)circularProfile:(UIImageView *)imgPrile
{
    imgPrile.layer.cornerRadius = imgPrile.frame.size.width / 2;
    imgPrile.clipsToBounds = YES;
    imgPrile.layer.borderWidth = 3.0f;
    imgPrile.layer.borderColor = [UIColor grayColor].CGColor;
}

@end
