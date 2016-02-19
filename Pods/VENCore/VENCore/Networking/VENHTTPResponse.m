#import "VENHTTPResponse.h"
#import "NSError+VENCore.h"
#import "NSDictionary+VENCore.h"

NSString *const VENErrorDomainHTTPResponse = @"com.venmo.VENCore.ErrorDomain.VENHTTPResponse";

@interface VENHTTPResponse ()

@property (nonatomic, readwrite, strong) id object;
@property (nonatomic, readwrite, assign) NSInteger statusCode;

@end

@implementation VENHTTPResponse

- (instancetype)initWithStatusCode:(NSInteger)statusCode responseObject:(id)object {
    self = [self init];
    if (self) {
        self.statusCode = statusCode;
        self.object = object;
    }
    return self;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"<VENHTTPResponse statusCode:%d body:%@>", (int)self.statusCode, self.object];
}


- (BOOL)didError {
    return self.statusCode > 299;
}


- (NSError *)error {
    if (![self didError]) {
        return nil;
    }

    NSDictionary *errorObject = [self.object objectOrNilForKey:@"error"];
    NSString *message = [errorObject stringForKey:@"message"];
    NSError *error;
    if (message) {
        NSString *codeString = [errorObject objectOrNilForKey:@"code"] ?: [errorObject[@"errors"] lastObject][@"error_code"];
        NSInteger code = [codeString integerValue];
        error = [NSError errorWithDomain:VENErrorDomainHTTPResponse
                                    code:code
                             description:message
                      recoverySuggestion:nil];
    }

    return error;
}

@end
