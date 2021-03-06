window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);

    const TaxDomValue = (inputValue / 10);

    const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = Math.floor(inputValue - TaxDomValue);
  });
});
