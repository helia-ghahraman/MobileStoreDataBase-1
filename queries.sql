/* ordering customer's last name alphabetically */
SELECT First_name, Last_name FROM Customer ORDER BY Last_name ASC;

/* highest total price of a bill*/
SELECT ID, Total_price, MAX(Total_price) FROM Bill;

/* list of orders */
SELECT Product_ID FROM Cart_contains_Product;

/* the greatest amount of discount */
SELECT Name, MAX(Discount) from product;

/* least amount of discount */
SELECT Name, MIN(Discount) from product;

/* the customer who has the highest balance */
SELECT c.First_name, c.Last_name, w.MAX(Balance) FROM wallet w, Customer c, Profile p
     WHERE p.Username = w.Profile_Username and p.Customer_ID = c.ID;

/* customers who have at least 2 carts */
SELECT distinct cr.First_name, cr.Last_name FROM Customer cr1, Customer cr2, Cart ct1, Cart ct2
     WHERE cr1.ID = cr2.ID and not(ct1.ID = ct2.ID) and cr1.ID = ct1.Customer_ID and cr2.ID = ct2.Customer_ID;

/* تامین کننده هایی که در یک شهر هستند */
SELECT distinct p1.Name, p1.ID, p2.Name, p2.ID FROM Provider p1, Provider p2
     WHERE p1.City = p2.City;

/* سه کاربر برتر ماه */
SELECT c.First_name, c.Last_name FROM Bill b, Customer c
     WHERE b.Date between '2021-03-01' and '2021-03-31' and c.ID = b.Cart_Customer_ID
     GROUP BY b.Cart_Customer_ID
     ORDER BY sum(Total_price) DESC LIMIT 3; 

/*اِن سفارش آخر هر کاربر مشخض (با گرفتن آیدی کاربر)*/
SELECT p.Name, b.Cart_Customer_ID FROM Product p, Bill b, Cart_contains_Product ccp
     WHERE p.ID = ccp.Product_ID and ccp.Cart_ID = b.Cart_ID and b.Cart_Customer_ID = 1
     ORDER BY b.Date DESC LIMIT 2;

/* پرفروش ترین محصولات ماه */
SELECT ccp.ID FROM Bill b, Cart_contains_Product ccp 
     WHERE b.Date between '2021-03-01' and '2021-03-31'
     GROUP BY ccp.ID
     ORDER BY count(ccp.ID) DESC LIMIT 3;

/* همه ی فروشنده های یک آیتم */
SELECT pr.Name, pr.ID, pt.Name FROM Product pt, Provider pr, Product_has_Provider php 
     WHERE pt.ID = php.Product_ID and pr.ID = php.Provider_ID;


/* قدیمی ترین عضو باشگاه مشتریان */
SELECT ID, First_name, Last_name, MIN(Join_date) FROM CUSTOMER;

/* جدیدترین عضو باشگاه مشتریان */
SELECT ID, First_name, Last_name, MAX(Join_date) FROM CUSTOMER;

/* میزان فروش محصولات در یک ماه */
SELECT p.ID, p.Name, SUM(p.Price) total "
                       "FROM Product p, Cart c, Cart_contains_Product ccp "
                       f"WHERE p.ID = ccp.Product_ID and c.ID = ccp.Cart_ID and p.ID = {ID};

/* انبار دارای بیشترین محصول*/
SELECT *, MAX(Amount) FROM Stockroom;

/* سه کاربر برتر هفته*/
SELECT c.First_name, c.Last_name FROM Bill b, Customer c 
     WHERE b.Date between '2021-03-24' and '2021-03-31' and 
          c.ID = b.Cart_Customer_ID 
     GROUP BY b.Cart_Customer_ID ORDER BY sum(Total_price) DESC LIMIT 3;

/* سه کاربر برتر ماه*/
SELECT c.First_name, c.Last_name FROM Bill b, Customer c 
     WHERE b.Date between '2021-03-01' and '2021-03-31' and 
          c.ID = b.Cart_Customer_ID 
     GROUP BY b.Cart_Customer_ID ORDER BY sum(Total_price) DESC LIMIT 3;

/*تعداد فروش محصولات در یک ماه */
SELECT count(ccp.Product_ID) FROM Cart_contains_Product ccp, Bill b, Product p
     WHERE b.Date between '2021-03-01' and '2021-03-31' and p.ID = ccp.Product_ID and b.Cart_ID = ccp.Cart_ID;

/* پیشنهاد‌های ویژه*/
SELECT * FROM Product WHERE Discount > 15;


/* ارزان فروش ترین فروشنده ی یک آیتم */
SELECT pr.Name, pr.ID, pt.Name, MIN(Price) FROM Product pt, Provider pr, Product_has_Provider php 
     WHERE pt.ID = php.Product_ID and pr.ID = php.Provider_ID;

/* مشتری‌هایی که در یک شهر هستند */
SELECT DISTINCT c1.First_name, c1.Last_name FROM Customer c1, Customer c2 WHERE c1.City = c2.City and not (c1.First_name = c2.First_name) ;

/* ordering customer's last name alphabetically...*/
SELECT First_name, Last_name FROM Customer ORDER BY Last_name ASC;

/* most expensive product...*/
SELECT Name, MAX(Price) FROM product;

/* cheapest product...*/
SELECT Name, MIN(Price) from product;

/* list of products...*/
SELECT ID, Name FROM Product;

/* همه ی فروشنده های یک آیتم...*/
SELECT pr.Name, pr.ID, pt.Name FROM Product pt, Provider pr, Product_has_Provider php 
     WHERE pt.ID = php.Product_ID and pr.ID = php.Provider_ID;

/* پرفروش ترین محصولات ماه...*/
SELECT ccp.ID FROM Bill b, Cart_contains_Product ccp 
     WHERE b.Date between '2021-03-01' and '2021-03-31'
     GROUP BY ccp.ID
     ORDER BY count(ccp.ID) DESC LIMIT 3;

/* میانگین فروش فروشگاه در یک ماه...*/
SELECT avg(b.Total_price) FROM Bill b WHERE b.Date between '2021-03-01' and '2021-03-31';
