#import "template.typ": *
#import "util.typ": *
#import "state.typ": bib_state
#context bib_state.get()

#h1("Xây dựng sản phẩm")

#h2("Chuẩn bị môi trường phát triển")

#tabl(
  columns: (auto, 1fr),
  [OS],
  [Linux],
  [Web hosting control panel],
  [cPanel],
  [Webserver],
  [Apache],
  [Version control system],
  [Git, Github],
  [Web framework],
  [Laravel],
  [Database],
  [MySQL],
  [IDE],
  [Visual Studio Code],
  cap: "Môi trường phát triển website TMĐT",
)

Việc chuẩn bị môi trường phát triển là rất quan trọng trong quá trình phát triển của một dự án web. Có nhiều yếu tố ảnh hưởng đến việc lựa chọn công nghệ: chi phí, chất lượng nhân lực, tính mở rộng, sự phổ biến và hỗ trợ từ cộng đồng của công nghệ đó,... Việc lựa chọn công nghệ phù hợp với dự án giúp cho việc phát triển dự án nhanh chóng, hiệu quả và ít rủi ro hơn.

Sau nhiều lần tìm hiểu và cân nhắc, tác giả quyết định sử dụng Laravel là một web framework hỗ trợ rất mạnh mẽ trong việc xây dựng website. Laravel được sử dụng rất phổ biến trong cộng đồng lập trình viên web vì sự mạnh mẽ cũng như hỗ trợ và cập nhật rất tốt từ tác giả và cộng đồng.

Vể IDE thì lựa chọn phổ biến nhất cho lập trình viên web đó là VS Code do đây là IDE được sử dụng phổ biến và được hỗ trợ rất tốt từ cộng đồng với khả năng tùy biến cao và nhiều plugin kèm theo. Ngoài ra còn do cá nhân tác giả đã có nhiều kinh nghiệm sử dụng VS Code. Đây là lựa chọn thuộc về chất lượng nhân lực.

Về phần hạ tầng tác giả chủ trương sử dụng web hosting để tiết kiệm chi phí và dễ dàng bảo trì, do đó đi kèm theo là sử dụng hệ điều hành Linux, cPanel control panel, MySQL database và Apache web server do đây là 4 service kèm theo phổ biến của shared web hosting và cũng phù hợp với nhu cầu dự án.

#h2("Xây dựng cơ sở dữ liệu")

Mã SQL trên định nghĩa các bảng trong cơ sở dữ liệu MySQL. Dưới đây là danh sách các bảng và chức năng của chúng:

Bảng `addresses`:
- Chức năng: Lưu trữ thông tin địa chỉ.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `country`: `varchar(255)`, không được để trống.
  - `city`: `varchar(255)`, không được để trống.
  - `state`: `varchar(255)`, không được để trống.
  - `street`: `varchar(255)`, không được để trống.
  - `zip_code`: `varchar(255)`, không được để trống.

Bảng `cart_items`:
- Chức năng: Lưu trữ thông tin về các mục trong giỏ hàng.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `product_id`: Khóa ngoại đến bảng `products` (id).
  - `user_id`: Khóa ngoại đến bảng `users` (id).
  - `quantity`: Số nguyên không dấu, không được để trống.
  - `created_at`: Thời điểm tạo, kiểu timestamp, không được để trống.
  - `updated_at`: Thời điểm cập nhật, kiểu timestamp, không được để trống.
  - `deleted_at`: Thời điểm xóa, kiểu timestamp, có thể là null.

Bảng `fulfilled_orders`:
- Chức năng: Lưu trữ thông tin về các đơn hàng đã hoàn tất.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `phone`: `varchar(255)`, không được để trống.
  - `email`: `varchar(255)`, không được để trống.
  - `total`: Số thực không dấu, không được để trống.
  - `status`: Số nguyên không dấu, không được để trống.
  - `created_at`: Thời điểm tạo, kiểu timestamp, có thể là null.
  - `updated_at`: Thời điểm cập nhật, kiểu timestamp, có thể là null.
  - `shipping_provider_id`: Khóa ngoại đến bảng "shipping_providers" (id).
  - `tracking_id`: `varchar(255)`, không được để trống.
  - `note`: `varchar(255)`, có thể là null.
  - `shipping_cost`: Số thực không dấu, không được để trống.
  - `address_id`: Khóa ngoại đến bảng "addresses" (id).

