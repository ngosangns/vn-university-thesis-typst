#import "template.typ": *
#import "util.typ": *
#import "state.typ": bib_state
#context bib_state.get()

#h1("Phân tích và thiết kế mô hình website TMĐT")

#h2("Phân tích các yêu cầu nghiệp vụ và chức năng")

Các tác nhân trong website:

- Khách hàng.
- Quản trị viên.

// @startuml
// left to right direction
// actor "Khách hàng" as C
// actor "Quản trị viên" as A
// rectangle "Website TMĐT" {
//     usecase "Đăng nhập/Đăng ký tài khoản" as Register
//     usecase "Quản lý giỏ hàng cá nhân và thanh toán" as ManageCartAndPayment
//     usecase "Quản lý đơn hàng" as ManageOrder
//     usecase "Quản lý sản phẩm" as ManageProduct
//     usecase "Quản lý thông tin tài khoản cá nhân" as ChangeUserInfo
//     usecase "Quản lý tài khoản" as ManageAccount
//     usecase "Xem đơn hàng cá nhân" as ViewCustomOrder
//     C -- Register
//     C -- ManageCartAndPayment
//     C -- ChangeUserInfo
//     C -- ViewCustomOrder
//     A -- ManageOrder
//     A -- ManageProduct
//     A -- ManageAccount
//     ManageOrder <-- ViewCustomOrder: <<generalization>>
//     ManageAccount <-- ChangeUserInfo: <<generalization>>
// }
// @enduml
#img("3image.png", cap: "Biểu đồ usecase tổng quát của hệ thống", width: 80%)

#h3("Chức năng quản lý sản phẩm")

Danh sách các chức năng con của chức năng quản lý sản phẩm:

- Thêm sản phẩm.
- Xem thông tin sản phẩm.
- Sửa thông tin sản phẩm.
- Xóa sản phẩm.
- Quản lý danh mục sản phẩm.

// @startuml
// rectangle "Quản lý sản phẩm" as manage_product {
//   left to right direction
//   rectangle "Xem danh sách sản phẩm" as index_prod
//   rectangle "Xem danh sách danh mục sản phẩm" as index_cate
//   rectangle "Xem thông tin sản phẩm" as view
//   rectangle "Thêm sản phẩm mới" as add_product
//   rectangle "Xóa sản phẩm" as delete_product
//   rectangle "Cập nhật thông tin sản phẩm" as update_product
//   rectangle "Quản lý hình ảnh, mô tả, giá cả và số lượng tồn kho" as manage_details
//   rectangle "Thêm danh mục sản phẩm" as add_cate
//   rectangle "Cập nhật danh mục sản phẩm" as update_cate
//   rectangle "Xóa danh mục sản phẩm" as delete_cate
//   rectangle "Thêm sản phẩm vào danh mục" as add_prod_cate
//   rectangle "Xóa sản phẩm khỏi danh mục" as delete_prod_cate
//   rectangle "Xem danh mục sản phẩm" as view_cate
//   add_product --> manage_details
//   update_product --> manage_details
//   update_product --> add_prod_cate
//   update_product --> delete_prod_cate
//   update_product --> delete_product
//   index_prod --> view
//   update_cate --> delete_cate
//   index_cate --> view_cate
// }
// @enduml
#img("4image.png", cap: "Biểu đồ phân rã chức năng quản lý sản phẩm", width: 70%)

// @startuml
// actor "Khách hàng" as user
// actor "Quản trị viên" as admin
//   left to right direction
//   usecase "Xem danh sách sản phẩm" as index_prod
//   usecase "Xem danh sách danh mục sản phẩm" as index_cate
//   usecase "Xem thông tin sản phẩm" as view
//   usecase "Thêm sản phẩm mới" as add_product
//   usecase "Xóa sản phẩm" as delete_product
//   usecase "Cập nhật thông tin sản phẩm" as update_product
//   usecase "Quản lý hình ảnh, mô tả, giá cả và số lượng tồn kho" as manage_details
//   usecase "Thêm danh mục sản phẩm" as add_cate
//   usecase "Cập nhật danh mục sản phẩm" as update_cate
//   usecase "Xóa danh mục sản phẩm" as delete_cate
//   usecase "Thêm sản phẩm vào danh mục" as add_prod_cate
//   usecase "Xóa sản phẩm khỏi danh mục" as delete_prod_cate
//   usecase "Xem danh mục sản phẩm" as view_cate
//   add_product <-- manage_details: <<generalization>>
//   update_product <-- manage_details: <<generalization>>
//   update_product <-- add_prod_cate: <<include>>
//   update_product <-- delete_prod_cate: <<include>>
//   update_product <-- delete_product: <<extend>>
//   index_prod <-- view: <<extend>>
//   update_cate <-- delete_cate: <<extend>>
//   index_cate <-- view_cate: <<extend>>
//   view <-- add_product: <<extend>>
//   view_cate <-- add_cate: <<extend>>
//   user -- index_prod
//   user -- view
//   user -- index_cate
//   user -- view_cate
//   admin -- index_prod
//   admin -- view
//   admin -- index_cate
//   admin -- view_cate
//   admin -- add_product
//   admin -- update_product
//   admin -- delete_product
//   admin -- add_cate
//   admin -- update_cate
//   admin -- delete_cate
// @enduml
#img("5image.png", cap: "Biểu đồ usecase cho chức năng quản lý sản phẩm")

#h3("Chức năng quản lý đơn hàng")

Chức năng quản lý đơn hàng cho phép khách hàng xem lại các đơn hàng đã đặt trước đó và theo dõi trạng thái của từng đơn hàng. Khách hàng có thể xem chi tiết về sản phẩm đã đặt, số lượng, giá cả và thông tin vận chuyển. Ngoài ra, khách hàng cũng có thể hủy bỏ đơn hàng hoặc yêu cầu trả lại sản phẩm trong trường hợp sản phẩm không đáp ứng được yêu cầu của khách hàng.

Danh sách các chức năng con của chức năng quản lý đơn hàng:

- Tạo đơn hàng.
- Xem đơn hàng.
- Cập nhật trạng thái đơn hàng.

