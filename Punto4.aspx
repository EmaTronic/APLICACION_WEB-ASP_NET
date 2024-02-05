<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Punto4.aspx.cs" Inherits="examenFebrero.Punto4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:#ccc">
       <h5>GRILLA CON EL TOTAL DE LOS RESULTADOS</h5>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="idPregunta" HeaderText="idPregunta" SortExpression="idPregunta" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" ReadOnly="True" />
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
       </asp:GridView>

        <asp:SqlDataSource 
            ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT DISTINCT E.idPregunta, P.descripcion, COUNT(E.id) AS Cantidad, SUM(E.valor) AS Total
FROM Encuestas E
INNER JOIN Preguntas P ON E.idPregunta = P.id
GROUP BY E.idPregunta, P.descripcion"></asp:SqlDataSource>

    </div>
</asp:Content>