Bảng `orders`:
- Chức năng: Lưu trữ thông tin về các đơn hàng.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `payment_method_id`: Khóa ngoại đến bảng `payment_methods` (id).
  - `name`: `varchar(255)`, không được để trống.
  - `email`: `varchar(255)`, không được để trống.
  - `phone`: `varchar(255)`, không được để trống.
  - `total`: Số thực không dấu, không được để trống.
  - `note`: Kiểu văn bản, có thể là null.
  - `status`: ENUM('unpaid', 'processing', 'paid', 'cancelled', 'cod'), không được để trống.
  - `user_id`: Khóa ngoại đến bảng `users` (id).
  - `address_id`: Khóa ngoại đến bảng `addresses` (id).
  - `fulfilled_order_id`: Khóa ngoại đến bảng `fulfilled_orders` (id), có thể là null.
  - `created_at`: Thời điểm tạo, kiểu timestamp, không được để trống.
  - `updated_at`: Thời điểm cập nhật, kiểu timestamp, không được để trống.
  - `deleted_at`: Thời điểm xóa, kiểu timestamp, có thể là null.

Bảng `order_items`:
- Chức năng: Lưu trữ thông tin về các mục hàng trong đơn hàng.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `product_id`: Khóa ngoại đến bảng `products` (id).
  - `quantity`: Số nguyên không dấu, không được để trống.
  - `price`: Số thực không dấu, không được để trống.
  - `order_id`: Khóa ngoại đến bảng `orders` (id).

Bảng `payment_methods`:
- Chức năng: Lưu trữ thông tin về các phương thức thanh toán.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `name`: `varchar(255)`, không được để trống.
  - `code`: `varchar(255)`, không được để trống.
  - `enable`: Số nguyên nhỏ (1 hoặc 0), không được để trống.

Bảng `products`:
- Chức năng: Lưu trữ thông tin về các sản phẩm.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `name`: `varchar(255)`, không được để trống.
  - `description`: Kiểu văn bản, có thể là null.
  - `price`: Số thực không dấu, không được để trống.
  - `sku`: `varchar(255)`, không được để trống.
  - `availability`: Số nguyên nhỏ (1 hoặc 0), không được để trống.
  - `quantity`: Số nguyên, có thể là null.
  - `discount_price`: Số thực không dấu, có thể là null.
  - `slug`: `varchar(255)`, không được để trống.
  - `created_at`: Thời điểm tạo, kiểu timestamp, không được để trống.
  - `updated_at`: Thời điểm cập nhật, kiểu timestamp, không được để trống.
  - `deleted_at`: Thời điểm xóa, kiểu timestamp, có thể là null.

Bảng `shipping_providers`:
- Chức năng: Lưu trữ thông tin về nhà cung cấp vận chuyển.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `name`: `varchar(255)`, không được để trống.
  - `code`: `varchar(255)`, không được để trống.
  - `enable`: Số nguyên nhỏ (1 hoặc 0), không được để trống.

Bảng `users`:
- Chức năng: Lưu trữ thông tin về người dùng.
- Các cột:
  - `id`: Khóa chính, số nguyên không dấu, tự động tăng.
  - `name`: `varchar(255)`, không được để trống.
  - `email`: `varchar(255)`, không được để trống, duy nhất.
  - `email_verified_at`: Thời điểm xác minh email, kiểu timestamp, có thể là null.
  - `password`: `varchar(255)`, không được để trống.
  - `remember_token`: `varchar(100)`, có thể là null.
  - `created_at`: Thời điểm tạo, kiểu timestamp, không được để trống.
  - `updated_at`: Thời điểm cập nhật, kiểu timestamp, không được để trống.

Những bảng có cột `deleted_at` cho thấy có sử dụng cơ chế "soft delete" (soft delete là phương pháp đánh dấu thời gian thực hiện xóa bản ghi ở cột `deleted_at` nhưng không xóa bản ghi trong cơ sở dữ liệu, website sẽ dựa vào đó để truy vấn và chỉ trả về những bản ghi chưa có giá trị `deleted_at`).