// @startuml
// rectangle "Quản lý đơn hàng" as manage_order {
//   rectangle "Tạo đơn hàng" as createOrder
//   rectangle "Xem danh sách đơn hàng" as viewListOrder
//   rectangle "Xem danh sách đơn hàng cá nhân" as viewListCustomOrder
//   rectangle "Xem đơn hàng cá nhân" as viewCustomOrder
//   rectangle "Cập nhật thông tin và trạng thái đơn hàng" as updateOrder
//   viewListOrder --> viewListCustomOrder
//   viewListOrder --> viewCustomOrder
//   viewListCustomOrder --> viewCustomOrder
// }
// @enduml
#img("6image.png", cap: "Biểu đồ phân rã chức năng quản lý đơn hàng", width: 70%)

// @startuml
// actor "Khách hàng" as user
// actor "Quản trị viên" as admin
//   usecase "Tạo đơn hàng" as createOrder
//   usecase "Xem danh sách đơn hàng" as viewListOrder
//   usecase "Xem danh sách đơn hàng cá nhân" as viewListCustomOrder
//   usecase "Xem đơn hàng cá nhân" as viewCustomOrder
//   usecase "Cập nhật thông tin và trạng thái đơn hàng" as updateOrder
//   viewListOrder <-- viewListCustomOrder: <<generalization>>
//   viewListOrder <-- viewCustomOrder: <<extend>>
//   viewListCustomOrder <-- viewCustomOrder: <<extend>>
//   createOrder --> viewListOrder: <<extend>>
//   updateOrder --> viewListOrder: <<extend>>
//   user -- viewListCustomOrder
//   user -- viewCustomOrder
//   admin -- createOrder
//   admin -- viewListOrder
//   admin -- updateOrder
//   admin -- viewCustomOrder
//   admin -- viewListCustomOrder
// @enduml
#img(
  "image231313213123123123123123131312345345412313.png",
  width: 90%,
  cap: "Biểu đồ usecase cho chức năng quản lý đơn hàng",
)

#h3("Chức năng đăng ký và đăng nhập tài khoản")

Chức năng đăng ký tài khoản cho phép khách hàng có thể tạo một tài khoản mới trên trang web TMĐT. Người dùng cần cung cấp thông tin cá nhân như tên địa chỉ email, mật khẩu. Thông tin này sẽ được lưu trữ trong hệ thống của trang web để khách hàng có thể đăng nhập lại vào lần sau. Ngoài ra website còn được tích hợp tính năng đăng nhập bằng tài khoản Google sử dụng OAuth 2.0.

Chức năng đăng nhập cung cấp cho khách hàng quyền truy cập vào các tính năng và dịch vụ của trang web TMĐT. Người dùng sẽ cần nhập tên đăng nhập và mật khẩu của mình để đăng nhập thành công. Sau khi đăng nhập thành công, khách hàng có thể thực hiện các hoạt động như xem lịch sử giao dịch, sửa đổi thông tin cá nhân, quản lý giỏ hàng và thanh toán đơn hàng.

Ngoài ra, việc có chức năng đăng nhập và đăng ký tài khoản còn giúp cho trang web TMĐT có thể thu thập thông tin về khách hàng để có thể cung cấp các dịch vụ tốt hơn và phù hợp với nhu cầu của từng khách hàng.

// @startuml
// rectangle "Đăng nhập và đăng ký tài khoản" as manage_order {
//   rectangle "Đăng nhập" as login
//   rectangle "Đăng ký" as register
//   rectangle "Đăng nhập với email/password" as loginEmail
//   rectangle "Đăng ký với email/password" as registerEmail
//   rectangle "Đăng nhập bằng tài khoản Google" as googleLogin
//   rectangle "Đăng ký bằng tài khoản Google" as googleRegister
//   rectangle "Đăng xuất" as logout
//   login --> loginEmail
//   login --> googleLogin
//   register --> registerEmail
//   register --> googleRegister
//   register --> login
//   loginEmail --> logout
//   googleLogin --> logout
//   registerEmail --> logout
//   googleRegister --> logout
// }
// @enduml
#img("8image.png", cap: "Biểu đồ phân rã chức năng của chức năng đăng ký và đăng nhập")

// @startuml
// actor "Khách hàng" as user
//   usecase "Đăng nhập" as login
//   usecase "Đăng ký" as register
//   usecase "Đăng nhập với email/password" as loginEmail
//   usecase "Đăng ký với email/password" as registerEmail
//   usecase "Đăng nhập bằng tài khoản Google" as googleLogin
//   usecase "Đăng ký bằng tài khoản Google" as googleRegister
//   usecase "Đăng xuất" as logout
//   login <-- loginEmail: <<generalization>>
//   login <-- googleLogin: <<generalization>>
//   register <-- registerEmail: <<generalization>>
//   register <-- googleRegister: <<generalization>>
//   register <-- login: <<include>>
//   loginEmail <-- logout: <<include>>
//   googleLogin <-- logout: <<include>>
//   registerEmail <-- logout: <<include>>
//   googleRegister <-- logout: <<include>>
//   user -- login
// @enduml
#img("imageq972193812931293.png", cap: "Biểu đồ usecase cho chức năng đăng nhập và đăng ký tài khoản")

// @startuml
// actor "Khách hàng" as customer
// participant "Website TMĐT" as website
// participant "OAuth 2.0 Provider" as oauth
// participant "Email Provider" as email
// == Quy trình đăng ký tài khoản bằng email/mật khẩu ==
// customer -> website: Truy cập trang đăng ký
// activate website
// website -> customer: Hiển thị biểu mẫu đăng ký
// deactivate website
// customer -> website: Gửi thông tin đăng ký
// activate website
// website -> website: Kiểm tra thông tin đăng ký
// alt Tài khoản đã tồn tại
//     website --> customer: Trả về thông báo lỗi: Tài khoản đã tồn tại
// else Tài khoản chưa tồn tại
//     website -> website: Tạo tài khoản mới
//     website -> email: Gửi email chứa link xác thực
//     activate email
//     email --> website: Thông báo đã gửi email thành công
//     deactivate email
//     website --> customer: Trả về thông báo tạo tài khoản thành công \n và yêu cầu xác thực email
//     deactivate website
//     customer -> website: Truy cập link xác thực
//     activate website
//     website -> website: Cập nhật trạng thái đã xác thực email
//     website --> customer: Thông báo đã xác thực email
//     deactivate website
// end
// == Quy trình đăng ký tài khoản bằng OAuth 2.0 ==
// customer -> website: Truy cập link đăng nhập bằng OAuth 2.0
// activate website
// website -> customer: Chuyển hướng đến OAuth Provider
// deactivate website
// customer -> oauth: Xác thực đăng nhập OAuth
// activate oauth
// oauth --> website: Cung cấp mã truy cập (access token)
// deactivate oauth
// activate website
// website -> oauth: Yêu cầu thông tin tài khoản dựa vào access token
// activate oauth
// oauth --> website: Trả về thông tin tài khoản
// deactivate oauth
// website -> website: Kiểm tra thông tin đăng ký
// alt Tài khoản chưa tồn tại
//     website -> website: Tạo tài khoản mới
// end
// website --> website: Đăng nhập tài khoản
// website --> customer: Trả về kết quả đăng nhập
// deactivate website
// @enduml
#img("10image.png", cap: "Biểu đồ sequence thể hiện luồng xử lý của tính năng đăng ký", width: 100%)

