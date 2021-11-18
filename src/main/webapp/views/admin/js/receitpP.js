(function (){
    let hora = function (){
        let f= new Date();
        dia= f.getDate(),
            mes= f.getMonth()+1,
            año= f.getFullYear();


        let pdia =document.getElementById('dia'),
            pmes =document.getElementById('mes'),
            paño =document.getElementById('año');

        pdia.textContent = dia;
        pmes.textContent = mes;
        paño.textContent = año;
        request.setAttribute("dia",pdia);
        request.setAttribute("mes",pmes);
        request.setAttribute("año",paño);
    };
    hora();
}())