// @startuml
// !define Table(name,desc) class name as "desc" << (T,#FFAAAA) >>
// !define primary_key(x) <b>x</b>
// !define foreign_key(x) <u>x</u>
// !define unique(x) <i>x</i>
// !define index(x) <i>x</i>
// hide methods
// hide stereotypes
// Table(addresses, "addresses") {
//   primary_key(id) bigint unsigned
//   country varchar(255)
//   city varchar(255)
//   state varchar(255)
//   street varchar(255)
//   zip_code varchar(255)
// }
// Table(cart_items, "cart_items") {
//   primary_key(id) bigint unsigned
//   foreign_key(product_id) bigint unsigned
//   foreign_key(user_id) bigint unsigned
//   quantity int unsigned
//   created_at timestamp
//   updated_at timestamp
//   deleted_at timestamp
// }
// Table(fulfilled_orders, "fulfilled_orders") {
//   primary_key(id) bigint unsigned
//   phone varchar(255)
//   email varchar(255)
//   total double unsigned
//   status int unsigned
//   created_at timestamp
//   updated_at timestamp
//   foreign_key(shipping_provider_id) bigint unsigned
//   tracking_id varchar(255)
//   note varchar(255)
//   shipping_cost double unsigned
//   foreign_key(address_id) bigint unsigned
// }
// Table(orders, "orders") {
//   primary_key(id) bigint unsigned
//   foreign_key(payment_method_id) bigint unsigned
//   name varchar(255)
//   email varchar(255)
//   phone varchar(255)
//   total double unsigned
//   note text
//   status enum
//   foreign_key(user_id) bigint unsigned
//   foreign_key(address_id) bigint unsigned
//   foreign_key(fulfilled_order_id) bigint unsigned
//   created_at timestamp
//   updated_at timestamp
//   deleted_at timestamp
// }
// Table(order_items, "order_items") {
//   primary_key(id) bigint unsigned
//   foreign_key(product_id) bigint unsigned
//   quantity int unsigned
//   price double unsigned
//   foreign_key(order_id) bigint unsigned
// }
// Table(payment_methods, "payment_methods") {
//   primary_key(id) bigint unsigned
//   name varchar(255)
//   code varchar(255)
//   enable tinyint(1)
// }
// Table(products, "products") {
//   primary_key(id) bigint unsigned
//   name varchar(255)
//   description text
//   price double unsigned
//   sku varchar(255)
//   availability tinyint(1)
//   quantity int
//   discount_price double unsigned
//   slug varchar(255)
//   created_at timestamp
//   updated_at timestamp
//   deleted_at timestamp
// }
// Table(shipping_providers, "shipping_providers") {
//   primary_key(id) bigint unsigned
//   name varchar(255)
//   code varchar(255)
//   enable tinyint(1)
// }
// Table(users, "users") {
//   primary_key(id) bigint unsigned
//   name varchar(255)
//   email varchar(255)
//   email_verified_at timestamp
//   password varchar(255)
//   remember_token varchar(100)
//   created_at timestamp
//   updated_at timestamp
// }
// addresses "1" -- "1..*" orders
// fulfilled_orders "1" -- "1..*" orders
// payment_methods "1" -- "1..*" orders
// shipping_providers "1" -- "1..*" fulfilled_orders
// products "1" -- "1..*" order_items
// users "1" -- "1..*" orders
// users "*" -- "1..*" cart_items
// addresses "*" -- "1" fulfilled_orders
// orders "1" -- "0..1" fulfilled_orders
// orders "*" -- "1..*" order_items
// products "*" -- "1..*" cart_items
// @enduml
#img(
  "55image.png",
  cap: "Biểu đồ quan hệ mô tả cấu trúc các bảng và quan hệ giữa chúng trong cơ sở dữ liệu của website TMĐT",
)

#h2("Xây dựng giao diện và trải nghiệm người dùng")

#h3("Cài đặt và sử dụng thư viện Tailwind")

Tác giả sử dụng hệ thống thiết kế cơ bản của Tailwind làm hệ thống thiết kế chính cho dự án. Tailwind là một thư viện design component phổ biến trong cộng đồng do đó có đa dạng thiết kế và ý tưởng được hỗ trợ từ cộng đồng. Kèm theo đó là sử dụng công cụ Vite để biên dịch và đóng gói code @vite.

Để cài đặt Tailwind cho website ta thực hiện các bước sau:

Cài đặt thư viện Tailwind bằng câu lệnh:

```sh
npm install -D tailwindcss
```

Khởi tạo file cấu hình Tailwind bằng câu lệnh:

```sh
npx tailwindcss init
```

