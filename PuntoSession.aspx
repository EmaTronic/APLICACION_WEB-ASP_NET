<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PuntoSession.aspx.cs" Inherits="examenFebrero.PuntoSession" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="background-color:#ccc">
          
                <div class="row">
                        <div class="col-xs-12">
                            <h2> FORMULARIO DE SESIÓN: </h2>
                        </div>
                </div>

                 <div>

                    <h4>USUARIO: <asp:Label ID="Label4" runat="server" Text=""></asp:Label><br /></h4>
                  
                </div>
                <div class="form-group">
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text="Username" 
                            CssClass="control-label col-sm-2">
                        </asp:Label>
                  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" 
                            ControlToValidate="TextBox1" 
                            ErrorMessage="Debe completar el usuario" 
                            ForeColor="#FF0066">
                        </asp:RequiredFieldValidator>

                    <div class="col-sm-10">    
                        <asp:TextBox ID="TextBox1" 
                            runat="server">
                        </asp:TextBox>
                    </div>
                    
                       
                    <br />
               </div>
               <div class="form-group">
                        <asp:Label ID="Label2" 
                            runat="server" 
                            Text="Reingrese el Username"
                            CssClass="control-label col-sm-2">
                        </asp:Label>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ControlToValidate="TextBox2" 
                            Display="Dynamic" 
                            ErrorMessage="Debe reingresar el usuario" 
                            ForeColor="#FF0066">
                        </asp:RequiredFieldValidator>

                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="TextBox2" ControlToValidate="TextBox1" 
                            ErrorMessage="Los usuarios no son iguales" 
                            ForeColor="#FF0066" 
                            SetFocusOnError="True" Display="Dynamic"></asp:CompareValidator>

                       

                   <div class="col-sm-10">
                         <asp:TextBox ID="TextBox2" 
                            runat="server"></asp:TextBox>
                   </div>
                   <br />
              <div>

               <div class="form-group">
                   
                   <asp:Label ID="Label5" 
                        runat="server" 
                        Text="Password"
                        CssClass="control-label col-sm-2">
                    </asp:Label>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        runat="server" 
                        ControlToValidate="TextBox3" 
                        ErrorMessage="Debe ingresar una contraseña" 
                        ForeColor="Lime">
                    </asp:RequiredFieldValidator>

                   <div class="col-sm-10">
                       <asp:TextBox ID="TextBox3" 
                           runat="server">
                       </asp:TextBox>
                   </div>
                    
                    <br />
               </div>



            <div class="form-group">
               <asp:Label ID="Label6" 
                    runat="server" 
                    Text="Reingrese Password"
                    CssClass="control-label col-sm-2">
               </asp:Label>

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                     runat="server" ControlToValidate="TextBox4" 
                     Display="Dynamic" ErrorMessage="Debe reingresar la contraseña" 
                     ForeColor="Lime">
                 </asp:RequiredFieldValidator>

                <asp:CompareValidator ID="CompareValidator2" 
                    runat="server" 
                    ControlToCompare="TextBox4" 
                    ControlToValidate="TextBox3" 
                    ErrorMessage="Las contraseñas no son iguales" 
                    ForeColor="Lime"></asp:CompareValidator>

               

                <div class="col-sm-10">
                    <asp:TextBox ID="TextBox4" 
                        runat="server">
                    </asp:TextBox>
                </div>
            </div>  
    
                    <br />

                    <div class="form-group">
                        <asp:Label ID="Label7" 
                            runat="server" 
                            Text="Edad"
                            CssClass="control-label col-sm-2">
                        </asp:Label>

                         <asp:RangeValidator ID="RangeValidator1" runat="server" 
                             ControlToValidate="TextBox5" Display="Dynamic" 
                             ErrorMessage="La edad debe ser mayor a 18 años" ForeColor="#0033CC" 
                             MaximumValue="101" 
                             MinimumValue="18"
                             SetFocusOnError="True" 
                             Type="Integer">
                         </asp:RangeValidator>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                            runat="server" 
                            ControlToValidate="TextBox5" 
                            ErrorMessage="Debe ingreasar una edad" 
                            ForeColor="#0033CC" Display="Dynamic"></asp:RequiredFieldValidator>

                        <div>
                            <asp:TextBox ID="TextBox5" 
                                runat="server">
                            </asp:TextBox>
                        </div>

                   </div>
                         <br />
       
                   <div class="form-group">
                        <asp:Label ID="Label3" 
                            runat="server" 
                            Text="Email: ">
                        </asp:Label>

                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                           runat="server" ControlToValidate="TextBox6" 
                           ErrorMessage="Email incorrecto- revise por favor" 
                           ForeColor="#FF6600" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" 
                           SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>

                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                         runat ="server" 
                          ControlToValidate="TextBox6" 
                          ErrorMessage="Debe ingresar el email"
                          ForeColor="#FF6600" Display="Dynamic"></asp:RequiredFieldValidator>

                       <div class="col-sm-10">
                            <asp:TextBox ID="TextBox6" 
                            runat="server"></asp:TextBox>
                       </div>
                     
                  </div>
                              <br />
                  <div>             
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                  </div>
                              <br />
                    <div class="form-group">
                        <asp:Button ID="Button1" 
                            runat="server" Text="ENVIAR" 
                            OnClick="Button1_Click1" 
                            CssClass ="form-control btn btn-primary"/> 
                    </div>
                  
                    <br />
             
        </div>
  
    </div>
    </div>
    
</asp:Content>
