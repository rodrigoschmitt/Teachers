//
//  TeacherControl.m
//  Teachers
//
//  Created by Rodrigo Andrade on 2/28/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

#import "TeacherManager.h"
#import "Teacher.h"
#import "Institution.h"

@implementation TeacherManager

- (NSMutableDictionary *)requestInstitutions {
    
    NSString *plistPath = [[NSBundle bundleForClass:[TeacherManager class]] pathForResource:@"Teachers" ofType:@"plist"];
    NSArray *plistData = [[NSDictionary dictionaryWithContentsOfFile:plistPath] allValues];
    
    NSMutableDictionary *institutions = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i < [plistData count]; i++) {
        
        Institution *institution = [[Institution alloc] init];
        
        NSMutableArray *teachers = [[NSMutableArray alloc] init];
        
        for (int j=0; j < [[plistData objectAtIndex:i] count]; j++) {
            
            if ([[[[plistData objectAtIndex:i] objectAtIndex:j] class] isSubclassOfClass:[NSString class]]) {
                institution.name = [[plistData objectAtIndex:i] objectAtIndex:j];
            }
            else {
                Teacher *teacher = [[Teacher alloc] init];
                
                teacher.name = [[[plistData objectAtIndex:i] objectAtIndex:j] objectForKey:@"name"];
                teacher.professional = [[[plistData objectAtIndex:i] objectAtIndex:j] objectForKey:@"professional"];
                teacher.linkedin = [NSURL URLWithString:[[[plistData objectAtIndex:i] objectAtIndex:j] objectForKey:@"linkedin"]];
                teacher.photo = [UIImage imageNamed:[[[plistData objectAtIndex:i] objectAtIndex:j] objectForKey:@"photo"]];
                
                [teachers addObject:teacher];
            }
        }

        [institutions setObject:teachers forKey:institution.name];
        
    }
    
    return institutions;
    
}

@end