Sau khi chạy câu lệnh hệ thống sẽ tạo ra file `tailwind.config.js` với nội dung bên dưới, trong file này ta có thể cài đặt thêm các plugin, theme và khai báo vào thuộc tính tương ứng, ngoài ra ta còn có thể cấu hình cho Tailwind tự động đọc và hot-reload những file được khai báo trong thuộc tính `content`:

```js
export default {
    content: [],
    corePlugins: {},
    plugins: [],
};
```

Sau khi tác giả cài đặt các thư viện cần thiết và khai báo đường dẫn những file giao diện web thì file có nội dung như sau:

```js
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],
    corePlugins: {
        aspectRatio: false,
    },
    plugins: [forms, require('@tailwindcss/typography'), require('@tailwindcss/aspect-ratio'), require('@tailwindcss/forms')],
};

```

Tiếp đến ta tạo file `app.css` vói nội dung như bên dưới, file CSS này import các thư viện CSS cùa Tailwind:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

Trong file `vite.config.js` ta cấu hình Tailwind cho Laravel như sau:

```js
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
export default defineConfig({
    plugins: [
        laravel({
            input: ['path/to/app.css'], // replace your app.css path
            refresh: true,
        }),
    ],
});
```

Sau khi đã cài đặt và cấu hình, ta chạy câu lệnh bên dưới để Tailwind tiến hành đọc và biên dịch những file được khai báo:

```sh
npm run dev
```

Cuối cùng mở Visual Studio Code và truy cập mã nguồn giao diện của website để lập trình. Ví dụ một đoạn mã giao diện sử dụng các class của thư viện Tailwind trong Laravel Blade:

```html
<div {{ $attributes->merge(['class' => 'rounded-md bg-green-50 dark:bg-green-900 p-4']) }}>
    <div class="flex">
        <div class="flex-shrink-0">
            <!-- Heroicon name: solid/check-circle -->
            <svg class="h-5 w-5 text-green-400 dark:text-green-200" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
            </svg>
        </div>
        <div class="ml-3">
            <p class="text-sm font-medium text-green-800 dark:text-green-200">
                {{ $slot }}
            </p>
        </div>
    </div>
</div>
```

Kết quả hiển thị:

#img("Screenshot 2023-06-07 013927.png", cap: "Giao diện thông báo thành công của website")

#h3("Xây dựng thành phần giao diện website")

Thành phần giao diện của website được xây dựng trong thư mục `views` của website bao gồm các thư mục chính bên trong sau:

- `components`: Chứa các thành phần giao diện có thể tái sử dụng nhiều lần trong website như giao diện thông báo, bảng, ô nhập, menu,...
- `layouts`: Chứa các khung giao diện có thể tái sử dụng nhiều lần ở các trang trong website. Ví dụ như khung giao diện quản trị nội dung và khung giao diện website dành cho khách hàng.
- `livewire`: Chứa những thành phần giao diện website có thể tương tác trong thời gian thực với server như trang quản lý giỏ hàng, nút thêm sản phẩm vào giỏ hàng.
- `admin`: Chứa các giao diện của các trang quản trị website.

Việc phân tách các giao diện có chức năng tương tự nhau vào các thư mục cụ thể giúp cho việc quản lý mã nguồn giao diện dễ dàng hơn và tối ưu hiệu suất khi lập trình.

#h3("Trải nghiệm người dùng")

Tác giả đã dành nhiều thời gian tham gia trải nghiệm các sản phẩm tương tự khác, trong số đó có nhiều sản phẩm phổ biến để đánh giá ưu nhược điểm của trải nghiệm người dùng từ đó cải thiện trải nghiệm cho sản phẩm này.

Trong quá trình xây dựng giao diện và trải nghiệm người dùng cho website TMĐT, tác giả đã đặt trọng điểm vào việc mang lại trải nghiệm tuyệt vời và thuận tiện cho người dùng. Đây là một phần quan trọng để thu hút và giữ chân khách hàng. Đảm bảo người dùng dễ dàng tìm thấy và khám phá các sản phẩm một cách nhanh chóng. Giao diện được thiết kế đơn giản, với bố cục rõ ràng và các thành phần giao diện được sắp xếp hợp lý, tạo ra một trải nghiệm trực quan và dễ sử dụng.

Việc đăng ký tài khoản cũng được đơn giản hóa để người dùng có thể nhanh chóng trở thành thành viên của trang web. Website đã tích hợp các tùy chọn đăng ký thông qua email và mật khẩu, cùng với việc đăng ký bằng tài khoản Google, giúp người dùng tiết kiệm thời gian hơn.

