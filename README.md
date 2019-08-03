# QingGuo Public Welfare Mall

## Introduction
With the increase of the business volume of QingGuo public welfare organization, the manual processing of the business has become mechanical and cumbersome. At the same time, the efficiency is very low. This problem can be solved by the establishment of an online mall to achieve the electronic transaction processing.
Currently there are many frameworks in web development field, such as Python's Flask framework, Java's Structs, Spring and Hibernate frameworks, etc. Based on lightweight and easy to learn, this thesis uses the SSM frameworks (Spring, SpringMVC, MyBatis) which are very popular in Java Web development field. At the same time, considering that this project will be a long-term project and Java has high maintainability compared with Python and PHP, I choose to use Java as the main programming language. Besides, in order to improve the efficiency of maintenance personnel, Docker can be used to containerize this program.
QingGuo Public Welfare Mall differs from general e-mall in that its user roles include tourists, general users, and QingGuo mentors. That is to say, ordinary users who want to sell goods on this site must apply to be a mentor in a certain field. Only after official approval has passed can he release the product. In addition, for the commodities in the mall, each one contains a certain amount of charity points. After the transaction is over, the mentor can obtain not only a certain amount of money but also some charity credits by which tutor can enjoy a number of preferential policies. The main purpose is to carry forward Chinese traditional culture.


## Structure of Directories
```
.  
├── src  
│   ├── main  
│   │   ├── java  
│   │   │   └── org  
│   │   │       └── qingGuo  
│   │   │           ├── common  
│   │   │           ├── controller  
│   │   │           ├── dao  
│   │   │           ├── dto  
│   │   │           ├── model  
│   │   │           └── service  
│   │   │               └── impl  
│   │   ├── resources  
│   │   │   └── mybatis  
│   │   └── webapp  
│   │       ├── WEB-INF  
│   │       │   └── views  
│   │       │       ├── commodity  
│   │       │       ├── error  
│   │       │       ├── order  
│   │       │       ├── pay  
│   │       │       ├── publish  
│   │       │       └── user  
│   │       ├── css  
│   │       ├── fonts  
│   │       │   ├── bootstrap  
│   │       │   └── icomoon  
│   │       ├── images  
│   │       ├── js  
│   │       ├── sass  
│   │       └── video  
│   └── test  
│       └── java  
└── upload  
```

## System Architecture
<img src="https://github.com/Bit64L/BlogImage/raw/master/qingguo/qingguosysarchi.png">

## Main Modules
### Main Page
<img src="https://github.com/Bit64L/BlogImage/raw/master/qingguo/qingguo-main-page.png">

### Register Center
<img src="https://github.com/Bit64L/BlogImage/raw/master/qingguo/qingguo-regester-page.png">

### Personal Center
<img src="https://github.com/Bit64L/BlogImage/raw/master/qingguo/qingguo-profile-page.png">

### Shopping Cart
<img src="https://github.com/Bit64L/BlogImage/raw/master/qingguo/qingguo-shopping-cart.png">

### Wechat Pay
<img src="https://github.com/Bit64L/BlogImage/raw/master/qingguo/qingguo-wechat-pay.png">

### Commodities 
<img src="https://github.com/Bit64L/BlogImage/raw/master/qingguo/qingguo-goods.png">

