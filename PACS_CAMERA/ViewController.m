//
//  ViewController.m
//  PACS_CAMERA
//
//  Created by Leiyou Who on 15/9/11.
//  Copyright (c) 2015年 Leiyou Who. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "ShowSinglePictureViewController.h"
#import "Picture.h"
#import "Pictures.h"
#import "MagicalRecord.h"

//TODO: 保存图片
//TODO: 单项上传
//TODO: 上传后删除该项

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationBarDelegate>
@property (weak, nonatomic) IBOutlet UIView *imagePickerView;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollection;
- (IBAction)takePhoto:(id)sender;
- (IBAction)upload:(id)sender;
@property (strong, nonatomic) NSMutableArray * imageList;
@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@end

@implementation ViewController

#pragma mark - init
- (NSMutableArray *)imageList {
    if (!_imageList) {
        _imageList = [[NSMutableArray alloc] init];
    }
    return _imageList;
}

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  set navigationItem title
     */
    self.navigationItem.title = self.pictures.patientid;
    
    /**
     * 设置返回按钮，返回至GroupsTableViewController
     */
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(back)];
    [self.navigationItem setLeftBarButtonItem:back];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imagePickerController = [[UIImagePickerController alloc] init];
    });
    
    NSSortDescriptor * sortByTag = [[NSSortDescriptor alloc] initWithKey:@"tag" ascending:YES];
    self.imageList = [[self.pictures.imageDataList sortedArrayUsingDescriptors:@[sortByTag]] mutableCopy];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - navigation
- (void)back {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowSinglePictureViewController"]) {
        ShowSinglePictureViewController *vc = segue.destinationViewController;
        vc.imageData = sender[@"imageData"];
        vc.index = sender[@"index"];
    }
}


- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    ShowSinglePictureViewController *vc = segue.sourceViewController;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) // ipad
    {
        [vc dismissViewControllerAnimated:YES completion:nil];
    }
    [self.imageList removeObjectAtIndex:[vc.index integerValue] ];
    [self.imageCollection deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:[vc.index integerValue] inSection:0]]];
}

#pragma mark - take photo

- (IBAction)takePhoto:(id)sender {
        self.imagePickerController.delegate = (id)self;
        self.imagePickerController.editing = false;
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

// TODO: 上传
- (IBAction)upload:(id)sender {

}

#pragma mark - UICollectionView Data Source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.imageList count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = [UIImage imageWithData: ((Picture *)self.imageList[indexPath.row]).imageData];
    return cell;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *param = @{@"imageData":((Picture *)self.imageList[indexPath.row]).imageData,@"index":@(indexPath.row)};
    [self performSegueWithIdentifier:@"ShowSinglePictureViewController" sender:param];
}

#pragma mark - UIImagePicker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage* originalImage;
    originalImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if(originalImage==nil)
    {
        originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if(originalImage == nil)
    {
        originalImage = [info objectForKey:UIImagePickerControllerCropRect];
    }
    
    // 将图片添加到 self.imageList
    Picture *picture = [Picture MR_createEntity];
    picture.pictures = self.pictures;
    picture.tag = [NSNumber numberWithInteger:[self.imageList count] - 1];
    picture.imageData = UIImageJPEGRepresentation(originalImage, 1);
    [self.imageList addObject:picture];
    [self.imageCollection reloadData];
    
    // 将图片添加到 self.pictures
    [self.pictures addImageDataListObject:picture];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
}

@end