Tính năng giỏ hàng được thiết kế để giúp người dùng quản lý và kiểm soát quá trình mua hàng một cách thuận tiện. Người dùng có thể dễ dàng thêm và xóa sản phẩm trong giỏ hàng, cập nhật số lượng sản phẩm và xem tổng giá trị đơn hàng. Điều này giúp người dùng có trải nghiệm mua sắm trực tuyến mượt mà và tiết kiệm thời gian.

Website cũng đã tích hợp nhiều phương thức thanh toán đa dạng để đáp ứng nhu cầu và sự thuận tiện của người dùng. Các tùy chọn thanh toán như Zalopay, Paypal và nhiều hơn nữa được tích hợp vào website, cho phép người dùng lựa chọn phương thức phù hợp và hoàn tất quá trình thanh toán một cách dễ dàng.

#img("18image.png", cap: "Giao diện trang xem giỏ hàng của website")

#img("19image.png", cap: "Giao diện trang đăng ký của website")

Website cũng đã được tối ưu hóa cho trải nghiệm di động, giúp người dùng truy cập và duyệt sản phẩm trên các thiết bị di động một cách thuận tiện. Thiết kế đáp ứng (RWD) đã được áp dụng để đảm bảo giao diện hiển thị tốt trên các kích thước màn hình khác nhau, từ điện thoại thông minh đến máy tính bảng và máy tính để bàn.

#img(
  "Screenshot 2023-06-07 015605.png",
  cap: "Giao diện website khi responsive ở màn hình máy tính (1280px)",
  width: 90%,
)

#img("20image.png", cap: "Giao diện website khi responsive ở màn hình Iphone 11 Pro (375px)", width: 38%)

#h2("Lập trình các chức năng và tính năng")

#h3("Tính năng đăng nhập và đăng ký với email/password")

Mặc định website sẽ sử dụng email/password để tiến hành đăng nhập, website sẽ lưu thông tin tên, email của người dùng. Ngoài ra còn hỗ trợ tính năng "Remember me" giúp người dùng dễ dàng quản lý phiên đăng nhập cho mình. @breeze

Code xử lý tính năng đăng nhập với email/password:
```php
if (! Auth::attempt($this->only('email', 'password'), $this->boolean('remember'))) {
    RateLimiter::hit($this->throttleKey());

    throw ValidationException::withMessages([
        'email' => trans('auth.failed'),
    ]);
}
```

Code xử lý tính năng đăng ký với email/password:
```php
public function store(Request $request): RedirectResponse
{
    $request->validate([
        'name' => ['required', 'string', 'max:255'],
        'email' => ['required', 'string', 'email', 'max:255', 'unique:' . User::class],
        'password' => ['required', 'confirmed', 'min:8', Rules\Password::defaults()],
    ]);
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
    ]);
    event(new Registered($user));
    Auth::login($user);
    return redirect(RouteServiceProvider::HOME);
}
```

#h3("Tính năng đăng nhập và đăng ký với tài khoản Google")

Tính năng đăng nhập và đăng ký với tài khoản Google sử dụng chuẩn OAuth 2.0 để triển khai trong website. Các bước triển khai được trình bày bên dưới. @oauth20google

Tạo Google OAuth Credentials:

- Vào trang https://console.developers.google.com và tạo project mới.
- Bật tính năng Google+ API bằng cách vào mục "Library" và tìm "Google+ API". Chọn và kích hoạt.
- Vào mục "Credentials" và chọn "Create Credentials". Chọn "OAuth client ID" ở menu xổ xuống.
- Cấu hình "name" và "authorized domains" của mục OAuth consent screen.
- Chọn "Web application".
- Thêm authorized redirect URIs. Ví dụ ở đây là `http://localhost/auth/google/callback` cho môi trường phát triển.
- Chọn "Create" để tạo OAuth client. Lưu giá trị mục "Client ID" và "Client Secret" vừa tạo.

Cấu hình Laravel:

Mở file `.env` và thêm Google OAuth client credentials:

```
GOOGLE_CLIENT_ID=your-client-id
GOOGLE_CLIENT_SECRET=your-client-secret
GOOGLE_REDIRECT_URI=http://localhost/auth/google/callback
```

Tạo routes cho việc xác thực Google ở file `routes/web.php`:

