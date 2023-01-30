<?php

declare(strict_types=1);

namespace Dreamax\Products\Models;

use Dreamax\Categories\Models\CategoriesModel;
use Dreamax\Core\Classes\Model;
use Dreamax\Stores\Models\StoreModel;
use Exception;


class ProductModel
{
    private $model;
    private $store_model;
    private $cat_model;

    private $product_tbl = 'products';
    private $product_store_tbl = 'products_store';
    private $product_options_tbl = 'products_options';
    private $product_meta_tbl = 'meta_fields';
    private $product_img_tbl = 'products_images';
    private $product_tags_tbl = 'products_tags';
    private $product_category_tbl = 'products_category';
    private $categories_tbl = 'categories';
    private $attributes_tbl = 'products_attributes';
    private $attributes_options_tbl = 'products_attributes_options';

    private $inventory_tbl = 'inventory';
    private $inventory_locations_tbl = 'inventory_locations';

    private $now;
    private $store_id;

    public function __construct(Model $model, StoreModel $store_model, CategoriesModel $cat_model)
    {
        $this->model = $model;
        $this->store_model = $store_model;
        $this->cat_model = $cat_model;
        $this->now = date("Y-m-d H:i:s", time());

        $this->store_id = isset($GLOBALS['sess']['store_id']) ? $GLOBALS['sess']['store_id'] : '2';
    }

