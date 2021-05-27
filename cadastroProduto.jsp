
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de produtos</title>
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
            
            .codp{
                margin-right:  40px;
            }

        </style>
    </head>
    <body>
        <div class="logo">
           <h1>Cadastrar produtos</h1> 
        </div>
        <div style="color: blue">${mensagemSucesso}</div>
        <div style="color: red">${mensagemErro}</div>
        
        <c:if test="${empty produtoEditando}">
        <fieldset>
            <legend>
                Inclusão de produtos:
            </legend>
            <form  action="${pageContext.request.contextPath}/produtocontroller" method="post">
                Nome:<input type="text" name="nome" placeholder="Nome do produto"/><br><br><br>
                Valor:<input type="text" name="valor" placeholder="Valor do produto"/><br><br><br>
                Cód produro:<input class="codp" type="text" name="validade" placeholder="Código do produro"/><br><br><br>
                <input type="submit" value="Incluir" name="incluir"/>
            </form>
        </fieldset>
        </c:if>
        
        <c:if test="${not empty produtoEditando}">
        <fieldset>
            <legend>
                Edição de produtos:
            </legend>
            <form  action="${pageContext.request.contextPath}/produtocontroller" method="post">
                <input type="hidden" name="idProduto" value="${produtoEditando.id}"/>
                Nome:<input type="text" name="nomeProduto" placeholder="Nome do produto"value="${produtoEditando.nome}"/><br><br><br>
                Valor:<input type="text" name="valorProduto" placeholder="Valor do produto"value="${produtoEditando.valor}"/><br><br><br>
                Cód produro:<input class="codp" type="text" name="validadeProduto" placeholder="Código do produro"value="${produtoEditando.validade}"/><br><br><br>
                <input type="submit" value="Alterar" name="alterar"/>
            </form>
        </fieldset>
        </c:if>
        
        <table style="border: 1px solid black; border-collapse: collapse; margin-top: 20px; width: 98%" border = "1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nome:</th>
                    <th>Valor</th>
                    <th>Código</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="produto" items="${produtos}"> 
                    <tr>
                        <td>${produto.id}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.valor}</td>
                        <td>${produto.validade}</td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/produtocontroller" style="float: left">
                                <input type="hidden" name="idProduto" value="${produto.id}"/>
                                <input type="submit" value="Excluir" name="excluir"/>
                            </form>
                            <form method="post" action="${pageContext.request.contextPath}/produtocontroller"style="float: left; margin-left: 10px">
                                <input type="hidden" name="idProduto" value="${produto.id}"/>
                                <input type="submit" value="Editar" name="editar"/>  
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="link">
        <a href="/hotdog/funcionario.html">Voltar</a>
        </div>
    </body>
</html>
