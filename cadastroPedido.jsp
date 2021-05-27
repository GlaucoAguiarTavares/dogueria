<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar Pedido</title>
        <style type="text/css">
              body{
                background-color: blueviolet;
            }
            .logo{
                color: aquamarine;
                text-align: center;
                width: 100%;
            }

            fieldset{
                background-color: slateblue;
                border-radius: 5px;
                text-align: center;
                color: white;
            }

            input{
                background-color: aqua;
                border-radius: 5px; 
                padding: 8px;
            }

            th, td{
                color: white;
            }

            div.link{
                margin-top: 25px;
                float: right;
                width: 50%;


            }
            a{
                text-decoration: none;
                background-color: aqua;
                padding: 10px;
                border-radius: 60px;
            }
            
            .qtd{
                margin-left: 30px;
            }
            
            .vrp{
                margin-left: 19px;
            }
            
            .dtp{
                margin-left: 25px;
            }
            
            .np{
                margin-left: 19px;
            }
            

        </style>
    </head>
    <body>
        <h1 class="logo">Realizar Pedido</h1>
        <div style="color: aqua; text-align: center">${mensagemSucesso}</div>
        <div style="color: aqua; text-align: center">${mensagemErro}</div>

        <c:if test="${empty pedidoEditando}">
            <fieldset>
                <legend>
                    Incluir pedido
                </legend>
                <form action="${pageContext.request.contextPath}/pedidocontroller" method="post">
                    Nome Pedido: <input class="np" type="text" name="nome" placeholder="Nome do pedido"/><br><br><br>
                    Data Pedido: <input class="dtp" type="text" name="data" placeholder="Data do pedido"/><br><br><br>
                    Tipo pagamento: <input type="text" name="tppagamento" placeholder="Tipo de pagamento"/><br><br><br>
                    Valor Pedido: <input class="vrp" type="text" name="vrpedido" placeholder="Valor pedido"/><br><br><br>
                    Quantidade: <input class="qtd" type="number" name="qtdpedido" placeholder="Quantidade"/><br><br><br>
                    <input type="submit" value="incluir" name="incluir"/>
                </form>
            </fieldset>
        </c:if>
        <c:if test="${not empty pedidoEditando}">
            <fieldset>
                <legend>
                    Editar pedido
                </legend>
                <form action="${pageContext.request.contextPath}/pedidocontroller" method="post">
                    <input type="hidden" name="id" value="${pedidoEditando.id}"/>
                    Nome Pedido: <input type="text" name="nome" placeholder="Nome do pedido" value="${pedidoEditando.nome}"/><br><br><br>
                    Data Pedido: <input type="text" name="data" placeholder="Data do pedido"value="${pedidoEditando.data}"/><br><br><br>
                    Tipo pagamento: <input type="text" name="tppagamento" placeholder="Tipo de pagamento"value="${pedidoEditando.tppagamento}"/><br><br><br>
                    Valor Pedido: <input type="text" name="vrpedido" placeholder="Valor pedido"value="${pedidoEditando.vrpedido}"/><br><br><br>
                    Quantidade: <input type="number" name="qtdpedido" placeholder="Quantidade"value="${pedidoEditando.qtdpedido}"/><br><br><br>
                    <input type="submit" value="Alterar" name="alterar"/>
                </form>
            </fieldset>
        </c:if>
        <table style="border: 1px solid black; border-collapse: collapse; margin-top: 20px; width: 98%" border = "1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nome Pedido</th>
                    <th>Data Pedido</th>
                    <th>Tipo Pagamento</th>
                    <th>Valor Pedido</th>
                    <th>Quantidade</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="pedido" items="${pedidos}">
                    <tr>
                        <td>${pedido.id}</td>
                        <td>${pedido.nome}</td>
                        <td>${pedido.data}</td>
                        <td>${pedido.tppagamento}</td>
                        <td>${pedido.vrpedido}</td>
                        <td>${pedido.qtdpedido}</td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/pedidocontroller" style="float: left; margin-left: 10px">
                                <input type="hidden" name="id" value="${pedido.id}"/>
                                <input type="submit" value="Excluir" name="excluir"/>
                                <form method="post" action="${pageContext.request.contextPath}/pedidocontroller" style="float: left; margin-left: 10px"/>
                                <input type="hidden" name="id" value="${pedido.id}"/>
                                <input type="submit" value="Editar" name="editar"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <hr>
        <div class="link">
            <a class="clcp" href="pedidosucesso.html">Concluir pedido</a><br><br><br>    
            <a href="${pageContext.request.contextPath}/cadastroUsuario.html">Voltar</a>
        </div>
    </body>
</html>