//
//  FINAccntDetailsVwCtrl.m
//  Finanzas
//
//  Created by juancarlos on 22/10/13.
//  Copyright (c) 2013 juancarlos. All rights reserved.
//

#import "FINAccntDetailsVwCtrl.h"
#import "FINPersistence.h"

@interface FINAccntDetailsVwCtrl ()

@end

@implementation FINAccntDetailsVwCtrl

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Eliminar" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAccount)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    [self populateList:self.filename];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateList:(NSString*)filename
{
    FINPersistence* myFile = [[FINPersistence alloc] init:filename];
    
    NSString* myString = myFile.contenido;
    NSArray* tempData = [myString componentsSeparatedByString:@"\n"];
    self.details = [[NSMutableArray alloc] init];
    
    for(id element in tempData){
        [self.details addObject:element];
    }
    
    return;
}


- (void)deleteAccount
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Eliminar cuenta"
                                                        message:@"Esta seguro que desea eliminar esta cuenta?"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancelar"
                                              otherButtonTitles:@"Aceptar", nil];
    
    //[alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alertView show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Aceptar"]){
        NSLog(@"Eliminando cuenta");
        NSLog(@"%@",self.indexPath);
        
        NSString* filename = @"cuentas.txt";
        FINPersistence* myFile = [[FINPersistence alloc] init:filename];
        
        NSString* myString = myFile.contenido;
        NSArray* tempArray = [myString componentsSeparatedByString:@"\n"];
        NSMutableArray* tempData = [[NSMutableArray alloc] init];
        
        for(id element in tempArray){
            [tempData addObject:element];
        }
        [tempData removeLastObject];
        
        [tempData removeObjectAtIndex:self.indexPath.row];
        
        NSMutableString* newAccountList = [[NSMutableString alloc] init];
        
        for(id element in tempData){
            [newAccountList appendString:[NSString stringWithFormat:@"%@\n", element]];
        }
        
        [myFile save:newAccountList];
        [self.navigationController popViewControllerAnimated:YES];
        return;
        
    }
    else if ([buttonTitle isEqualToString:@"Cancelar"]){
        NSLog(@"Cancelando");
    }
    
    //which alert view it is?
    //NSString *alertTitle = [alertView title];
    //NSLog(@"%@", alertTitle);
    
    // If plain text or secure text
    //if ([alertView alertViewStyle] == UIAlertViewStylePlainTextInput ||
    //[alertView alertViewStyle] == UIAlertViewStyleSecureTextInput)
    //find the text field by index and then find its value
    //NSLog(@"Text: %@", [[alertView textFieldAtIndex:0] text]);
    
    // Login and password, they have 2 text field at index 0 and 1
    //else if ([alertView alertViewStyle] == UIAlertViewStyleLoginAndPasswordInput)
    //{
    //find the text field by index and then find its value
    //NSLog(@"Login: %@", [[alertView textFieldAtIndex:0] text]);
    //find the text field by index and then find its value
    //NSLog(@"Password: %@", [[alertView textFieldAtIndex:1] text]);
    //}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.details count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.details objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;
    NSLog(@"%@", cellText);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    /*
    self.accountDetailsVwCtrl = [[FINAccountDetailsVwCtrl alloc] init];
    self.accountDetailsVwCtrl.title = cellText;
    [self.accountDetailsVwCtrl setTit:cellText];
    [[self navigationController] pushViewController:self.accountDetailsVwCtrl animated:YES];
    */
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
