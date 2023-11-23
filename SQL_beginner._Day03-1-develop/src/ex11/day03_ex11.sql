
 update menu set
    price = (select price from menu where pizza_name = 'greek pizza') - (select price from menu where pizza_name = 'greek pizza') * 0.1
    where  pizza_name = 'greek pizza';