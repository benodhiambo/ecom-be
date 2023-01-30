<?php

declare(strict_types=1);

namespace Dreamax\Products\Controllers;

use Dreamax\Core\Classes\Controller;
use Dreamax\Products\Models\ProductModel;
use Exception;
use Psr\Http\Message\ResponseInterface;

class ProductController
{
    private $controller;
    private $model;

    public function __construct(Controller $controller, ProductModel $model)
    {
        $this->controller = $controller;
        $this->model = $model;
    }

    /**
     * Returns all the products available for this users session
     * and its variants
     */
    public function getAllProducts(): ResponseInterface
    {
        try {

            $products = $this->model->getAllProducts();
            $data = [
                'products' => $products
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Database Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    /**
     * Returns all the products available for this users session
     * and its variants
     */
    public function getProducts(): ResponseInterface
    {
        try {

            // $params = ['user_id' => $this->controller->user_id];
            $params = ['user_id' => $GLOBALS['sess']['user_id']];

            $products = $this->model->getProducts($params);
            $data = [
                'products' => $products
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Database Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    /**
     * Returns all the products available for this users session
     * and its variants
     */
    public function getStoreProducts($id): ResponseInterface
    {
        try {

            $products = $this->model->getProductsByStore($id['store_id']);
            $data = [
                'products' => $products
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Database Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getTag(array $name): ResponseInterface
    {
        try {
            $tag = $this->model->getTag($name['tag_name']);

            if ($tag === false) {
                $data = [
                    'tags' => []
                ];
            } else {
                $data = [
                    'tags' => $tag
                ];
            }
            
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Database Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    /**
     * Gets the product with the specified ID and all its variants
     */
    public function getProduct(array $id): ResponseInterface
    {
        try {
            $product = $this->model->getProduct($id['product_id']);

            // check that a product was actually found
            if (!empty($product)) {
                $prod[] = $product;
                $data = [
                    'product' => $prod
                ];

                return $this->controller->setResponse($product);
            }
            $data = ['error' => 'Product Not Found'];
            return $this->controller->setErrorResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Database Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    /**
     * Gets the products in these categories
     */
    public function getProductsByCategories(array $id): ResponseInterface
    {
        try {
            $post_data = $this->controller->getPostData();

            $categories = $this->model->getProductsByCategories($post_data['categories']);

            
            if (!empty($categories)) {

                $data = [
                    'categories' => $categories
                ];

                return $this->controller->setResponse($data);
            }

            $data = ['error' => 'No products found for this category'];
            return $this->controller->setErrorResponse($data);

        } catch (Exception $e) {
            $data = ['error' => 'Database Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getProductCategoryDetails(array $id): ResponseInterface
    {
        try {
            $category_details = $this->model->getProductCategoryById((int)$id['category_id']);
            $data = [
                'categories' => $category_details
            ];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Products Category Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function saveProduct($cdata = []): ResponseInterface
    {
        try {


            $post_data = $this->controller->getRequest()->getBody()->getContents();
            $product_data = json_decode($post_data, true);

            $product_id = '';
            if (isset($cdata['product_id'])) {
                $product_id = $cdata['product_id'];
            }

            $product = $this->model->saveProduct($product_data, $product_id);

            $product_array = $this->model->getProduct($product['product_id']);


            $data = [
                'success' => 'Product',
                'product_id' => $product['product_id'],
                'product' => $product_array
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Add Product Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function saveProductImages($cdata = []): ResponseInterface
    {
        try {
            $path = __DIR__ . '/../../../uploads/products/';
            $relative_path = '/uploads/products/';

            $position = 0;

            $imgs = [];

            if (isset($_FILES['images'])) {


                $files = $_FILES['images'];


                $position = 0;

                foreach ($files['name'] as $key => $value) {

                    if ($files['size'][$key] !== 0) {

                        $filename = sprintf(
                            '%s.%s',
                            $this->controller->create_uuid(),
                            pathinfo((string)$value, PATHINFO_EXTENSION)
                        );

                        if (!is_dir($path)) {
                            mkdir($path, 0777, true);
                        }

                        $file_location =  $path . $filename;

                        move_uploaded_file($files["tmp_name"][$key], $file_location);

                        $img_data = [
                            'name' => $filename,
                            'alt' => (string)$value,
                            'path' => $relative_path . $filename,
                            'position' => $position
                        ];

                        array_push($imgs, $img_data);

                        $position++;
                    }
                }
            } 

            $results = $this->model->saveProductImages($imgs);

            $data = [
                'success' => 'Product Images Saved Successfully',
                'images' => $results
            ];

            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Add Product Image Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function updateProductImages(array $id)
    {
        try {
        } catch (Exception $e) {
            $data = ['error' => 'Add Product Image Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function removeProduct(array $id): ResponseInterface
    {
        try {
            $result = $this->model->deleteProduct($id['product_id']);
            $data = ['result' => ($result) ? 'Product deleted successfully' : 'Product not found'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cannot delete product - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getVariant(array $id): ResponseInterface
    {
        try {
            $variant_details = $this->model->getVariant($id['variant_id']);
            // check that a variant was actually found
            if (!empty($variant_details)) {
                $data = ['products' => $variant_details];
                return $this->controller->setResponse($data);
            }
            $data = ['none' => 'Variant Not Found'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cannot get products - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function getProductVariantDetails(array $id): ResponseInterface
    {
        $product = $this->model->getProductById($id['product_id'], $this->controller->user_id);

        if (empty($product) || $product['user_id'] != $this->controller->user_id) {
            $data = [
                'error' => 'Product does not exist!'
            ];
        } else {


            $data = [
                'product' => $product,
                'variants' => [],
                'attributes' => [],
                'inventory' => [],
                'images' => [],
                'tags' => [],
                'stores' => [],
                'categories' => [],
                'meta_fields' => [],
                'json' => [
                    'variants' => [],
                    'attributes' => [],
                ]
            ];
        }

        return $this->controller->setResponse($data);
    }

    public function addProductVariant(array $id): ResponseInterface
    {
        try {
            // get POST data
            $product_data = $this->controller->getRequest()->getParsedBody();
            $results = $this->model->addVariant($product_data);

            if ($results) {
                $data = ['success' => 'Variant Added Succesfully'];
                return $this->controller->setResponse($data);
            }
            $data = ['fail' => 'Variant Save failed'];
            return $this->controller->setErrorResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Add Variant Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function updateProductVariantDetails(array $id): ResponseInterface
    {
        try {
            // get POST data
            $product_data = $this->controller->getRequest()->getParsedBody();
            $results = $this->model->addVariant($product_data);

            if ($results) {
                $data = ['success' => 'Variant Added Succesfully'];
                return $this->controller->setResponse($data);
            }
            $data = ['fail' => 'Variant Save failed'];
            return $this->controller->setErrorResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Update Variant Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }


    public function removeProductVariant(array $id): ResponseInterface
    {
        try {
            $data = ['none' => 'No Data'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Details Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }


    public function getProductCategories(): ResponseInterface
    {
        try {
            $data = ['none' => 'No Data'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Get Categories Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function addProductCategory(): ResponseInterface
    {
        try {
            // get POST data
            $category_data = $this->controller->getRequest()->getParsedBody();
            $results = $this->model->addProduct($category_data);
            if ($results) {
                $data = ['success' => 'Variant Added Succesfully'];
                return $this->controller->setResponse($data);
            }
            $data = ['fail' => 'Variant Save failed'];
            return $this->controller->setErrorResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Add Product Category Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function updateProductCategoryDetails(array $id): ResponseInterface
    {
        try {
            // get POST data
            $category_data = $this->controller->getRequest()->getParsedBody();
            $results = $this->model->updateProduct($category_data);
            if ($results) {
                $data = ['success' => 'Category Updated Succesfully'];
                return $this->controller->setResponse($data);
            }
            $data = ['fail' => 'Category Update failed'];
            return $this->controller->setErrorResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Update Product Category Page Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }

    public function removeProductCategory(array $id): ResponseInterface
    {
        try {
            $data = ['none' => 'No Data'];
            return $this->controller->setResponse($data);
        } catch (Exception $e) {
            $data = ['error' => 'Cart Details Error - ' . $e->getMessage()];
            return $this->controller->setErrorResponse($data);
        }
    }
}
