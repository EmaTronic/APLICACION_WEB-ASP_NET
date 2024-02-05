<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Punto1.aspx.cs" Inherits="examenFebrero.Punto1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="background-color:greenyellow">
     
        
            <div class="row justify-content-center mt-4 " style= "height:80px ; background-color:yellow; margin-bottom: 15px;">
                <div class="col-sm-3 container d-flex align-items-center" >
                    <h4 class="text-center">Carga de</h4>
                </div>
                <div class="col-sm-3 container d-flex align-items-center" >
                     <asp:TextBox  ID="TextBox1" 
                         runat="server">
                     </asp:TextBox>

                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                         runat="server" 
                         ControlToValidate="TextBox1" 
                         ErrorMessage="Debe completar el campo requerido" 
                         ForeColor="#FF0066">
                     </asp:RequiredFieldValidator>
                     <br />
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Preguntas]" DeleteCommand="DELETE FROM [Preguntas] WHERE [id] = @id" InsertCommand="INSERT INTO [Preguntas] ([descripcion]) VALUES (@descripcion)" UpdateCommand="UPDATE [Preguntas] SET [descripcion] = @descripcion WHERE [id] = @id">
                         <DeleteParameters>
                             <asp:Parameter Name="id" Type="Int32" />
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
           </div>
         </div>
        <div class="container-fluid">
            <div class="row justify-content-start" style="height:80px ; background-color:#808080; margin-bottom: 15px;" >
                 <div class="col-sm-6 container d-flex align-items-center" >
                     <br />
                           <h4>Estado de carga: <asp:Label 
                               ID="LabelMensaje" 
                               runat="server" 
                               Text=""></asp:Label></h4>
                  </div>

                       <br />
            
            
                 <div class="col-sm-3 container d-flex align-items-center m-4">
                            <asp:Button ID="Button1" 
                                runat="server" 
                                Text="Cargar" 
                                OnClick="Button1_Click" />
                 </div>
            </div>
       

                    <br /><br />
    
            <div class="row" style="background-color:#808080; margin-bottom: 15px;"> <h4> Lista de ..solo a los efectos de corroborar que la carga se realizó</h4>
                <div class="col-sm-12">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1">
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
            </div>
        
    </div>
</asp:Content>
