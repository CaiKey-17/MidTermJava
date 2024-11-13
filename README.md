# ✨SpringCommerce✨
> Tác giả: Nguyễn Cao Kỳ - 52200056

SpringCommerce là một ứng dụng mua sắm trực tuyến đơn giản, hỗ trợ các tính năng cơ bản như tìm kiếm sản phẩm, thêm vào giỏ hàng và đặt hàng với thanh toán khi nhận hàng. Dự án này được xây dựng với Java Spring Boot và sử dụng cơ sở dữ liệu MySQL để lưu trữ dữ liệu sản phẩm, khách hàng và đơn hàng.


## 1. Nguyên Tắc và Thực Hành Phát Triển Phần Mềm
### Các Nguyên Tắc:
- Single Responsibility Principle (SRP): Mỗi lớp (class) và phương thức (method) chỉ đảm nhiệm một trách nhiệm duy nhất.
- Open/Closed Principle (OCP): Mã nguồn được thiết kế để có thể mở rộng thêm tính năng mà không cần sửa đổi code hiện có.
- Dependency Injection: Giúp giảm sự phụ thuộc của các thành phần và dễ dàng kiểm thử .
- RESTful Design: API được thiết kế theo kiến trúc RESTful, giúp tối ưu hóa các thao tác CRUD và cải thiện tính tương tác của hệ thống.
### Các Mẫu Thiết Kế Được Sử Dụng:
- MVC Pattern (Model-View-Controller): Cấu trúc ứng dụng theo mô hình MVC để tách biệt phần xử lý nghiệp vụ và giao diện người dùng. Trong ứng dụng này, các yêu cầu từ người dùng được gửi tới Controller, nơi chúng sẽ được xử lý và gọi đến Service để thực hiện các nghiệp vụ. Kết quả được gửi về View hoặc trả về API cho giao diện người dùng.
- Repository Pattern: Cung cấp lớp trung gian giữa ứng dụng và cơ sở dữ liệu, giúp dễ dàng kiểm soát các truy vấn dữ liệu. Các lớp Repository thực hiện các thao tác truy xuất dữ liệu từ cơ sở dữ liệu và có thể mở rộng khi cần thêm các thao tác truy vấn phức tạp hơn.
- Service Layer Pattern: Tầng Service chịu trách nhiệm xử lý các nghiệp vụ chính của ứng dụng. Tầng này đảm bảo rằng các nghiệp vụ được tách biệt khỏi lớp Controller, giúp Controller trở nên nhẹ nhàng và chỉ tập trung vào việc nhận/gửi yêu cầu và trả về dữ liệu. Service cũng là nơi kiểm soát luồng xử lý, thực hiện kiểm tra và xử lý logic trước khi gửi yêu cầu đến lớp Repository hoặc xử lý dữ liệu nhận về từ Repository.
- Model: Trong ứng dụng này, Model đại diện cho các thực thể trong cơ sở dữ liệu. Các lớp Model sẽ được ánh xạ trực tiếp vào các bảng trong cơ sở dữ liệu, ví dụ như Product, Customer, Order, v.v. Mỗi thực thể này sẽ có các thuộc tính tương ứng với các cột trong bảng cơ sở dữ liệu và sẽ được sử dụng để thực hiện các thao tác CRUD thông qua Repository.
 
## 2. Cấu Trúc Code
/src/main/java/com/example/chuyentrang. Trong đó:
- controller: Chứa các lớp Controller để xử lý các yêu cầu HTTP từ người dùng.
- service: Chứa các lớp Service xử lý nghiệp vụ cho ứng dụng.
- repository: Chứa các lớp repository (DAO) để truy xuất và lưu trữ dữ liệu từ cơ sở dữ liệu.
- model: Chứa các lớp đại diện cho các thực thể (Entity) trong cơ sở dữ liệu như Product, Customer, Order, v.v.
- config: Chứa các cấu hình bảo mật (Spring Security) và các cấu hình khác của ứng dụng.

## 3. Các Bước Chạy Ứng Dụng Trên Máy Tính Cá Nhân

