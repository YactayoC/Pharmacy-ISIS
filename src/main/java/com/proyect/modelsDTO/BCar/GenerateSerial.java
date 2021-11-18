package com.proyect.modelsDTO.BCar;

public class GenerateSerial {
    String num;
    int date;
    public String SeriralNum(int date){
        this.date = date + 1;
        if ((this.date>=10000000)&&(this.date<100000000)){
            num = "" + this.date;
        }
        if ((this.date>=1000000)&&(this.date<10000000)) {
            num = "0" + this.date;
        }
        if ((this.date>=100000)&&(this.date<1000000)){
            num = "00" + this.date;
        }
        if ((this.date>=10000)&&(this.date<100000)){
            num = "000" + this.date;
        }
        if ((this.date>=1000)&&(this.date<10000)){
            num = "0000" + this.date;
        }
        if ((this.date>=100)&&(this.date<1000)){
            num = "00000" + this.date;
        }
        if ((this.date>10)&&(this.date<100)){
            num = "000000" + this.date;
        }
        if (this.date==10){
            num = "000000" + this.date;
        }if (this.date<10){
            num = "0000000" + this.date;
        }
        return this.num;
    }
}