    /**
     * Get Products for front end customers
     */
    public function getAllProducts()
    {
        try {
            $products_array = $this->model->getAll($this->product_tbl);


            $products = [];

            foreach ($products_array as $product) {

                $variants = $this->getProductVariants($product['product_id']);

                $product['variants_count'] = count($variants);

                if ($product['parent_id'] == 0) {

                    //$product['variants'] = [];
                    //$product['attributes'] = [];

                    $products[] = $product;
                }
            }

            return $products;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProducts($data)
    {
        try {
            // Get the base products

            $params = [
                'fields' => [
                    'user_id' => $data['user_id'],
                    'deleted' => '0'
                ],
                'order' => [
                    'created_at' => 'DESC'
                ]
            ];

            $products_array = $this->model->getByParams($this->product_tbl, $params);


            $products = [];

            foreach ($products_array as $product) {

                $variants = $this->getProductVariants($product['product_id']);

                $product['variants_count'] = count($variants);

                if ($product['parent_id'] == 0) {

                    //$product['variants'] = [];
                    //$product['attributes'] = [];

                    $products[] = $product;
                }
            }

            return $products;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getBaseProducts()
    {
        try {
            $params = [
                'fields' => [
                    'user_id' => $_SESSION['user_id'],
                    'deleted' => '0'
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                'limit' => 5000
            ];

            return $this->model->getByParams($this->product_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getStoreProducts($store_id)
    {
        try {
            $params = [
                'fields' => [
                    'store_id' => $store_id
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                'limit' => 5000
            ];

            return $this->model->getByParams($this->product_store_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getTag($tag_name)
    {
        try {
            $tag = $this->model->searchByField('tags', 'name', $tag_name);
            if (empty($tag)) {
                return false;
            }
            return $tag;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getProductById($product_id)
    {
        try {

            $params = [
                'fields' => array(
                    'product_id' => $product_id,
                    'deleted' => '0'
                )
            ];

            $params = [
                'fields' => [
                    'product_id' => $product_id
                ],
                'order' => [
                    'parent_id' => 'DESC'
                ],
                'limit' => 5000
            ];

            $product_data = $this->model->getByParams($this->product_tbl, $params);

            if (!empty($product_data)) {
                return $product_data[0];
            }
            return $product_data;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    /**
     * Gets only the base product and its attributes
     */
    public function getProduct($product_id)
    {
        try {
            $product_data = $this->getProductById($product_id);

            // print_r(['prod_data' => $product_data]); die;

            if (!empty($product_data)) {

                if ($product_data['parent_id'] == 0) {

                    $product_data['attributes'] = [];

                    $product_attributes = $this->getProductAttributes($product_id);

                    if (!empty($product_attributes)) {

                        foreach ($product_attributes as $key => $attribute) {

                            $product_attributes[$key]['options'] = $this->getProductAttributeOptions($attribute['attribute_id']);
                        }

                        $product_data['attributes'] = $product_attributes;
                    }

                    $qtys = $this->getProductQuantities($product_id);

                    $product_data['quantities'] = empty($qtys) ? [] : $qtys;

                    $product_data['meta_data'] = $this->getProductMetaFields($product_id);

                    $product_data['tags'] = $this->getProductTags($product_id);

                    $product_data['stores'] = [];





                    $product_data['images'] = $this->getProductImages($product_id);

                    $variants = $this->getProductVariants($product_id);
                    if (!empty($variants)) {

                        $product_data['variants'] = $variants;
                    }


                    $stores = [];

                    $categories = $this->getProductCategories($product_id);

                    foreach ($categories as $category) {

                        if (!isset($stores[$category['store_id']])) {

                            $stores[$category['store_id']] = [
                                'store_id' => $category['store_id'],
                                'categories' => []
                            ];
                        }

                        $stores[$category['store_id']]['categories'][] = $category['category_id'];
                    }

                    // print_r(['stores' => $stores]); die;

                    foreach ($stores as $key => $value) {
                        $product_data['stores'][] = $value;
                    }

                    // $product_data['stores'] = $stores;
                }
            }

            return $product_data;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    /**
     * Check if any attributes have been defined for this product
     */
    public function productHasAttributes($prod_id): bool
    {
        $params = [
            'fields' => [
                'product_id' => $prod_id
            ],
            'order' => [
                'created_at' => 'DESC'
            ],
            'limit' => 50
        ];

        $attr = $this->model->getByParams($this->attributes_tbl, $params);

        if (!empty($attr)) {
            return true;
        }
        return false;
    }

    /**
     * Check if this product is defined for this store
     */
    public function productInStore($prod_id): bool
    {
        $params = [
            'fields' => [
                'product_id' => $prod_id,
                'store_id' => $_SESSION['store_id']
            ],
            'order' => [
                'created_at' => 'DESC'
            ],
            'limit' => 50
        ];

        $in_store = $this->model->getByParams($this->product_tbl, $params);

        if (!empty($in_store)) {
            return true;
        }
        return false;
    }

    /**
     * Gets all the variants of a product
     */
    public function getProductVariants($product_id)
    {
        try {
            $params = [
                'fields' => [
                    'parent_id' => $product_id,
                    'deleted' => '0'
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                'limit' => 5000
            ];
            $variants = $this->model->getByParams($this->product_tbl, $params);


            // array to hold all the variants for this product
            $full_product_variants = [];

            foreach ($variants as $variant) {
                /**
                 * get the full info about the variant
                 * including attributes and options
                 */

                $full_product_variants[] = $this->getVariant($variant['product_id']);
            }


            return $full_product_variants;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getVariant($variant_id)
    {
        try {
            // get base variant data
            $variant = $this->getProductById($variant_id);


            if (!empty($variant)) {

                $sql = "SELECT {$this->product_options_tbl}.*
                      ,{$this->attributes_tbl}.name AS attribute_name
                      ,{$this->attributes_options_tbl}.name AS option_name
                        FROM {$this->product_options_tbl} 
                    LEFT JOIN {$this->attributes_tbl} ON {$this->attributes_tbl}.attribute_id = {$this->product_options_tbl}.attribute_id
                    LEFT JOIN {$this->attributes_options_tbl} ON {$this->attributes_options_tbl}.option_id = {$this->product_options_tbl}.option_id
                    WHERE {$this->product_options_tbl}.product_id = :product_id";

                $params = [
                    'product_id' => $variant_id
                ];


                $variant['attributes'] = $this->model->getBySql($sql, $params);

                $qtys = $this->getProductQuantities($variant_id);

                // $product_data['quantities'] = empty($qtys) ? [] : $qtys;
                $variant['quantities'] = $qtys;

                $params = [
                    'fields' => [
                        'product_id' => $variant_id
                    ]
                ];
                $variant['images'] = $this->model->getByParams($this->product_img_tbl, $params);

                return $variant;
            }


            return $variant;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductQuantities($product_id)
    {
        try {

            $params = [
                'fields' => [
                    'product_id' => $product_id
                ]
            ];

            $qtys = $this->model->getByParams($this->inventory_tbl, $params);

            // foreach ($qtys as $qty) {
            //     $params = [
            //         'fields' => [
            //             'location_id' => $qty['location_id']
            //         ]
            //     ];
            //     $qty['location'] = $this->model->getByParams($this->inventory_tbl, $params);
            // }

            return $qtys;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductMetaFields($product_id)
    {
        try {
            // get base variant data
            $params = [
                'fields' => [
                    'product_id' => $product_id
                ]
            ];
            return $this->model->getByParams($this->product_meta_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductTags($product_id)
    {
        try {
            $tags = [];
            // get base variant data
            $params = [
                'fields' => [
                    'product_id' => $product_id
                ]
            ];
            $tag_ids = $this->model->getByParams($this->product_tags_tbl, $params);

            foreach ($tag_ids as $id) {
                $params = [
                    'fields' => [
                        'tag_id' => $id['tag_id']
                    ]
                ];
                $tag_info = $this->model->getByParams('tags', $params);
                $tags[] = $tag_info[0];
            }
            return $tags;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductStores($product_id)
    {
        try {
            // get base variant data
            $params = [
                'fields' => [
                    'product_id' => $product_id
                ]
            ];
            return $this->model->getByParams($this->product_store_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * gets the basic product info without any attributes or variants
     */
    public function getBasicProductDetails($product_id)
    {
        try {
            // get base variant data
            $params = [
                'fields' => [
                    'product_id' => $product_id
                ],
                'order' => [
                    'created_at' => 'DESC'
                ],
                'limit' => 50
            ];
            return $this->model->getByParams($this->product_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getProductCategoryById($category_id)
    {

        try {

            $params = [
                'fields' => array(
                    'product_id' => $category_id
                )
            ];

            $data = $this->model->getByParams($this->categories_tbl, $params);

            if (!empty($data)) {
                $data = $data[0];
            }

            return $data;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getProductImages($product_id)
    {

        try {

            $params = [
                'fields' => array(
                    'product_id' => $product_id
                ),
            ];

            return $this->model->getByParams($this->product_img_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductCategories($product_id)
    {

        try {

            $params = [
                'fields' => array(
                    'product_id' => $product_id
                ),
                'order' => [
                    'store_id' => "ASC"
                ]
            ];

            $data = $this->model->getByParams($this->product_category_tbl, $params);

            return $data;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getStoreSettings($store_id)
    {

        try {

            $settings = $this->model->getByField($this->table_settings, 'store_id', $store_id);

            if (!empty($settings)) {
                $settings = $settings[0];
            }

            return $settings;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Gets the products in these categories
     */
    public function getProductsByCategories(array $category_names = [])
    {
        try {
            $categorys = [];

            if (empty($category_names)) {
                $cats = $this->cat_model->getCategoriesByStoreId($this->store_id);

                foreach ($cats as $cat) {
                    $category_names[] = $cat['name'];
                }
            }

            foreach ($category_names as $name) {

                $category = $this->cat_model->getCategoryByName($name);

                if (!empty($category) && $category['parent_id'] == '0') {

                    $products = $this->getProductsForCategory($category['category_id']);

                    $category['products'] = $products['products'];


                    $category['filters'] = $this->getFilters($products['products']);

                    $sc = [];

                    if (!empty($category['sub_categories'])) {

                        foreach ($category['sub_categories'] as $cat) {

                            $products = $this->getProductsForCategory($cat['category_id']);

                            $cat['products'] = $products['products'];

                            $l1_sc = [];

                            if (!empty($cat['sub_categories'])) {

                                foreach ($cat['sub_categories'] as $l1_cat) {

                                    $l1_products = $this->getProductsForCategory($l1_cat['category_id']);

                                    $l1_cat['products'] = $l1_products['products'];

                                    $l2_sc = [];

                                    if (!empty($l1_cat['sub_categories'])) {

                                        foreach ($cat['sub_categories'] as $l2_cat) {

                                            $l2_products = $this->getProductsForCategory($l2_cat['category_id']);

                                            $l2_cat['products'] = $l2_products['products'];

                                            $l2_sc[] = $l2_cat;
                                        }
                                    }

                                    $l1_sc[] = $l1_cat;
                                }
                            }


                            $sc[] = $cat;
                        }
                    }

                    unset($category['sub_categories']);

                    $category['sub_categories'] = $sc;

                    $categorys[] = $category;
                }
            }

            return $categorys;
        } catch (Exception $e) {
            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getFilters(array $products)
    {
        try {
            $filters = [];

            foreach ($products as $product) {

                $attrib = [];

                foreach ($product['attributes'] as $attr) {

                    if (!array_key_exists($attr['name'], $filters)) {
                        $filters[$attr['name']] = [];
                    }

                    foreach ($attr['options'] as $opt) {

                        if (!in_array($opt, $filters[$attr['name']])) {
                            array_push($filters[$attr['name']], $opt['name']);
                        }
                    }
                }
            }

            $objects = [];

            foreach ($filters as $key => $value) {
                $objects[] = [$key => $value];
            }

            return $objects;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    public function getFilteredProducts($category_id, $filters)
    {
        try {


            // products that fit search
            $filter_products = [];

            $attr_names = [];

            foreach ($filters as $key => $value) {
                $attr_names[] = array_key_first($value);
            }

            $products = $this->getProductsForCategory($category_id);

            foreach ($products as $product) {

                $product = $product[0];

                if (!empty($product['attributes'])) {

                    foreach ($product['attributes'] as $att) {

                        if (in_array($att['name'], $attr_names)) {
    
                            //add id of parent product to array
                            $filter_ids[] = $product['product_id'];
    
                            /**
                             * Go through the variants and pick the 
                             * variants that match the search
                             */
                            foreach ($product['variants'] as $variant) {
    
                                
                                foreach ($variant['attributes'] as $v_attr) {
    
                                    if (in_array($v_attr['attribute_name'], $attr_names)) {
    
                                        unset($product['variants']);
    
                                        foreach ($filters as $key => $value) {
    
                                            $option_values = [];
    
                                            foreach ($value[array_key_first($value)] as $val) {
                                                $option_values[] = $val;
                                            }
    
                                            if ($v_attr['attribute_name'] == array_key_first($value)) {
                                                
                                                if (in_array($v_attr['option_name'], $option_values)) {
    
                                                    $product['variants'] = $variant;
                                                }
                                            }
                                        }
    
                                    }
                                }
                            }
    
                            $filter_products[] = $product;
                        }
                    }
                }

                
            }
            return $filter_products;

        } catch (Exception $e) {
            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductsForCategory($category_id)
    {
        try {
            $category = [];

            $category['products'] = [];

            $product_ids = $this->model->getByParams($this->product_category_tbl, [
                'fields' => [
                    'category_id' => $category_id
                ]
            ]);


            foreach ($product_ids as $id) {

                $prod = $this->getProduct($id['product_id']);

                // skip variants
                if ($prod['parent_id'] == '0') {
                    $category['products'][] = $prod;
                }
            }

            return $category;
        } catch (Exception $e) {
            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductsByStore($store_id)
    {
        try {
            $store_categories = $this->cat_model->getCategoriesByStoreId($store_id);

            $store_products = [];

            foreach ($store_categories as $category) {
                $cat_products = $this->getProductsForCategory($category['category_id']);

                foreach ($cat_products['products'] as $product) {
                    if (!empty($product)) {
                        $store_products[] = $product;
                    }
                    
                }
                
            }

            return $store_products;

        } catch (Exception $e) {
            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function saveProduct($data, $product_id = '')
    {
        try {

            $product = $this->productDataToArray($data);

            if ($product_id == '') {

                $product['created_at'] = $this->model->now;
                $this->model->add($this->product_tbl, $product);


                $params = [
                    'fields' => [
                        'sku' => $data['sku']
                    ],
                    'order' => [
                        'product_id' => 'DESC'
                    ],
                    'limit' => 1
                ];
            } else {

                $conditions_product = [
                    'product_id' => $product_id
                ];
                $this->model->updateByParams($this->product_tbl, $product, $conditions_product);


                $params = [
                    'fields' => [
                        'product_id' => $product_id
                    ],
                    'order' => [
                        'product_id' => 'DESC'
                    ],
                    'limit' => 1
                ];
            }


            $product = $this->model->getByParams($this->product_tbl, $params);

            if (empty($product)) {

                throw new Exception('Problem get product');
            } else {

                $product = end($product);
            }






            $this->addAttributes($data['attributes'], $product['product_id']);



            if (isset($data['variants']) && !empty($data['variants'])) {

                $exist_variants_ids = [];
                $variants = $this->getProductVariants($product['product_id']);

                foreach ($data['variants'] as $variant) {

                    $variant['parent_id'] = $product['product_id'];

                    if (isset($variant['product_id']) && $variant['product_id'] != '') {

                        $exist_variants_ids[] = $variant['product_id'];

                        $this->updateVariant($variant);
                        unset($exist_variants_ids[$variant['product_id']]);
                    } else {


                        $this->addVariant($variant);
                    }
                }

                foreach ($variants as $variant) {

                    if (!in_array($variant['product_id'], $exist_variants_ids)) {

                        $this->deleteVariant($variant['product_id']);
                    }
                }
            }





            if (isset($data['tags'])) {

                $exist_tag_ids = [];

                $tags = $this->getProductTags($product['product_id']);

                foreach ($data['tags'] as $tag) {

                    if (isset($tag['tag_id']) && $tag['tag_id'] != '') {

                        $exist_tag_ids[] = $tag['tag_id'];

                        $this->updateProductTags($tag, $product['product_id']);
                    } else {

                        $this->addProductTags($tag, $product['product_id']);
                    }
                }

                foreach ($tags as $tag) {

                    if (!in_array($tag['tag_id'], $exist_tag_ids)) {

                        $this->deleteProductTag($tag, $product['product_id']);
                    }
                }
            }


            if (isset($data['meta_data'])) {

                $exist_meta_ids = [];
                $metas = $this->getProductMetaFields($product['product_id']);

                foreach ($data['meta_data'] as $meta) {

                    if (isset($meta['meta_id']) && $meta['meta_id'] != '') {

                        $exist_meta_ids[] = $meta['meta_id'];
                        $this->updateProductMetadata($meta, $product['product_id']);
                    } else {

                        $this->addProductMetadata($meta, $product['product_id']);
                    }
                }

                foreach ($metas as $meta) {

                    if (!in_array($meta['meta_id'], $exist_meta_ids)) {

                        $this->deleteProductMetaField($meta, $product['product_id']);
                    }
                }
            }

            if (isset($data['quantities'])) {

                $this->saveProductQuantity($data['quantities'], $product['product_id']);
            }


            if (isset($data['images'])) {

                $images = $this->getProductImages($product['product_id']);

                $current_img_ids = [];

                foreach ($images as $current_img) {
                    $current_img_ids[] = $current_img['image_id'];
                }


                foreach ($data['images'] as $image_id) {

                    $image_id = (is_array($image_id)) ? $image_id['image_id'] : $image_id;

                    if ($image_id != '') {

                        $this->updateProductImage($image_id, $product['product_id']);

                        if (in_array($image_id, $current_img_ids)) {
                            if (($key = array_search($image_id, $current_img_ids)) !== false) {
                                unset($current_img_ids[$key]);
                            }
                        }
                    }
                }

                foreach ($current_img_ids as $image_id) {
                    $this->deleteProductImage($image_id, $product['product_id']);
                }
            }


            if (isset($data['stores'])) {

                $exist_categories_ids = [];

                $categories = $this->getProductCategories($product['product_id']);

                foreach ($data['stores'] as $store_key => $store) {


                    foreach ($store['categories'] as $category_id) {

                        $exist_categories_ids[] = $category_id;

                        $this->addProductCategory($category_id, $product['product_id'], $store['store_id']);
                    }
                }

                foreach ($categories as $category) {

                    if (!in_array($category['category_id'], $exist_categories_ids)) {

                        $this->deleteProductCategory($category['category_id'], $product['product_id']);
                    }
                }
            }


            if (isset($product)) {

                return ['product_id' => $product['product_id']];
            } else {

                return true;
            }
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function saveProductQuantity($quantities, $product_id)
    {
        try {

            foreach ($quantities as $quantity) {

                $location_id = (empty($quantity['location_id'])) ? '1' : $quantity['location_id'];

                $params = [
                    'fields' => [
                        'location_id' => $location_id,
                        'product_id' => $product_id
                    ]
                ];
                $prod_qty = $this->model->getByParams($this->inventory_tbl, $params);

                if (!empty($prod_qty)) {
                    $update_qty = [
                        'qty' => $quantity['qty']
                    ];

                    $conditions = [
                        'location_id' => $location_id,
                        'product_id' => $product_id
                    ];

                    $this->model->updateByParams($this->inventory_tbl, $update_qty, $conditions);
                } else {
                    $qty_info = [
                        'location_id' => $location_id,
                        'product_id' => $product_id,
                        'qty' => $quantity['qty']
                    ];

                    $this->model->add($this->inventory_tbl, $qty_info);
                }
            }
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function saveProductImages($images)
    {
        try {

            $new_images = [];

            $names = [];

            foreach ($images as $image) {

                $image_info = $this->imageDataToArray($image);

                unset($image_info['image_id']);
                unset($image_info['product_id']);
                $image_info['created_at'] = $this->now;

                array_push($names, $image_info['name']);

                $this->model->add($this->product_img_tbl, $image_info);
            }

            foreach ($names as $img_name) {
                $params = [
                    'fields' => [
                        'name' => $img_name
                    ]
                ];
                $new_image = $this->model->getByParams($this->product_img_tbl, $params);
                array_push($new_images, $new_image[0]);
            }

            return $new_images;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function imageDataToArray(array $base)
    {
        $structure = $this->imageDataArray();

        foreach ($structure as $key => $value) {
            if (isset($base[$key])) {
                $structure[$key] = $base[$key];
            }
        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    public function imageDataArray()
    {

        return [
            'image_id' => '',
            'product_id' => '',
            'name' => '',
            'alt' => '',
            'path' => '',
            'position' => '',
            'deleted' => 0,
            'created_at' => '',
            'updated_at' => '',
        ];
    }

    public function addVariant(array $variant)
    {
        try {

            if (empty($variant['attributes'])) {

                return new Exception('Cannot create variant without attributes.', 1);
            }

            $base_variant = $this->productDataToArray($variant);
            $base_variant['created_at'] = $this->model->now;

            $results = $this->model->add($this->product_tbl, $base_variant);


            if (empty($results)) {

                return new Exception('Problem adding variant', 1);
            }



            // Get the details(id) of the newly saved product
            $params = [
                'fields' => [
                    'parent_id' => $base_variant['parent_id'],
                ],
                'order' => [
                    'product_id' => 'DESC'
                ],
                'limit' => 1
            ];


            $new_variant = $this->model->getByParams($this->product_tbl, $params);

            if (!empty($new_variant)) {

                $new_variant = end($new_variant);

                $this->assignVariantAttributes($variant['attributes'], $new_variant['product_id'], $new_variant['parent_id']);
            }


            if (isset($variant['images'])) {

                $images = $this->getProductImages($new_variant['product_id']);

                $current_img_ids = [];

                foreach ($images as $current_img) {
                    $current_img_ids[] = $current_img['image_id'];
                }


                foreach ($variant['images'] as $image_id) {

                    if ($image_id != '') {

                        $this->updateProductImage($image_id, $new_variant['product_id']);

                        if (in_array($image_id, $current_img_ids)) {
                            if (($key = array_search($image_id, $current_img_ids)) !== false) {
                                unset($current_img_ids[$key]);
                            }
                        }
                    }
                }

                foreach ($current_img_ids as $image_id) {
                    $this->deleteProductImage($image_id, $new_variant['product_id']);
                }
            }

            if (isset($variant['quantities'])) {
                $this->updateVariantQuantity($variant['quantities'], $new_variant['product_id']);
            }

            return false;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateVariant(array $variant_data)
    {
        try {
            if (empty($variant_data['attributes'])) {

                return new Exception('Cannot create variant without attributes.', 1);
            }

            $base_variant = $this->productDataToArray($variant_data);

            $conditions = [
                'product_id' => $variant_data['product_id'],
            ];
            $this->model->updateByParams($this->product_tbl, $base_variant, $conditions);

            $this->assignVariantAttributes($variant_data['attributes'], $variant_data['product_id'], $variant_data['parent_id']);

            if (isset($variant_data['images'])) {
                $this->updateVariantImages($variant_data['images'], $variant_data['product_id']);
            }

            if (isset($variant_data['quantities'])) {
                $this->updateVariantQuantity($variant_data['quantities'], $variant_data['product_id']);
            }


            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateVariantImages(array $variant_images, $variant_id)
    {
        try {
            $delete_image_ids = [];
            $params = [
                'fields' => [
                    'product_id' => $variant_id
                ]
            ];

            $current_img = $this->model->getByParams($this->product_img_tbl, $params);

            foreach ($current_img as $img) {
                $delete_image_ids[] = $img['image_id'];
            }

            foreach ($variant_images as $img_id) {

                if (($key = array_search($img_id, $delete_image_ids)) !== false) {
                    /**
                     * image is still available
                     */
                    unset($delete_image_ids[$key]);
                } else {
                    /**
                     * new image for variant
                     */
                    $this->updateProductImage($img_id['image_id'], $variant_id);
                }
            }

            /**
             * Remove deleted images
             */
            foreach ($delete_image_ids as $id) {
                $this->deleteProductImage($id, $variant_id);
            }

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateVariantQuantity(array $variant_qtys, $variant_id)
    {
        try {

            foreach ($variant_qtys as $location_qty) {


                $location_id = empty($location_qty['location_id']) ? '1' : $location_qty['location_id'];

                $var_qty = $this->model->getByParams($this->inventory_tbl, ['fields' => ['location_id' => $location_id, 'product_id' => $variant_id]]);


                if (!empty($var_qty)) {
                    $update_data = [
                        'qty' => $location_qty['qty']
                    ];

                    $conditions = [
                        'location_id' => $location_id,
                        'product_id' => $variant_id
                    ];

                    $this->model->updateByParams($this->inventory_tbl, $update_data, $conditions);
                } else {
                    $new_data = [
                        'location_id' => $location_id,
                        'product_id' => $variant_id,
                        'qty' => $location_qty['qty']
                    ];
                    $this->model->add($this->inventory_tbl, $new_data);
                }
            }

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateProductQuantities(array $product_qtys, $variant_id)
    {
        try {

            foreach ($product_qtys as $location_qty) {

                $location_id = empty($location_qty['location_id']) ? '1' : $location_qty['location_id'];

                $prod_qty = $this->model->getByParams($this->inventory_tbl, ['fields' => ['location_id' => $location_id, 'product_id' => $variant_id]]);


                if (!empty($prod_qty)) {
                    $update_data = [
                        'qty' => $location_qty['quantity']
                    ];

                    $conditions = [
                        'location_id' => $location_id,
                        'product_id' => $variant_id
                    ];

                    $this->model->updateByParams($this->inventory_tbl, $update_data, $conditions);
                } else {
                    $new_data = [
                        'location_id' => $location_id,
                        'product_id' => $variant_id,
                        'qty' => $location_qty['quantity']
                    ];
                    $this->model->add($this->inventory_tbl, $new_data);
                }
            }

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateProductTags($tag, $product_id)
    {
        try {
            if (!isset($tag['tag_id'])) {
                $result = $this->addProductTags($tag, $product_id);
                if ($result !== true) {
                    //die('tag not added');
                }
            } elseif (!isset($tag['product_id'])) {

                $result = $this->addProductTags($tag, $product_id);
                // $data = [
                //     'tag_id' => $tag['tag_id'],
                //     'product_id' => $product_id
                // ];
                // $result = $this->model->add($this->product_tags_tbl, $data);
                if ($result !== true) {
                    //die('tag not added');
                }
            }
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }


    public function deleteProductTag(array $tag_data, $product_id)
    {
        try {
            $db = $this->model->getDB();

            $sql = "DELETE FROM {$this->product_tags_tbl} WHERE product_id = ? AND tag_id = ?";
            $stmt = $db->prepare($sql);
            $stmt->bindValue(1, $product_id);
            $stmt->bindValue(2, $tag_data['tag_id']);
            $result = $stmt->executeQuery();

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }

    public function deleteProductMetaField(array $meta_field, $product_id)
    {
        try {
            $db = $this->model->getDB();

            $sql = "DELETE FROM {$this->product_meta_tbl} WHERE product_id = ? AND meta_id = ?";
            $stmt = $db->prepare($sql);
            $stmt->bindValue(1, $product_id);
            $stmt->bindValue(2, $meta_field['meta_id']);
            $result = $stmt->executeQuery();

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }


    public function deleteProductImage($image_id)
    {
        try {
            $data = [
                'deleted' => 1
            ];
            $conditions = [
                'image_id' => $image_id
            ];
            $this->model->updateByParams($this->product_img_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }

    public function deleteVariant($product_id)
    {
        try {
            $data = [
                'deleted' => 1
            ];
            $conditions = [
                'product_id' => $product_id
            ];
            $this->model->updateByParams($this->product_tbl, $data, $conditions);
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            die($err . $e->getMessage());
            throw new Exception($err . $e->getMessage());
        }
    }


    public function getProductAttributes($product_id)
    {

        try {
            $params = [
                'fields' => [
                    'product_id' => $product_id
                ],
                'order' => [
                    'position' => 'ASC'
                ],
                'limit' => 5000
            ];

            return $this->model->getByParams($this->attributes_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function getProductAttributeOptions($attribute_id)
    {

        try {
            $params = [
                'fields' => [
                    'attribute_id' => $attribute_id
                ],
                'order' => [
                    'position' => 'ASC'
                ]
            ];

            return $this->model->getByParams($this->attributes_options_tbl, $params);
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addAttributes($attributes, $product_id)
    {
        try {

            $attribute_ids_list = [];

            $conditions = [
                'fields' => [
                    'product_id' => $product_id
                ]
            ];

            $exist_attributes = $this->model->getByParams($this->attributes_tbl, $conditions);

            $position = 0;

            foreach ($attributes as $attribute) {

                $position++;

                $exist_attribute = [];

                if (isset($attribute['attribute_id']) && $attribute['attribute_id'] != '') {

                    $attribute_ids_list[] = $attribute['attribute_id'];

                    $conditions = [
                        'fields' => [
                            'product_id' => $product_id,
                            'attribute_id' => $attribute['attribute_id']
                        ]
                    ];

                    $exist_attribute = $this->model->getByParams($this->attributes_tbl, $conditions);
                }

                if (!empty($exist_attribute)) {

                    /**
                     * Product attribute exists so just do an update
                     */
                    $conditions = [
                        'product_id' => $product_id,
                        'attribute_id' => $attribute['attribute_id'],
                    ];
                    $params = [
                        'name' => $attribute['name'],
                        'position' => $attribute['position']
                    ];

                    $this->model->updateByParams($this->attributes_tbl, $params, $conditions);


                    $conditions = [
                        'fields' => [
                            'product_id' => $product_id,
                            'attribute_id' => $attribute['attribute_id'],
                        ]
                    ];
                } else {

                    /**
                     * Product attribute does not exist so create a new azttribute
                     */

                    $data = [
                        'product_id' => $product_id,
                        'name' => $attribute['name'],
                        'position' => $position,
                    ];

                    $this->model->add($this->attributes_tbl, $data);

                    // get attribute _id of new attribute
                    $conditions = [
                        'fields' => [
                            'product_id' => $product_id,
                            'name' => $attribute['name'],
                            'position' => $position
                        ]
                    ];
                }

                $attribute_data = $this->model->getByParams($this->attributes_tbl, $conditions);

                // add attribute options
                if (isset($attribute['options']) && is_array($attribute['options'])) {

                    $result = $this->addAttributeOptions($attribute['options'], $attribute_data[0]['attribute_id']);
                    if ($result !== true) {
                        // TODO .. handle error
                        die('Attribute options not added');
                    }
                }
            }

            /*
             *  DELETE NO EXIST ATTRIBUTES
             */
            foreach ($exist_attributes as $attribute) {


                if (!in_array($attribute['attribute_id'], $attribute_ids_list)) {

                    $conditions = [
                        'attribute_id' => $attribute['attribute_id']
                    ];

                    /**
                     * delete the attribute
                     */
                    $this->model->deleteByParams($this->attributes_tbl, $conditions);
                }
            }

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function assignVariantAttributes($attribute_options, $product_id, $parent_id)
    {
        try {

            foreach ($attribute_options as $option) {


                /*
                 *
                 * Verify the existance of the attribute for parent
                 *
                 */

                if ($option['attribute_id'] == '') {

                    $conditions = [
                        'fields' => [
                            'product_id' => $parent_id,
                            'name' => $option['attribute_name']
                        ]
                    ];
                } else {

                    $conditions = [
                        'fields' => [
                            'product_id' => $parent_id,
                            'attribute_id' => $option['attribute_id']
                        ]
                    ];
                }
                $attribute = $this->model->getByParams($this->attributes_tbl, $conditions);
                if (empty($attribute)) {
                    continue;
                }


                if ($option['option_id'] == '') {

                    $conditions = [
                        'fields' => [
                            'attribute_id' => $attribute[0]['attribute_id'],
                            'name' => $option['option_name']
                        ]
                    ];
                } else {

                    $conditions = [
                        'fields' => [
                            'attribute_id' => $attribute[0]['attribute_id'],
                            'option_id' => $option['option_id']
                        ]
                    ];
                }

                $option = $this->model->getByParams($this->attributes_options_tbl, $conditions);
                if (empty($option)) {
                    continue;
                }


                /***
                 *  Checking if the connection between attribute and product exist
                 */
                $conditions = [
                    'fields' => [
                        'attribute_id' => $attribute[0]['attribute_id'],
                        'product_id' => $product_id
                    ]
                ];
                $product_option = $this->model->getByParams($this->product_options_tbl, $conditions);

                if (!empty($product_option)) {


                    // update the variant options
                    $conditions = [
                        'attribute_id' => $attribute[0]['attribute_id'],
                        'product_id' => $product_id
                    ];


                    $data = [
                        'option_id' => $option[0]['option_id'],
                    ];


                    $this->model->updateByParams($this->product_options_tbl, $data, $conditions);
                } else {

                    // add the variant options
                    $data = [
                        'product_id' => $product_id,
                        'attribute_id' => $attribute[0]['attribute_id'],
                        'option_id' => $option[0]['option_id'],
                    ];
                    $this->model->add($this->product_options_tbl, $data);
                }
            }
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function addAttributeOptions($attribute_opts, $attribute_id)
    {
        try {

            $existing_values = [];
            $existing_values_validation = [];
            $existing_ids_validation = [];

            $conditions = [
                'fields' => [
                    'attribute_id' => $attribute_id
                ]
            ];

            $exist_attribute_options = $this->model->getByParams($this->attributes_options_tbl, $conditions);

            foreach ($exist_attribute_options as $option) {

                $existing_values[] = $option['name'];
            }

            $position = 0;

            foreach ($attribute_opts as $attr_opt_value) {

                $existing_values_validation[] = $attr_opt_value['value'];


                $position++;


                if (isset($attr_opt_value['option_id']) && $attr_opt_value['option_id'] != '') {


                    $conditions = [
                        'attribute_id' => $attribute_id,
                        'option_id' => $attr_opt_value['option_id'],
                    ];

                    $data = [
                        'name' => $attr_opt_value['value'],
                        'position' => $attr_opt_value['position'],
                    ];

                    $this->model->updateByParams($this->attributes_options_tbl, $data, $conditions);
                } else if (in_array($attr_opt_value['value'], $existing_values)) {

                    $conditions = [
                        'attribute_id' => $attribute_id,
                        'name' => $attr_opt_value['value'],
                    ];

                    $data = [
                        'name' => $attr_opt_value['value'],
                        'position' => $attr_opt_value['position'],
                    ];

                    $this->model->updateByParams($this->attributes_options_tbl, $data, $conditions);
                } else {

                    $existing_values[] = $attr_opt_value['value'];

                    $data = [
                        'attribute_id' => $attribute_id,
                        'name' => $attr_opt_value['value'],
                        'position' => $attr_opt_value['position'],
                    ];

                    $this->model->add($this->attributes_options_tbl, $data);
                }
            }

            /***
             *  LETS REMOVE UNNESSESRY OPTIONS             *
             */


            foreach ($exist_attribute_options as $option) {

                $delete_option = true;

                foreach ($attribute_opts as $attr_opt_value) {

                    if (
                        (isset($attr_opt_value['option_id']) && $attr_opt_value['option_id'] == $option['option_id'])
                        ||
                        $attr_opt_value['value'] == $option['name']
                    ) {

                        $delete_option = false;
                    }
                }

                if ($delete_option == true) {

                    $conditions = [
                        'name' => $option['name'],
                        'attribute_id' => $attribute_id
                    ];


                    $this->model->deleteByParams($this->attributes_options_tbl, $conditions);
                }

                /*
                if (!in_array($option['name'], $existing_values_validation)) {

                    $conditions = [
                        'name' => $option['name'],
                        'attribute_id' => $attribute_id
                    ];

                    $this->model->deleteByParams($this->attributes_options_tbl, $conditions);
                }
                */
            }


            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    /**
     * Matches the products to the stores wher it held
     */
    public function addProductStore($store_data, $product_id)
    {
        try {

            foreach ($store_data as $data) {
                $base_data = $data;
                unset($base_data['categories']);

                $prod_store = [
                    'store_id' => $data['store_id'],
                    'product_id' => $product_id
                ];
                $this->model->add($this->product_store_tbl, $prod_store);

                foreach ($data['categories'] as $category) {

                    // get the ID of the category
                    $conditions = [
                        'fields' => [
                            'name' => $category['category_name']
                        ]
                    ];
                    $cat_results = $this->model->getByParams('categories', $conditions);

                    /**
                     * If category id is set it means the
                     * category is defined so add it directly
                     */
                    if (!empty($cat_results)) {
                        $prod_category = [
                            'category_id' => $cat_results[0]['category_id'],
                            'product_id' => $product_id
                        ];
                        $this->model->add($this->product_category_tbl, $prod_category);
                    } else {
                        // add the new category
                        $prod_category = [
                            'parent_id' => 0,
                            'user_id' => $GLOBALS['sess']['user_id'],
                            'name' => $category['category_name'],
                            'position' => 1,
                            'deleted' => 0,
                            'status' => 1,
                            'created_at' => $this->now,
                            'updated_at' => $this->now
                        ];
                        $this->model->add('categories', $prod_category);

                        // get the ID of the new category
                        $conditions = [
                            'fields' => [
                                'name' => $category['category_name']
                            ]
                        ];
                        $results = $this->model->getByParams('categories', $conditions);
                        if (!empty($results)) {
                            $prod_category = [
                                'category_id' => $results[0]['category_id'],
                                'product_id' => $product_id
                            ];
                            $this->model->add($this->product_category_tbl, $prod_category);
                        }
                    }
                }
            }
            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addProductMetadata($meta, $product_id)
    {
        if (isset($meta['meta_id']) && $meta['meta_id'] != '') {
            return;
        }
        try {

            $params = [
                'fields' => [
                    'meta_key' => $meta['meta_key'],
                    'product_id' => $product_id,
                ]
            ];


            $results = $this->model->getByParams($this->product_meta_tbl, $params);

            if (empty($results)) {

                $data = [
                    'product_id' => $product_id,
                    'meta_key' => $meta['meta_key'],
                    'value' => $meta['value']
                ];
                $this->model->add($this->product_meta_tbl, $data);
            } else {

                $this->updateProductMetadata($meta, $product_id);
            }
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateProductMetadata($meta, $product_id)
    {

        if (!isset($meta['meta_id'])) {
            return;
        }

        try {

            $conditions = [
                'fields' => [
                    'meta_id' => $meta['meta_id'],
                    'product_id' => $product_id,
                ]
            ];
            $results = $this->model->getByParams($this->product_meta_tbl, $conditions);

            if (!empty($results)) {

                $conditions = [
                    'meta_id' => $meta['meta_id'],
                    'product_id' => $product_id,
                ];

                $data = [
                    'value' => $meta['value'],
                    'meta_key' => $meta['meta_key']
                ];
                $this->model->updateByParams($this->product_meta_tbl, $data, $conditions);
            }
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Adds product_ids to the new images 
     */
    public function updateProductImage($image_id, $product_id)
    {
        try {

            $conditions = [
                'image_id' => $image_id
            ];

            $data = [
                'product_id' => $product_id
            ];

            $this->model->updateByParams($this->product_img_tbl, $data, $conditions);

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addProductCategory($category_id, $product_id, $store_id)
    {
        try {

            $conditions = [
                'fields' => [
                    'product_id' => $product_id,
                    'category_id' => $category_id,
                    'store_id' => $store_id
                ]
            ];

            $results = $this->model->getByParams($this->product_category_tbl, $conditions);

            if (empty($results)) {

                $data = [
                    'product_id' => $product_id,
                    'category_id' => $category_id,
                    'store_id' => $store_id
                ];
                $this->model->add($this->product_category_tbl, $data);
            }
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function addProductTags($data, $product_id)
    {
        try {

            /**
             * Check if tag name has been saved before
             */
            $conditions = [
                'fields' => [
                    'name' => $data['name']
                ]
            ];
            $old_tag = $this->model->getByParams('tags', $conditions);


            if (empty($old_tag)) {

                /**
                 * If tag has not been created before 
                 * create a new tag entry
                 */
                $new_tag_data = [
                    'name' => $data['name'],
                    'user_id' => $GLOBALS['sess']['user_id'],
                    'deleted' => 0,
                    'created_at' => $this->now,
                    'updated_at' => $this->now,
                ];
                $this->model->add('tags', $new_tag_data);

                $conditions = [
                    'fields' => [
                        'name' => $data['name']
                    ]
                ];
                $new_tag = $this->model->getByParams('tags', $conditions);

                /**
                 * get tag id of new tag
                 */
                $tag_id = $new_tag[0]['tag_id'];

                /**
                 * associate the new tag with this product
                 */
                $product_tag = [
                    'tag_id' => $tag_id,
                    'product_id' => $product_id,
                ];

                $this->model->add($this->product_tags_tbl, $product_tag);
            } else {

                $conditions = [
                    'fields' => [
                        'tag_id' => $old_tag[0]['tag_id'],
                        'product_id' => $product_id
                    ]
                ];
                $tag_exists = $this->model->getByParams($this->product_tags_tbl, $conditions);

                /**
                 * tag exists and is already associated with product
                 */
                if (!empty($tag_exists)) {
                    return true;
                } else {
                    /**
                     * tag exists but is not associated with product
                     */
                    $product_tag = [
                        'tag_id' => $old_tag[0]['tag_id'],
                        'product_id' => $product_id,
                    ];

                    $this->model->add($this->product_tags_tbl, $product_tag);
                }
            }

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    /**
     * Validate image and Save file locally
     */
    public function saveUploadedFile()
    {
        // TODO ... sanitization
        $post_files = $_FILES;

        foreach ($post_files as $key => $file) {

            if ($file['size'] !== 0) {

                $filename = sprintf(
                    '%s.%s',
                    //$this->create_uuid(),
                    pathinfo($file['name'], PATHINFO_EXTENSION)
                );

                $path = __DIR__ . '/../../../uploads/' . $GLOBALS['sess']['user_id'] . '/products/';
                if (!is_dir($path)) {
                    mkdir($path, 0777, true);
                }
                // user_id / module
                $file_location = $path . $filename;
                move_uploaded_file($_FILES["file"]["tmp_name"], $file_location);
                $details = [
                    'path' => $file_location,
                    'file_name' => $filename
                ];
                return $details;
            }
        }
        return false;
    }

    public function addProductImages($images, $product_id)
    {
        try {
            foreach ($images as $image) {

                // $save_details = $this->saveUploadedFile();

                $data = [
                    'product_id' => $product_id,
                    'name' => $image['name'],
                    'alt' => $image['alt'],
                    'path' => $image['path'],
                    'position' => $image['position'] //$prod_data[0]['tag_id']
                ];

                $conditions = [
                    'image_id' => $image['image_id'],
                ];
                $this->model->updateByParams($this->product_tbl, $data, $conditions);
            }

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }

    public function updateAttributes($attributes, $product_id)
    {


        foreach ($attributes as $attr_id => $attr_value) {

            $data = [
                'name' => $attr_value,
            ];

            $conditions = [
                'fields' => [
                    'attribute_id' => $attr_id,
                    'product_id' => $product_id
                ]
            ];


            $attribute = $this->model->getByParams($this->attributes_tbl, $conditions);


            if (!empty($attribute)) {

                $conditions = [
                    'attribute_id' => $attr_id,
                    'product_id' => $product_id
                ];

                $this->model->updateByParams($this->attributes_tbl, $data, $conditions);
            } else {

                $this->addAttributes([$attr_value], $product_id);
            }
        }
    }


    public function deleteProduct($product_id)
    {
        $prod = $this->getProduct($product_id);


        /**
         * remove attributes
         */
        if (isset($prod['attributes'])) {
            foreach ($prod['attributes'] as $attribute) {
                $this->deleteAttributes($attribute['attribute_id']);
            }
        }

        /**
         * remove tag association
         */
        if (isset($prod['tags'])) {
            foreach ($prod['tags'] as $tag) {
                $this->deleteProductTag($tag, $product_id);
            }
        }

        /**
         * remove meta_data association
         */
        if (isset($prod['meta_data'])) {
            foreach ($prod['meta_data'] as $meta) {
                $this->deleteProductMetaField($meta, $product_id);
            }
        }

        /**
         * remove image 
         */
        if (isset($prod['images'])) {
            foreach ($prod['images'] as $image) {
                $this->deleteProductImage($image['image_id']);
            }
        }

        /**
         * remove category_association
         */
        if (isset($prod['stores'])) {
            foreach ($prod['stores'] as $store) {
                if (isset($store['categories']) && !empty($store['categories'])) {
                    foreach ($store['categories'] as $category) {

                        $this->deleteProductCategory($category, $product_id);
                    }
                }
            }
        }

        /**
         * remove variants
         */
        if (isset($prod['variants'])) {
            foreach ($prod['variants'] as $variant) {
                $this->deleteVariant($product_id);
            }
        }

        /**
         * Set product deleted to 1
         */
        $data = [
            'deleted' => 1
        ];
        $conditions = [
            'product_id' => $product_id
        ];
        $this->model->updateByParams($this->product_tbl, $data, $conditions);

        return true;
    }


    public function deleteAttributes($attribute_id)
    {
        /**
         * Check if attribute has any attribute options
         */
        $params = [
            'fields' => [
                'attribute_id' => $attribute_id
            ]
        ];
        $attribute_opts = $this->model->getByParams($this->attributes_options_tbl, $params);

        if (!empty($attribute_opts)) {
            // if the attribute has any options delete them
            foreach ($attribute_opts as $opt_id => $opt_value) {
                $this->deleteAttributeOptions($opt_id);
            }
        }
        $this->model->delete($this->attributes_tbl, 'attribute_id', $attribute_id);
        return true;
    }

    public function deleteAttributeOptions($option_id)
    {
        try {

            $this->model->delete($this->attributes_options_tbl, 'option_id', (string)$option_id);
            return true;
        } catch (Exception $e) {
            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';
            throw new Exception($err . $e->getMessage());
        }
    }


    public function deleteProductCategory($category_id, $product_id)
    {
        try {

            $params = [
                'category_id' => $category_id,
                'product_id' => $product_id
            ];

            $this->model->deleteByParams($this->product_category_tbl, $params);

            return true;
        } catch (Exception $e) {

            $err = '<h3>Database Exception - ' . __FUNCTION__ . ' - </h3><br><br>';

            throw new Exception($err . $e->getMessage());
        }
    }


    public function convertDate($data)
    {
        $stamp = null;
        if (strtotime($data) !== false) {
            $stamp = date("Y-m-d H:i:s", strtotime($data));
        }
        return $stamp;
    }


    public function productDataToArray(array $base)
    {
        $structure = $this->productDataArray();

        foreach ($structure as $key => $value) {
            if (isset($base[$key])) {
                $structure[$key] = $base[$key];
            }
        }

        $structure['updated_at'] = $this->model->now;

        return $structure;
    }

    public function productDataArray()
    {

        return [
            'user_id' => $GLOBALS['sess']['user_id'],
            'sku' => '',
            'parent_id' => 0,
            'name' => '',
            'description' => '',
            'short_description' => '',
            'price' => 0.00,
            'sale_price' => 0.00,
            'sale_start' => null,
            'sale_end' => null,
            'status' => 0,
            'deleted' => 0
            //            'drop_price' => '', //$drop_price,
            //            'drop_sale_price' => '', //$drop_sale_price,
            //            'drop_sale_start' => '',
            //            'drop_sale_end' => '',
            //            'drop_status' => 0,
        ];
    }
}
