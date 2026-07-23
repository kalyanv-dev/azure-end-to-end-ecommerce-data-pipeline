CREATE TABLE metadata_silver_config (
    id INT IDENTITY(1,1) PRIMARY KEY,
    
    table_name VARCHAR(100),
    bronze_path VARCHAR(500),
    silver_table VARCHAR(200),
    file_format VARCHAR(20),

    primary_key VARCHAR(100),
    watermark_column VARCHAR(100),

    is_active BIT DEFAULT 1,

    rules NVARCHAR(MAX),

    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

INSERT INTO metadata_silver_config (
    table_name, bronze_path, silver_table, file_format,
    primary_key, watermark_column, rules
)
VALUES (
    'customers',
    '/Volumes/ecommerce_data_pipline_databricks_ws/bronze/bronze_vol/customers/',
    'silver.ecommerce_customers',
    'csv',
    'customer_id',
    'updated_at',
    '{
      "validations": {
        "primary_key_not_null": true,
        "primary_key_unique": true,
        "phone_min_length": 10
      },
      "transformations": [
        {"column": "first_name", "action": "lower"},
        {"column": "last_name", "action": "lower"},
        {"column": "email", "action": "upper"}
      ],
      "derived_columns": [
        {"name": "full_name", "expression": "concat(first_name, '' '', last_name)"}
      ]
    }'
);

INSERT INTO metadata_silver_config (
    table_name, bronze_path, silver_table, file_format,
    primary_key, watermark_column, rules
)
VALUES (
    'products',
    '/Volumes/ecommerce_data_pipline_databricks_ws/bronze/bronze_vol/products/',
    'silver.ecommerce_products',
    'csv',
    'product_id',
    'updated_at',
    '{
      "validations": {
        "primary_key_not_null": true,
        "primary_key_unique": true
      },
      "transformations": [
        {"column": "product_name", "action": "capitalize"}
      ]
    }'
);

INSERT INTO metadata_silver_config (
    table_name, bronze_path, silver_table, file_format,
    primary_key, watermark_column, rules
)
VALUES (
    'orders',
    '/Volumes/ecommerce_data_pipline_databricks_ws/bronze/bronze_vol/orders/',
    'silver.ecommerce_orders',
    'csv',
    'order_id',
    'order_date',
    '{
      "validations": {
        "primary_key_not_null": true,
        "primary_key_unique": true
      },
      "transformations": [
        {"column": "order_date", "action": "to_timestamp"}
      ]
    }'
);

INSERT INTO metadata_silver_config (
    table_name, bronze_path, silver_table, file_format,
    primary_key, watermark_column, rules
)
VALUES (
    'order_items',
    '/Volumes/ecommerce_data_pipline_databricks_ws/bronze/bronze_vol/order_items/',
    'silver.ecommerce_order_items',
    'csv',
    'order_item_id',
    'updated_at',
    '{
      "validations": {
        "primary_key_not_null": true,
        "primary_key_unique": true
      }
    }'
);

INSERT INTO metadata_silver_config (
    table_name, bronze_path, silver_table, file_format,
    primary_key, watermark_column, rules
)
VALUES (
    'payments',
    '/Volumes/ecommerce_data_pipline_databricks_ws/bronze/bronze_vol/payments/',
    'silver.ecommerce_payments',
    'csv',
    'payment_id',
    'payment_date',
    '{
      "validations": {
        "primary_key_not_null": true,
        "primary_key_unique": true
      },
      "transformations": [
        {"column": "payment_method", "action": "upper"},
        {"column": "payment_date", "action": "to_timestamp"}
      ]
    }'
);