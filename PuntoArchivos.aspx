<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PuntoArchivos.aspx.cs" Inherits="examenFebrero.PuntoArchivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="background-color:#ccc">

            <div>
                <div>
                  <h4> Usuario: <asp:Label ID="labelUsuario" runat="server" Text=""></asp:Label></h4>
                    <br />
                </div>

                <div id="cargaDeArchivos">

                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:FileUpload ID="FileUpload1" runat="server" />

                    <br />

                    <br />

                </div>

                <div id="estadoDeCarga">
                    <h4>Estado de carga: <asp:Label ID="LabelCarga" runat="server" Text=""></asp:Label></h4>
                </div>

                <div id="grillaArchivos">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                     <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="Descargar" HeaderText="Descargar" ShowHeader="True" Text="Botón" />
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
                </div>

                <div id="botonEnvio">
                     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="CARGAR" />
                </div>

            </div>
         </div>

</asp:Content>
