//
//  ViewController.m
//  MDYTableViewCellLayoutDemo
//
//  Created by 郑敏 on 15/12/28.
//  Copyright © 2015年 郑敏. All rights reserved.
//

#import "ViewController.h"
#import "MDYLayoutCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    
    
    __weak IBOutlet UITableView *listTb;
    
    NSMutableArray *layoutArr;
}



@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    listTb.delegate = self;
    listTb.dataSource = self;
    
    layoutArr = [NSMutableArray array];
    
    [self createData];
}

- (void)createData {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *mArr = [NSMutableArray array];
        
        // 创建数据
        for (int i = 0; i < 100; i ++) {
            MDYLayoutModel *model = [[MDYLayoutModel alloc] init];
            model.name = @"你好哥";
            
            model.avator = [NSString stringWithFormat:@"avator_%d.jpg", arc4random() %4];
            
            model.text = [NSString stringWithFormat:@"好想吃烧烤好好想吃烧烤好想吃烧烤好好想吃烧烤好想吃烧烤好好想吃烧烤%d", i];
            
            NSMutableArray *picArr = [NSMutableArray array];
            int picCount = arc4random() %4;
            for (int i = 1; i <= picCount; i++) {
                [picArr addObject:[NSString stringWithFormat:@"t_image_%02d.jpg", arc4random() %6]];
            }
            model.pics = [picArr copy];
            
            
            NSMutableArray *reviewArr = [NSMutableArray array];
            int reCount = arc4random() %5;
            for (int i = 0; i < reCount; i++) {
                MDYReviewModel *review = [[MDYReviewModel alloc] init];
                review.name = @"大表哥";
                review.text = @"我是评论我是评论我是评论我是评论我是评论我是评论我是评论";
                [reviewArr addObject:@[review]];
            }
            
            model.reviews = reviewArr;
            
            [mArr addObject:model];
        }
        
        // 创建布局
        for (MDYLayoutModel *model in mArr) {
            MDYLayout *layout = [MDYLayout layoutWithMoment:model];
            [layoutArr addObject:layout];
        }
        
        // 刷新数据
        [listTb reloadData];
        
    });
}

#pragma mark - 代理和协议

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return layoutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MDYLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MDYLayoutCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.layout = layoutArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [layoutArr[indexPath.row] height];
}


@end
