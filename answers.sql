-- Question 1
SELECT orderID, customerName, LTRIM(value) AS Product FROM ProductDetail CROSS APPLY STRING_SPLIT(Product, ',');

-- Question 2
      -- creating orders table
CREATE TABLE orders (
    orderID INT PRIMARY KEY,
    customerName VARCHAR(100)
);

    -- Create orderItems table
CREATE TABLE orderItems(
    orderID INT, 
    product VARCHAR(100),
    quantity INT,
    PRIMARY KEY (orderID , product),
    FOREIGN KEY (orderID), REFERENCES orders(orderID)
);

    -- Inserting data into orders
INSERT INTO orders (orderID, customerName)
SELECT DISTINCT orderID,customerName
FROM orderDetails;

    -- Inserting data into orderitems
INSERT INTO orderItems (orderID, product, quantity)
SELECT orderID, product, quantity
FROM orderDetails;