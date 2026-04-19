import '../models/product.dart';

//Category: Gia dụng
/* Bếp điện 
      Máy sưởi
      Nồi cơm điện
      Quạt*/

//Category:Sự kiện
/*  Bàn ghế
      Đèn trang trí
   *  Loa
   *  Máy chiếu
   *  Micro
   */

//Category: Du lịch
/* 
  Bếp du lịch
  Đèn camping
  Đèn pin
  Lều trại
  Túi ngủ
 */

//Category: Điện tử
/*
  Gimbal
  Laptop
  Lens máy ảnh
  Máy ảnh
  Máy quay
 */

//Category: Thời trang
/*
  Áo dài
  Quần
  Váy
  Vest
 */

class ProductService {
  static List<Product> getProducts() {
    return [
      // ================== GIA DỤNG ==================
      Product(
        id: "GD1",
        name: "Bếp điện Sunhouse SHD6017",
        image: "assets/images/sucess.png",
        price: 60000,
        category: "Gia dụng",
        subCategory: "Bếp điện",
        description: "Bếp điện nhỏ gọn, tiết kiệm điện",
      ),
      Product(
        id: "GD2",
        name: "Bếp điện Kangaroo KG20",
        image: "assets/images/sucess.png",
        price: 70000,
        category: "Gia dụng",
        subCategory: "Bếp điện",
        description: "Công suất cao, nấu nhanh",
      ),
      Product(
        id: "GD3",
        name: "Bếp điện Toshiba IC20",
        image: "assets/images/sucess.png",
        price: 80000,
        category: "Gia dụng",
        subCategory: "Bếp điện",
        description: "Thiết kế hiện đại",
      ),
      Product(
        id: "GD4",
        name: "Bếp điện Panasonic PN10",
        image: "assets/images/sucess.png",
        price: 75000,
        category: "Gia dụng",
        subCategory: "Bếp điện",
        description: "An toàn khi sử dụng",
      ),
      Product(
        id: "GD5",
        name: "Bếp điện Sharp SH20",
        image: "assets/images/sucess.png",
        price: 65000,
        category: "Gia dụng",
        subCategory: "Bếp điện",
        description: "Dễ sử dụng",
      ),

      Product(
        id: "GD6",
        name: "Máy sưởi mini Xiaomi",
        image: "assets/images/sucess.png",
        price: 50000,
        category: "Gia dụng",
        subCategory: "Máy sưởi",
        description: "Giữ ấm nhanh",
      ),
      Product(
        id: "GD7",
        name: "Máy sưởi dầu Kangaroo",
        image: "assets/images/sucess.png",
        price: 90000,
        category: "Gia dụng",
        subCategory: "Máy sưởi",
        description: "Giữ nhiệt lâu",
      ),
      Product(
        id: "GD8",
        name: "Máy sưởi Halogen Sunhouse",
        image: "assets/images/sucess.png",
        price: 60000,
        category: "Gia dụng",
        subCategory: "Máy sưởi",
        description: "Tiết kiệm điện",
      ),
      Product(
        id: "GD9",
        name: "Máy sưởi ceramic Panasonic",
        image: "assets/images/sucess.png",
        price: 85000,
        category: "Gia dụng",
        subCategory: "Máy sưởi",
        description: "An toàn cho trẻ em",
      ),
      Product(
        id: "GD10",
        name: "Máy sưởi Xiaomi Pro",
        image: "assets/images/sucess.png",
        price: 95000,
        category: "Gia dụng",
        subCategory: "Máy sưởi",
        description: "Thiết kế cao cấp",
      ),

      // ================== ĐIỆN TỬ ==================
      Product(
        id: "DT1",
        name: "Gimbal DJI Osmo Mobile 6",
        image: "assets/images/sucess.png",
        price: 120000,
        category: "Điện tử",
        subCategory: "Gimbal",
        description: "Chống rung quay video",
      ),
      Product(
        id: "DT2",
        name: "Gimbal Zhiyun Smooth 5",
        image: "assets/images/sucess.png",
        price: 110000,
        category: "Điện tử",
        subCategory: "Gimbal",
        description: "Ổn định hình ảnh",
      ),
      Product(
        id: "DT3",
        name: "Gimbal FeiyuTech Vlog Pocket",
        image: "assets/sucess/sucess.png",
        price: 100000,
        category: "Điện tử",
        subCategory: "Gimbal",
        description: "Nhỏ gọn",
      ),
      Product(
        id: "DT4",
        name: "Gimbal DJI RS3",
        image: "assets/images/sucess.png",
        price: 200000,
        category: "Điện tử",
        subCategory: "Gimbal",
        description: "Chuyên nghiệp",
      ),
      Product(
        id: "DT5",
        name: "Gimbal Moza Mini",
        image: "assets/images/sucess.png",
        price: 90000,
        category: "Điện tử",
        subCategory: "Gimbal",
        description: "Dễ sử dụng",
      ),

      Product(
        id: "DT6",
        name: "Laptop Dell XPS 13",
        image: "assets/images/sucess.png",
        price: 250000,
        category: "Điện tử",
        subCategory: "Laptop",
        description: "Mỏng nhẹ",
      ),
      Product(
        id: "DT7",
        name: "Laptop HP Pavilion",
        image: "assets/images/sucess.png",
        price: 200000,
        category: "Điện tử",
        subCategory: "Laptop",
        description: "Hiệu năng ổn định",
      ),
      Product(
        id: "DT8",
        name: "Laptop Asus TUF Gaming",
        image: "assets/images/sucess.png",
        price: 300000,
        category: "Điện tử",
        subCategory: "Laptop",
        description: "Chơi game tốt",
      ),
      Product(
        id: "DT9",
        name: "Macbook Air M1",
        image: "assets/images/sucess.png",
        price: 280000,
        category: "Điện tử",
        subCategory: "Laptop",
        description: "Pin trâu",
      ),
      Product(
        id: "DT10",
        name: "Laptop Lenovo ThinkPad",
        image: "assets/images/sucess.png",
        price: 230000,
        category: "Điện tử",
        subCategory: "Laptop",
        description: "Bền bỉ",
      ),

      // ================== DU LỊCH ==================
      Product(
        id: "DL1",
        name: "Lều 4 người chống nước",
        image: "assets/images/sucess.png",
        price: 100000,
        category: "Du lịch",
        subCategory: "Lều trại",
        description: "Chống mưa",
      ),
      Product(
        id: "DL2",
        name: "Lều tự bung tiện lợi",
        image: "assets/images/sucess.png",
        price: 120000,
        category: "Du lịch",
        subCategory: "Lều trại",
        description: "Dễ sử dụng",
      ),
      Product(
        id: "DL3",
        name: "Lều du lịch mini",
        image: "assets/images/sucess.png",
        price: 80000,
        category: "Du lịch",
        subCategory: "Lều trại",
        description: "Nhỏ gọn",
      ),
      Product(
        id: "DL4",
        name: "Lều cao cấp chống gió",
        image: "assets/images/sucess.png",
        price: 150000,
        category: "Du lịch",
        subCategory: "Lều trại",
        description: "Chắc chắn",
      ),
      Product(
        id: "DL5",
        name: "Lều camping 2 lớp",
        image: "assets/images/sucess.png",
        price: 140000,
        category: "Du lịch",
        subCategory: "Lều trại",
        description: "Thoáng khí",
      ),

      // ================== SỰ KIỆN ==================
      Product(
        id: "SK1",
        name: "Loa JBL PartyBox",
        image: "assets/images/sucess.png",
        price: 200000,
        category: "Sự kiện",
        subCategory: "Loa",
        description: "Âm thanh lớn",
      ),
      Product(
        id: "SK2",
        name: "Loa kéo karaoke",
        image: "assets/images/sucess.png",
        price: 150000,
        category: "Sự kiện",
        subCategory: "Loa",
        description: "Dễ di chuyển",
      ),
      Product(
        id: "SK3",
        name: "Loa mini bluetooth",
        image: "assets/images/sucess.png",
        price: 80000,
        category: "Sự kiện",
        subCategory: "Loa",
        description: "Nhỏ gọn",
      ),
      Product(
        id: "SK4",
        name: "Loa sân khấu lớn",
        image: "assets/images/sucess.png",
        price: 250000,
        category: "Sự kiện",
        subCategory: "Loa",
        description: "Công suất cao",
      ),
      Product(
        id: "SK5",
        name: "Loa Sony XB43",
        image: "assets/images/sucess.png",
        price: 180000,
        category: "Sự kiện",
        subCategory: "Loa",
        description: "Chống nước",
      ),

      // ================== THỜI TRANG ==================
      Product(
        id: "TT1",
        name: "Áo dài truyền thống lụa",
        image: "assets/images/sucess.png",
        price: 120000,
        category: "Thời trang",
        subCategory: "Áo dài",
        description: "Trang nhã",
      ),
      Product(
        id: "TT2",
        name: "Áo dài cưới đỏ",
        image: "assets/images/sucess.png",
        price: 200000,
        category: "Thời trang",
        subCategory: "Áo dài",
        description: "Sang trọng",
      ),
      Product(
        id: "TT3",
        name: "Áo dài cách tân",
        image: "assets/images/sucess.png",
        price: 150000,
        category: "Thời trang",
        subCategory: "Áo dài",
        description: "Hiện đại",
      ),
      Product(
        id: "TT4",
        name: "Áo dài học sinh",
        image: "assets/images/sucess.png",
        price: 80000,
        category: "Thời trang",
        subCategory: "Áo dài",
        description: "Đơn giản",
      ),
      Product(
        id: "TT5",
        name: "Áo dài cao cấp",
        image: "assets/images/sucess.png",
        price: 220000,
        category: "Thời trang",
        subCategory: "Áo dài",
        description: "Thiết kế đẹp",
      ),
    ];
  }
}
