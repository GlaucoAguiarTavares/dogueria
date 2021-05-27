<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de funcionário</title>
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


        </style>
    </head>
    <body>
        <div style="color: blue">${mensagemSucesso}</div> 
        <div style="color: red">${mensagemErro}</div> 
        <div class="logo">
            <h1>Funcionários:</h1>
        </div>
        <c:if test="${empty funcionarioEditando}">  

            <fieldset>
                <legend>
                    Incluir funcionário:
                </legend>
                <form action="${pageContext.request.contextPath}/funcionariocontroller" method="post">
                    Nome do funcionário: <input type="text" name="nomeFuncionario" placeholder="Nome Funcionário"/><br><br><br>
                    Senha do funcionário: <input type="password" name="senhaFuncionario" placeholder="Senha Funcionário"/><br><br><br> 
                    Função do funcionário: <input type="text" name="loginFuncionario" placeholder="Função Funcionário"/><br><br><br>
                    <input type="submit" value="Incluir" name="incluir"/>
                </form>
            </fieldset>
        </c:if>
        <c:if test="${not empty funcionarioEditando}">
            <fieldset>
                <legend>
                    Alterar funcionário:
                </legend>
                <form action="${pageContext.request.contextPath}/funcionariocontroller" method="post">
                    <input type="hidden" name="idFuncionario" value="${funcionarioEditando.id}"/>
                    Nome do funcionário: <input type="text" name="nomeFuncionario" placeholder="Nome Funcionário" value="${funcionarioEditando.nome}"/><br><br><br>
                    Senha do funcionário: <input type="password" name="senhaFuncionario" placeholder="Senha Funcionário" value="${funcionarioEditando.senha}"/><br><br><br> 
                    Funçao do funcionário: <input type="text" name="loginFuncionario" placeholder="Função Funcionário"value="${funcionarioEditando.login}"/><br><br><br>
                    <input type="submit" value="Alterar" name="alterar"/>
                </form>
            </fieldset>
        </c:if>
        <table style="border: 1px solid black; border-collapse: collapse; margin-top: 20px; width: 98%;" border = 1>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome do Funcionário</th>
                    <th>Função</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="funcionario" items="${funcionarios}">
                    <tr>
                        <td>${funcionario.id}</td>
                        <td>${funcionario.nome}</td>
                        <td>${funcionario.login}</td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/funcionariocontroller" method="post" style="float: left; margin-left: 10px">
                                <input type="hidden" name="idFuncionario" value="${funcionario.id}"/>
                                <input type="submit" value="Excluir" name="excluir"/>
                            </form>
                            <form method="post" action="${pageContext.request.contextPath}/funcionariocontroller" method="post" style="float: left">
                                <input type="hidden" name="idFuncionario" value="${funcionario.id}"/>
                                <input type="submit" value="Editar" name="editar"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="link">
            <a  href=funcionario.html>Voltar</a>    
        </div>

    </body>
</html>
