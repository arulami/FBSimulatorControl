/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <XCTest/XCTest.h>

@interface MacUnitTestFixtureTests : XCTestCase

@end

@implementation MacUnitTestFixtureTests

- (void)setUp
{
  NSLog(@"Started running MacUnitTestFixtureTests");
}

- (void)testIsRunningOnIOS
{
  XCTAssertNotNil(NSClassFromString(@"UIView"));
}

- (void)testIsRunningInIOSApp
{
  XCTAssertNotNil([NSClassFromString(@"UIApplication") performSelector:@selector(sharedApplication)]);
}

- (void)testIsRunningOnMacOSX
{
  XCTAssertNotNil(NSClassFromString(@"NSView"));
}

- (void)testIsRunningInMacOSXApp
{
  XCTAssertNotNil([NSClassFromString(@"NSApplication") performSelector:@selector(sharedApplication)]);
}

- (void)testHostProcessIsXctest
{
  XCTAssertTrue([NSProcessInfo.processInfo.processName isEqualToString:@"xctest"]);
}

- (void)testHostProcessIsMobileSafari
{
  XCTAssertTrue([NSProcessInfo.processInfo.processName isEqualToString:@"MobileSafari"]);
}

- (void)testPossibleCrashingOfHostProcess
{
  if ([NSProcessInfo.processInfo.environment[@"TEST_FIXTURE_SHOULD_CRASH"] boolValue]) {
    NSLog(@"'TEST_FIXTURE_SHOULD_CRASH' is True, aborting");
    abort();
  }
}

- (void)testWillAlwaysPass
{
  // do nothing
}

- (void)testWillAlwaysFail
{
  XCTFail(@"This always fails");
}

@end
