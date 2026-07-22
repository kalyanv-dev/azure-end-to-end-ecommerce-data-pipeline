CREATE TABLE watermark_metadata (
    id INT IDENTITY(1,1) PRIMARY KEY,

    source_db VARCHAR(100),
    table_name VARCHAR(100),

    bronze_watermark_column VARCHAR(100),
    bronze_last_processed DATETIME,

    silver_watermark_column VARCHAR(100),
    silver_last_processed DATETIME,

    gold_watermark_column VARCHAR(100),
    gold_last_processed DATETIME,

    is_active BIT DEFAULT 1,

    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

INSERT INTO watermark_metadata (
    source_db,
    table_name,

    bronze_watermark_column,
    bronze_last_processed,

    silver_watermark_column,
    silver_last_processed,

    gold_watermark_column,
    gold_last_processed,

    is_active
)
VALUES
('ecommerce_db', 'customers',
 'updated_at', '1900-01-01 00:00:00',
 'updated_at', '1900-01-01 00:00:00',
 'updated_at', '1900-01-01 00:00:00',
 1),
('ecommerce_db', 'products',
 'updated_at', '1900-01-01 00:00:00',
 'updated_at', '1900-01-01 00:00:00',
 'updated_at', '1900-01-01 00:00:00',
 1),
('ecommerce_db', 'orders',
 'order_date', '1900-01-01 00:00:00',
 'order_date', '1900-01-01 00:00:00',
 'order_date', '1900-01-01 00:00:00',
 1),
('ecommerce_db', 'order_items',
 'created_at', '1900-01-01 00:00:00',
 'created_at', '1900-01-01 00:00:00',
 'created_at', '1900-01-01 00:00:00',
 1),
('ecommerce_db', 'payments',
 'payment_date', '1900-01-01 00:00:00',
 'payment_date', '1900-01-01 00:00:00',
 'payment_date', '1900-01-01 00:00:00',
 1);