<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EjemploWebForm.index" %>

<!DOCTYPE html>
<html lang="es-es">
<head runat="server">
<meta charset="utf-8"/>
    <title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script   src="http://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager" />

       
        <asp:Menu ID="mnNavegacion" runat="server">
            <Items>
                <asp:MenuItem NavigateUrl="~/index.aspx" Text="Pagina principal" Value="Pagina principal"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <asp:Panel ID="mensajeAlert" CssClass="alert alert-danger alert-dismissible hide" runat="server">            
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span></button> 
            <asp:Label ID="lblError" runat="server" Text="Prueba"> </asp:Label>  
        </asp:Panel>
<div class="col-xs-12 col-sm-6">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView CssClass="table table-bordered" DataKeyNames="codigoUsuario" OnRowCommand="grdv_Usuarios_RowCommand" ID="grdv_Usuarios" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="codigoUsuario" Visible="False" />
                                <asp:BoundField DataField="nombreUsuario" HeaderText="Nombre" Visible="true" />
                                <asp:BoundField DataField="apellidosUsuario" HeaderText="Apellidos" Visible="true" />
                                <asp:BoundField DataField="emailUsuario" HeaderText="Documento" Visible="true" />
                                <asp:ButtonField CommandName="editUsuario" Text="Editar" ControlStyle-CssClass="btn btn-info">
                                    <ControlStyle CssClass="btn btn-info" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteUsuario" Text="Borrar" ControlStyle-CssClass="btn btn-danger"></asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="btncrearUsuario" runat="server" Text="Crear Usuario" CssClass="btn btn-success" OnClick="btncrearUsuario_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!--Ventana modal del formulario para crear/modificar un usuario -->

            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="crearEditarModal"></h4>
                                </div>
                                <div class="modal-body">
                                    <asp:Label runat="server" ID="lblIdUsuario" Visible="false" Text=""></asp:Label>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblNombre" Visible="true" Text="Nombre:"></asp:Label>
                                        <asp:TextBox ID="txtNombreUsuario" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblApellidos" Visible="true" Text="Apellidos:"></asp:Label>
                                        <asp:TextBox ID="txtApellidos" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblNick" Visible="true" Text="NickName:"></asp:Label>
                                        <asp:TextBox ID="txtAlias" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblfNacimiento" Visible="true" Text="Fecha de Nacimiento:"></asp:Label>
                                        <asp:TextBox ID="txtfNacimiento" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblPassword" Visible="true" Text="Contraseña:"></asp:Label>
                                        <asp:TextBox ID="txtPassword" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                    <asp:Button runat="server" OnClick="btnGuardarUsuario_Click" CssClass="btn btn-success" ID="btnGuardarUsuario" Text="Guardar" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id=""></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblMensaje" runat="server" Text="¿Esta usted seguro que desea borrar?"></asp:Label>
                            <asp:TextBox ID="txtIdUsuario" runat="server" Enabled="false" Visible="false"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                            <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Borrar" CssClass="btn btn-danger" />
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