Một số cơ chế an toàn trong chức năng này:

- Mã hóa mật khẩu: Mật khẩu của người dùng nên được mã hóa trước khi lưu trữ trong cơ sở dữ liệu. Một cách thông thường là sử dụng thuật toán băm (hashing) như bcrypt để mã hóa mật khẩu, đảm bảo rằng mật khẩu không thể được khôi phục ngược lại từ các giá trị được lưu trữ.
- Bảo mật giao tiếp: Đảm bảo rằng thông tin đăng nhập và thông tin cá nhân của người dùng được bảo vệ trong quá trình truyền tải. Sử dụng kết nối an toàn qua HTTPS (SSL/TLS) để mã hóa dữ liệu giao tiếp giữa người dùng và hệ thống.
- Kiểm tra mật khẩu mạnh: Yêu cầu người dùng sử dụng mật khẩu mạnh, bao gồm sự kết hợp của ký tự chữ hoa, chữ thường, chữ số và ký tự đặc biệt.
- Bảo vệ thông tin cá nhân: Đảm bảo rằng thông tin cá nhân của người dùng được bảo vệ và không được tiết lộ cho bất kỳ bên thứ ba nào. Áp dụng các biện pháp bảo mật phù hợp như mã hóa dữ liệu, kiểm soát quyền truy cập và chứng thực đúng người dùng để bảo vệ thông tin cá nhân.

#h3("Chức năng giỏ hàng và thanh toán")

#img("11image.png", cap: "Giao dịch thanh toán trên internet")

Đầu tiên, xác định các yêu cầu kinh doanh liên quan đến thanh toán điện tử của website. Website TMĐT trong báo cáo này hỗ trợ các phương thức thanh toán thông qua ví điện tử và thanh toán khi nhận hàng (COD). Đơn vị tiền tệ sử dụng Việt Nam Đồng.

Lựa chọn cổng thanh toán cho ví điện tử: Dựa trên yêu cầu kinh doanh, chọn cổng thanh toán phù hợp để tích hợp vào website. Các cổng thanh toán phổ biến bao gồm PayPal, Stripe,... Sau quá trình khảo sát tác giả quyết định chọn Zalopay và Paypal là hai cổng thanh toán ví điện tử của website.

Tiếp theo cần thiết kế cơ sở dữ liệu để lưu trữ thông tin liên quan đến thanh toán. Ở phần thiết kế danh sách các thực thể chính của website tác giả đã thiết kế thực thể "Payment Method" đại diện cho thông tin các cổng thanh toán được lưu trữ trong website. Từ đó có thể triển khai xây dựng cơ sở dữ liệu ở Chương 3.

Tiếp theo cần thiết kế giao diện người dùng để hiển thị thông tin liên quan đến thanh toán, bao gồm các biểu mẫu nhập thông tin thanh toán, hiển thị đơn hàng, tóm tắt thanh toán và xác nhận thanh toán.

Xử lý và xác thực thanh toán: Khi người dùng hoàn tất thông tin thanh toán, thực hiện xử lý và xác thực thanh toán. Điều này bao gồm gửi thông tin thanh toán đến cổng thanh toán, kiểm tra tính hợp lệ và xác nhận thanh toán từ cổng thanh toán. Nếu thanh toán thành công, cập nhật trạng thái đơn hàng và lưu trữ thông tin thanh toán. Ngoài ra cần xây dựng cơ chế để xử lý các lỗi thanh toán và quản lý giao dịch không thành công bao gồm xử lý các thông báo lỗi từ cổng thanh toán, gửi thông báo cho người dùng và cập nhật trạng thái đơn hàng tương ứng.

Cuối cùng cần kiểm tra toàn bộ quy trình thanh toán để đảm bảo tính chính xác và hoạt động một cách trơn tru trên website. Sau đó, triển khai mô hình xử lý thanh toán vào website.

Chức năng giỏ hàng cho phép người dùng lưu trữ các sản phẩm mà họ muốn mua vào trong giỏ hàng. Người dùng có thể thêm hoặc xóa bất kỳ sản phẩm nào từ giỏ hàng của mình và có thể xem toàn bộ giỏ hàng của mình trước khi hoàn tất đơn hàng.

Sau khi đã chọn các sản phẩm mua, khách hàng cần thực hiện thanh toán để hoàn tất đơn hàng. Chức năng thanh toán cung cấp cho khách hàng các phương thức thanh toán khác nhau để lựa chọn, bao gồm thanh toán qua ví Zalopay, Paypal, thanh toán COD (thanh toán khi nhận hàng).

Ngoài ra, trang web TMĐT cũng cần đảm bảo rằng các thông tin thanh toán của khách hàng được bảo mật và an toàn. Vì vậy, trang web TMĐT cần sử dụng các công nghệ bảo mật như SSL (Secure Sockets Layer) để mã hóa thông tin thanh toán và tránh các vấn đề bảo mật như lừa đảo hoặc giả mạo thông tin.

Danh sách các chức năng con của chức năng giỏ hàng và thanh toán:

- Thêm sản phẩm vào giỏ hàng.
- Cập nhật số lượng sản phẩm.
- Xóa sản phẩm ra khỏi giỏ hàng.
- Thanh toán.

