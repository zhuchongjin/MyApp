//
//  BaseTabViewController.m
//  linjinsuo
//
//  Created by zcj on 2018/4/2.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseTabViewController.h"

@interface BaseTabViewController ()

@end

@implementation BaseTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.psddDic = [[NSMutableDictionary alloc] initWithCapacity:3];
    [self.psddDic setObject:@"03" forKey:@"channel"];
    [self.psddDic setObject:@"f683adab1b3f4f189f9a512d537264c9" forKey:@"sid"];
    [self.psddDic setObject:@"1.0.0" forKey:@"version"];
    [self.psddDic setObject:@"dataQuery" forKey:@"service"];
    [self.psddDic setObject:@"" forKey:@"pid"];
    //预先加载url
    
    
    self.BodyDic = [[NSMutableDictionary alloc]initWithCapacity:3];
    self.param = [[NSMutableDictionary alloc]initWithCapacity:3];
    [self isLogin];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(NSString *) urldecode:(NSMutableDictionary *) input
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:input options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString * url =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    return url;
}
-(BOOL)isLogin
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary * userinfo = [userDefault objectForKey:@"UserInfo"];
    if (IsNilOrNull(userinfo)) {
        return NO;
    }else
    {
        [self.psddDic setObject:[userinfo valueForKey:@"linKingTokenPid"] forKey:@"pid"];
        [self.psddDic setObject:[userinfo valueForKey:@"linKingTokenSid"] forKey:@"sid"];
        return YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
