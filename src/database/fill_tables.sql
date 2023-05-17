INSERT INTO "users"("name", "password")
VALUES ('zm1try', 'em0xdHJ5OlRFU1RfUEFTU1dPUkQ=');

INSERT INTO "products"("id","title", "description", "price")
VALUES ('04fa804c-28aa-4a72-9107-4a1783990a5b',
        'nikon d40',
        'basic ccd dslr camera',
        11),
       ('b49ae536-605a-4efd-99f9-3898a2afef6b',
        'nikon d90',
        'medium cmos camera',
        22),
       ('8d5b4c8c-ce88-4206-991a-22582ce4fb9b',
        'nikon d200',
        'pro cmos camera',
        33),
       ('cbf1bf25-2c91-4b1a-8976-567ba28c3c37',
        'nikon d600',
        'medium ff dslr camera',
        44);

INSERT INTO "carts"("user_id", "status")
SELECT (SELECT id
        FROM "users"
        WHERE name = 'zm1try'),
       'OPEN'
;

INSERT INTO "cart_items"("cart_id", "product_id", "count")
SELECT (SELECT id FROM carts WHERE status = 'OPEN' LIMIT 1),
       (SELECT id FROM products where title = 'nikon d600'),
       1;

INSERT INTO "orders"("cart_id", "user_id", "payment", "delivery", "comments", "status", "total")
SELECT (SELECT id FROM carts WHERE status = 'OPEN' LIMIT 1),
       (SELECT id FROM "users" WHERE name = 'zm1try'),
       '{"type":"card","address":"2-2 street","creditCart":"1111111"}',
       '{"type":"default","address":"2-2 street"}',
       'nice goods',
       'OPEN',
       23;