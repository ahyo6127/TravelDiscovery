# Practice Project 1：Travel Discovery

[ Main Practice ]

- RestFul API：使用 Swift 內建的 網路 API ( URLSession ) 擷取JSON格式的網頁圖片、文字、數值
- ViewModel：定義 擷取網頁圖片文字數值的 class ，以便處理網頁的請求／回應／數據交換／解碼／錯誤回報
- 記憶體管理：使用 NavigationLazyView 避免打開主頁就已下載所有分頁，點進分頁的時候再跑就好，以便節省記憶體
- UI： GeometryReader 製作類似Instagram的圖片格、Picker製作標籤切換頁、 Linear Gradient 製作漸層色、Color(#colorLiteral()) 搭配色碼 製作指定調色

[ import ]

- Models: Foundation
- Views: SwiftUI, MapKit, Kingfisher, SDWebImageSwiftUI

[ Third-party Library ]

- SDWebImage：提供 iOS 圖像下載 ( Objective-C & Swift )。
- Kingfisher： 提供 iOS 圖像下載 ( Swift )。

[ Main UI ]

- Home Screen 主頁面 = DiscoverView
- 支援Dark Mode ( 左Light Mode, 右Dark Mode )
<img width="240" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/13b10f08-5efa-4a77-b2d3-adc33fd279e5">
<img width="240" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/213600e8-b74f-40ba-ab9f-083b0e4844a2">

  
- 主頁面包含：
  
1.DiscoverCategoriesView
<img width="240" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/4ec19832-b8ee-4a33-9a16-739fe39547f0">
<img width="300" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/66a810f9-0126-49b0-8acb-6f97dc32a8a3">

2.PopularDestinationsView
<img width="240" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/e60ffa2a-58b6-4333-91a7-304c819e60d7">
<img width="300" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/fee82650-6965-4f97-baa5-4846b2180aba">

3.PopularRestaurantsView
<img width="240" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/3902622d-bd15-4750-89f5-4af3162e9b97">
<img width="300" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/bc758253-7e67-427b-a245-04bc3fe51240">

4.TrendingCreatorsView
<img width="240" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/dec96399-2eb2-4d6b-9789-34e3aa931d07">
<img width="300" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/e4c145a7-1e28-48d5-8e41-d4cb1ac3d04b">

[ File Description ]  
  
<img width="360" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/7c3734ef-6612-4522-af0b-82fa95cb6ac8">  
  

<img width="600" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/f1f14629-6941-451a-a9f8-cedd88a2e1d6">  
<img width="600" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/f09b3d75-e13e-42d6-a8a9-bbcef713d131">  
<img width="600" alt="截圖" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/298f646f-3745-4310-97f9-7f2846af8bc1">
  
---
  
[ Summary Details of Item ]  

--- Home Screen Layout ---  
1.NavigationView ScrollViews and Stacking  
2.ForEach Hashables and System Images  
3.Destinations Row Images and Sizing  
4.Restaurants and Trending Creators  
5.Linear Gradients and ZStack Layers  
6.Project Clean Up and File Organization  
7.Reduce Code Duplication with ViewModifiers  
  
--- Travel Categories ---  
8.Using NavigationLink to Perform Transitions  
9.Perform Networking using ObservableObject  
10.Decode JSON Objects and JSON Errors  
11.Kingfisher SDWebImage Image Loading  
12.Dependency Injection and Network Errors  
13.NavigationLazyView Bug Fix  
  
--- Destinations ---  
14.Popular Destination Details and Text Fix  
15.SwiftUI Map Views and @State Initialization  
16.Show Map Markers with Toggle  
17.Custom MapAnnotation with RoundedRectangle Borders  
  
--- Swiping with PageViewController ( in Destinations ) ---    
18.Show UIViewController with UIViewControllerRepresentable Container  
19.Integrate Swiping with UIPageViewController and UIHostingController  
20.Inject Images into PageViewController  
21.Load Images from Internet in PageViewController  
22.Fetch Destination Details from API  
  
--- Restaurants ---  
23.Restaurant Details View  
24.Fetch PopularDishes Nested JSON  
25.Customer Reviews with Ratings  
  
--- Photos Grid View ( in Restaurants )---  
26.Restaurant Photos LazyVGrid  
27.GeometryReader 3 Column Image Grid  
28.Picker Grid List Toggle  
29.Present Fullscreen Modal with Photos  
30.Correct Page Index for Carousel Modal  
  
--- User View ---  
31.Navigate to User Details View  
32.Post Card Layout View  
33.Fetch UserDetails JSON  