// @startuml
// top to bottom direction
// rectangle "Giỏ hàng và thanh toán" {
//   rectangle "Xem giỏ hàng" as DisplayCart
//   rectangle "Thêm sản phẩm vào giỏ hàng" as AddToCart
//   rectangle "Cập nhật số lượng sản phẩm" as UpdateQuantity
//   rectangle "Xóa sản phẩm khỏi giỏ hàng" as RemoveFromCart
//   rectangle "Cung cấp thông tin thanh toán" as SelectPaymentMethod
//   rectangle "Thanh toán" as ConfirmPayment
//   DisplayCart --> UpdateQuantity
//   DisplayCart --> RemoveFromCart
//   AddToCart --> DisplayCart
//   SelectPaymentMethod --> ConfirmPayment
//   UpdateQuantity --> SelectPaymentMethod
//   RemoveFromCart --> SelectPaymentMethod
//   DisplayCart --> SelectPaymentMethod
// }
// @enduml
#img("12image.png", cap: "Biểu đồ phân rã chức năng giỏ hàng và thanh toán", width: 70%)

// @startuml
// top to bottom direction
// actor "Khách hàng" as user
//   usecase "Xem giỏ hàng" as DisplayCart
//   usecase "Thêm sản phẩm vào giỏ hàng" as AddToCart
//   usecase "Cập nhật số lượng sản phẩm" as UpdateQuantity
//   usecase "Xóa sản phẩm khỏi giỏ hàng" as RemoveFromCart
//   usecase "Thanh toán" as ConfirmPayment
//   DisplayCart <-- UpdateQuantity: <<include>>
//   DisplayCart <-- RemoveFromCart: <<include>>
//   AddToCart <-- DisplayCart: <<extend>>
//   UpdateQuantity --> AddToCart: <<include>>
//   DisplayCart <-- ConfirmPayment: <<include>>
//   user -- AddToCart
//   user -- UpdateQuantity
//   user -- RemoveFromCart
//   user -- ConfirmPayment
// @enduml
#img("13image22.png", cap: "Biểu đồ usecase cho chức năng giỏ hàng và thanh toán", width: 70%)

// @startuml
// actor "Khách hàng" as cus
// participant "Website TMĐT" as web
// participant "Paypal" as pay
// == Quy trình thanh toán giỏ hàng bằng Paypal ==
// cus -> web: Gửi thông tin thanh toán
// activate web
// web -> web: Kiểm tra thông tin thanh toán
// web -> pay: Tạo đơn hàng thanh toán qua Paypal kèm link chuyển\nhướng về website TMĐT khi thanh toán thành công
// activate pay
// pay --> web: Trả về thông tin đơn hàng thanh toán qua Paypal\nkèm link chuyển hướng đến trang thanh toán Paypal
// deactivate pay
// web -> cus: Chuyển hướng sang trang thanh toán Paypal
// deactivate web
// cus -> pay: Thanh toán đơn hàng qua Paypal
// activate pay
// pay -> pay: Xử lý thanh toán đơn hàng
// pay -> web: Gửi thông báo đã thanh toán đơn hàng
// activate web
// web -> web: Cập nhật trạng thái đơn hàng
// deactivate web
// pay -> cus: Chuyển hướng về website TMĐT
// deactivate pay
// @enduml
#img("14image.png", cap: "Biểu đồ sequence thể hiện luồng thực hiện tính năng thanh toán với cổng thanh toán Paypal")

#h3("Chức năng quản lý tài khoản")

Chức năng quản lý tài khoản cho phép quản trị viên quản lý danh sách khách hàng trên website TMĐT và cho phép khách hàng cập nhật xem và sửa đổi thông tin cá nhân của mình, bao gồm tên, địa chỉ, số điện thoại và địa chỉ email. Khách hàng cũng có thể thay đổi mật khẩu để bảo mật tài khoản của mình.

Danh sách các chức năng con của chức năng quản lý thông tin tài khoản:
- Xem danh sách tài khoản.
- Xem thông tin tài khoản.
- Cập nhật thông tin tài khoản.
- Xóa tài khoản.

// @startuml
// rectangle "Quản lý tài khoản" as manage_customer {
//     rectangle "Xem thông tin tài khoản" as view
//     rectangle "Cập nhật thông tin tài khoản" as update_customer_info
//     rectangle "Quản lý địa chỉ giao hàng và thanh toán" as manage_address
//     rectangle "Thay đổi mật khẩu" as change_password
//     rectangle "Xóa tài khoản" as delete
//     update_customer_info --> manage_address
//     update_customer_info --> change_password
// }
// @enduml
#img("15image.png", cap: "Biểu đồ phân rã tinh năng quản lý tài khoản", width: 80%)

// @startuml
// actor "Khách hàng" as user
// actor "Quản trị viên" as admin
//     usecase "Xem thông tin tài khoản" as view
//     usecase "Xem thông tin tài khoản cá nhân" as view_custom
//     usecase "Cập nhật thông tin tài khoản" as update_customer_info
//     usecase "Cập nhật thông tin tài khoản cá nhân" as update_customer_info_custom
//     usecase "Quản lý địa chỉ giao hàng và thanh toán" as manage_address
//     usecase "Quản lý địa chỉ giao hàng và thanh toán cá nhân" as manage_address_custom
//     usecase "Thay đổi mật khẩu cá nhân" as change_password
//     usecase "Xóa tài khoản" as delete
//     usecase "Xóa tài khoản cá nhân" as delete_custom
//     update_customer_info <-- manage_address: <<generalization>>
//     view <-- view_custom: <<generalization>>
//     delete <-- delete_custom: <<generalization>>
//     update_customer_info <-- update_customer_info_custom: <<generalization>>
//     update_customer_info_custom <-- manage_address_custom: <<include>>
//     manage_address <-- manage_address_custom: <<generalization>>
//     change_password --> update_customer_info_custom: <<extend>>
//     user -- delete_custom
//     user -- update_customer_info_custom
//     user -- view_custom
//     user -- change_password
//     admin -- view
//     admin -- update_customer_info
//     admin -- manage_address
//     admin -- delete
// @enduml
#img("16image22.png", cap: "Biểu đồ usecase của chức năng quản lý tài khoản")