```php
Route::get('/auth/google', [LoginController::class, 'redirectToGoogle']);
Route::get('/auth/google/callback', [LoginController::class, 'handleGoogleCallback']);
```

Tạo mới controller tên `LoginController` sử dụng câu lệnh sau:

```bash
php artisan make:controller Auth/LoginController
```

Mở file `LoginController.php` và triển khai hàm `redirectToGoogle` có chức năng chuyển hướng người dùng đến trang xác thực của Google và hàm `handleGoogleCallback` có chức năng nhận dữ liệu đã xác thực phía Google gửi về:

```php
public function redirectToGoogle()
{
    $params = [
        'client_id' => config('app.google_client_id'),
        'redirect_uri' => config('app.google_redirect_uri'),
        'response_type' => 'code',
        'scope' => 'openid email profile',
        'state' => csrf_token(),
    ];
    $url = 'https://accounts.google.com/o/oauth2/auth?' . http_build_query($params);
    return redirect($url);
}

public function handleGoogleCallback(Request $request)
{
    $state = $request->query('state');
    $code = $request->query('code');

    if ($state !== csrf_token())
        return redirect('/login')->withErrors('Invalid state parameter');

    $response = Http::asForm()->post('https://oauth2.googleapis.com/token', [
        'code' => $code,
        'client_id' => config('app.google_client_id'),
        'client_secret' => config('app.google_client_secret'),
        'redirect_uri' => config('app.google_redirect_uri'),
        'grant_type' => 'authorization_code',
    ]);

    if ($response->failed())
        return redirect('/login')->withErrors('Failed to retrieve access token');

    $access_token = $response->json('access_token');

    $response = Http::withHeaders([
        'Authorization' => 'Bearer ' . $access_token,
    ])->get('https://www.googleapis.com/oauth2/v3/userinfo');

    if ($response->failed())
        return redirect('/login')->withErrors('Failed to retrieve user information');

    $user = $response->json();

    Auth::loginUsingId($userId);

    return redirect('/home');
}
```

Đoạn code bên trên cũng là code triển khai OAuth 2.0 của Google vào website Laravel.

Cuối cùng thêm đoạn code hiển thị nút đăng nhập với Google vào trang đăng nhập của website:

```html
<div {{ $attributes }}>
    <a href="{{ route('auth.google.redirect') }}"
        class="flex items-center justify-center bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 font-semibold py-2 px-4 border border-gray-300 dark:border-gray-700 rounded-lg shadow-md transition duration-300 ease-in-out hover:bg-gray-100 dark:hover:bg-gray-700 hover:border-gray-400 dark:hover:border-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 dark:focus:ring-offset-gray-800">
        <img class="w-6 h-6 mr-2" src="{{ asset('assets/images/google.svg') }}" alt="Login with Google" />
        Sign in with Google
    </a>
</div>
```

Sử dụng tính năng:

- Khởi động Docker, sau đó khởi Laravel bằng câu lệnh:
```bash
sail up -d
```
- Vào link trang đăng nhập của website sau đó nhấn chọn "Login with Google".
- Ta sẽ được chuyển hướng đến trang đăng nhập của Google. Tiến hành đăng nhập và xác thực tài khoản.
- Sau khi xác thực thành công ta sẽ được chuyển hướng về trang `/home`.

#h3("Tính năng giỏ hàng")

Tính năng giỏ hàng của website yêu cầu khách hàng phải đăng nhập để sử dụng. Dựa vào mô hình dữ liệu được thiết kế ở mục 2.2.2 thì mỗi khách hàng sẽ có một giỏ hàng duy nhất.

Sau khi đăng nhập, khi khách hàng nhấn nút "Add to cart" thì sản phẩm sẽ được thêm vào giỏ hàng của khách hàng và được cập nhật ngay lập tức mà không cần load lại trang. Việc không load lại trang giúp cho trải nghiệm mua sắm của khách hàng được mượt mà trơn tru hơn.

#img("21image.png", cap: "Giao diện của nút thêm sản phẩm vào giỏ hàng")

Code giao diện của tính năng thêm sản phẩm vào giỏ hàng:

```html
<button wire:loading.attr="disabled" wire:target="addToCart" wire:click="addToCart"
    class="mt-8 w-full bg-indigo-600 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
    <x-loading-spin class="mt-2" wire:loading wire:target="addToCart" />
    Add to cart
</button>
```

Code xử lý của tính năng thêm sản phẩm vào giỏ hàng:

