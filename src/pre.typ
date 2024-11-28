#import "template.typ": *
#import "util.typ": *
#import "state.typ": bib_state
#context bib_state.get()

#h1("Lời cảm ơn", numbering: false)

Tôi xin gửi lời cảm ơn chân thành tới các giáo viên hướng dẫn của tôi, ThS. Vũ Thị Vân và ThS. Nguyễn Thị Kim Oanh, vì sự hỗ trợ và định hướng quan trọng của cô trong quá trình phân tích thiết kế kiến trúc hệ thống website thương mại điện tử. Dưới sự chỉ dạy tận tâm của các cô, tôi đã học được rất nhiều kiến thức chuyên môn và nhận được sự truyền cảm hứng về tinh thần trách nhiệm và thái độ làm việc nghiêm túc.

Tôi cũng muốn gửi lời cảm ơn đến tất cả các thầy cô trong học viện Kỹ thuật Mật Mã và khoa an toàn thông tin đã tận tình giảng dạy và truyền đạt những kiến thức và kinh nghiệm quý báu cho tôi trong suốt thời gian học tập tại học viện. Sự quan tâm và tạo mọi điều kiện thuận lợi từ phía các thầy cô cũng đã đóng góp không nhỏ trong quá trình thực hiện đồ án của tôi.

Tôi cũng không thể quên lời cảm ơn đến gia đình, bạn bè và những người đã động viên, đóng góp ý kiến và hỗ trợ tôi trong suốt quá trình học tập, nghiên cứu và hoàn thành đồ án.

Tôi xin gửi lời cảm ơn chân thành tới tất cả mọi người đã đóng góp vào quá trình học tập và hoàn thiện đồ án tốt nghiệp của tôi. Sự giúp đỡ và hỗ trợ từ mọi người là một phần không thể thiếu để tôi có thể đạt được kết quả tốt nhất.

Tôi rất biết ơn sự hướng dẫn và hỗ trợ từ ThS. Vũ Thị Vân và ThS. Nguyễn Thị Kim Oanh và toàn thể những người đã góp phần vào thành công của tôi trong quá trình thực hiện đồ án. Tôi sẽ luôn đánh giá cao sự đóng góp của mọi người và sẽ nỗ lực để áp dụng kiến thức đã học vào thực tế trong tương lai.

Tôi xin chân thành cảm ơn! \

#[
  #set align(right)
  Tp. Hồ Chí Minh, ngày 05 tháng 06 năm 2023 \
  Sinh viên thực hiện #h(75pt) \ \ \
  Ngô Quang Sang #h(80pt)
]

#h1("Lời cam đoan", numbering: false)

Tôi xin cam đoan bản đồ án này do tôi tự nghiên cứu dưới sự hướng dẫn của giảng viên hướng dẫn ThS. Vũ Thị Vân và ThS. Nguyễn Thị Kim Oanh.

Để hoàn thành đồ án này, tôi chỉ sử dụng những tài liệu đã ghi trong mục tài liệu tham khảo, ngoài ra không sử dụng bất cứ tài liệu nào khác mà không được ghi.

Nếu sai, tôi xin chịu mọi hình thức kỷ luật theo quy định của Học viện. \ \

#[
  #set align(right)
  Tp. Hồ Chí Minh, ngày 05 tháng 06 năm 2023 \
  Sinh viên thực hiện #h(75pt) \ \ \
  Ngô Quang Sang #h(80pt)
]

#h1("Mục lục", numbering: false)
#par(
  first-line-indent: 0pt,
  outline(
    title: none,
    depth: 3,
  ),
)

#h1("Danh mục các ký hiệu, chữ viết tắt", numbering: false)

#tabl(
  columns: (auto, 1fr),
  [*Từ viết tắt*],
  [*Định nghĩa*],
  [TMĐT],
  [Thương mại điện tử],
  [SSL],
  [Secure Socket Layer],
  [CSS],
  [Cascading Style Sheets],
  [HTML],
  [HyperText Markup Language - Ngôn ngữ Đánh dấu Siêu văn bản],
  [RWD],
  [Responsive web design - Thiết kế responsive],
  [URL],
  [Uniform Resource Locator],
  [PCI DSS],
  [Payment Card Industry Data Security Standard],
  [API],
  [Application Programming Interface],
  [DBMS],
  [Database Management System - Hệ quản trị cơ sở dữ liệu],
  [COD],
  [Cash on delivery - Thanh toán khi nhận hàng],
  [SQL],
  [Structured Query Language],
  [CSDL],
  [Cơ sở dữ liệu],
  [AES],
  [Advanced Encryption Standard],
  [JWT],
  [JSON Web Token],
)

#h1("Danh mục bảng", numbering: false)
#par(
  first-line-indent: 0pt,
  outline(
    title: none,
    target: figure.where(kind: table),
  ),
)

#h1("Danh mục hình vẽ, đồ thị", numbering: false)

#par(
  first-line-indent: 0pt,
  outline(
    title: none,
    target: figure.where(kind: image),
  ),
)

#h1("Mở đầu", numbering: false)

Số lượng người dùng thương mại điện tử (TMĐT) tăng nhanh: Gần đây, sự phát triển công nghệ mở ra nhiều cơ hội kinh doanh mới, giúp thị trường TMĐT phát triển và thu hút nhiều người dùng hơn.

