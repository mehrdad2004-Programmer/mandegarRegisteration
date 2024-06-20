class MandegarValidation{
    /*
    *
    * this modules validates form input, checks for special chars, numbers, english letters and etc, to prevent xss attack or fake data
    * this is a general module that can be used to create system applications
    * created by MANDEGAR COMPUTER SCS - MEHRDAD KALATEH ARABI - 27 KHORDAD 1403
    *
    * */
    constructor() {
        this.inputValidation = {
            "englishLetter" : [

                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',

                'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',

                'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',

                'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',

                'W', 'X', 'Y', 'Z'

            ],
            "numbers" : [
                '0', '2', '3', '4', '5', '6', '7', '8', '9'
            ],
            "specialChar" : [
                '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', ',', '.', '/', ' '
            ]
        }

        this.fileValidation = {
            "fileExtension" : ['jpg', 'jpeg', 'png'],
            "fileSize" : 4000000,
        }
    }

    validateNumeral(val){
        //method to validate numeral input
        try{
            if(isNaN(val.trim())){
                return false;
            }
            return true;
        }catch (e){
            console.log(`Occurred An Error : \n ${e.message}`);
            return false;
        }

    }

    validateText(val){
        //check that there is no any english letter in the input fields
        try{
            for(let i in val.trim()){
                for(let j in this.inputValidation.numbers){
                    if(val[i].includes(this.inputValidation.numbers[j])){
                        console.log("numbers are not allowed")
                        return false;
                    }
                }

                for(let k in this.inputValidation.englishLetter){
                    if(val[i].includes(this.inputValidation.englishLetter[k])){
                        console.log("english letters are not allowed");
                        return false;
                    }
                }

                for(let h in this.inputValidation.specialChar){
                    if(val[i].includes(this.inputValidation.specialChar[h])){
                        console.log("special chars are not allowed")
                        return false;
                    }
                }
            }
            return true;
        }catch (e){
            console.log(`Occurred An Error : \n${e.message}`);
            return false;
        }

    }

    validateLen(val, len){
        try{
            if(val.trim().length < len){
                return false;
            }
            return true;
        }catch (e){
            console.log(`Occurred An Error : \n${e.message}`);
        }

    }

    validateFileExtension(fileName){
        try{
            for(let i in this.fileValidation.fileExtension){
                console.log(fileName.trim().split('.').pop())
                if(fileName.trim().toLowerCase().split('.').pop() === this.fileValidation.fileExtension[i]){
                    return true;
                }
            }
            return false;
        }catch (e){
            console.log(`Occurred An Error : \n${e.message}`);
            return false;
        }
    }

    validateFileSize(size){
        if(size <= this.fileValidation.fileSize){
            return true;
        }
        return false;
    }

}