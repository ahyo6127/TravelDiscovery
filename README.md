# Travel Discovery：Practice Project 1

[ Main Practice ]  
* 定義 struct 網頁擷取交換資料 的協議為 Decodable
* 定義 class 請求／處理回應／數據交換／解碼／處理錯誤 的協議為 ObservableObject，  
並以 ViewModel作為名稱結尾（網頁資料發生改變時就會自動的在 UI 上刷新）
* 使用 Swift 內建的網路API ( URLSession ) 擷取JSON格式的網頁圖片、文字、數值
* 使用 SDWebImage/Kingfisher 將網頁圖片放置在需要位置
    
* 使用 NavigationLazyView 避免打開主頁就已下載所有分頁，點進分頁的時候再跑就好，以便節省記憶體
* 使用 GeometryReader 製作類似Instagram的圖片格及利用Picker製作標籤切換頁
* 使用 Linear Gradient 製作漸層色
* 使用 Color(#colorLiteral()) 搭配色碼 https://rgbcolorpicker.com/0-1 製作指定調色
  
[ import ] 
* Models: Foundation
* Views: SwiftUI, MapKit, Kingfisher, SDWebImageSwiftUI

[ Third-party Library ]
* SDWebImage：提供 iOS 圖像下載 ( Objective-C & Swift )。  
* Kingfisher： 提供 iOS 圖像下載 ( Swift )。  

[ Main UI ]   
* Home Screen 主頁面 = DiscoverView

<img width="361" alt="截圖 2024-03-25 18 34 39" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/4d749c31-c257-43dd-b748-8326330f0508">
<img width="361" alt="截圖 2024-03-25 18 34 55" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/c83dceb4-a790-4785-b0f8-e882372edc0b">
  
* 主頁面包含：  
  1.DiscoverCategoriesView
   <img width="356" alt="截圖 2024-03-25 18 31 55" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/00dc78be-a011-4ef0-b445-ed1fec0e643e">  
  2.PopularDestinationsView
   <img width="364" alt="截圖 2024-03-25 18 32 07" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/e26f9396-0a03-4ffe-9dd8-a121dc149ce4">  
  3.PopularRestaurantsView
   <img width="363" alt="截圖 2024-03-25 18 32 13" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/e1c0ee26-9201-44f4-8062-db4ad1db6549">  
  4.TrendingCreatorsView __
   <img width="361" alt="截圖 2024-03-25 18 32 25" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/7cdf93a5-bb6a-48fa-aea9-204f11d48717">
    
[ File Description ]  
<img width="321" alt="截圖 2024-03-25 12 33 43" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/7c3734ef-6612-4522-af0b-82fa95cb6ac8">  

<img width="727" alt="截圖 2024-03-25 13 29 56" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/f1f14629-6941-451a-a9f8-cedd88a2e1d6">
<img width="728" alt="截圖 2024-03-25 13 30 13" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/f09b3d75-e13e-42d6-a8a9-bbcef713d131">
<img width="732" alt="截圖 2024-03-25 13 30 26" src="https://github.com/ahyo6127/TravelDiscovery/assets/57893533/298f646f-3745-4310-97f9-7f2846af8bc1">
  
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
