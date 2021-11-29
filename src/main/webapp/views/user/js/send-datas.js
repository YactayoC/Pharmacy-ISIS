function deleteP(idProduct) {
    axios({
        method: 'POST',
        url: "SCard?action=delete",
        data: "id=" + idProduct,
    }).then(
        swal({
            title: "Estas seguro de eliminar?",
            text: "El registro seleccionado se eliminara!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
                if (willDelete) {

                    swal("Registro eliminado!", {
                        icon: "success",
                    }).then((willDelete) => {
                        if (willDelete) {
                            location.reload();
                        }
                    });
                }
            }))
}

function btnAdd(id,stock) {
    if (stock <= 0) {

    }else{
        console.log(id)
        axios({
            method: 'POST',
            url: 'SCard',
            data: 'idProduct=' + id
        }).then(response => console.log(response))
            .catch(err => console.log(err));
    }
}

const totalProduct = document.querySelectorAll('.product__card')
const totalBtns = document.querySelectorAll('.add-to-cart')

totalProduct?.forEach((product, index) => {
    const id = product?.firstElementChild.textContent

    totalBtns[index]?.addEventListener('click', () => btnAdd(id))
})


