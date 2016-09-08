//
//  IntentHandler.m
//  SiriKitIntentDemo
//
//  Created by uwei on 9/8/16.
//  Copyright © 2016 Tencent. All rights reserved.
//

#import "IntentHandler.h"

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Start my workout using <myApp>"
// "Pause my workout using <myApp>"
// "Resume my workout using <myApp>"
// "Cancel my workout using <myApp>"
// "End my workout using <myApp>"

@interface IntentHandler () <INStartWorkoutIntentHandling, INPauseWorkoutIntentHandling, INResumeWorkoutIntentHandling, INCancelWorkoutIntentHandling, INEndWorkoutIntentHandling, INSendMessageIntentHandling>

@end

@implementation IntentHandler

- (id)handlerForIntent:(INIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    
    id handler = nil;
    
    // You can substitute other objects for self based on the specific intent.
    if ([intent isKindOfClass:[INStartWorkoutIntent class]] ||
        [intent isKindOfClass:[INPauseWorkoutIntent class]] ||
        [intent isKindOfClass:[INResumeWorkoutIntent class]] ||
        [intent isKindOfClass:[INCancelWorkoutIntent class]] ||
        [intent isKindOfClass:[INEndWorkoutIntent class]] ||
        [intent isKindOfClass:[INSendMessageIntent class]]
        ) {
        handler = self;
    }
    
    return handler;
}

#pragma mark - INStartWorkoutIntentHandling

// Implement resolution methods to provide additional information about your intent (optional).

- (void)resolveIsOpenEndedForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INBooleanResolutionResult * _Nonnull))completion {
    INBooleanResolutionResult *resolutionResult = [INBooleanResolutionResult successWithResolvedValue:NO];
    completion(resolutionResult);
}

- (void)resolveGoalValueForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INDoubleResolutionResult * _Nonnull))completion {
    INDoubleResolutionResult *resolutionResult = [INDoubleResolutionResult successWithResolvedValue:5];
    completion(resolutionResult);
}

- (void)resolveWorkoutGoalUnitTypeForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INWorkoutGoalUnitTypeResolutionResult * _Nonnull))completion {
    INWorkoutGoalUnitTypeResolutionResult *resolutionResult = [INWorkoutGoalUnitTypeResolutionResult successWithResolvedValue:INWorkoutGoalUnitTypeMinute];
    completion(resolutionResult);
}

- (void)resolveWorkoutLocationTypeForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INWorkoutLocationTypeResolutionResult * _Nonnull))completion {
    INWorkoutLocationTypeResolutionResult *resolutionResult = [INWorkoutLocationTypeResolutionResult successWithResolvedValue:INWorkoutLocationTypeIndoor];
    completion(resolutionResult);
}

- (void)resolveWorkoutNameForStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent withCompletion:(void (^)(INSpeakableStringResolutionResult * _Nonnull))completion {
    // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
    INSpeakableString *resolvedWorkoutName = [[INSpeakableString alloc] initWithIdentifier:@"latissimus_dorsi_pulldown" spokenPhrase:@"Lat Pulldown"  pronunciationHint:@"lat pull down"];
    INSpeakableStringResolutionResult *resolutionResult = [INSpeakableStringResolutionResult successWithResolvedString:resolvedWorkoutName];
    completion(resolutionResult);
}

// Once resolution is completed, perform validation on the intent and provide confirmation (optional).

- (void)confirmStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent completion:(void (^)(INStartWorkoutIntentResponse * _Nonnull))completion {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INStartWorkoutIntent class])];
    INStartWorkoutIntentResponse *response = [[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}

// Handle the completed intent (required).

- (void)handleStartWorkout:(INStartWorkoutIntent *)startWorkoutIntent completion:(void (^)(INStartWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to start a workout here.
    
    // Update application state by updating NSUserActivity.
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INStartWorkoutIntent class])];
    INStartWorkoutIntentResponse *response = [[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

// Implement handlers for each intent you wish to handle.  As an example for workouts, you may wish to handle pause, resume, cancel, and end.

#pragma mark - INPauseWorkoutIntentHandling

- (void)handlePauseWorkout:(INPauseWorkoutIntent *)pauseWorkoutIntent completion:(void (^)(INPauseWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to pause a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INPauseWorkoutIntent class])];
    INPauseWorkoutIntentResponse *response = [[INPauseWorkoutIntentResponse alloc] initWithCode:INPauseWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

#pragma mark - INResumeWorkoutIntentHandling

- (void)handleResumeWorkout:(INResumeWorkoutIntent *)resumeWorkoutIntent completion:(void (^)(INResumeWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to resume a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INResumeWorkoutIntent class])];
    INResumeWorkoutIntentResponse *response = [[INResumeWorkoutIntentResponse alloc] initWithCode:INResumeWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

#pragma mark - INCancelWorkoutIntentHandling

- (void)handleCancelWorkout:(INCancelWorkoutIntent *)cancelWorkoutIntent completion:(void (^)(INCancelWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to cancel a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INCancelWorkoutIntent class])];
    INCancelWorkoutIntentResponse *response = [[INCancelWorkoutIntentResponse alloc] initWithCode:INCancelWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

#pragma mark - INEndWorkoutIntentHandling

- (void)handleEndWorkout:(INEndWorkoutIntent *)endWorkoutIntent completion:(void (^)(INEndWorkoutIntentResponse * _Nonnull))completion {
    // Implement your application logic to end a workout here.
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INEndWorkoutIntent class])];
    INEndWorkoutIntentResponse *response = [[INEndWorkoutIntentResponse alloc] initWithCode:INEndWorkoutIntentResponseCodeContinueInApp userActivity:userActivity];
    completion(response);
}

#pragma mark - INSendingMessageIntentHandling

- (void)resolveContentForSendMessage:(INSendMessageIntent *)intent withCompletion:(void (^)(INStringResolutionResult * _Nonnull))completion {
    INStringResolutionResult *result = nil;
    if (intent.content) {
        result = [INStringResolutionResult successWithResolvedString:intent.content];
    } else {
        // if without value please insult to user
        result = [INStringResolutionResult needsValue];
    }
    
    completion(result);
}

- (void)resolveRecipientsForSendMessage:(INSendMessageIntent *)intent withCompletion:(void (^)(NSArray<INPersonResolutionResult *> * _Nonnull))completion {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"count = %u", intent.recipients.count);
//    completion(@[[INStringResolutionResult needsValue]]);
    if (intent.recipients.count <= 0) {
        completion(@[[INStringResolutionResult needsValue]]);
        return;
    }
    
    NSMutableArray<INPersonResolutionResult *> *resolutionResults = [[NSMutableArray alloc] init];
    
    for (INPerson *recipient in intent.recipients) {
        [resolutionResults addObject:[INPersonResolutionResult successWithResolvedPerson:recipient]];
    }
    
    completion(resolutionResults);
}


- (void)confirmSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion {
    INSendMessageIntentResponse *response = nil;
    NSUserActivity *activity = nil;
    if (intent.recipients.count <= 0 || !intent.content) { //check
        response = [[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeFailure userActivity:activity];
    } else {
        response = [[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeSuccess userActivity:activity];
    }
    
    completion(response);
}

- (void)handleSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion {
    INSendMessageIntentResponse *response = [[INSendMessageIntentResponse alloc] initWithCode:(INSendMessageIntentResponseCodeSuccess) userActivity:nil];
    completion(response);
    // 业务逻辑实现
}




@end
