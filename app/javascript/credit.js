window.addEventListener('load', () => {
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formIn = document.getElementById("charge-form");
    const formData = new FormData(formIn);

    const card = {
      number: formData.get("card-umber"),
      cvc: formData.get("card-cvc"),
      exp_month: formData.get("card-exp-month"),
      exp_year: formData.get("card-exp-year")
    };
  });
});