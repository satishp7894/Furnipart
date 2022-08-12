// import 'dart:convert';
// import 'dart:io';
// import 'package:desire_production/model/address_model.dart';
// import 'package:desire_production/model/admin_chat_details_model.dart';
// import 'package:desire_production/model/admin_chat_list_model.dart';
// import 'package:desire_production/model/cart_model.dart';
// import 'package:desire_production/model/category_list_model.dart';
// import 'package:desire_production/model/credit_list_model.dart';
// import 'package:desire_production/model/customer_list_for_chat_model.dart';
// import 'package:desire_production/model/dailyOrderListModel.dart';
// import 'package:desire_production/model/dailyProductionListModel.dart';
// import 'package:desire_production/model/dashboard_production_model.dart';
// import 'package:desire_production/model/dispatchOrderDetailsModel.dart';
// import 'package:desire_production/model/modelList_model.dart';
// import 'package:desire_production/model/modelNoWiseListModel.dart';
// import 'package:desire_production/model/model_listing_model.dart';
// import 'package:desire_production/model/order_model.dart';
// import 'package:desire_production/model/order_track_model.dart';
// import 'package:desire_production/model/product_list_order_model.dart';
// import 'package:desire_production/model/production_order_model.dart';
// import 'package:desire_production/model/readyToDispatchListModel.dart';
// import 'package:desire_production/model/role_model.dart';
// import 'package:desire_production/model/sales_customer_list_model.dart';
// import 'package:desire_production/model/salesman_list_for_chat_model.dart';
// import 'package:desire_production/model/user_model.dart';
// import 'package:desire_production/model/warehouse_dashboard_model.dart';
// import 'package:http_parser/http_parser.dart';
//
// import 'package:desire_production/model/category_model.dart';
// import 'package:desire_production/model/dispatch_processing_model.dart';
// import 'package:desire_production/model/kyc_model.dart';
// import 'package:desire_production/model/kyc_view_model.dart';
// import 'package:desire_production/model/product_list_model.dart';
// import 'package:desire_production/model/product_model.dart';
// import 'package:desire_production/model/warehouse_list_model.dart';
// import 'package:http/http.dart' as http;
//
// import 'package:desire_production/model/dashboard_count_model.dart';
//
// import 'connections.dart';
//
// class ApiClient {
//
//   Future<DashboardCountModel> getDashboardCount() async {
//     var response = await http.post(Uri.parse(Connection.dashboardCount), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("kyc response $result");
//
//
//     DashboardCountModel dashboardCountModel;
//     dashboardCountModel = (DashboardCountModel.fromJson(result));
//     print("dashboardCountModel $dashboardCountModel");
//
//     return dashboardCountModel;
//   }
//
//   Future<AdminChatDetailsModel> getAdminChatDetails(dynamic conversationId) async {
//     var response = await http.post(Uri.parse(Connection.adminChatDetails), body: {
//       "secretkey": Connection.secretKey,
//       "conversation_id":conversationId
//     });
//     var result = json.decode(response.body);
//     print("AdminChatListModel $result");
//
//
//     AdminChatDetailsModel adminChatDetailsModel;
//     adminChatDetailsModel = (AdminChatDetailsModel.fromJson(result));
//     print("adminChatDetailsModel $adminChatDetailsModel");
//
//     return adminChatDetailsModel;
//   }
//
//   Future<AdminChatListModel> getAdminChatList() async {
//     var response = await http.post(Uri.parse(Connection.adminChatList), body: {
//       "secretkey": Connection.secretKey,
//       "admin_id": "1"
//     });
//     var result = json.decode(response.body);
//     print("AdminChatListModel $result");
//
//
//     AdminChatListModel adminChatListModel;
//     adminChatListModel = (AdminChatListModel.fromJson(result));
//     print("adminChatListModel $adminChatListModel");
//
//     return adminChatListModel;
//   }
//
//  Future<CustomerListForChatModel> getCustomerListForChat() async {
//     var response = await http.post(Uri.parse(Connection.customerListForChat), body: {
//       "secretkey": Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("CustomerListForChatModel $result");
//
//
//     CustomerListForChatModel customerListForChatModel;
//     customerListForChatModel = (CustomerListForChatModel.fromJson(result));
//     print("customerListForChatModel $customerListForChatModel");
//
//     return customerListForChatModel;
//   }
//
//  Future<SalesmanListForChatModel> getSalesmanListForChat() async {
//     var response = await http.post(Uri.parse(Connection.salesmanListForChat), body: {
//       "secretkey": Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("SalesmanListForChatModel $result");
//
//
//     SalesmanListForChatModel salesmanListForChatModel;
//     salesmanListForChatModel = (SalesmanListForChatModel.fromJson(result));
//     print("salesmanListForChatModel $salesmanListForChatModel");
//
//     return salesmanListForChatModel;
//   }
//
//   Future<ProductionDashBoardModel> getProductionDashboardCount() async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/poductionDashoard"), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("kyc response $result");
//
//
//     ProductionDashBoardModel productionDashBoardModel;
//     productionDashBoardModel = (ProductionDashBoardModel.fromJson(result));
//     print("productionDashBoardModel $productionDashBoardModel");
//
//     return productionDashBoardModel;
//   }
//
//   Future<WarehouseDashBoardModel> getWarehouseDashboardCount() async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/warehouseDashoard"), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("warehouseDashBoard response $result");
//
//
//     WarehouseDashBoardModel warehouseDashBoardModel;
//     warehouseDashBoardModel = (WarehouseDashBoardModel.fromJson(result));
//     print("warehouseDashBoardModel $warehouseDashBoardModel");
//
//     return warehouseDashBoardModel;
//   }
//
//   Future<DailyProductionListModel> getDailyProductionList() async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/dailyProductionList"), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("product  response $result");
//
//
//     DailyProductionListModel dailyProductionListModel;
//     dailyProductionListModel = (DailyProductionListModel.fromJson(result));
//     print("productListModel $dailyProductionListModel");
//
//     return dailyProductionListModel;
//   }
//
//   Future<DailyOrdersListModel> getDailyOrdersList() async {
//     var response = await http.post(Uri.parse(Connection.dailyOrderList), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print(" daily order response $result");
//
//
//     DailyOrdersListModel dailyProductionListModel;
//     dailyProductionListModel = (DailyOrdersListModel.fromJson(result));
//     print("daily productListModel $dailyProductionListModel");
//
//     return dailyProductionListModel;
//   }
//
//   Future<ProductListModel> getProductionPlanningList() async {
//     var response = await http.post(Uri.parse(Connection.productionPlanningList), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("product daily response $result");
//
//
//     ProductListModel productListModel;
//     productListModel = (ProductListModel.fromJson(result));
//     print("productionPlanningList $productListModel");
//
//     return productListModel;
//   }
//
//   Future<WareHouseListModel> getWareHouseList() async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/warehouseList"), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("ware house response $result");
//
//
//     WareHouseListModel wareHouseListModel;
//     wareHouseListModel = (WareHouseListModel.fromJson(result));
//     print("warhouseList $wareHouseListModel");
//
//     return wareHouseListModel;
//   }
//
//   Future<ReadyToDispatchListModel> getReadyToDispatchList() async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/readyToDispatchList"), body: {
//       "secretkey": Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("readyToDispatchList response $result");
//
//
//     ReadyToDispatchListModel readyToDispatchListModel;
//     readyToDispatchListModel = (ReadyToDispatchListModel.fromJson(result));
//     print("readyToDispatchListModel $readyToDispatchListModel");
//
//     return readyToDispatchListModel;
//   }
//
//   Future<DispatchOrderDetailsModel> getDispatchOrderDetailsList(var orderId) async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/dispatchOrderDetailsList"), body: {
//       "secretkey": Connection.secretKey,
//       "order_id" : orderId
//     });
//     var result = json.decode(response.body);
//     print("dispatchOrderDetailsModel response $result");
//
//
//     DispatchOrderDetailsModel dispatchOrderDetailsModel;
//     dispatchOrderDetailsModel = (DispatchOrderDetailsModel.fromJson(result));
//     print("dispatchOrderDetailsModel $dispatchOrderDetailsModel");
//
//     return dispatchOrderDetailsModel;
//   }
//
//   Future<DispatchProcessingModel> getDispatchProcessing(String warehouseKey, String productId, String warehouseId) async {
//     var response = await http.post(Uri.parse(Connection.dispatchProcessing), body: {
//       "secretkey": Connection.secretKey,
//       "number":warehouseKey,
//       "product":productId,
//       "id":warehouseId,
//
//     });
//     var result = json.decode(response.body);
//     print("ware house response $result");
//
//
//     DispatchProcessingModel dispatchProcessing;
//     dispatchProcessing = (DispatchProcessingModel.fromJson(result));
//     print("warhouseList $dispatchProcessing");
//
//     return dispatchProcessing;
//   }
//
//   Future<ProductModel> getProductList() async {
//     var response = await http.post(Uri.parse(Connection.productList), body: {
//       "secretkey": Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("ware house response $result");
//
//
//     ProductModel productListModel;
//     productListModel = (ProductModel.fromJson(result));
//     print("warhouseList $productListModel");
//
//     return productListModel;
//   }
//
//   Future<ModelListModel> getModelList(String customerId) async {
//     var response = await http.post(Uri.parse(Connection.modelList), body: {
//       "secretkey": Connection.secretKey,
//       "customer_id":"$customerId"
//     });
//     var result = json.decode(response.body);
//     print("model house response $result");
//
//
//     ModelListModel modelListModel;
//     modelListModel = (ModelListModel.fromJson(result));
//     print("model $modelListModel");
//
//     return modelListModel;
//   }
//
//   Future<ProductModel> getProductDetails(String productID, String id) async {
//     var response = await http.post(Uri.parse(Connection.productDetails), body: {
//       "secretkey" : Connection.secretKey,
//       "product_id" : productID,
//       "customer_id" : "$id"
//     });
//     var result = json.decode(response.body);
//     print("new product response $result");
//
//
//     ProductModel _productModel;
//     _productModel = (ProductModel.fromJson(result));
//     print("new product api $_productModel");
//
//     return _productModel;
//   }
//
//   Future<ProductModel> getNewProductDetails(String id) async {
//     var response = await http.post(Uri.parse(Connection.newProduct), body: {
//       "secretkey" : Connection.secretKey,
//       "customer_id" : "$id"
//     });
//     var result = json.decode(response.body);
//     print("new product response $result");
//
//
//     ProductModel _productModel;
//     _productModel = (ProductModel.fromJson(result));
//     print("new product api $_productModel");
//
//     return _productModel;
//   }
//
//   Future<ProductModel> getBestProductDetails(String id) async {
//     var response = await http.post(Uri.parse(Connection.bestProduct), body: {
//       "secretkey" : Connection.secretKey,
//       "customer_id" : "$id"
//     });
//     var result = json.decode(response.body);
//     print("best product response $result");
//
//
//     ProductModel _productModel;
//     _productModel = (ProductModel.fromJson(result));
//     print("best product api $_productModel");
//
//     return _productModel;
//   }
//
//   Future<ProductModel> getFutureProductDetails(String id) async {
//     var response = await http.post(Uri.parse(Connection.futureProduct), body: {
//       "secretkey" : Connection.secretKey,
//       "customer_id" : "$id"
//     });
//     var result = json.decode(response.body);
//     print("future product response $result");
//
//
//     ProductModel _productModel;
//     _productModel = (ProductModel.fromJson(result));
//     print("future product api $_productModel");
//
//     return _productModel;
//   }
//
//   Future<ProductModel> getAccessoryDetails(String id) async {
//     var response = await http.post(Uri.parse(Connection.accessory), body: {
//       "secretkey" : Connection.secretKey,
//       "customer_id" : "$id"
//     });
//     var result = json.decode(response.body);
//     print("AccessoryModel product response $result");
//
//
//     ProductModel _accessModel;
//     _accessModel = (ProductModel.fromJson(result));
//     print("future product api $_accessModel");
//
//     return _accessModel;
//   }
//
//   Future<ProductModel> getCategoryWiseProductDetails(String id) async {
//     print("object string $id");
//     var response = await http.post(Uri.parse(Connection.categoryWiseList), body: {
//       "secretkey" : Connection.secretKey,
//       "category_id" : id,
//       "customer_id" : "$id"
//     });
//     var result = json.decode(response.body);
//     print("category product response $result");
//
//
//     ProductModel _productModel;
//     _productModel = (ProductModel.fromJson(result));
//     print("category product api ${_productModel.status}");
//
//     return _productModel;
//   }
//
//   Future<ProductModel> getSearchProductDetails(String search, String id) async {
//     print("object string $search");
//     var response = await http.post(Uri.parse(Connection.searchProduct), body: {
//       "secretkey" : Connection.secretKey,
//       "search_keyword" : search,
//       "customer_id" : "$id"
//     });
//     var result = json.decode(response.body);
//     print("search product response $result");
//
//
//     ProductModel _productModel;
//     _productModel = (ProductModel.fromJson(result));
//     print("search product api ${_productModel.status}");
//
//     return _productModel;
//   }
//
//   Future<ProductModel> getSearchAccessoriesDetails(String search) async {
//     print("object string $search");
//     var response = await http.post(Uri.parse(Connection.searchAccessories), body: {
//       "secretkey" : Connection.secretKey,
//       "search_keyword" : search,
//       //"customer_id" : "77"
//     });
//     var result = json.decode(response.body);
//     print("search product response $result");
//
//
//     ProductModel _accModel;
//     _accModel = (ProductModel.fromJson(result));
//     print("search product api ${_accModel.status}");
//
//     return _accModel;
//   }
//
//   Future<CategoryModel> getCategoryDetails() async {
//     var response = await http.post(Uri.parse(Connection.categoryList), body: {
//       "secretkey" : Connection.secretKey,
//       //"customer_id" : "77"
//     });
//     var result = json.decode(response.body);
//     print("category  response $result");
//
//
//     CategoryModel _catModel;
//     _catModel = (CategoryModel.fromJson(result));
//     print("category api $_catModel");
//
//     return _catModel;
//   }
//
//   Future<KycModel> getKYCDetails() async {
//     var response = await http.post(Uri.parse(Connection.getKYC), body: {
//       "secretkey" : Connection.secretKey
//     });
//     var result = json.decode(response.body);
//     print("kyc response $result");
//
//
//     KycModel _cfsPerformance;
//     _cfsPerformance = (KycModel.fromJson(result));
//     print("ifc Performance $_cfsPerformance");
//
//     return _cfsPerformance;
//   }
//
//   Future<KycViewModel> getKYCViewDetails(String userId) async   {
//     var response = await http.post(Uri.parse(Connection.getKYCDetails), body: {
//       "secretkey" : Connection.secretKey,
//       "user_id" : userId
//     });
//     var result = json.decode(response.body);
//     print("kyc view response $result");
//
//
//     KycViewModel kycViewModel;
//     kycViewModel = (KycViewModel.fromJson(result));
//     print("kycViewModel Performance $kycViewModel");
//
//     return kycViewModel;
//   }
//
//   Future<String> updateProfilePhoto(File photo, String user, String kycId, String kycNo) async {
//     print("object inside upload ${photo.path}");
//     var request = http.MultipartRequest(
//         "POST", Uri.parse(Connection.uploadKYC));
//     request.fields['secretkey'] = '${Connection.secretKey}';
//     request.fields['user_id'] = user;
//     request.fields['kyc_id'] = kycId;
//     request.fields['number'] = kycNo;
//     request.files.add(await http.MultipartFile.fromPath('image', photo.path,
//         filename: 'photo$kycId.jpg', contentType: MediaType('image', 'jpeg')));
//     final streamResponse = await request.send();
//     print("object ${streamResponse.statusCode}");
//     print("object response ${streamResponse.statusCode} ${streamResponse.request}");
//     if (streamResponse.statusCode >= 200 && streamResponse.statusCode <= 299) {
//       final http.Response response = await http.Response.fromStream(streamResponse);
//       final results = json.decode(response.body);
//       if (results['status'] == true) {
//         return results['data'];
//       } else {
//         return null;
//       }
//     } else {
//       return "false";
//       //Alerts.showAlertAndBack(context, "Error uploading data", "try again");
//     }
//   }
//
//   Future<AddressModel> getAddressDetails(String userId) async {
//
//     print("object userid $userId");
//
//     var response = await http.post(Uri.parse(Connection.addressList ), body: {
//       "secretkey" : Connection.secretKey,
//       "customer_id" : userId
//     });
//     var result = json.decode(response.body);
//     print("address response $result");
//
//
//     AddressModel addressModel;
//     addressModel = (AddressModel.fromJson(result));
//     print("kycViewModel Performance $addressModel");
//
//     return addressModel;
//   }
//
//   Future<OrderModel> getCustomerOrderList(String customerId) async{
//     print("object customer id $customerId");
//     var response = await http.post(Uri.parse(Connection.customerOrderList), body: {
//       "secretkey" : Connection.secretKey,
//       "customerid":customerId
//     });
//     var result = json.decode(response.body);
//     print("customer order† response $result ${result['status']}");
//
//
//     OrderModel _orderModel;
//     _orderModel = OrderModel.fromJson(result);
//     print("_userModel $_orderModel");
//
//     return _orderModel;
//   }
//
//   Future<ProductListOrderModel> getOrderDetailsIdWise(String orderId) async {
//     var response = await http.post(Uri.parse(Connection.productListByOrder), body: {
//       "secretkey" : Connection.secretKey,
//       "orderid":orderId
//     });
//     var result = json.decode(response.body);
//     print("customer order† response $result ${result['status']}");
//
//
//     ProductListOrderModel _orderModel;
//     _orderModel = ProductListOrderModel.fromJson(result);
//     print("_userModel $_orderModel");
//
//     return _orderModel;
//   }
//
//   Future<OrderTrackModel> getOrderTracking(String orderId, String trackId) async {
//
//     print("object userid $orderId");
//
//     var response = await http.post(Uri.parse(Connection.orderTracking), body: {
//       "secretkey" : Connection.secretKey,
//       "orderdetail_id" : orderId,
//       "tracknumber" : trackId,
//     });
//
//     var result = json.decode(response.body);
//     print("order list response $result");
//
//     OrderTrackModel orderTrackModel;
//     orderTrackModel = OrderTrackModel.fromJson(result);
//     print("wishlist model Performance $orderTrackModel");
//
//     return orderTrackModel;
//   }
//
//   Future<CartModel> getCartDetails(String userId) async {
//
//     print("object userid $userId");
//
//     var response = await http.post(Uri.parse(Connection.cartDetails ), body: {
//       "secretkey" : Connection.secretKey,
//       "customer_id" : userId
//     });
//
//     var result = json.decode(response.body);
//     print("cart list response $result");
//     print("cart list response ${result['message']}");
//
//
//
//     CartModel cartModel;
//     cartModel = CartModel.fromJson(result);
//     print("cartmodel Performance $cartModel");
//
//     return cartModel;
//   }
//
//   Future<CreditListModel> getCustomerCreditList() async {
//     var response = await http.post(Uri.parse(Connection.creditList), body: {
//       "secretkey" : Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("customer credit response $result ${result['status']}");
//
//
//     CreditListModel _listModel;
//     _listModel = CreditListModel.fromJson(result);
//     print("_userModel $_listModel");
//
//     return _listModel;
//   }
//
//   Future<SalesCustomerModel> getCustomerListDetails(String salesId) async {
//     var response = await http.post(Uri.parse(Connection.getCustomerList), body: {
//       "secretkey" : Connection.secretKey,
//       "sales_user_id":salesId
//     });
//     var result = json.decode(response.body);
//     print("customer lis† response $result ${result['status']}");
//
//
//     SalesCustomerModel _userModel;
//     _userModel = SalesCustomerModel.fromJson(result);
//     print("_userModel $_userModel");
//
//     return _userModel;
//   }
//
//   Future<SalesCustomerModel> getAllCustomerListDetails() async {
//     var response = await http.post(Uri.parse(Connection.allCustomerList), body: {
//       "secretkey" : Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("customer lis† response $result ${result['status']}");
//
//
//     SalesCustomerModel _userModel;
//     _userModel = SalesCustomerModel.fromJson(result);
//     print("_userModel $_userModel");
//
//     return _userModel;
//   }
//
//   Future<UserModel> getSalesmanList() async {
//     var response = await http.post(Uri.parse(Connection.salesManList), body: {
//       "secretkey" : Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("customer lis† response $result ${result['status']}");
//
//
//     UserModel _userModel;
//     _userModel = UserModel.fromJson(result);
//     print("_userModel $_userModel");
//
//     return _userModel;
//   }
//
//   Future<UserModel> getAdminUserList() async {
//     var response = await http.post(Uri.parse(Connection.adminUserList), body: {
//       "secretkey" : Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("customer lis† response $result ${result['status']}");
//
//
//     UserModel _userModel;
//     _userModel = UserModel.fromJson(result);
//     print("_userModel $_userModel");
//
//     return _userModel;
//   }
//
//   Future<RoleModel> getAdminRoleList() async {
//     var response = await http.post(Uri.parse(Connection.roleList), body: {
//       "secretkey" : Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("customer lis† response $result ${result['status']}");
//
//
//     RoleModel _userModel;
//     _userModel = RoleModel.fromJson(result);
//     print("_userModel $_userModel");
//
//     return _userModel;
//   }
//
//   Future<CategoryListModel> getCategoryList() async {
//     var response = await http.post(Uri.parse(Connection.allCategory), body: {
//       "secretkey" : Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("customer lis† response $result ${result['status']}");
//
//
//     CategoryListModel _userModel;
//     _userModel = CategoryListModel.fromJson(result);
//     print("_userModel $_userModel");
//
//     return _userModel;
//   }
//
//   Future<ModelListingModel> getModelList1() async {
//     var response = await http.post(Uri.parse(Connection.allModel), body: {
//       "secretkey" : Connection.secretKey,
//     });
//     var result = json.decode(response.body);
//     print("customer lis† response $result ${result['status']}");
//
//
//     ModelListingModel _userModel;
//     _userModel = ModelListingModel.fromJson(result);
//     print("_userModel $_userModel");
//
//     return _userModel;
//   }
//
// Future<ModelNoWiseListModel>  getModelWiseDailyOrdersList(var modelNoId) async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/modelNoWiseList"), body: {
//       "secretkey" : Connection.secretKey,
//       "model_no_id": modelNoId,
//       "status": "1"
//     });
//     var result = json.decode(response.body);
//     print("model wise  lis† response $result ${result['data']}");
//
//
//     ModelNoWiseListModel modelWiseDailyProductionListModel;
//     modelWiseDailyProductionListModel = ModelNoWiseListModel.fromJson(result);
//     print("_userModel $modelWiseDailyProductionListModel");
//
//     return modelWiseDailyProductionListModel;
//   }
//
//
// Future<ModelNoWiseListModel> getModelWiseDailyProductionList(var modelNoId) async {
//     var response = await http.post(Uri.parse("http://loccon.in/desiremoulding/api/ProductionApiController/modelNoWiseList"), body: {
//       "secretkey" : Connection.secretKey,
//       "model_no_id": modelNoId,
//       "status": "2"
//     });
//     var result = json.decode(response.body);
//     print("model wise  production lis† response $result ${result['data']}");
//
//
//     ModelNoWiseListModel modelWiseDailyProductionListModel;
//     modelWiseDailyProductionListModel = ModelNoWiseListModel.fromJson(result);
//     print("_userModel $modelWiseDailyProductionListModel");
//
//     return modelWiseDailyProductionListModel;
//   }
//
//
// }