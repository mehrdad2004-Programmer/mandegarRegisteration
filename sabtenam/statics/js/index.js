let validate = new MandegarValidation();

let inputTypes = {
    "textbase" : document.querySelectorAll(".textbase"),
    "numericbase" : document.querySelectorAll(".numericbase"),
    "filebase" : document.querySelectorAll(".filebase")
}

let elements = {
    "form" : document.querySelector('form'),
    "err" : document.querySelectorAll(".err"),
    "submitBtn" : document.querySelector('.submit'),
    "submitBtnStatus" : true,
}


elements.submitBtn.setAttribute('disabled', 'true');

elements.err.forEach(item => {
    item.style.display = 'none';
})

let eventListeners = ['change', 'keypress', 'keyup'];



elements.form.addEventListener('input', (e)=>{
    eventListeners.forEach(listener =>{
        inputTypes.textbase.forEach(textInput =>{
            //validating textbase inputs
            textInput.addEventListener(listener, (e)=>{
                if(!(validate.validateText(e.target.value))){
                    e.target.value = null;
                    elements.submitBtnStatus = false;
                }
            })
        })

        inputTypes.numericbase.forEach(numericInput => {
            numericInput.addEventListener(listener, (e)=>{
                if(!(validate.validateNumeral(e.target.value))){
                    e.target.value = null;
                    elements.submitBtnStatus = false;
                }

                if(!(validate.validateLen(e.target.value, e.target.getAttribute('maxlength')))){
                    e.target.nextElementSibling.style.display = 'block'
                    elements.submitBtnStatus = false;
                }else{
                    e.target.nextElementSibling.style.display = 'none';
                    elements.submitBtnStatus = true;
                }

            })
        })

        inputTypes.filebase.forEach(fileInput =>{
            fileInput.addEventListener(listener, (e)=>{
                if(!(validate.validateFileExtension(e.target.value))){
                    e.target.value = null;
                    elements.submitBtnStatus = false;
                }
            })
        })
    })


})

