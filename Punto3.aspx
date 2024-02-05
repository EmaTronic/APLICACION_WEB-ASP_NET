<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Punto3.aspx.cs" Inherits="examenFebrero.Punto3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="background-color:#FFFACD">
            <div>
                <h5>CARGA DE DEPORTISTAS </h5>
                <div>
                    <h5> --- CAMPOS PARA CARGAR DESDE LA SELECCION DE UNA GRILLA ---</h5>


                     <asp:DropDownList ID="DropDownList1" 
                         runat="server" AutoPostBack="True" 
                         DataSourceID="SqlDataSource1" 
                         DataTextField="descripcion" 
                         DataValueField="id">
                     </asp:DropDownList>

                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe completar este campo" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar un nro del 1 al 1000" ForeColor="Lime" MaximumValue="10000" MinimumValue="1"></asp:RangeValidator>
                    <br />

           

                        <br />

                        <div>

                            <asp:Button ID="Button1" runat="server" Text="AGREGAR" OnClick="Button1_Click" />&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="MODIFICAR" OnClick="Button2_Click" />
        &nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="ELIMINAR" OnClick="Button3_Click" />
                        &nbsp;
                            <br />
                            <br />
                            <br />
                            <h5>--- ESTADO DE LA OPERACION: <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label> ---</h5>
                        </div>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Preguntas]"></asp:SqlDataSource>

                    <br />

                </div>
            </div>
            <div>
                 <h5> --- GRILLA DE DEPORTISTAS Y DEPORTES ---</h5>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" />
                        <asp:BoundField DataField="idPregunta" HeaderText="idPregunta" SortExpression="idPregunta" />
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

                 <br />

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" 
                    SelectCommand="SELECT * FROM [Encuestas]" 
                    DeleteCommand="DELETE FROM [Encuestas] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [Encuestas] ([valor], [idPregunta]) VALUES (@valor, @idPregunta)" 
                    UpdateCommand="UPDATE [Encuestas] SET [valor] = @valor, [idPregunta] = @idPregunta WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="valor" Type="Int32" />
                        <asp:Parameter Name="idPregunta" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="valor" Type="Int32" />
                        <asp:Parameter Name="idPregunta" Type="Int32" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                 </asp:SqlDataSource>

            </div>
            <div>
                <h5>LA CANTIDAD DE FILAS DE LA GRILLA:
                    <asp:Label ID="LabelCantidadFilas" runat="server" Text="Label"></asp:Label></h5>
            </div>
         </div>
   
</asp:Content>
