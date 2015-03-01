//
//  TeacherControl.m
//  Teachers
//
//  Created by Rodrigo Andrade on 2/28/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

#import "TeacherControl.h"
#import "Teacher.h"

@implementation TeacherControl

- (NSArray *)requestTeachers {
    
    NSString *plistPath = [[NSBundle bundleForClass:[TeacherControl class]] pathForResource:@"Teachers" ofType:@"plist"];
    NSArray *plistData = [[NSDictionary dictionaryWithContentsOfFile:plistPath] allValues];
    
    NSMutableArray *teachers = [[NSMutableArray alloc] init];
    
    for (int i=0; i < [plistData count]; i++) {
        
        Teacher *teacher = [[Teacher alloc] init];
        
        teacher.name = [[plistData objectAtIndex:i] objectForKey:@"name"];
        teacher.professional = [[plistData objectAtIndex:i] objectForKey:@"professional"];
        teacher.linkedin = [NSURL URLWithString:[[plistData objectAtIndex:i] objectForKey:@"linkedin"]];
        teacher.photo = [UIImage imageNamed:[[plistData objectAtIndex:i] objectForKey:@"photo"]];
        
        [teachers addObject:teacher];
        
    }
    
    return teachers;
    
}

@end