Theo Hiệp hội Thương mại điện tử Việt Nam, hoạt động kinh doanh trên các sàn TMĐT và mạng xã hội là những nét nổi bật của ngành TMĐT Việt Nam năm 2022 và quý 1/2023. Kết quả khảo sát cho thấy có tới 65% doanh nghiệp đã triển khai hoạt động kinh doanh trên các mạng xã hội. Ngoài ra, số lượng lao động trong doanh nghiệp thường xuyên sử dụng các công cụ như Zalo, WhatsApp, Viber hay Facebook Messenger cũng liên tục tăng qua từng năm. @tapchicongthuong1

#img("23image.png", cap: "Người dùng sử dụng các nền tảng mạng xã hội trong 2 năm")

Với sự phát triển mang tính toàn cầu của mạng Internet và TMĐT, con người có thể mua bán hàng hoá và dịch vụ thông qua mạng máy tính toàn cầu một cách dễ dàng trong mọi lĩnh vực thương mại rộng lớn. Tuy nhiên đối với các giao dịch mang tính nhạy cảm này cần phải có những cơ chế đảm bảo bảo mật và an toàn vì vậy vấn đề an toàn bảo mật thông tin trong TMĐT là một vấn đề hết sức quan trọng.

Hiện nay vấn đề an toàn bảo mật cho dữ liệu và thanh toán trong TMĐT đã và đang được áp dụng phổ biến và rộng rãi ở Việt Nam và trên phạm vi toàn cầu. Vì thế vấn đề an toàn bảo mật cho dữ liệu và thanh toán đang được nhiều người tập trung nghiên cứu và tìm mọi giải pháp để đảm bảo an toàn bảo mật cho các hệ thống thông tin trên mạng. Tuy nhiên cũng cần phải hiểu rằng không có một hệ thống thông tin nào được bảo mật 100% bất kỳ một hệ thống thông tin nào cũng có những lỗ hổng về bảo mật và an toàn mà chưa được phát hiện ra. Khi giao dịch trực tuyến, người dùng thường cung cấp thông tin cá nhân và tài khoản ngân hàng. Nếu không có biện pháp bảo mật, dữ liệu này có thể bị đánh cắp và lợi dụng để gây hại.

Vấn đề an toàn bảo mật thông tin cho dữ liệu và thanh toán trong TMĐT phải đảm bảo bốn yêu cầu sau đây:

- Đảm bảo tin cậy: Các nội dung thông tin không bị theo dõi hoặc sao chép bởi những thực thể không được uỷ thác.
- Đảm bảo toàn vẹn: Các nội dung thông tin không bị thay đổi bởi những thực thể không được uỷ thác.
- Sự chứng minh xác thực: Không ai có thể tự trá hình như là bên hợp pháp trong quá trình trao đổi thông tin.
- Không thể thoái thác trách nhiệm: Người gửi tin không thể thoái thác về những sự việc và những nội dung thông tin thực tế đã gửi đi.

Mục tiêu chính của đề tài này là tạo ra sản phẩm nhằm tăng cường an toàn và bảo mật trong TMĐT: Triển khai giải pháp xác thực đảm bảo an toàn bảo mật cho dữ liệu và thanh toán giúp tăng cường an toàn và bảo mật cho giao dịch TMĐT, giúp người dùng yên tâm hơn khi giao dịch trực tuyến. Giúp nâng cao uy tín và chất lượng của website TMĐT khi triển khai các giải pháp bảo mật an toàn và đáp ứng các tiêu chuẩn an toàn quốc tế, đó là điểm cộng để nâng cao uy tín và chất lượng của website, thu hút người dùng tin tưởng và sử dụng. Nghiên cứu các kỹ thuật và triển khai các phương pháp mã hóa bảo vệ dữ liệu, chống xâm nhập và đánh cắp dữ liệu và áp dụng các kết quả đã tìm hiểu và nghiên cứu để triển khai hệ thống an toàn bảo mật cho dữ liệu và thanh toán trong TMĐT.

TMĐT đang trở thành lĩnh vực kinh doanh tiềm năng, đóng góp tích cực cho sự phát triển của nền kinh tế và xã hội. Triển khai giải pháp bảo mật an toàn cho TMĐT giúp tạo điều kiện thuận lợi cho sự phát triển của lĩnh vực này, giúp doanh nghiệp TMĐT tăng cường sự tin tưởng của khách hàng và nâng cao hiệu quả kinh doanh. Hiện nay, các quy định về bảo mật thông tin và thanh toán trực tuyến đang được nhiều quốc gia và khu vực áp dụng. Triển khai giải pháp bảo mật an toàn cho TMĐT giúp đáp ứng các tiêu chuẩn và quy định này, giúp website TMĐT tránh được các rủi ro về pháp lý.

Vì vậy, đề tài này có tính cấp thiết và ý nghĩa thực tiễn cao, giúp tăng cường an toàn và bảo mật cho giao dịch TMĐT, đóng góp tích cực cho sự phát triển của lĩnh vực TMĐT và đáp ứng các tiêu chuẩn và quy định của pháp luật.