### Yêu cầu
- Java JDK: Phiên bản 11 trở lên.
- Maven: Để xây dựng và quản lý dependencies.
- MySQL: Để lưu trữ dữ liệu.
- Postman hoặc CURL: Để kiểm tra API.
### Cài đặt
Clone repository:
```sh
git clone https://github.com/CaiKey-17/MidTermJava.git
cd Springcommerce
```
Cấu hình cơ sở dữ liệu:
- Tạo cơ sở dữ liệu trong MySQL:
```sh
CREATE DATABASE giuaki
```
- Cập nhật thông tin cấu hình trong file application.yaml trong /src/main/resources/templates (nếu không có, hãy tạo file):
```sh
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/giuaki
    username: ...
    password: ...

  jpa:
    hibernate:
      ddl-auto: update
  servlet:
    multipart:
      max-file-size: 20MB
      max-request-size: 20MB

  mail:
    host: smtp.gmail.com
    port: 587
    username: ...@gmail.com
    password: ...
    properties:
      mail:
        smtp:
          auth: true
          starttls:
            enable: true
```
- Import data mẫu từ file data.sql:
- Thay đổi tài khoản admin do hệ thống cung cấp trong /src/main/java/com/example/chuyentrang/DataInitializer.java
```sh
String email = "...@gmail.com";
String rawPassword = "...";
```
- Build và chạy ứng dụng:
```sh
mvn clean install
mvn spring-boot:run
```
### 4. Postman Snapshots để Kiểm Tra API
##### Xem giao diện trang chủ:
- Test API:
![image](https://github.com/user-attachments/assets/88d82d05-34cf-487d-872a-2b4dcf2a3588)
- Kết quả:
![image](https://github.com/user-attachments/assets/7bb534d0-f69a-40d0-8622-41b87e9fbc1a)

##### Xem giao diện các danh mục sản phẩm (Ví dụ: Áo), tương tự cho các danh mục sản phẩm khác:
- Test API:
![image](https://github.com/user-attachments/assets/0e58d8fb-ded8-4cbb-8243-d77cbfe5b31b)
- Kết quả:
![image](https://github.com/user-attachments/assets/c233ec13-6656-4a06-91dd-9247e04c39c1)


#### Lọc theo giá sản phẩm (Ví dụ: Áo - dưới 500k):
- Test API:
![image](https://github.com/user-attachments/assets/544a1d42-afe3-4ceb-bbce-aebd6403cd92)
- Kết quả:
![image](https://github.com/user-attachments/assets/832800c3-d43c-4050-ad5b-54f509666a2a)



#### Lọc theo màu sắc sản phẩm (Ví dụ: Áo - Màu xanh):
- Test API:
![image](https://github.com/user-attachments/assets/ec788e21-b470-44c5-b8e5-947f1261d679)
- Kết quả:
![image](https://github.com/user-attachments/assets/048fa27a-3b31-4dab-9636-b8b6c136e991)


  

#### Lọc theo kích cỡ sản phẩm (Ví dụ: Quần - Size M):
- Test API:
![image](https://github.com/user-attachments/assets/9ded5650-ac37-4280-85ff-79fe9a243d64)
- Kết quả:
![image](https://github.com/user-attachments/assets/5532ad8e-6ab1-4b0a-a8a6-9a2a8a6d0fab)

  

#### Lọc theo giá giảm dần sản phẩm (Ví dụ: Quần):
- Test API:
![image](https://github.com/user-attachments/assets/7361ec53-0c4d-4868-abf6-bf13ebe7b5ad)
- Kết quả:
![image](https://github.com/user-attachments/assets/84390392-8515-4f1b-a24e-53d4024d1e85)





#### Lọc theo giá tăng dần sản phẩm (Ví dụ: Quần):
- Test API:
![image](https://github.com/user-attachments/assets/d114f9f3-fd46-4b44-95d5-b9c378700c3d)
- Kết quả:
![image](https://github.com/user-attachments/assets/ec1e266a-95e7-43ac-88b2-0d592a869cda)





#### Xem chi tiết sản phẩm (Ví dụ: Balo - có mã số 19):
- Test API:
![image](https://github.com/user-attachments/assets/9cb8c7b1-d00a-432e-aa6a-bebaa7b0e31d)
- Kết quả:
![image](https://github.com/user-attachments/assets/9e7f950c-d4fb-49d7-92ba-abaf8ef30d0a)



#### Xem hoá đơn:
- Test API:
![image](https://github.com/user-attachments/assets/9add3478-c193-4ebb-9ac5-c8d73053ed4e)
- Kết quả:
![image](https://github.com/user-attachments/assets/1429fc28-a7f0-44e0-9f32-ba9f06234fa3)



#### Xác nhận hoá đơn:
- Test API:
![image](https://github.com/user-attachments/assets/cbe5554c-58f5-4880-b56f-2863eae0fa03)
- Kết quả:
![image](https://github.com/user-attachments/assets/722cf7e1-b3c3-43c0-9aed-dfb417a9c7d9)
Admin - Kết quả nhận được bên email:
![image](https://github.com/user-attachments/assets/f1c882f4-7231-4a32-9a31-7c1cecee347f)
Khách hàng - Kết quả nhận được bên email:
![image](https://github.com/user-attachments/assets/3942db4d-4182-4c66-9e6e-8fd54235f99b)





#### Truy cập trang chủ admin:
- Test API:
![image](https://github.com/user-attachments/assets/6b392736-a9f1-4d5e-89ba-ea8c63589f6f)
- Kết quả: Trả về trang đăng nhập - vì sử dụng security để ngăn chặn xâm nhập trái phép
![image](https://github.com/user-attachments/assets/bb6387a1-f769-4292-b8a3-84b08d4bf9ec)




#### Giao diện đăng nhập:
- Test API:
![image](https://github.com/user-attachments/assets/5d04680e-f9f8-42a1-932f-d9ab994101d2)
- Kết quả:
![image](https://github.com/user-attachments/assets/a6ee69c3-80b4-4c75-9200-ac4d09618e36)

  
#### Kiểm tra đăng nhập:
- Test API trường hợp nhập đúng --> Trả về trang chủ của admin:
![image](https://github.com/user-attachments/assets/fa39bce5-84f8-45ea-89ab-9528ea98bc19)
- Kết quả:
![image](https://github.com/user-attachments/assets/c53f9b82-c10a-433c-8d3d-983686609d29)
- Test API trường hợp nhập sai --> Ở lại trang để nhập lại:
![image](https://github.com/user-attachments/assets/de861f22-f1e9-4746-837f-7bf5d6c3cc8c)
- Kết quả:
![image](https://github.com/user-attachments/assets/cf692510-43c8-4f57-9482-3deac50dfd9e)




#### Giao diện khôi phục mật khẩu:
- Test API:
![image](https://github.com/user-attachments/assets/0fc1651a-e351-41ec-a599-58ebd4e32b96)
- Kết quả:
![image](https://github.com/user-attachments/assets/72ed2290-2005-461f-927b-2e615b5f39dc)



#### Kiểm tra tài khoản để khôi phục mật khẩu:
- Test API trường hợp nhập đúng tài khoản tồn tại trong cơ sở dữ liệu --> Trả về trang đăng nhập để tiếp tục:
![image](https://github.com/user-attachments/assets/df7fa85a-229c-451c-9f93-6298f01c11f1)
- Kết quả:
![image](https://github.com/user-attachments/assets/5e1caf31-cc37-4052-beb2-b55c4c8306f7)
- Test API trường hợp nhập sai --> Ở lại trang để nhập tài khoản khác:
![image](https://github.com/user-attachments/assets/c3b1cde6-276f-4514-871a-14a9168fc5da)
- Kết quả:
![image](https://github.com/user-attachments/assets/b0a4c173-fe89-48a1-af85-7aa95be493f9)




#### Giao diện đổi mật khẩu:
- Test API trường hợp đã đăng nhập:
![image](https://github.com/user-attachments/assets/5718191a-80e0-41ab-9651-fb0d1587b946)
- Kết quả:
![image](https://github.com/user-attachments/assets/18bad162-fbb0-4033-beb8-476a2fb3c165)
- Test API trường hợp chưa đăng nhập:
![image](https://github.com/user-attachments/assets/f8133d9e-ac5e-45bc-adbc-1f6254e229e0)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)





#### Giao diện quản lý các danh mục sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/01bb309b-cdc0-4ec9-98f4-d5c158fcb5f3)
- Kết quả:
![image](https://github.com/user-attachments/assets/988182fd-493c-4b9e-99fb-a5cd1d2bc5b4)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/4f12969e-df39-48ba-ad5e-e3b9c0a0b9bb)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)


  
#### Thêm danh mục sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống --> Trả về danh sách các loại danh mục sản phẩm
![image](https://github.com/user-attachments/assets/340cc0ce-98f7-457e-8c36-aacd8b53b025)
- Kết quả:
![image](https://github.com/user-attachments/assets/6993dc94-9d07-43c3-8ffa-d4853bb23fa2)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/f28d8177-76cc-4a05-abad-79cf8f77bc14)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)
 



#### Xoá danh mục sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống --> Trả về danh sách các loại danh mục sản phẩm
![image](https://github.com/user-attachments/assets/52095f1c-1e7e-48a8-9c03-ab74f44c6020)
- Kết quả:
![image](https://github.com/user-attachments/assets/f08c3d7f-ff58-4943-b6db-134483a2168c)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/b4450ed0-ac97-4ae3-9cf4-c51342c742f0)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)




#### Giao diện quản lý các sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/3507e170-919c-47a3-9d52-3d3b48673d6f)
- Kết quả:
![image](https://github.com/user-attachments/assets/f71fd621-bff7-4150-a8cb-3ca2241c62c0)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/6332a56f-67bf-4930-b1a3-2786c2954549)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)
 



#### Thêm sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/c5c3da3c-9eed-480f-b6cb-b82842e28cdf)
- Kết quả:
![image](https://github.com/user-attachments/assets/2bcb7ebd-a636-4ae0-90b9-2749fa05758c)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/56c369ca-5809-42a0-ba6e-6a6c36c03880)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)




#### Giao diện sửa sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/00e14985-8180-4876-a73b-29c857c2cc2f)
- Kết quả:
![image](https://github.com/user-attachments/assets/8142adee-b658-4931-8490-e1526be3955d)  
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/5b2f3500-a858-439a-92d4-1809300bb0e2)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)


#### Sửa sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/10c61525-fb2b-4c3d-82a7-7a2781b29113)
- Kết quả:
![image](https://github.com/user-attachments/assets/5cd5303d-03c2-4c74-8e9d-671af6526214)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/d4d4178f-2a24-4f67-be52-2e335c2a7dd3)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)




#### Xoá sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/b49bdee6-1ae2-4259-8e7b-a8192dc8f94f)
- Kết quả:
![image](https://github.com/user-attachments/assets/f77f04d0-dfc0-4b8b-8963-00a3f41d0d24)  
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/4a723a50-dcce-494c-86f4-317692056cda)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)



#### Giao diện quản lý màu sắc sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/10b3c26c-f67e-4498-94a8-8a0cd6a530b7)
- Kết quả:
![image](https://github.com/user-attachments/assets/99cb1684-cc31-4833-aa74-3b8ac8613015) 
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/47314a88-261b-403e-94ab-7b5d96dc19fe)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)


#### Thêm màu sắc sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/e84489fb-67b9-4391-baf6-c534aa787b85)
- Kết quả:
![image](https://github.com/user-attachments/assets/10380168-4d8c-4cb9-853f-3dc4da9a4608)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/94d9a06f-d8cb-4c92-a316-d9f970bf9f78)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)



#### Xoá màu sắc sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/7df108e3-f006-45e9-8729-31d03c0ef5cf)
- Kết quả:
![image](https://github.com/user-attachments/assets/a772927a-9f7a-4818-afd1-0689c5589127)  
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/9aca4a43-a33f-41e6-be7c-872d326d35c7)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)








#### Giao diện quản lý kích cỡ sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/3e12501b-54b7-4ebd-8e5e-0ec799e7ffa1)
- Kết quả:
![image](https://github.com/user-attachments/assets/45624374-d7d6-43eb-b497-ea44dd4311e0)  
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/1ba57d15-63e5-4424-8649-bae44d1612f0)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)
  



#### Thêm kích thước sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/98691a95-9e60-4906-bba0-e207cf0346d6)
- Kết quả:
![image](https://github.com/user-attachments/assets/e98ca4db-dcd7-4ffc-a9b2-0b2d9d1e1c3e)  
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/de45e6a0-bc0d-4fc7-9f7f-768d4b58b18e)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)
 


#### Xoá kích thước sản phẩm:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/eeda8b63-4564-49f3-89eb-e94719d96f21)
- Kết quả:
![image](https://github.com/user-attachments/assets/efa223d7-6da3-4dc4-a657-a35780b0a551) 
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/8fa1e7f4-a0b5-4460-8e0d-2bb875165d3d)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)
 




#### Giao diện quản lý đơn hàng:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/75b0241b-d12d-4389-944a-39d821d6d700)
- Kết quả:
![image](https://github.com/user-attachments/assets/4af6cf2d-bf9f-4b6e-b289-36435f88adf5)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/6febebc4-d45c-43c2-a296-0dc5ae42ed80)
- Kết quả:
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)
 

#### Xem chi tiết đơn hàng:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/ea3298f8-1fe7-4be0-8031-86ff9e291941)
- Kết quả: 
![image](https://github.com/user-attachments/assets/cd761113-ca21-4b98-9e0b-7781931317aa)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/493b50e1-d280-49c0-ab1e-a8a941d93379)
- Kết quả: 
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)




#### Phê duyệt đơn hàng:
- Test API trường hợp đã đăng nhập vào hệ thống:
![image](https://github.com/user-attachments/assets/bc36bd0e-d370-43f9-a69e-b5763ff4cf80)
- Kết quả: 
![image](https://github.com/user-attachments/assets/720f9ff0-6300-4647-a4e7-85d26af5ebe7)
- Test API trường hợp chưa đăng nhập --> Trả về trang đăng nhập để tránh xâm nhập trái phép
![image](https://github.com/user-attachments/assets/32c40d02-6f4d-4546-b0b3-080474295186)
- Kết quả: 
![image](https://github.com/user-attachments/assets/de4db959-9937-427a-a51a-2907bf6c7209)








![ERD_Midterm_java](https://github.com/user-attachments/assets/1cecd6dc-5083-49c1-a513-083a6103844e)

