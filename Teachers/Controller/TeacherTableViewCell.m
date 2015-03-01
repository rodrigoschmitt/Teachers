//
//  TeacherTableViewCell.m
//  Teachers
//
//  Created by Rodrigo Andrade on 2/28/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

#import "TeacherTableViewCell.h"
#import "Util.h"

@implementation TeacherTableViewCell

- (void)configCell {
    [Util circularProfile:self.imgTeacher];
}

@end
