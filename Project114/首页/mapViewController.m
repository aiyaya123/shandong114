//
//  mapViewController.m
//  Project114
//
//  Created by fosung_002 on 16/8/10.
//  Copyright © 2016年 fosung_002. All rights reserved.
//

#import "mapViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>

@interface mapViewController ()<BMKMapViewDelegate>
{
    
    BMKMapView* _mapView;
    BMKPinAnnotationView * newAnnotationView;
    NSMutableArray *annoArray;
    BMKPointAnnotation* pointAnnotation;
    
}
@end

@implementation mapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
   
    _mapView.delegate=self;
    self.view = _mapView;

    [self createView];
}


-(void)createView
{

    if (pointAnnotation == nil) {
        pointAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = 41.915;
        coor.longitude = 116.404;
        pointAnnotation.coordinate = coor;
        pointAnnotation.title = @"test";
        pointAnnotation.subtitle = @"此Annotation可拖拽!";
         [_mapView setCenterCoordinate:pointAnnotation.coordinate animated:YES];
    }
    [_mapView addAnnotation:pointAnnotation];

    
    
    
}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    //普通annotation
//    if (annotation == pointAnnotation) {
        NSString *AnnotationViewID = @"renameMark";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            // 设置颜色
            annotationView.pinColor = BMKPinAnnotationColorPurple;
            // 从天上掉下效果
            annotationView.animatesDrop = YES;
            // 设置可拖拽
            annotationView.draggable = YES;
            annotationView.image=[UIImage imageNamed:@"datou.png"];
        }
        return annotationView;
//    }
    
    
}

- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
    NSLog(@"paopaoclick");
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
