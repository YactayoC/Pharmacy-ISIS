package com.proyect.servlets.UEmployee;

import com.proyect.modelsDAO.General.ReceiptDAO;
import com.proyect.modelsDAO.OProduct.ProductDAO;
import com.proyect.modelsDAO.OProduct.ReceiptDetailDAO;
import com.proyect.modelsDTO.BCar.*;
import com.proyect.modelsDTO.OProduct.Product;
import com.proyect.modelsDTO.UEemployee.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SAOffline", value = "/SAOffline")
public class SAOffline extends HttpServlet {

    List<Product> products = new ArrayList<>();
    List<Car> listCar = new ArrayList<>();
    List<Receipt> receR = new ArrayList<>();
    List<ReceiptDetail> receRD = new ArrayList<>();
    Product product = new Product();
    ProductDAO pdao = new ProductDAO();
    MetSale metsale = new MetSale();
    MetPay metpay = new MetPay();
    Employee employee = new Employee();
    Receipt receipt = new Receipt();
    ReceiptDAO sdao = new ReceiptDAO();
    ReceiptDetailDAO rddao= new ReceiptDetailDAO();
    String SerialNum;
    int item;
    int Cant = 1;
    boolean button=false;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "search" -> {
                String text = request.getParameter("searchOffline");
                products = pdao.search(text);
                request.setAttribute("productsOffline", products);
                request.getRequestDispatcher("/views/admin/offline-sale.jsp").forward(request, response);
            }
            case"DeleteP" -> {
                int idProduct = Integer.parseInt(request.getParameter("idProduct"));
                for (int i=0; i<listCar.size(); i++){
                    if (listCar.get(i).getIdProducts()==idProduct){
                        listCar.remove(i);
                    }
                }
                request.setAttribute("car",listCar);
                request.getRequestDispatcher("SAOffline?action=finalPayment").forward(request, response);
            }
            case"DeleteAll" -> {
                for (int e=0; e<=25; e++){
                    for (int i=0; i<listCar.size(); i++){
                        if (listCar.get(i).getIdProducts()==e){
                            listCar.remove(i);
                        }
                    }
                }
                request.setAttribute("car",listCar);
                request.getRequestDispatcher("SAOffline?action=listRece").forward(request, response);
            }
            case"listRece" ->{
                //List Receipt
                receR = sdao.listReipt();
                button=false;
                request.setAttribute("receR",receR);
                request.getRequestDispatcher("/views/admin/saleOffline.jsp").forward(request, response);
            }
            case"listDetailRece" ->{
                //List ReceiptDetail
                int idReceit = Integer.parseInt(request.getParameter("idReceit"));
                receRD = sdao.listDetail(idReceit);
                request.setAttribute("receRD", receRD);
                request.getRequestDispatcher("/views/admin/modalDetail.jsp").forward(request, response);
            }
            case "addProduct" -> {
                int position = 0;
                Cant = 1;
                int idProduct = Integer.parseInt(request.getParameter("idProduct"));
                String url = String.format(request.getParameter("url"));
                product = pdao.byId(idProduct);
                if(listCar.size() > 0) {
                    for (int i = 0; i < listCar.size(); i++) {
                        if (idProduct == listCar.get(i).getIdProducts()) {
                            position = i;
                        }
                    }
                    if (idProduct == listCar.get(position).getIdProducts()) {
                        Cant = listCar.get(position).getCant() + Cant;
                        button=true;
                        double SubTotal = listCar.get(position).getPrices() * Cant;
                        listCar.get(position).setCant(Cant);
                        listCar.get(position).setSubTotal(SubTotal);
                        request.setAttribute("car",listCar);
                        request.getRequestDispatcher("SAOffline?action=finalPayment").forward(request, response);
                    }else{
                        item = item + 1;
                        Car sale = new Car();
                        sale.setItem(item);
                        sale.setUrlPhotos(url);
                        sale.setNamePP(product.getNameP());
                        sale.setPrices(product.getPrice());
                        sale.setCant(Cant);
                        sale.setSubTotal(Cant*product.getPrice());
                        sale.setIdProducts(product.getIdProduct());
                        listCar.add(sale);
                        request.setAttribute("car",listCar);
                        request.getRequestDispatcher("SAOffline?action=finalPayment").forward(request, response);
                    }
                }else{
                    item = item + 1;
                    Car sale = new Car();
                    sale.setItem(item);
                    sale.setUrlPhotos(url);
                    sale.setNamePP(product.getNameP());
                    sale.setPrices(product.getPrice());
                    sale.setCant(Cant);
                    sale.setSubTotal(Cant*product.getPrice());
                    sale.setIdProducts(product.getIdProduct());
                    listCar.add(sale);
                    request.setAttribute("car",listCar);
                    request.getRequestDispatcher("SAOffline?action=finalPayment").forward(request, response);
                }
            }
            case "recietp" ->{
                button=false;
                request.getRequestDispatcher("SAOffline?action=Pay").forward(request, response);
            }
            case "Pay" ->{
                if (button==true){
                    SerialNum = sdao.GenerateSerial();
                    //Generar SerialN
                    Double finalPayment = 0.0;
                    for (int i = 0; i < listCar.size(); i++) {
                        finalPayment = finalPayment + listCar.get(i).getSubTotal();
                    }
                    request.setAttribute("finalPayment", finalPayment);
                    if (SerialNum==null){
                        SerialNum="00000001";
                        request.setAttribute("SerialN",SerialNum);
                    }else{
                        int increment = Integer.parseInt(SerialNum);
                        GenerateSerial serie = new GenerateSerial();
                        SerialNum = serie.SeriralNum(increment);
                        request.setAttribute("SerialN",SerialNum);
                    }
                    button=false;
                    request.setAttribute("car",listCar);
                    request.getRequestDispatcher("/views/admin/receitpP.jsp").forward(request, response);
                }if(button==false) {
                    request.getRequestDispatcher("SAOffline?action=list").forward(request, response);
                }
            }
            case "finalPayment" -> {
                //SubTotal
                Double finalPayment=0.0;
                for(int i=0; i<listCar.size(); i++){
                    finalPayment= finalPayment+listCar.get(i).getSubTotal();
                }
                //GenerateSerieN
                SerialNum = sdao.GenerateSerial();
                if (SerialNum==null){
                    SerialNum="00000001";
                    request.setAttribute("SerialN",SerialNum);
                } else{
                    int increment = Integer.parseInt(SerialNum);
                    GenerateSerial serie = new GenerateSerial();
                    SerialNum = serie.SeriralNum(increment);
                    request.setAttribute("SerialN",SerialNum);
                }
                button=true;
                request.setAttribute("finalPayment",finalPayment);
                request.getRequestDispatcher("/views/admin/offline-sale.jsp").forward(request, response);
            }
            case "SafeReceipt" ->{
                //SafeReceipt
                //int idMetS = 1;
                //int idMetP =1;
                //int idEmplo = 0;
                //employee.setIdEmployee(idEmplo);
                //metpay.setIdMetPay(idMetP);
                //metsale.setIdMetSale(idMetS);
                receipt.setSerialN(SerialNum);
                //receipt.setDateP("2021-11-10");
                //receipt.setPaySt("0");
                receipt.setEmployee(employee);
                receipt.setMetPay(metpay);
                receipt.setMetSale(metsale);
                sdao.save(receipt);
                //SafeDetallReceipt
                int receiptId = Integer.parseInt(sdao.ReceiptId());
                for (int i=0; i< listCar.size(); i++){
                    ReceiptDetail receiptD = new ReceiptDetail();
                    product.setIdProduct(listCar.get(i).getIdProducts());
                    receipt.setIdReceipt(receiptId);
                    receiptD.setPrice(listCar.get(i).getPrices());
                    receiptD.setQuantity(listCar.get(i).getCant());
                    receiptD.setProduct(product);
                    receiptD.setReceipt(receipt);
                    rddao.saveRD(receiptD);
                }
                request.getRequestDispatcher("SAOffline?action=DeleteAll").forward(request, response);
            }
            default -> this.list(request, response);
        }
    }

    public void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        products = pdao.list();
        request.getSession().setAttribute("productsOffline", products);
        request.getRequestDispatcher("/views/admin/offline-sale.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}