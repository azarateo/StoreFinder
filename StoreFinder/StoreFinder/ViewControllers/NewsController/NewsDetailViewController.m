//
//  NewsDetailViewController.m
//  StoreFinder
//
//
//  Copyright (c) 2014 Mangasaur Games. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()<UISplitViewControllerDelegate, UIWebViewDelegate, UIScrollViewDelegate> {
    MBProgressHUD* _hud;
}

@end

@implementation NewsDetailViewController

@synthesize barButtonBack;
@synthesize barButtonForward;
@synthesize barButtonRefresh;
@synthesize webViewMain;

@synthesize strUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [MGUIAppearance createLogo:HEADER_LOGO];
    self.view.backgroundColor = BG_VIEW_COLOR;
    
    [MGUIAppearance enhanceNavBarController:self.navigationController
                               barTintColor:WHITE_TEXT_COLOR
                                  tintColor:WHITE_TEXT_COLOR
                             titleTextColor:WHITE_TEXT_COLOR];
    
    webViewMain.dataDetectorTypes = UIDataDetectorTypeAll;
	webViewMain.scalesPageToFit = YES;
    webViewMain.multipleTouchEnabled = NO;
    webViewMain.scrollView.delegate = self;
    webViewMain.delegate = self;
    
    NSRange rangeHttp = [strUrl rangeOfString : @"http://"];
    NSRange rangeHttps = [strUrl rangeOfString : @"https://"];
    NSString* newUrlStr = strUrl;
    
    BOOL isHttp = rangeHttp.location != NSNotFound ? YES : NO;
    BOOL isHttps = rangeHttps.location != NSNotFound ? YES : NO;
    
    if(!isHttp && !isHttps)
        newUrlStr = [@"http://" stringByAppendingString:strUrl];
    
    
    NSURL* url = [NSURL URLWithString:newUrlStr];
    
    if(![MGUtilities hasInternetConnection]) {
        
        [MGUtilities showAlertTitle:LOCALIZED(@"NETWORK_ERROR")
                            message:LOCALIZED(@"NETWORK_ERROR_DETAILS")];
        return;
    }
    
    [webViewMain loadRequest:[NSURLRequest requestWithURL:url]];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {

    NSLog(@"Finish load");
    if ([[webView stringByEvaluatingJavaScriptFromString:@"document.readyState"] isEqualToString:@"complete"]) {
        // UIWebView object has fully loaded.
        [_hud removeFromSuperview];
        _hud = nil;
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Start load");
    
    if(_hud == nil) {
        _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        _hud.mode = MBProgressHUDModeIndeterminate;
        _hud.labelText = @"Loading";
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    NSLog(@"Failed Loading");
    
    [_hud removeFromSuperview];
    _hud = nil;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)didClickBarButtonBack:(id)sender {

    if(webViewMain.canGoBack)
        [webViewMain goBack];
}

-(IBAction)didClickBarButtonForward:(id)sender {
    
    if(webViewMain.canGoForward)
        [webViewMain goForward];
}

-(IBAction)didClickBarButtonRefresh:(id)sender {
    [webViewMain reload];
}

@end
