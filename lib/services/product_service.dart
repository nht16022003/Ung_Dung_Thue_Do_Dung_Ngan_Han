import '../models/product.dart';

class ProductService {
  static List<Product> getProducts() {
    return [
      Product(
        id: "1",
        name: "Máy ảnh Canon",
        image: "assets/images/sucess.png",
        price: 150000,
        category: "Điện tử",
      ),
      Product(
        id: "2",
        name: "Lều cắm trại",
        image: "assets/images/sucess.png",
        price: 100000,
        category: "Du lịch",
      ),
      Product(
        id: "3",
        name: "Loa Bluetooth",
        image: "assets/images/sucess.png",
        price: 80000,
        category: "Sự kiện",
      ),
    ];
  }
}
