<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Punto2.aspx.cs" Inherits="examenFebrero.Punto2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="background-color:#ccc">
        <div>
            <h2>MODIFICACION Y ELIMINACION DE</h2>
        </div>
        <div>
            <h5>ELIJA LO QUE DESEA MODIFICAR:</h5>
            <asp:DropDownList ID="DropDownList1" 
                runat="server" 
                DataSourceID="SqlDataSource1" 
                DataTextField="descripcion" 
                DataValueField="id" 
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" 
                DeleteCommand="DELETE FROM [Preguntas] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [Preguntas] ([descripcion]) VALUES (@descripcion)" 
                SelectCommand="SELECT * FROM [Preguntas]" 
                UpdateCommand="UPDATE [Preguntas] SET [descripcion] = @descripcion WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />

        </div>
        <div>
            <h5>CAMPO PARA MODIFICAR</h5>
            <asp:TextBox ID="TextBox1" 
                runat="server">
            </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe completar este campo" ForeColor="#FF0066"></asp:RequiredFieldValidator>
            <br />
            <br />
        </div>
        <div>
            <H5>ACCIONES A REALIZAR</H5>
            <asp:Button ID="eliminar" runat="server" Text="ELIMINAR" OnClick="eliminar_Click" /> &nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Button ID="modificar" runat="server" Text="MODIFICAR" OnClick="modificar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <h5>ESTADO DE LA ELIMINACION/MODIFICACION:<asp:Label ID="labelEstado" runat="server" Text=""></asp:Label> </h5>
            <p>&nbsp;</p>
            <br />

            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <br />
        </div>
        <div>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" 
                SelectCommand="SELECT * FROM [Preguntas]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
