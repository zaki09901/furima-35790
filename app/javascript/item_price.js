window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    //入力した値の10%を計算する
    // その計算結果を販売手数料に表示できるようにinnerHTMLを使う
   // const priceInput2 = document.getElementById("add-tax-price");
   // const priceInput3 = document.getElementById("profit");
   const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue*0.1))


    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
    console.log(value_result)
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      console.log(profitNumber);


  })




});