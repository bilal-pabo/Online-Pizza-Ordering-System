function addToCart (pid, pname, price)
{
    let cart = localStorage.getItem("cart");
    if (cart == null)
    {
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1};
        products.push(product);

        localStorage.setItem("cart", JSON.stringify(products));
        console.log("First added");
    }
    else
    {
        let pcart = JSON.parse(cart);
        let old = pcart.find((item) => item.productId == pid)
        if (old)
        {
            old.productQuantity = old.productQuantity + 1;
            pcart.map((item) =>
            {
                if (item.productId == old.productId)
                {
                    item.productQuantity = old.productQuantity;
                }
                localStorage.setItem("cart", JSON.stringify(pcart))
            })
            console.log("Quantity Increased");
        }
        else
        {
            let product = {productId: pid, productName: pname, productQuantity: quantity};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart))
            console.log("Another added");
        }
    }
}

function updatCart()
{
    let cartString = localStorage.setItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {
        console.log("Empty cart!")
        $(".cart-items").html("0");
        $(".cart-body").html("<h3>Cart is empty</h3>")
        $(".checkout").addClass('disabled');
    }
    else
    {
        console.log(cart);
        $(".cart-items").html('$(cart.length)');
    }
}

$(document).ready (function()
{
    updatCart()
}
)