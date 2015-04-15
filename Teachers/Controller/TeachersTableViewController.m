//
//  TeachersTableViewController.m
//  Teachers
//
//  Created by Rodrigo Andrade on 2/28/15.
//  Copyright (c) 2015 DevMac. All rights reserved.
//

#import "TeachersTableViewController.h"
#import "TeacherTableViewCell.h"
#import "ProfileViewController.h"
#import "Teacher.h"
#import "TeacherManager.h"

@interface TeachersTableViewController () {
    NSDictionary *institutions;
    
    NSInteger cellIndex;
    NSInteger sectionIndex;
}

@end

@implementation TeachersTableViewController

#pragma mark - Custom Methods

- (void)loadData {
    
    TeacherManager *teacherManager = [[TeacherManager alloc] init];

    institutions = [teacherManager requestInstitutions];
    
    [[self tableView] reloadData];
    
}

#pragma mark - Methods of this TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Teachers";
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [institutions count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[institutions allValues] objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [[institutions allKeys] objectAtIndex:section];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeacherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teacherCell" forIndexPath:indexPath];
    
    Teacher *teacher = [[[institutions allValues] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.imgTeacher.image = teacher.photo;
    cell.lblName.text = teacher.name;
    cell.lblProfissional.text = teacher.professional;
    
    [cell configCell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    sectionIndex = indexPath.section;
    cellIndex = indexPath.row;
    
    [self performSegueWithIdentifier:@"segueProfileViewController" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ProfileViewController *profileViewController = [segue destinationViewController];
    profileViewController.teacher = [[[institutions allValues] objectAtIndex:sectionIndex] objectAtIndex:cellIndex];;
    
}

@end
