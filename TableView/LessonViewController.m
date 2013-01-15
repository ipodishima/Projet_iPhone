//
//  LessonViewController.m
//  TableView
//
//  Created by Élèves on 09/10/12.
//  Copyright (c) 2012 EvaRousseau. All rights reserved.
//

#import "LessonViewController.h"
#import "LessonObject.h"
#import "DetailLessonViewController.h"

@interface LessonViewController ()

@end

@implementation LessonViewController

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
    self.title = @"Cours";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    // Set it to the right on navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activity];
    [[DownloadManager shared] loadLocalFileName:@"LessonList" withDelegate:self];
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
    LessonObject *l = [_arrayOfContacts objectAtIndex:indexPath.row];
    
    // Display!
    cell.textLabel.text = [NSString stringWithFormat:@"%@", l.title];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", l.date];
    //cell.imageView.image = [UIImage imageNamed:c.image];
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    DetailLessonViewController *detailViewController = [[DetailLessonViewController alloc]init];
    detailViewController.tabBarItem = self.tabBarItem;
    detailViewController.texteAAfficher = [[_arrayOfContacts objectAtIndex:[indexPath row]]description];
    detailViewController.address = [[_arrayOfContacts objectAtIndex:[indexPath row]]adr];
    detailViewController.price = [[_arrayOfContacts objectAtIndex:[indexPath row]]price];
    detailViewController.title = [[_arrayOfContacts objectAtIndex:[indexPath row]]title];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - DownloadDelegate protocol

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    // Stop activity indicator
    [_activity stopAnimating];
    NSLog(@"%@", error);
    // Todo : handle the error
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{
    // Start the activity indicator
    [_activity startAnimating];
}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    // Stop activity indicator
    [_activity stopAnimating];
    
    // Now, we need to go through all the objects loaded in the JSON, parse it, and create new Objective-C objects
    // First, remove previous objects in instance array
    [_arrayOfContacts removeAllObjects];
    
    if (!_arrayOfContacts)
        _arrayOfContacts = [NSMutableArray new];
    
    // Enumerate the json array
    for (NSDictionary *dic in object)
    {
        LessonObject *l = [LessonObject new];
        
        // Set properties from JSON 'object'
        l.date = [dic objectForKey:@"Date"];
        l.title = [dic objectForKey:@"Title"];
        l.adr = [dic objectForKey:@"Address"];
        l.price = [[dic objectForKey:@"Price"]integerValue];
        l.description = [dic objectForKey:@"Description"];
        
        // Add it to the array
        [_arrayOfContacts addObject:l];
    }
    
    // Sort the array
    //[_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES]]];
    
    
    // We are almost done. Please note that the parsing is made here just to avoid complexification. You should always create a model like YouTubeManager class which handles the parsing and give the data to the controller. Remember the MVC pattern
    
    // When we finished, reload the table view
    [self.tableView reloadData];
}

@end
