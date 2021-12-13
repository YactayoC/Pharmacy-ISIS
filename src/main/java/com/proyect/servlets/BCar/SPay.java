package com.proyect.servlets.BCar;

import com.proyect.modelsDAO.General.ReceiptDAO;
import com.proyect.modelsDAO.OProduct.ReceiptDetailDAO;
import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDTO.BCar.*;
import com.proyect.modelsDTO.OProduct.Product;
import com.proyect.modelsDTO.UClient.Client;
import com.proyect.modelsDTO.UClient.District;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SPay", value = "/SPay")
public class SPay extends HttpServlet {
    List<Car> listCar = new ArrayList<>();
    District district = new District();
    Client client = new Client();
    ClientDAO cdao = new ClientDAO();
    ReceiptDAO rdao = new ReceiptDAO();
    ReceiptDetailDAO drdao = new ReceiptDetailDAO();
    Receipt receipt = new Receipt();
    Product product = new Product();
    ReceiptDetail detaill = new ReceiptDetail();
    String SerialNum;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("validats") == null || (boolean) session.getAttribute("validats") == false) {
            request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
            return;
        }
        int idClientHome = (Integer) session.getAttribute("idClientHome");
        registerAddress(request, response, idClientHome);
    }

    private void registerAddress(HttpServletRequest request, HttpServletResponse response, int idClient) throws IOException, ServletException {
        HttpSession session;
        ListCard listCard;
        String address = request.getParameter("address");
        int idDistrict = Integer.parseInt(request.getParameter("district"));

        client = cdao.byId(idClient);

        SerialNum = rdao.GenerateSerial();
            client.setIdClient(idClient);
            client.setAddress(address);
            client.setIdDistrict(idDistrict);
            client.setDistrict(district);
            cdao.updateAddress(client);

            request.setAttribute("client", client);
            request.setAttribute("address", address);
            request.setAttribute("client", client);

            DecimalFormat df = new DecimalFormat("0.000");

            session = request.getSession();
            listCard = (ListCard) session.getAttribute("card");
            double igv = Double.parseDouble(df.format(listCard.getTotal()*(0.18)));
            double totalP = Double.parseDouble(df.format(listCard.getTotal()*(1.18)));
            request.setAttribute("cardInfo", listCard.getItems());
            request.setAttribute("total", listCard.getTotal());
            request.setAttribute("igv",igv);
            request.setAttribute("totalP",totalP);
            listCard.getItems();

        //geneated SERIAL NUMBER
        if (SerialNum==null){
            SerialNum="10000001";
            request.setAttribute("SerialN",SerialNum);
        }else{
            int increment = Integer.parseInt(SerialNum);
            GenerateSerial serie = new GenerateSerial();
            SerialNum = serie.SeriralNum(increment);
            request.setAttribute("SerialN",SerialNum);
        }

            receipt.setSerialN(SerialNum);
            client.setIdClient(idClient);
            receipt.setClient(client);
            rdao.savev(receipt);

            receipt = rdao.getDate(idClient);
            String date = receipt.getDateP();
            int idReceipt = receipt.getIdReceipt();
            request.setAttribute("receipt", idReceipt);
            request.setAttribute("date", date);
/*
            receipt = rdao.getNames(idClient);
            String nameEmployee = receipt.getEmployee().getName();
            String surnameEmployee = receipt.getEmployee().getSurname();
            request.setAttribute("namesEmployee", nameEmployee + " " + surnameEmployee);
*/
            receipt.setIdReceipt(drdao.getLast());
            int receiptId = Integer.parseInt(rdao.ReceiptId());

        ListCard list = (ListCard) session.getAttribute("card");
        for (ItemCard items : list.getItems()){
            ReceiptDetail receiptD = new ReceiptDetail();
            product.setIdProduct(items.getProduct().getIdProduct());
            receipt.setIdReceipt(receiptId);
            receiptD.setPrice(items.getProduct().getPrice());
            receiptD.setQuantity(items.getQuantity2());
            receiptD.setProduct(product);
            receiptD.setReceipt(receipt);
            drdao.saveRD(receiptD);
            System.out.println("item" + items.getProduct());
        }
        request.getRequestDispatcher("/views/user/receipt.jsp").forward(request, response);
        listCard.getstockTotal();
        listCard.getItems().clear();
            }


    }