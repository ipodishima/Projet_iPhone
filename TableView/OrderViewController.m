//
//  OrderViewController.m
//  TableView
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import "OrderViewController.h"
#import "WineObject.h"
#import "CustomCell.h"
#import "DetailWineViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Commandes";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [[DownloadManager shared] loadLocalFileName:@"WineList" withDelegate:self];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _arrayOfContacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Get the contact for the row
    WineObject *w = [_arrayOfContacts objectAtIndex:indexPath.row];
    
    // Display!
    cell.textLabel.text = [NSString stringWithFormat:@"%@", w.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", w.aoc];
    cell.imageView.image = [UIImage imageNamed:w.image];

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Pushing to the detail view controller of the wine's bottle
    DetailWineViewController *detailwineViewController = [[DetailWineViewController alloc]init];
    detailwineViewController.tabBarItem = self.tabBarItem;
    detailwineViewController.texteAAfficher = [[_arrayOfContacts objectAtIndex:[indexPath row]]description];
    detailwineViewController.name = [[_arrayOfContacts objectAtIndex:[indexPath row]]name];
    detailwineViewController.price = [[_arrayOfContacts objectAtIndex:[indexPath row]]price];
    detailwineViewController.title = [[_arrayOfContacts objectAtIndex:[indexPath row]]aoc];
    [self.navigationController pushViewController:detailwineViewController animated:YES];
}

#pragma mark - DownloadDelegate protocol

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    // Todo : handle the error
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{

}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    
    // Now, we need to go through all the objects loaded in the JSON, parse it, and create new Objective-C objects
    // First, remove previous objects in instance array
    [_arrayOfContacts removeAllObjects];
    
    if (!_arrayOfContacts)
        _arrayOfContacts = [NSMutableArray new];
    
    // Enumerate the json array
    for (NSDictionary *dic in object)
    {
        WineObject *w = [WineObject new];
        
        // Set properties from JSON 'object'
        w.name = [dic objectForKey:@"Name"];
        w.aoc = [dic objectForKey:@"AOC"];
        w.image = [dic objectForKey:@"Image"];
        w.description = [dic objectForKey:@"Description"];
        w.price = [[dic objectForKey:@"Price"] floatValue];
        
        [_arrayOfContacts addObject:w];
    }
    
    // Sort the array
    //[_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES]]];
    
    
    // When we finished, reload the table view
    [self.tableView reloadData];
}

@end
