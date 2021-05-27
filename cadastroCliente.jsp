<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cliente</title>

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
            tittle{
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="logo">
            <h1>Cadastro Cliente</h1>
        </div>

        <div style="color: blue">${mensagemSucesso}</div>
        <div style="color: red">${mensagemErro}</div>

        <c:if test="${empty clienteEditando}">
            <fieldset>
                <legend>
                    Inclusão de cliente
                </legend>
                <form action="${pageContext.request.contextPath}/clientecontroller" method="post">
                    Nome: <input type="text" name="nomeCliente" placeholder="Nome do cliente"/><br><br><br>
                    Cpf: <input type="text" name="cpfCliente" maxlength="11" placeholder="Cpf do cleinte"/><br><br><br>
                    Telefone:<input type="text" name="telefoneCliente" maxlength="11" placeholder="Telefone do cliente"/><br><br><br>
                    <input type="submit" value="Incluir" name="incluir"/>
                </form>
            </fieldset>

        </c:if>
        <c:if test="${not empty clienteEditando}">
            <fieldset>
                <legend>
                    Inclusão de cliente
                </legend>
                <form action="${pageContext.request.contextPath}/clientecontroller" method="post">
                    <input type="hidden" name="id" value="${clienteEditando.id}"/>
                    Nome: <input type="text" name="nomeCliente" placeholder="Nome do cliente" value="${clienteEditando.nome}"/><br><br><br>
                    Cpf: <input type="text" name="cpfCliente" maxlength="11" placeholder="Cpf do cleinte"value="${clienteEditando.cpf}"/><br><br><br>
                    Telefone: <input type="text" name="telefoneCliente" maxlength="11" placeholder="Telefone do cliente"value="${clienteEditando.telefone}"/><br><br><br>
                    <input type="submit" value="Alterar" name="alterar"/>
                </form>
            </fieldset>

        </c:if>

        <table style="border: 1px solid black; border-collapse: collapse; margin-top: 20px; width: 98%" border=" 1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Cpf</th>
                    <th>Telefone</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cliente" items="${clientes}">
                    <tr>
                        <td>${cliente.id}</td>
                        <td>${cliente.nome}</td>
                        <td>${cliente.cpf}</td>
                        <td>${cliente.telefone}</td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/clientecontroller" style="float: left">
                                <input type="hidden" name="idCliente" value="${cliente.id}"/>
                                <input type="submit" value="Excluir" name="excluir"/>
                            </form>
                            <form method="post" action="${pageContext.request.contextPath}/clientecontroller" style="float: left; margin-left: 10px">
                                <input type="hidden" name="idCliente" value="${cliente.id}"/>
                                <input type="submit" value="Editar" name="editar"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
        <hr>
        <div class="link">
            <a href="/hotdog/funcionario.html">Voltar</a>
        </div>
    </body>
</html>