// #h3("Chức năng tìm kiếm sản phẩm")
// #p Chức năng tìm kiếm sản phẩm cho phép người dùng nhập từ khóa tìm kiếm vào ô tìm kiếm và sau đó hiển thị các sản phẩm liên quan đến từ khóa tìm kiếm đó. Nếu có quá nhiều sản phẩm được tìm thấy, trang web TMĐT có thể sắp xếp chúng theo các tiêu chí khác nhau như giá cả, độ phổ biến, đánh giá của khách hàng hoặc thương hiệu sản phẩm.

// Ngoài ra, trang web TMĐT cũng có thể cung cấp các công cụ lọc sản phẩm để giúp khách hàng thu hẹp phạm vi tìm kiếm của mình và tìm kiếm các sản phẩm phù hợp với nhu cầu của mình hơn. Các tiêu chí lọc sản phẩm phổ biến bao gồm màu sắc, kích thước, giá cả và thương hiệu.

// Chức năng tìm kiếm sản phẩm cùng với các công cụ lọc sản phẩm giúp khách hàng dễ dàng tìm kiếm các sản phẩm mà họ đang quan tâm và giúp trang web TMĐT cung cấp cho khách hàng những trải nghiệm mua sắm thân thiện và tiện lợi.

#h2("Thiết kế cơ sở dữ liệu")

#h3("Lựa chọn hệ quản trị cơ sở dữ liệu")

Lựa chọn hệ quản trị cơ sở dữ liệu (Database Management System - DBMS) trong thiết kế website thương mại điện tử là một yếu tố quan trọng và có ảnh hưởng đáng kể đến hiệu suất, bảo mật và khả năng mở rộng của hệ thống.

Phân loại và đánh giá tổng quát của các loại cơ sở dữ liệu phổ biến:

- Relational Database:
  - Đặc điểm: Cơ sở dữ liệu quan hệ sử dụng bảng và mối quan hệ để tổ chức dữ liệu thành các thực thể và quan hệ giữa chúng. Structured Query Language (SQL) là ngôn ngữ phổ biến để truy vấn và quản lý cơ sở dữ liệu quan hệ.
  - Ưu điểm: Dễ hiểu, dễ sử dụng, hỗ trợ các hoạt động truy vấn phức tạp, đảm bảo tính nhất quán và toàn vẹn dữ liệu.
  - Nhược điểm: Cần sử dụng quá nhiều liên kết giữa các bảng trong trường hợp dữ liệu phức tạp, có thể làm chậm hiệu suất truy vấn.
- Non-Relational Database:
  - Đặc điểm: Các cơ sở dữ liệu không quan hệ, hay còn gọi là NoSQL, có cấu trúc linh hoạt hơn và không sử dụng mô hình quan hệ. Các loại cơ sở dữ liệu NoSQL bao gồm: cơ sở dữ liệu cột, cơ sở dữ liệu tài liệu, cơ sở dữ liệu đồ thị và cơ sở dữ liệu key-value.
  - Ưu điểm: Khả năng mở rộng tốt, hỗ trợ truy vấn nhanh, linh hoạt và có thể xử lý dữ liệu phi cấu trúc.
  - Nhược điểm: Không đảm bảo tính nhất quán dữ liệu như cơ sở dữ liệu quan hệ, hạn chế trong việc truy vấn phức tạp.
- Graph Database:
  - Đặc điểm: Cơ sở dữ liệu đồ thị được sử dụng để lưu trữ dữ liệu có mối quan hệ phức tạp. Nó sử dụng các nút, cạnh và thuộc tính để biểu diễn dữ liệu và quan hệ giữa chúng.
  - Ưu điểm: Hiệu suất cao trong việc truy vấn và phân tích các mối quan hệ dữ liệu phức tạp.
  - Nhược điểm: Thường không phù hợp cho các dự án có dữ liệu đơn giản hoặc ít quan hệ.

Dựa vào các phân tích và đánh giá được thực hiện trong Chương 1, kết hợp tìm hiểu trong quá trình xây dựng yêu cầu nghiệp vụ và chức năng của website, tác giả đánh giá rằng mô hình dữ liệu của website được liên kết với nhau một cách chặt chẽ và mạch lạc. Do đó, tác giả đã quyết định chọn SQL làm hệ quản trị cơ sở dữ liệu cho website, bởi SQL mang đến những ưu điểm quan trọng và phù hợp với yêu cầu của dữ liệu trong dự án.

Bằng việc sử dụng SQL, website thương mại điện tử sẽ có khả năng xử lý dữ liệu một cách hiệu quả, đáng tin cậy và linh hoạt. SQL cung cấp một ngôn ngữ truy vấn mạnh mẽ cho phép thực hiện các truy vấn phức tạp và tùy chỉnh theo nhu cầu cụ thể của dự án.

#h3("Thiết kế mô hình dữ liệu") <titlexx1>

Trong quá trình phân tích thiết kế website thương mại điện tử, thiết kế mô hình dữ liệu đóng vai trò quan trọng để xác định cấu trúc và quan hệ giữa các bảng dữ liệu. Việc thiết kế mô hình dữ liệu cẩn thận và hợp lý là yếu tố quyết định thành công của hệ thống cơ sở dữ liệu, ảnh hưởng đến hiệu suất, tính nhất quán và quản lý dữ liệu. Dưới đây là phân tích và đánh giá chi tiết về thiết kế mô hình dữ liệu trong phân tích thiết kế website thương mại điện tử:

- Xác định yêu cầu và mục tiêu: Trước khi thiết kế mô hình dữ liệu, cần xác định rõ yêu cầu và mục tiêu của website thương mại điện tử. Điều này bao gồm việc hiểu rõ các chức năng, quy trình kinh doanh, quyền hạn và yêu cầu về dữ liệu của hệ thống.
- Xác định các thực thể (entities): Xác định các thực thể chính trong hệ thống, như sản phẩm, người dùng, đơn hàng, danh mục sản phẩm, v.v. Mỗi thực thể đại diện cho một tập hợp các đối tượng có liên quan trong thế giới thực.
- Xác định các thuộc tính (attributes) của thực thể: Xác định các thuộc tính cần thiết để mô tả và lưu trữ thông tin về các thực thể. Ví dụ, thuộc tính của thực thể "sản phẩm" có thể bao gồm tên, mô tả, giá, hình ảnh, số lượng, v.v.

