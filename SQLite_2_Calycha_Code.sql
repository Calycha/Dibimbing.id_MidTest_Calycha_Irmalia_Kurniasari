CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought

WHERE item NOT IN 
(
    SELECT item
  
    FROM table
  
    GROUP BY item
  
    HAVING COUNT(*) = 1
  
) AND item NOT IN 
(
  
    SELECT item
  
    FROM table
  
    GROUP BY item
  
    HAVING COUNT(*) = (
      
        SELECT COUNT(*)
      
        FROM table
      
        GROUP BY item
      
        ORDER BY COUNT(*) DESC
      
        LIMIT 1 OFFSET 1
    )
);