window.addEventListener("load",()=>{
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {

    const addTaxValue = document.getElementById("add-tax-price");
    addTaxValue.innerHTML = Math.floor(priceInput.value * 0.1);
     
    const salesProfit = document.getElementById("profit")
    salesProfit.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ));

  })
})