Từ những đánh giá trên tác giả đã xây dựng danh sách các thực thể chính trong một website TMĐT như sau:

- User: Đại diện cho người dùng của website, bao gồm thông tin như tên, email, mật khẩu, và các thông tin liên quan khác.
- Product: Lưu trữ thông tin về các sản phẩm mà website đang bán, bao gồm tên, mô tả, giá, số lượng, mã SKU, và trạng thái có sẵn hay không.
- Order: Đại diện cho đơn hàng được tạo bởi người dùng, bao gồm thông tin như người đặt hàng, phương thức thanh toán, địa chỉ giao hàng, tổng giá trị đơn hàng, ghi chú và trạng thái đơn hàng.
- Order Item: Lưu trữ thông tin về các sản phẩm được đặt trong mỗi đơn hàng, bao gồm sản phẩm, số lượng và giá.
- Cart Item: Lưu trữ thông tin về các sản phẩm trong giỏ hàng của người dùng, bao gồm sản phẩm, số lượng và người dùng tương ứng.
- Shipping Provider: Đại diện cho các nhà cung cấp dịch vụ giao hàng mà website hỗ trợ.
- Payment Method: Đại diện cho các phương thức thanh toán mà người dùng có thể sử dụng khi đặt hàng.
- Address: Lưu trữ thông tin về địa chỉ của người dùng, bao gồm quốc gia, thành phố, tiểu bang/tỉnh, đường phố, và mã bưu điện.

Sau khi đã xác định các thực thể chính trong website, dựa vào đó tác giả đã thiết kế mô hình ER cho cơ sở dữ liệu để triển khai trong Chương 3:

// @startuml
// entity User {
//   id: Integer
//   name: String
//   email: String
//   password: String
// }
// entity Product {
//   id: Integer
//   name: String
//   price: Integer
//   quantity: Integer
// }
// entity Order {
//   id: Integer
//   user: User
//   orderDate: Date
//   address: Address
//   paymentMethod: PaymentMethod
// }
// entity OrderItem {
//   id: Integer
//   order: Order
//   product: Product
//   quantity: Integer
// }
// entity CartItem {
//   id: Integer
//   user: User
//   product: Product
//   quantity: Integer
// }
// entity ShippingProvider {
//   id: Integer
//   name: String
//   cost: Integer
// }
// entity PaymentMethod {
//   id: Integer
//   name: String
//   code: String
// }
// entity Address {
//   id: Integer
//   user: User
//   street: String
//   city: String
//   state: String
//   zipcode: String
// }
// User "1" -- "1" Order
// User "1" -- "1..*" CartItem
// Order "1" -- "1" ShippingProvider
// Order "1" -- "1" PaymentMethod
// Order "1" -- "1..*" OrderItem
// CartItem "1" -- "1" Product
// OrderItem "1" -- "1" Product
// Address "1" -- "1" User
// @enduml
#img("17image.png", cap: "Biểu đồ ER của CSDL website TMĐT", width: 70%)

#h3("Đảm bảo tính nhất quán và an toàn cho cơ sở dữ liệu")

Đảm bảo tính nhất quán và an toàn cho cơ sở dữ liệu là một yếu tố quan trọng trong phân tích và thiết kế website thương mại điện tử. Điều này đảm bảo rằng dữ liệu được lưu trữ và truy cập một cách đáng tin cậy, đồng thời đảm bảo tính toàn vẹn và bảo mật của thông tin. Dưới đây là phân tích và đánh giá chi tiết về đảm bảo tính nhất quán và an toàn cho cơ sở dữ liệu trong phân tích thiết kế website thương mại điện tử:

- Tính nhất quán của cơ sở dữ liệu.
- Tính toàn vẹn dữ liệu.
- Bảo mật dữ liệu.
- Sao lưu và phục hồi dữ liệu.

#h2("Phân tích thiết kế kiến trúc hệ thống")

#h3("Xác định các thành phần hệ thống")

Từ những phân tích trên kết hợp với việc ứng dụng mô hình MVC vào website TMĐT, ta có các thành phần chính như sau:

- Model: Đại diện cho logic xử lý dữ liệu trong ứng dụng. Model thực hiện truy vấn, thêm, sửa đổi và xóa dữ liệu từ cơ sở dữ liệu. Nó quản lý lưu trữ và truy xuất dữ liệu thông qua truy vấn SQL hoặc Object Relational Mapping (ORM).
- View: Đại diện cho giao diện người dùng của ứng dụng. View hiển thị dữ liệu cho người dùng và tương tác với họ. Nó chứa mã HTML, CSS và JavaScript để tạo giao diện người dùng.
- Controller: Xử lý yêu cầu từ người dùng và tương tác với Model và View. Controller nhận yêu cầu qua Routes và gọi phương thức tương ứng để xử lý. Nó thực hiện lấy dữ liệu từ Model, xử lý logic và chuyển dữ liệu đến View.
- Routes: Xác định các đường dẫn URL và kết nối chúng với phương thức trong Controller. Routes định nghĩa các điểm cuối (endpoints) của ứng dụng và quyết định điều hướng yêu cầu từ người dùng đến Controller.
- Middleware: Là thành phần trung gian giữa yêu cầu và phản hồi của ứng dụng. Middleware cho phép xử lý trước và sau khi yêu cầu đi qua Controller. Nó kiểm soát quyền truy cập, xác thực người dùng, thực hiện xử lý logic và bổ sung thông tin vào yêu cầu.

Thiết kế cấu trúc thư mục của website:

- Thư mục `app` chứa các thành phần chính của ứng dụng như Controllers, Models, và Services.
- Thư mục `config` chứa các tệp cấu hình của ứng dụng.
- Thư mục `database` chứa các file migration và seeders.
- Thư mục `public` chứa các file tĩnh như hình ảnh, CSS, và JavaScript.
- Thư mục `resources` chứa các file nguồn của ứng dụng như views, assets, và ngôn ngữ.
- Thư mục `routes` chứa các file định tuyến của ứng dụng.

#h3("Các cơ chế an toàn")

