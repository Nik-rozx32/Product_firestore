import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productmodel/models/product_model.dart';

class FirestoreService {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(Product product) {
    return _productCollection.doc(product.id).set(product.toMap());
  }

  Stream<List<Product>> getProducts() {
    return _productCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Product.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> updateProduct(Product product) {
    return _productCollection.doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String productId) {
    return _productCollection
        .doc(productId)
        .delete(); 
  }
}
