/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "EC2DescribeReservedInstancesRequestMarshaller.h"

@implementation EC2DescribeReservedInstancesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeReservedInstancesRequest *)describeReservedInstancesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeReservedInstances"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeReservedInstancesRequest delegate]];
    [request setCredentials:[describeReservedInstancesRequest credentials]];
    [request setEndpoint:[describeReservedInstancesRequest requestEndpoint]];

    if (describeReservedInstancesRequest != nil) {
        int reservedInstancesIdsListIndex = 1;
        for (NSString *reservedInstancesIdsListValue in describeReservedInstancesRequest.reservedInstancesIds) {
            if (reservedInstancesIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", reservedInstancesIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ReservedInstancesId", reservedInstancesIdsListIndex]];
            }
            reservedInstancesIdsListIndex++;
        }
    }

    if (describeReservedInstancesRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeReservedInstancesRequest.filters) {
            if (filtersListValue != nil) {
                if (filtersListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", filtersListValue.name] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Filter", filtersListIndex, @"Name"]];
                }
            }
            if (filtersListValue != nil) {
                int valuesListIndex = 1;
                for (NSString *valuesListValue in filtersListValue.values) {
                    if (valuesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", valuesListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d", @"Filter", filtersListIndex, @"Value", valuesListIndex]];
                    }
                    valuesListIndex++;
                }
            }

            filtersListIndex++;
        }
    }


    return [request autorelease];
}

@end