Cần xác định rõ các yêu cầu bảo mật của hệ thống. Bao gồm việc xác định các nguyên tắc bảo mật cần tuân thủ, các loại dữ liệu nhạy cảm cần được bảo vệ, và các rủi ro bảo mật tiềm ẩn. Xác định các yêu cầu bảo mật sẽ giúp xác định các khía cạnh cần thiết để bảo vệ thông tin của người dùng.

Tiếp theo, cần thiết kế kiến trúc hệ thống hướng bảo mật. Bao gồm việc sử dụng các phương pháp mã hóa mạnh mẽ để bảo vệ thông tin, xác thực và ủy quyền để kiểm soát quyền truy cập, và các lớp bảo vệ phòng ngừa tấn công từ bên ngoài.

Một phần quan trọng trong việc đảm bảo tính bảo mật là quản lý danh sách truy cập và phân quyền. Cần xác định các vai trò người dùng và quyền hạn tương ứng để kiểm soát quyền truy cập vào hệ thống và dữ liệu. Quản lý danh sách truy cập và phân quyền giúp đảm bảo rằng chỉ những người được ủy quyền mới có thể truy cập và thao tác với thông tin nhạy cảm.

Cần thực hiện kiểm tra và xác minh bảo mật thường xuyên để đảm bảo tính bảo mật của hệ thống. Kiểm tra bảo mật bao gồm việc kiểm tra các lỗ hổng bảo mật và điểm yếu trong hệ thống, trong khi xác minh bảo mật đảm bảo rằng các biện pháp bảo mật đã được triển khai và hoạt động hiệu quả. Kiểm tra và xác minh bảo mật định kỳ giúp phát hiện và khắc phục các lỗ hổng bảo mật sớm trước khi chúng có thể bị tấn công.

Cuối cùng, cần đảm bảo rằng nhân viên được đào tạo và có nhận thức về bảo mật. Đào tạo nhân viên về các quy trình bảo mật và các biện pháp bảo mật sẽ giúp nâng cao ý thức về bảo mật và đảm bảo rằng mọi người đều thực hiện các biện pháp bảo mật một cách đúng đắn.

Một số phương pháp đảm bảo an toàn cho ứng dụng cho website TMĐT:

- Sử dụng giao thức an toàn Secure Socket Layer (SSL): SSL/TLS tạo ra một kênh truyền thông an toàn giữa máy tính của người dùng và máy chủ của website, đảm bảo rằng dữ liệu không bị đánh cắp, thay đổi hoặc giả mạo trong quá trình truyền. Khi một trang web sử dụng SSL/TLS, địa chỉ URL sẽ bắt đầu bằng `https://` thay vì `http://`, và thông thường trình duyệt sẽ hiển thị một biểu tượng khóa hoặc dấu chấm than xanh lá để chỉ ra rằng kết nối là an toàn. Sử dụng giao thức HTTPS là một cách triển khai SSL. Một số nhà cung cấp chứng chỉ SSL miễn phí để sử dụng giao thức HTTPS cho website như Cloudflare và Let's Encrypt. Để cài đặt chứng chỉ cho website ta cần vào trang quản trị tên miền trỏ nameserver về nameserver của nhà cung cấp (đối với Cloudflare) hoặc cài đặt các khóa chứng chỉ của nhà cung cấp lên VPS mà tên miền đang trỏ về (đối với Let's Encrypt).
- Mã hóa và xác thực với Tokenization: Thông tin thanh toán nhạy cảm của người sử dụng được thay thế bằng một tập hợp các ký tự được gọi là token và các token này sẽ không ảnh hưởng đến tính an toàn trong các giao dịch trực tuyến và di động. Các máy khách sẽ thực hiện truyền mã token, thay vì dữ liệu thông tin gốc quan trọng, điều này khiến dữ liệu sẽ không thể bị đánh cắp hoặc không có giá trị đối với kẻ tấn công khi đánh cắp được. Một trong số cách triển khai đó là xác thực người dùng sử dụng JSON Web Token (JWT) là một phương thức xác thực dựa trên mã thông báo (token) được tạo và ký bởi máy chủ. JWT hỗ trợ nhiều thuật toán mã hóa phổ biến như HS256 (HMAC SHA-256), RS256 (RSA SHA-256), và nhiều thuật toán khác dựa trên mã hóa đối xứng và bất đối xứng.
- Thiết kế theo tiêu chuẩn Payment Card Industry Data Security Standard (PCI DSS): Để đạt được tuân thủ PCI DSS, website phải thực hiện theo một loạt các yêu cầu khắt khe, chẳng hạn như thực hiện bảo mật hệ thống và mạng để bảo vệ dữ liệu thẻ tín dụng, bảo vệ các thông tin xác thực của khách hàng bằng cách sử dụng các giải pháp mã hóa và thực hiện quản lý quy trình và chính sách bảo mật, đảm bảo rằng nhân viên được đào tạo và thực hiện theo tiêu chuẩn an ninh thông tin.
- Xác thực với giao thức Open Authorization: Open Authorization (OAuth) là một giao thức xác thực và ủy quyền được sử dụng để cho phép người dùng cấp quyền truy cập tài khoản của mình cho các ứng dụng, dịch vụ và trang web khác. OAuth cho phép người dùng chia sẻ thông tin cá nhân và tài khoản của họ mà không cần tiết lộ mật khẩu của mình. Thay vào đó, OAuth sử dụng một mã truy cập để cung cấp quyền truy cập. Khi người dùng cấp quyền truy cập cho ứng dụng, dịch vụ hoặc trang web, mã truy cập sẽ được tạo ra. Mã này sau đó được sử dụng để xác thực yêu cầu truy cập từ ứng dụng, dịch vụ hoặc trang web đó. OAuth 2.0 là phiên bản tiếp theo của giao thức OAuth. OAuth 2.0 giúp cho việc ủy quyền truy cập dễ dàng hơn và cung cấp nhiều cấp độ quyền hơn so với phiên bản trước đó.
- Quản lý phiên làm việc bằng việc triển khai session cho website. Framework Laravel đã hỗ trợ session cho user.
- Chỉ lưu trữ mật khẩu đã mã hóa 1 chiều vào website nhằm giảm khả năng lộ lọt dữ liệu của cơ sơ dữ liệu, có thể sử dụng hàm mã hóa `bcrypt` của Laravel.
- Kiểm tra và sửa lỗi bảo mật: Thực hiện kiểm tra bảo mật định kỳ, bao gồm kiểm tra lỗ hổng, kiểm tra xác thực, kiểm tra cấu hình, và kiểm tra mã nguồn để tìm và sửa các lỗi bảo mật tiềm ẩn.
- Xây dựng các bộ kiểm thử input đầu vào. Ta có thể sử dụng class `Validator` được hỗ trợ bởi framework Laravel hoặc có thể xây dựng các kịch bản kiểm thử input đầu vào. Dưới đây là một số bộ kiểm thử input đầu vào có thể sử dụng trong website:

