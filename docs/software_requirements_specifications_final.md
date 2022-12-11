
# OVERVIEW
The online book store is the best way for students & other general users to buy books online and to save their precious time.It should be simple and convenient for students, professors, and other interested parties to acquire knowledge. They can get the book they need from the online bookstore, whether they need it for research or education. The online bookshop overturned the conventional bookshop's management model, allowing anybody with a computer or smartphone to purchase a book from any location while simultaneously saving time and effort and speeding up the book selection process. The concept behind the online bookshop system is to offer clients convenience and service. The size of the bookstore is relatively small, saving money.

# Software Requirements
## Functional Requirements

### 1)Login/signup:

FR1. User shall be validated by sending the OTP to the user through mail/phone number.

FR2. The user's details shall be secured by enabling the two steps verification option.

FR3. Verification of the user shall be done during login.

FR4. Working on the login button is very important.

FR5. Working on the signup button is very important.

FR6. New user details should be saved in the database.

### 2)Homepage:

FR7. correct results provided for search engine on the home page is necessary.

FR8. Classification of the books into their respective genre.

FR9. Display of any deals or offers on the home page is necessary.

FR10. Display and work of add to cart logo on the home page is necessary.

FR11. Search a book using keywords such as author, year of publication, title, etc. It is crucial.

### 3)user info & functions:

FR12. Users can update their contact & email information.

FR13. User getting emails regarding product deals.

FR14. User getting mails account login/signup.

FR15. User getting SMS regarding details.

FR16. User can add multiple delivery locations.

FR17. User being able to add and remove products.

FR18. User gets to search for their required books.

FR19. User being able to track the order.

### 4)Product and product details:

FR20. Sample book shall be displayed to the customers once the order is placed.

FR21. Payment details shall be shown to the customer once the order is finalized.

FR22. Details regarding the project shall be displayed below the product.

FR23. Add to cart button should work properly.

FR24. Books can be returned by tapping on the return option.

FR25. Inserting /Adding new books to the application.

FR26. Updating the app regarding the books which are out of stock.

### 5)Order details:

FR27. verification of customers' addresses must be done while logging in.

FR28. Display the total purchase, including the taxes.

FR29. User being able to track the order.

FR30. Updating order status if there is any delay.

FR31. User being able to add any delivery instructions.

## Non-functional requirements:

### 1)Login/signup:

NFR1. Scalability of application as the users are increased.

NFR2. performance of account login.

NFR3. Capacity of the application for adding new users.

NFR4. Adding any new details of the existing user from time to time in a database (admin function).

NFR5. Security of the user details.

### 2)Homepage:

NFR6. performance of search engine.

NFR7. Homepage shall be shown immediately after logging out.

NFR8. Use the name which is displayed on the home screen.

NFR9. Price filter on the home page is not used that much in an online bookstore.

NFR10. the Total number of products present on the website.

### 3)user info & functions:

NFR11. Updating the language based on the user locations is not required.

NFR12. Security of the user details.

NFR13. Location changes shall be updated immediately in the user profile.

NFR14. contact should be updated immediately.

NFR15. User date of birth is not mandatory.

NFR16. Gender of the user is not mandatory.

### 4)Product and product details:

NFR17. Rating of the books shall be collected from the user, and they are displayed beside the name of the book.

NFR18. Reviews given by the user shall be located in the book description.

NFR19. Books shall be added to favorites by clicking on the save option.

NFR20. The books shall be wishlisted by tapping on the wishlist button.

NFR21. Similar products must be displayed down below.

### 5)Order details:

NFR22. Performance of check-ins.

NFR23. Usability of coupons.

NFR24. The growth of the application shall be done through marketing by providing zero delivery charges.

NFR25. Orders to be defined without obstacles.

NFR26. Similar products must be displayed down below.

## Change Management Plan

### How to train people to use the application:

The application that we built is simple to use. Any user can utilize it with only one touch tap, regardless of age. However, if the situation calls for it, we may give users a user guide to make their jobs easier.The user guide that explains how to use our program includes the following instructions:

Users may log in to the application with their data and pick a book from the home page to begin the registration process. Following that, a chapter from the book may be found underneath the product itself. After reading a sample of the book, if the customer decides to purchase the book, they may do so by clicking the "Add to Cart" button on the book's product page. After the user has added a book to the shopping cart, he may go to the checkout page, where he will be required to click the button labeled "Conform Orders". Following confirmation of the order, the customer is given a tracking number to monitor their charges.


### How to ensure that it integrates within their ecosystem/software:

Since our program is designed for Android devices, we will not invite Apple's Mac operating system users to test it out. However, we guarantee this program will function properly on any android mobile device. After installing the application's APK file, you may start using it. According to the positive feedback we've received from clients, our application's features all function just as intended.

### To ensure that discovered issues are resolved:

While building this application, we came across several faults and mistakes; however, most of them are function-based. The problems with the functions were resolved through further research into the technology. However, for anybody to be able to carry out our project, they will need to install the identical versions that we used.

## Traceability links

During the process of developing the application, several artifacts were created, and this section's goal was to guide those artifacts. In addition, we will divide the requirements into functional and non-functional categories before aligning them with the objects. Listed below are links that will take you to each individual artifact for the application.

## usecase Diagram 
 
| Artifact ID | Artifact Name | Requirement ID |
| :-------------: | :----------: | :----------: |
|    Id1     | Login    |     FR01   |
|    Id2     | Add To Cart    |     FR23     |
|    Id3     | Remove Items   |     FR17    |

## Activity Diagram

| Artifact ID | Artifact Name | Requirement ID |
| :-------------: | :----------: | :----------: |
|    Id4     | Sign Up    |     FR06    |
|    Id5     |  Payment Details   |     FR21     |
|    Id6     | Order Status   |     FR30    |

## Class Diagram

| Artifact Name   | Requirement ID |
| :----------:    | :----------: |
| Class User      |     FR01-FR06    |
| Class Location  |     FR16     |
| Class Books      |     FR08,FR11,FR20,FR24     |
| Class Admin      |     FR25,FR26     |
| Class Cart      |     FR23,FR10   |
| Class Cart Items      |     FR17  |
| Class Orders      |     FR19,FR20,FR21,FR29   |
| Class Order Items      |     FR28     |
