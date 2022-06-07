<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UploadPhoto.aspx.cs" Inherits="UploadPhoto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="img2/misrecs01.png" Height="80px"  />
    <table>
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="img2/descrip01.png" />
            </td>
            <td>
                <div>
        <telerik:RadGrid ID="RadGrid1" runat="server" Width="700px"
            AllowAutomaticInserts="True" GridLines="None" AllowAutomaticDeletes="True" DataSourceID="SqlDataSource1"
            OnInsertCommand="RadGrid1_InsertCommand" CellSpacing="0" OnUpdateCommand="RadGrid1_UpdateCommand" Height="250px">
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ImageID" DataSourceID="SqlDataSource1"
                CommandItemDisplay="Top" EditMode="InPlace" CommandItemSettings-AddNewRecordText="Agregar Foto!">
                <CommandItemSettings AddNewRecordText="Agregar Foto!" ExportToPdfText="Export to PDF"></CommandItemSettings>

                <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

                <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton"></telerik:GridEditCommandColumn>
                    <telerik:GridClientDeleteColumn ButtonType="ImageButton"></telerik:GridClientDeleteColumn>
                    <telerik:GridTemplateColumn HeaderText="Nombre del archivo" UniqueName="ImageName" DataField="ImageName">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="LblImage" Text='<%# Eval("ImageName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadAsyncUpload ID="RadUpload1" runat="server"
                                TargetFolder="Images/Photos" AllowedFileExtensions="jpg,jpeg,png"
                                OverwriteExistingFiles="false"
                                ControlObjectsVisibility="None">
                            </telerik:RadAsyncUpload>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridImageColumn DataImageUrlFields="ImageName" UniqueName="Photo" DataType="System.String" DataImageUrlFormatString="~/Images/Photos/{0}" ImageAlign="Middle" ImageHeight="100px" HeaderText="Foto">
                    </telerik:GridImageColumn>

                </Columns>
                <EditFormSettings>
                    <PopUpSettings Modal="true" Height="500px" Width="400px" />
                    <EditColumn UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>

            <FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>"
            DeleteCommand="DELETE FROM [Images] WHERE [ImageID] = @ImageID" InsertCommand="INSERT INTO [Images] ([ImageName],UserID) VALUES (@ImageName,@UserID)"
            SelectCommand="SELECT * FROM [Images] Where UserID=@UserID" UpdateCommand="UPDATE [Images] SET [ImageName] = @ImageName WHERE [ImageID] = @ImageID">
            <DeleteParameters>
                <asp:Parameter Name="ImageID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="UserID" Type="Int32" SessionField="UserID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ImageID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
            </td>
        </tr>
    </table>

    

    <table align="center">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Blade.aspx" ImageUrl="~/img2/mailbtn01.png" Height="80px" /></td>
                            <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/Catalog.aspx" ImageUrl="~/img2/mailbtn02.png" Height="80px" /></td>
                            <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton3" runat="server" PostBackUrl="~/Experience.aspx" ImageUrl="~/img2/mailbtn03.png" Height="80px" /></td>
                            <td style="width: 50px"></td>
                            <td>
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img2/mailbtn06.png" Height="80px" OnClick="ImageButton4_Click" /></td>
                        </tr>
                    </table>
</asp:Content>