```php
// Thông tin thanh toán đơn hàng
$rules = [
    'name' => 'required',
    'email' => 'required|email',
    'country' => 'required',
    'city' => 'required',
    'state' => 'required',
    'street' => 'required',
    'postalCode' => 'required|postal_code',
    'phone' => 'required|vn_phone_number',
    'paymentMethodId' => 'required',
    'cart' => 'required|array|min:1',
];

// Thông tin đăng ký
$rules = [
    'name' => 'required|string|max:255',
    'email' => 'required|email|unique:users',
    'password' => 'required|string|min:8|confirmed',
];

// Thông tin cập nhật tài khoản
$rules = [
    'name' => 'required|string|max:255',
    'email' => 'required|email|unique:users,email,'.$id,
];
```

// #h2("Quản lý và bảo vệ thông tin khách hàng trên website TMĐT")

// #h3("Quản lý thông tin cá nhân và dữ liệu khách hàng")

// #h3("Bảo vệ thông tin giao dịch trên website TMĐT")

// #h3("Các qui định pháp lý liên quan")

#h2("Giải pháp xây dựng giao diện và trải nghiệm người dùng")

#h3("Xây dựng giao diện với Tailwind")

Tailwind một framework CSS utility-first được lựa chọn vì sự linh hoạt và hiệu quả trong việc thiết kế giao diện. Tailwind CSS đặc biệt hữu ích cho việc xây dựng giao diện web từ đầu, mang lại khả năng tùy chỉnh cao và sự linh hoạt trong việc tạo ra các thành phần giao diện.

Một trong những ưu điểm của Tailwind CSS là phương pháp thiết kế utility-first. Thay vì tạo ra các class CSS đặc biệt cho từng thành phần, Tailwind CSS tập trung vào việc cung cấp các class utilitarian như `w-`, `h-`, `bg-`, `text-`,... cho phép xây dựng giao diện nhanh chóng bằng cách kết hợp các class này lại với nhau. Điều này giúp tiết kiệm thời gian viết CSS từ đầu và cho phép tập trung vào việc xây dựng giao diện một cách hiệu quả.

Ngoài ra, Tailwind CSS cung cấp một design system rất phong phú với rất nhiều thành phần giao diện sẵn có. Các thành phần này bao gồm nút, thẻ, menu, biểu đồ, bảng và nhiều hơn nữa.

Một khía cạnh quan trọng khác của việc sử dụng Tailwind CSS là khả năng áp dụng Responsive Web Design (RWD). Framework cung cấp các class CSS breakpoint như `sm`, `md`, `lg`, `xl` để giúp điều chỉnh giao diện theo kích thước màn hình khác nhau. Bằng cách sử dụng các class này, ta có thể dễ dàng điều chỉnh giao diện để nó hiển thị tốt trên điện thoại di động, máy tính bảng và máy tính để bàn.

Đối với trải nghiệm người dùng, Tailwind CSS cung cấp một giao diện đẹp, dễ nhìn và dễ sử dụng. Các thành phần được thiết kế sao cho tương thích với nguyên tắc thiết kế giao diện hiện đại và hướng tới trải nghiệm người dùng tốt nhất. Ta có thể tùy chỉnh giao diện để phù hợp với thương hiệu và mục tiêu của mình, tạo nên một trải nghiệm độc đáo và chuyên nghiệp cho người dùng.

#h3("Tối ưu hóa tốc độ load trang")

Tối ưu hóa tốc độ load trang là một trong những yếu tố quan trọng để cải thiện trải nghiệm người dùng và tăng tương tác trên website TMĐT. Dưới đây là một số cách để tối ưu hóa tốc độ load trang:

- Tối ưu hóa hình ảnh: Sử dụng các công cụ tối ưu hóa hình ảnh để giảm dung lượng của các hình ảnh trên trang web, đồng thời áp dụng kỹ thuật lazy loading để chỉ tải hình ảnh khi cần thiết.
- Sử dụng cache: Sử dụng bộ nhớ cache để giảm thời gian tải lại trang web và cải thiện trải nghiệm người dùng.
- Giảm số lượng yêu cầu HTTP: Giảm số lượng yêu cầu HTTP bằng cách sử dụng các kỹ thuật như gộp file CSS và JavaScript hoặc sử dụng các CDN (Content Delivery Network) để phân phối tài nguyên trên nhiều máy chủ.
- Chọn hosting tốt: Lựa chọn một nhà cung cấp hosting tốt có thể giúp tăng tốc độ tải trang web.
- Tối ưu hóa mã nguồn: Sử dụng các phương pháp tối ưu hóa mã nguồn, chẳng hạn như sử dụng minifier để giảm kích thước của mã HTML, CSS và JavaScript.
- Sử dụng các công cụ đo lường hiệu suất: Sử dụng các công cụ đo lường hiệu suất như Google PageSpeed Insights để theo dõi và đánh giá tốc độ tải trang web.

Tuy nhiên, việc tối ưu hóa tốc độ load trang là một quá trình liên tục và cần được thực hiện thường xuyên để đạt được hiệu quả tối đa.

#h2("Kết chương")

Trong chương 2 tác giả đã trình bày các bước xây dựng mô hình cơ sở dữ liệu, thiết kế kiến trúc dự án và các quy trình tích hợp cổng thanh toán cũng như quy trình cụ thể để đảm bảo an toàn dữ liệu cho website TMĐT. Việc phân tích và đánh giá trước khi bắt đầu xây dựng sản phẩm giúp cho việc xây dựng trở nên an toàn và hiệu quả, đạt được lợi ích lớn nhất. Từ những phân tích và đánh giá đó sẽ áp dụng vào việc xây dựng website sẽ được trình bày trong Chương 3.