```php
public function addToCart($quantity = 1) {
    try {
        $user = Auth::user();

        if (!$user->id)
            throw new Exception('You must be logged in to add to cart.', 1);

        // check quantity
        if ($quantity < 1)
            throw new Exception('Quantity must be greater than 0.', 1);

        // check product exists
        $product = Product::find($this->productId);
        if (is_null($product))
            throw new Exception('Product not found.', 1);

        // add to cart
        $cartItem = CartItem::where('user_id', $user->id)
            ->where('product_id', $product->id)->first();
        if (is_null($cartItem)) {
            CartItem::create([
                'product_id' => $product->id,
                'quantity' => $quantity,
                'user_id' => $user->id,
            ]);
        } else {
            $cartItem->quantity = $cartItem->quantity + $quantity;
            $cartItem->save();
        }

        // response
        $this->alert('success', 'Product added successfully');
        $this->emit("cart-update");
    } catch (Exception $e) {
        $this->alert(
            'error',
            $e->getCode() ? $e->getMessage() : "Error updating quantity."
        );
    }
}
```

#h3("Tính năng thanh toán")

Website có 3 phương thức thanh toán chính: Thanh toán qua Zalopay, Paypal và thanh toán Cash On Delivery (COD).

#img("22image.png", cap: "Giao diện chọn phương thức thanh toán trong website", width: 80%)

Thông tin người dùng cần nhập khi thanh toán bao gồm: email người nhận, tên người nhận, số điện thoại người nhận và địa chỉ.

Code kiểm tra thông tin người dùng nhập vào đơn hàng, nếu thông tin đúng format và chính xác thì sẽ tạo đơn hàng:

```php
protected $rules = [
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

// ...

public function createOrder() {
    $this->validate();

    try {
        $user = $this->getUser();

        // custom validate
        if (is_null(PaymentMethod::where('id', $this->paymentMethodId)
            ->where('enable', true)->first()))
            throw new Exception('Payment method does not exist.', 1);

        $count = $user->cartItems()
            ->whereIn('id', array_map(fn ($item) => $item['id'], $this->cart))->count();
        if ($count != count($this->cart))
            throw new Exception('Cart items are wrong.', 1);

        $productIds = array_map(fn ($item) => $item['product_id'], $this->cart);
        $count = Product::whereIn('id', $productIds)->count();
        if ($count != count($productIds))
            throw new Exception('Cart items are wrong.', 1);

        foreach ($this->cart as &$item)
            if ($item['user_id'] != $user->id || $item['quantity'] < 1)
                throw new Exception('Cart items are wrong.', 1);

        DB::beginTransaction();
        $addressId = Address::insertGetId([
            'country' => $this->country,
            'city' => $this->city,
            'state' => $this->state,
            'street' => $this->street,
            'zip_code' => $this->postalCode,
        ]);
        $orderId = Order::insertGetId([
            'user_id' => $user->id,
            'address_id' => $addressId,
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'total' => $this->total(),
            'payment_method_id' => $this->paymentMethodId,
            'status' => OrderStatus::UNPAID,
        ]);
        OrderItem::insert(
            array_map(function ($v) use ($orderId) {
                return [
                    'order_id' => $orderId,
                    'product_id' => $v['product']['id'],
                    'quantity' => $v['quantity'],
                    'price' => $v['product']['price'],
                ];
            }, $this->cart)
        );
        $user->cartItems()->delete();
        DB::commit();
        return redirect()->route('order.pay', ['order' => $orderId]);
    } catch (Exception $e) {
        DB::rollBack();
        return $this->handleException($e);
    }
}
```

Code xử lý thanh toán:

```php
public function pay(Request $request, Order $order)
{
    $order->with('paymentMethod');

    // cod
    if ($order->paymentMethod->code === 'cod')
        return redirect()->route('order.show', $order->id);

    // process payment
    $paymentGateway = null;
    switch ($order->paymentMethod->code) {
        case 'zalopay':
            $paymentGateway = new Zalopay();
            break;
        case 'paypal':
            $paymentGateway = new Paypal();
            break;
    }
    return $paymentGateway->pay($order);
}
```

#h3("Tính năng quản lý đơn hàng")

Mỗi người dùng chỉ quản lý đơn hàng của mình.

Quản trị viên có thể xem tất cả đơn hàng.

Code xử lý lấy dữ liệu đơn hàng của người dùng:

