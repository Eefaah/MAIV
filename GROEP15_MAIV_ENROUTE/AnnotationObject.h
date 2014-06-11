//
//  AnnotationObject.h
//  GROEP15_MAIV_ENROUTE
//
//  Created by Eva Pieters on 11/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AnnotationObject : NSObject <MKAnnotation>
@property (nonatomic) int identifier;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@end
