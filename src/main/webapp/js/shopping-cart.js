/** 添加购物车，修改购物车图标数量 */
function addShoppingCart(id, goodsCount) {
    // window.location.href="commodityCatalogAddShoppingCart?uniqueName="+$("#uniqueName_"+uniqueName).val()+
    // "&" + "quantity="+$("#quantity_"+uniqueName).val();
    $.ajax({
        data:
            {
                "commodity.id": id,
                "goodsCount": goodsCount
            },
        type: "POST",
        dataType: 'json',
        url: "/qingguo/commodity/addShoppingCart",
        error: function (data) {
            alert("出错了！！:" + data);
        },
        success: function (data) {
            if (data.message != null && data.message != '')
                alert(data.message);
            $("#shoppingCartSize").html(data.shoppingCartTotalAmount);
        }
    });
}


/** 修改购物车单一商品数量，前端 */
function quantityChange(id,quantity){
    var x = Number($("#buyQuantity_"+id).val()) + Number(quantity);
    if(x==0) return;
    $("#buyQuantity_"+id).val(x);
    quantityChangeServer(id);//修改后台
}
/** 修改购物车单一商品数量,后台 */
function quantityChangeServer(id){
    var quantity = $("#buyQuantity_"+id).val();
    quantity = Number(quantity);
    if(isNaN(quantity) || quantity < 1){
        $("#buyQuantity_"+id).val(1);
        quantity = Number(1);
    }
    $.ajax({
            data :
                {
                    "id" : id,
                    "goodsCount" : quantity
                },
            type:"POST",
            dataType: 'json',
            url:"/qingguo/commodity/updateShoppingCartDetailCount",
            error:function(data){
                alert("出错了！！:"+data.size);
            },
            success:function(data){
                //alert("success:"+data);
                $("#shoppingCartSize").text(data.shoppingCartTotalAmount);
                $("#shopping_cart_total_money").text("￥" +data.shoppingCartTotalMoney);
                $("#goods_money_"+id).text("￥" +data.goodsMoney);
            }
        }
    )
}