```php
public function show(Order $order)
{
    $order->with('paymentMethod', 'address', 'orderItems.product');
    return view('orders.show', ['order' => $order]);
}
```

// #h3("Đảm bảo an toàn và bảo mật cho website")

// #h3("Triển khai website TMĐT")

// #h2("Kiểm thử và nâng cao chất lượng sản phẩm")

// #h3("Kiểm thử chức năng")

// #h3("Kiểm thử hiệu suất và tải trang")

// #h3("Kiểm thử bảo mật")

// #h3("Nâng cao chất lượng sản phẩm")

// #h2("Quản lý và vận hành website")

// #h3("Quản lý nội dung website")

// #h3("Quản lý danh mục sản phẩm và kho hàng")

// #h3("Quản lý đơn hàng và thanh toán")

// #h3("Quản lý khách hàng và dịch vụ hỗ trợ")

// #h2("Đảm bảo an toàn và bảo mật cho website")

// #h3("Sử dụng HTTPS để bảo mật kết nối")

// #h3("Xác thực người dùng và quản lý phiên làm việc")

// #h3("Kiểm tra dữ liệu đầu vào và đầu ra")

// #h3("Áp dụng các giải pháp bảo mật như CAPTCHA, ReCaptcha")

// #h3("Theo dõi và giám sát hệ thống thường xuyên")

#h2("Kết chương")

Qua chương 3 tác giả đã trình bày các bước triển khai xây dựng các tính năng chính trong một website TMĐT dựa vào các khảo sát phân tích và những thiết kế mô hình được thực hiện ở Chương 1 và Chương 2.

#h1("Kết luận chung", numbering: false)

Thương mại điện tử mở ra cơ hội kinh doanh trực tuyến trên toàn cầu. Khách hàng có thể truy cập và mua hàng từ bất kỳ đâu và bất kỳ khi nào, giúp mở rộng phạm vi tiếp cận khách hàng và tăng doanh thu. Doanh nghiệp ngày nay cần cạnh tranh trên không gian trực tuyến để tồn tại và phát triển. Website thương mại điện tử cho phép doanh nghiệp tiếp cận được khách hàng tiềm năng và cung cấp thông tin sản phẩm, dịch vụ, đánh giá, và khuyến mãi để thu hút và giữ chân khách hàng cũng như mở rộng khả năng tiếp cận thị trường, giúp doanh nghiệp tăng doanh số bán hàng và khách hàng. Do đó việc xây dựng website thương mại điện tử là một công việc có tính cấp thiết cao trong thời đại số hóa ngày nay. Đề tài này đã giúp tác giả nhận thức rõ hơn về tính cấp thiết đó và tạo động lực để tiếp tục nghiên cứu và phát triển trong lĩnh vực này.

Qua quá trình thực hiện đề tài nghiên cứu này, đồ án đã đạt được một số mục tiêu mong muốn. Tác giả đã tiến hành phân tích, khảo sát và xây dựng và hoàn thiện phần lớn đề tài, bao gồm xác định các yêu cầu chức năng và yêu cầu an toàn, thực hiện việc phân tích thiết kế các yêu cầu bằng các biểu đồ phân rã chức năng, biểu đồ use-case, mô hình quan hệ và lưu trữ dữ liệu,... cho đến việc triển khai các chức năng quan trọng của website TMĐT như tính năng đăng nhập/đăng ký, giỏ hàng và thanh toán. Tạo nền tảng cho việc phát triển website TMĐT trong thực tế.

Tuy nhiên, do thời gian nghiên cứu, kiến thức và tìm hiểu còn hạn chế do đó đồ án còn một số thiếu sót. Tác giả nhận thức được rằng đề tài này đòi hỏi sự hiểu biết và kỹ năng rộng hơn để đạt được một hệ thống hoàn thiện.

Trong tương lai, tác giả sẽ tiếp tục nghiên cứu, tìm hiểu và nâng cấp hệ thống để hoàn thiện và đáp ứng được yêu cầu sử dụng trong thực tế. Tác giả rất mong nhận được ý kiến đóng góp quý báu từ thầy cô để đồ án có thể phát triển và hoàn thiện hơn nữa.

Để phát triển và nâng cao chất lượng hệ thống, tác giả sẽ tiếp tục nghiên cứu, tìm hiểu và áp dụng các công nghệ mới, cũng như thực hiện các bước nâng cấp và tối ưu hóa hệ thống hiện tại.
