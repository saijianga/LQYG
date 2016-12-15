//
//  PodPictureViewController.m
//  LQYG
//
//  Created by issuser on 2016/12/7.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "PodPictureViewController.h"
#import "TZImagePickerController.h"
#import "PodCollectionViewCell.h"
#import "ShowPodViewController.h"
@interface PodPictureViewController ()<TZImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,PodCollectionViewCellDelegate>
@property(nonatomic,strong)UICollectionView *_collectionView;
@property(nonatomic,strong)NSMutableArray *imageArr;
@end

@implementation PodPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArr = [[NSMutableArray alloc] init];
    [_imageArr addObject:[UIImage imageNamed:@"加号.png"]];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    __collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    __collectionView.backgroundColor = [UIColor whiteColor];
    __collectionView.delegate = self;
    __collectionView.dataSource = self;
    
    [__collectionView registerNib:[UINib nibWithNibName:@"PodCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"podCell"];
    
    [self.view addSubview:__collectionView];
    
    
    
   
    
   
  //  [self presentViewController:_imagePicker animated:YES completion:nil];
    
    // Do any additional setup after loading the view.
}
#warning 代理
-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    if (photos.count > 0) {
        for (int i = 0; i < photos.count; i++) {
//            [_imageArr addObject:photos[i]];
            [_imageArr insertObject:photos[i] atIndex:0];
        }
    }
    
    [__collectionView reloadData];
   
}
#pragma collectionview代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageArr.count;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10.f;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10.f;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"podCell" forIndexPath:indexPath];
    cell.PodImageView.image = _imageArr[indexPath.row];
    if (indexPath.row == (_imageArr.count - 1)) {
        cell.PodCancelButton.hidden = YES;
      
    }
    else
        cell.PodCancelButton.hidden = NO;
    cell.delegate = self;
    return cell;
}
-(void)deleagteCell:(PodCollectionViewCell *)cell{
    NSIndexPath *path = [__collectionView indexPathForCell:cell];
    [_imageArr removeObjectAtIndex:path.row];
    [__collectionView reloadData];
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == (_imageArr.count - 1)) {
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
        //禁止内部可以选择拍照
        imagePickerVc.allowTakePicture = NO;
        
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
    else{
        [_imageArr removeLastObject];
        ShowPodViewController *podController = [[ShowPodViewController alloc] init];
        podController.image = _imageArr[indexPath.row];
        podController.dataArr = _imageArr;
        [self.navigationController pushViewController:podController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
