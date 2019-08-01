document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary
      //----------------------categories--------------------------
      let bagsQuantity = Number(document.querySelector("#bags").value);
      let category="";
      document.querySelectorAll(".ch").forEach(function (checkbox) {
        if(checkbox.checked) {
          let categoryName = checkbox.nextElementSibling.nextElementSibling.innerHTML;
          category += "- " + categoryName + "<br>"
        }
      })
      if(bagsQuantity === 1){
        document.querySelector(".icon-bag").nextElementSibling.innerHTML = bagsQuantity+" worek z:<br>" +category;
      }
      else{
        document.querySelector(".icon-bag").nextElementSibling.innerHTML = bagsQuantity+" worki z:<br>" +category;
      }

      //--------------------institution------------------
      let radios = document.querySelectorAll("input[type=radio]")
      radios.forEach(function (r) {
        if(r.checked){
          document.querySelector(".icon-hand").nextElementSibling.innerText =
              "Dla: " + r.nextElementSibling.nextElementSibling.firstElementChild.innerText;
          console.log(r.nextElementSibling.nextElementSibling.firstElementChild)
        }
      })

      //------------------address------------------------------
      let inputAdress = document.querySelectorAll("#inputAddress input");
      address.innerHTML = "";
      inputAdress.forEach(function (i) {
        let li = document.createElement("li");
        li.innerText = i.value;
        address.append(li)

      })

      //----------------------pickUp--------------------
      let pickUpDate = document.getElementById("pickUpDT");
      let pickUpInputs = document.querySelectorAll("#pickUp input");
      pickUpDate.innerHTML = ""
      pickUpInputs.forEach(function (i) {
        let li = document.createElement("li");
        li.innerText = i.value;
        pickUpDate.append(li)

      })
      let nextLi = document.createElement("li")
      nextLi.innerText = document.querySelector("textarea").value;
      pickUpDate.append(nextLi);





    }

  }
// <form:checkboxes path="categories" itemLabel="name" items="${categories}"/>
//       <form:select path="institution" itemLabel="name" items="${institutions}"/>
//       <form:input path="zipCode"/>
//       <form:input path="street"/>
//       <form:input path="city"/>
//       <form:input path="quantity"/>
//       <form:textarea path="pickUpComment"/>
//       <form:input type="date" path="pickUpDate"/>
//       <form:input type="time" path="pickUpTime"/>
//       <script
//   src="https://code.jquery.com/jquery-3.4.1.min.js"
//   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
//   crossorigin="anonymous"></script>
//       <script type="text/javascript">

  //     $("#zipCode").change(function () {
  //       console.log(this);
  //       console.log($(this).val());
  //       $("#zipCodeSummary").html($(this).val());
  //     });
  // $("#quantity").change(function () {
  //   console.log(this);
  //   console.log($(this).val());
  //   $("#quantitySummary").html($(this).val());
  // });
  // $('input[name=categories]').change(function () {
  //   $('#categoriesSummary').html('');


  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }
});
