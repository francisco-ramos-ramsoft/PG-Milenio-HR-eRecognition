<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .RadTabStrip_MetroTouch .rtsLevel .rmText {
            text-transform: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBodyMain" runat="Server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadListBox1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadListBox2" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <table class="table" align="center">
        <tr>
            <td class="table_tittle" style="height:7%" colspan="2">Administración de Catálogos</td>
        </tr>
        <tr>
            <td>
                <telerik:RadTabStrip RenderMode="Lightweight" runat="server" Skin="MetroTouch" ID="RadTabStrip2" MultiPageID="RadMultiPage2"
                    Orientation="VerticalLeft" Width="150px" Height="400px" SelectedIndex="2" CssClass="menu3">
                    <Tabs>
                        <telerik:RadTab Text="Reconocimientos" Selected="True"></telerik:RadTab>
                        <telerik:RadTab Text="Rocas & Motivos"></telerik:RadTab>
                        <telerik:RadTab Text="Asignación de Alces"></telerik:RadTab>
                        <telerik:RadTab Text="Artículos"></telerik:RadTab>
                        <telerik:RadTab Text="Almacén"></telerik:RadTab>
                        <telerik:RadTab Text="Empleados"></telerik:RadTab>
                        <telerik:RadTab Text="Fotos"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
            </td>
            <td>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="innerMultiPage" Width="900px" Height="450px">
                    <telerik:RadPageView runat="server" ID="PageView1">

                        <telerik:RadGrid ID="grdRecognitions" runat="server" AllowSorting="True" CellSpacing="0" DataSourceID="dsRecognitions" GridLines="None" Height="450px" Width="900px"
                            AllowAutomaticUpdates="True" Skin="Metro" AllowAutomaticInserts="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsRecognitions" CommandItemDisplay="Top" EditMode="InPlace" CommandItemSettings-AddNewRecordText="Agregar Reconocimiento">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>
                                    <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="5%" HeaderStyle-Width="8%"></telerik:GridEditCommandColumn>
                                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false" ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Nombre" SortExpression="Name" UniqueName="Name" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Descripción" SortExpression="Description" UniqueName="Description" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Value" DataType="System.Int32" FilterControlAltText="Filter Value column" HeaderText="Valor" SortExpression="Value" UniqueName="Value" ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCheckBoxColumn DataType="System.Boolean" DataField="Enabled" HeaderText="Habilitado" SortExpression="Enabled" UniqueName="Enabled" ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                    </telerik:GridCheckBoxColumn>
                                    <telerik:GridImageColumn DataImageUrlFields="ID" DataType="System.String" DataImageUrlFormatString="~/Images/Recs/{0}.png" ImageAlign="Middle" ImageWidth="80" ItemStyle-CssClass="imgAdmin" HeaderText="Imagen" ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                    </telerik:GridImageColumn>
                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="dsRecognitions" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Server %>"
                            OldValuesParameterFormatString="original_{0}"
                            SelectCommand="SELECT [ID], [Name], [Description], [Value], [Enabled] FROM [Recognitions]"
                            UpdateCommand="UPDATE [Recognitions] SET [Name] = @Name, [Description] = @Description, [Value] = @Value, [Enabled] = @Enabled WHERE [ID] = @original_ID AND [Name] = @original_Name AND [Description] = @original_Description AND [Value] = @original_Value AND [Enabled] = @original_Enabled"
                            DeleteCommand="DELETE FROM [Recognitions] WHERE [ID] = @original_ID AND [Name] = @original_Name AND [Description] = @original_Description AND [Value] = @original_Value AND [Enabled] = @original_Enabled"
                            InsertCommand="INSERT INTO [Recognitions] ([Name], [Description], [Value], [Enabled]) VALUES (@Name, @Description, @Value, @Enabled)">
                            <DeleteParameters>
                                <asp:Parameter Name="original_ID" Type="Int32" />
                                <asp:Parameter Name="original_Name" Type="String" />
                                <asp:Parameter Name="original_Description" Type="String" />
                                <asp:Parameter Name="original_Value" Type="Int32" />
                                <asp:Parameter Name="original_Enabled" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="Value" Type="Int32" />
                                <asp:Parameter Name="Enabled" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="Value" Type="Int32" />
                                <asp:Parameter Name="Enabled" Type="Boolean" />
                                <asp:Parameter Name="original_ID" Type="Int32" />
                                <asp:Parameter Name="original_Name" Type="String" />
                                <asp:Parameter Name="original_Description" Type="String" />
                                <asp:Parameter Name="original_Value" Type="Int32" />
                                <asp:Parameter Name="original_Enabled" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="PageView2">
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadGrid ID="grdRocks" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="0" DataSourceID="ds_Rocks" GridLines="None" Width="300px" Height="400px">
                                        <ClientSettings>
                                            <Selecting AllowRowSelect="True" />
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                        </ClientSettings>
                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_Rocks" EditMode="InPlace" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Agregar Roca">
                                            <CommandItemSettings ExportToPdfText="Export to PDF" />
                                            <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </RowIndicatorColumn>
                                            <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </ExpandCollapseColumn>
                                            <Columns>
                                                <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="8%" HeaderStyle-Width="8%"></telerik:GridEditCommandColumn>
                                                <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Roca" SortExpression="Name" UniqueName="Name" ItemStyle-Width="40%" HeaderStyle-Width="40%">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                            <EditFormSettings>
                                                <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                                </EditColumn>
                                            </EditFormSettings>
                                        </MasterTableView>
                                        <FilterMenu EnableImageSprites="False">
                                        </FilterMenu>
                                    </telerik:RadGrid>
                                    <asp:SqlDataSource ID="ds_Rocks" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Name], [Descrip] FROM [Rocks]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Rocks] WHERE [ID] = @original_ID AND [Name] = @original_Name AND [Descrip] = @original_Descrip"
                                        InsertCommand="INSERT INTO [Rocks] ([Name], [Descrip]) VALUES (@Name, @Descrip)"
                                        OldValuesParameterFormatString="original_{0}"
                                        UpdateCommand="UPDATE [Rocks] SET [Name] = @Name WHERE [ID] = @original_ID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_ID" Type="Int32" />
                                            <asp:Parameter Name="original_Name" Type="String" />
                                            <asp:Parameter Name="original_Descrip" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Descrip" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Name" Type="String" />
                                            <asp:Parameter Name="Descrip" Type="String" />
                                            <asp:Parameter Name="original_ID" Type="Int32" />
                                            <asp:Parameter Name="original_Name" Type="String" />
                                            <asp:Parameter Name="original_Descrip" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 70px"></td>
                                <td>
                                    <telerik:RadGrid ID="grdReasons" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowAutomaticDeletes="True" CellSpacing="0" DataSourceID="ds_Reasons" GridLines="None" Width="700px" Height="400px">
                                        <ClientSettings>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                        </ClientSettings>
                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_Reasons" EditMode="InPlace" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Agregar Motivo">
                                            <CommandItemSettings ExportToPdfText="Export to PDF" />
                                            <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </RowIndicatorColumn>
                                            <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </ExpandCollapseColumn>
                                            <Columns>
                                                <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="8%" HeaderStyle-Width="8%"></telerik:GridEditCommandColumn>
                                                <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridDropDownColumn ListTextField="Name" ListValueField="ID" DataField="RockID" ItemStyle-Width="25%" HeaderStyle-Width="25%"
                                                    UniqueName="RockID" SortExpression="RockID" HeaderText="Roca" DataSourceID="ds_Rocks"
                                                    AllowAutomaticLoadOnDemand="true"
                                                    AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="DropDownList">
                                                </telerik:GridDropDownColumn>
                                                <telerik:GridBoundColumn DataField="Category" FilterControlAltText="Filter Category column" HeaderText="Categoria" SortExpression="Category" UniqueName="Category" ItemStyle-Width="20%" HeaderStyle-Width="20%">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Descrip" FilterControlAltText="Filter Descrip column" HeaderText="Motivo" SortExpression="Descrip" UniqueName="Descrip" ItemStyle-Width="40%" HeaderStyle-Width="40%">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridClientDeleteColumn ButtonType="ImageButton" ItemStyle-Width="8%" HeaderStyle-Width="8%"></telerik:GridClientDeleteColumn>
                                            </Columns>
                                            <%-- <GroupByExpressions>
                                                <telerik:GridGroupByExpression>
                                                    <SelectFields>
                                                        <telerik:GridGroupByField FieldAlias="RockID" FieldName="RockID" FormatString="" HeaderText="" />
                                                    </SelectFields>
                                                    <GroupByFields>
                                                        <telerik:GridGroupByField FieldAlias="RockID" FieldName="RockID" FormatString="" HeaderText="" />
                                                    </GroupByFields>
                                                </telerik:GridGroupByExpression>
                                            </GroupByExpressions>
                                            --%>
                                            <EditFormSettings>
                                                <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                                </EditColumn>
                                            </EditFormSettings>
                                        </MasterTableView>
                                        <FilterMenu EnableImageSprites="False">
                                        </FilterMenu>
                                    </telerik:RadGrid>
                                    <asp:SqlDataSource ID="ds_Reasons" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>"
                                        SelectCommand="SELECT [ID], [RockID], [Category], [Descrip] FROM [Reasons]"
                                        ConflictDetection="CompareAllValues"
                                        DeleteCommand="DELETE FROM [Reasons] WHERE [ID] = @original_ID "
                                        InsertCommand="INSERT INTO [Reasons] ([RockID], [Category], [Descrip]) VALUES (@RockID, @Category, @Descrip)"
                                        OldValuesParameterFormatString="original_{0}"
                                        UpdateCommand="UPDATE [Reasons] SET [RockID] = @RockID, [Category] = @Category, [Descrip] = @Descrip WHERE [ID] = @original_ID AND [RockID] = @original_RockID ">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_ID" Type="Int32" />
                                            <asp:Parameter Name="original_RockID" Type="Int32" />
                                            <asp:Parameter Name="original_Category" Type="String" />
                                            <asp:Parameter Name="original_Descrip" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="RockID" Type="Int32" />
                                            <asp:Parameter Name="Category" Type="String" />
                                            <asp:Parameter Name="Descrip" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="RockID" Type="Int32" />
                                            <asp:Parameter Name="Category" Type="String" />
                                            <asp:Parameter Name="Descrip" Type="String" />
                                            <asp:Parameter Name="original_ID" Type="Int32" />
                                            <asp:Parameter Name="original_RockID" Type="Int32" />
                                            <asp:Parameter Name="original_Category" Type="String" />
                                            <asp:Parameter Name="original_Descrip" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="PageView3">
                        <div>
                            <telerik:RadGrid ID="RadGrid4" runat="server" DataSourceID="dsQty" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="0" GridLines="None" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" Width="900px" Height="450px">
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsQty" CommandItemDisplay="Top" EditMode="InPlace">
                                    <CommandItemSettings ExportToPdfText="Export to PDF" />
                                    <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                        <HeaderStyle Width="20px" />
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                        <HeaderStyle Width="20px" />
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridDropDownColumn ListTextField="Name" ListValueField="ID" DataField="UserID"
                                            UniqueName="UserID" SortExpression="UserID" HeaderText="Usuario" DataSourceID="dsLUsers"
                                            AllowAutomaticLoadOnDemand="true"
                                            AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="7" DropDownControlType="DropDownList">
                                        </telerik:GridDropDownColumn>
                                        <telerik:GridDropDownColumn ListTextField="Name" ListValueField="Month" DataField="Month"
                                            UniqueName="Month" SortExpression="Month" HeaderText="Mes" DataSourceID="dsMonths"
                                            AllowAutomaticLoadOnDemand="true"
                                            AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="7" DropDownControlType="DropDownList">
                                        </telerik:GridDropDownColumn>
                                        <telerik:GridDropDownColumn ListTextField="Name" ListValueField="ID" DataField="RecID"
                                            UniqueName="RecID" SortExpression="RecID" HeaderText="Reconocimiento" DataSourceID="dsRecs"
                                            AllowAutomaticLoadOnDemand="true"
                                            AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="7" DropDownControlType="DropDownList">
                                        </telerik:GridDropDownColumn>
                                        <telerik:GridBoundColumn DataField="Qty" DataType="System.Int32" FilterControlAltText="Filter Qty column" HeaderText="Cantidad" SortExpression="Qty" UniqueName="Qty">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridEditCommandColumn ButtonType="ImageButton"></telerik:GridEditCommandColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                        </EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>
                                <FilterMenu EnableImageSprites="False">
                                </FilterMenu>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dsQty" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Server %>"
                                DeleteCommand="DELETE FROM [UserRecQty] WHERE [ID] = @original_ID AND [UserID] = @original_UserID AND [Month] = @original_Month AND [RecID] = @original_RecID AND [Qty] = @original_Qty"
                                InsertCommand="INSERT INTO [UserRecQty] ([UserID], [Month], [RecID], [Qty]) VALUES (@UserID, @Month, @RecID, @Qty)" OldValuesParameterFormatString="original_{0}"
                                SelectCommand="SELECT * FROM [UserRecQty] order by id desc"
                                UpdateCommand="UPDATE [UserRecQty] SET [UserID] = @UserID, [Month] = @Month, [RecID] = @RecID, [Qty] = @Qty WHERE [ID] = @original_ID AND [UserID] = @original_UserID AND [Month] = @original_Month AND [RecID] = @original_RecID AND [Qty] = @original_Qty">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ID" Type="Int32" />
                                    <asp:Parameter Name="original_UserID" Type="Int32" />
                                    <asp:Parameter Name="original_Month" Type="String" />
                                    <asp:Parameter Name="original_RecID" Type="Int32" />
                                    <asp:Parameter Name="original_Qty" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="UserID" Type="Int32" />
                                    <asp:Parameter Name="Month" Type="String" />
                                    <asp:Parameter Name="RecID" Type="Int32" />
                                    <asp:Parameter Name="Qty" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="UserID" Type="Int32" />
                                    <asp:Parameter Name="Month" Type="String" />
                                    <asp:Parameter Name="RecID" Type="Int32" />
                                    <asp:Parameter Name="Qty" Type="Int32" />
                                    <asp:Parameter Name="original_ID" Type="Int32" />
                                    <asp:Parameter Name="original_UserID" Type="Int32" />
                                    <asp:Parameter Name="original_Month" Type="String" />
                                    <asp:Parameter Name="original_RecID" Type="Int32" />
                                    <asp:Parameter Name="original_Qty" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsRecs" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Name] FROM [Recognitions] WHERE ([Enabled] = @Enabled)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="True" Name="Enabled" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsLUsers" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Name] FROM [Users] WHERE ([Active] = 1) and Name<>'System' Order by Name"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dsMonths" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [Month], [Name] FROM [Months] where [month]>=replace(substring(convert(nvarchar(10),getdate(),120),1,7),'-','')"></asp:SqlDataSource>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button runat="server" ID="Plantilla" Text="Plantilla" OnClientClick="window.open('https://mbrap-webserver.la.pg.com/erecognition/Templates/Plantilla_Alces.xlsx');" />
                                    </td>
                                    <td>
                                        <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="AsyncUpload1" MultipleFileSelection="Disabled" TargetFolder="~/TempFiles" OnFileUploaded="RadAsyncUpload1_FileUploaded" />
                                    </td>
                                    <td>
                                        <telerik:RadButton runat="server" ID="Upload" Text="Cargar Archivo" />
                                        <asp:Label runat="server" ID="UploadDetails"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="width: 100%">
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="RadPageView1">

                        <telerik:RadGrid ID="RadGrid3" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="0" DataSourceID="dsGifts" GridLines="None" Height="450px" Width="980px">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsGifts" CommandItemDisplay="Top" EditMode="InPlace">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>
                                    <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="2%" HeaderStyle-Width="2%"></telerik:GridEditCommandColumn>
                                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Nombre" SortExpression="Name" UniqueName="Name" ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Descrip" FilterControlAltText="Filter Descrip column" HeaderText="Descripción" SortExpression="Descrip" UniqueName="Descrip" ItemStyle-Width="10%" HeaderStyle-Width="10%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Value" DataType="System.Int32" FilterControlAltText="Filter Value column" HeaderText="Costo" SortExpression="Value" UniqueName="Value" ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Type" FilterControlAltText="Filter Type column" HeaderText="Surte" SortExpression="Type" UniqueName="Type" ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCheckBoxColumn DataField="Active" DataType="System.Boolean" FilterControlAltText="Filter Active column" HeaderText="Activo" SortExpression="Active" UniqueName="Active" ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                    </telerik:GridCheckBoxColumn>
                                    <telerik:GridImageColumn DataImageUrlFields="ID" DataType="System.String" DataImageUrlFormatString="~/Images/Gifts/{0}.png" ImageAlign="Middle" ImageWidth="100px" ItemStyle-CssClass="imgAdmin" HeaderText="Imagen" ItemStyle-Width="7%" HeaderStyle-Width="7%">
                                    </telerik:GridImageColumn>
                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="dsGifts" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Server %>" DeleteCommand="DELETE FROM [Gifts] WHERE [ID] = @original_ID AND [Name] = @original_Name AND [Descrip] = @original_Descrip AND [Value] = @original_Value AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Active] = @original_Active) OR ([Active] IS NULL AND @original_Active IS NULL))" InsertCommand="INSERT INTO [Gifts] ([Name], [Descrip], [Value], [Type], [Active]) VALUES (@Name, @Descrip, @Value, @Type, @Active)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Gifts]" UpdateCommand="UPDATE [Gifts] SET [Name] = @Name, [Descrip] = @Descrip, [Value] = @Value, [Type] = @Type, [Active] = @Active WHERE [ID] = @original_ID AND [Name] = @original_Name AND [Descrip] = @original_Descrip AND [Value] = @original_Value AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Active] = @original_Active) OR ([Active] IS NULL AND @original_Active IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_ID" Type="Int32" />
                                <asp:Parameter Name="original_Name" Type="String" />
                                <asp:Parameter Name="original_Descrip" Type="String" />
                                <asp:Parameter Name="original_Value" Type="Int32" />
                                <asp:Parameter Name="original_Type" Type="String" />
                                <asp:Parameter Name="original_Active" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Descrip" Type="String" />
                                <asp:Parameter Name="Value" Type="Int32" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Active" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Descrip" Type="String" />
                                <asp:Parameter Name="Value" Type="Int32" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Active" Type="Boolean" />
                                <asp:Parameter Name="original_ID" Type="Int32" />
                                <asp:Parameter Name="original_Name" Type="String" />
                                <asp:Parameter Name="original_Descrip" Type="String" />
                                <asp:Parameter Name="original_Value" Type="Int32" />
                                <asp:Parameter Name="original_Type" Type="String" />
                                <asp:Parameter Name="original_Active" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>


                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="RadPageView2">

                        <table class="table">
                            <tr>

                                <td class="table_tittle">Existencias</td>
                                <td class="table_tittle">Entradas de Almacén</td>
                            </tr>
                            <tr>
                                <td class="table_content" style="vertical-align: top">
                                    <telerik:RadGrid ID="RadGrid6" runat="server" DataSourceID="dsExistencias" AllowPaging="True" CellSpacing="0" GridLines="None" Width="370px">
                                        <MasterTableView AutoGenerateColumns="False" DataSourceID="dsExistencias" DataKeyNames="ID">
                                            <CommandItemSettings ExportToPdfText="Export to PDF" />
                                            <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </RowIndicatorColumn>
                                            <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </ExpandCollapseColumn>
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="ID" SortExpression="ID" UniqueName="ID" DataType="System.Int32" ReadOnly="True" Visible="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Obsequio" SortExpression="Name" UniqueName="Name">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Entry" DataType="System.Int32" FilterControlAltText="Filter Entry column" HeaderText="Entradas" ReadOnly="True" SortExpression="Entry" UniqueName="Entry">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Out" DataType="System.Int32" FilterControlAltText="Filter Out column" HeaderText="Canjes" ReadOnly="True" SortExpression="Out" UniqueName="Out">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Total" DataType="System.Int32" FilterControlAltText="Filter Total column" HeaderText="Total" ReadOnly="True" SortExpression="Total" UniqueName="Total">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                            <EditFormSettings>
                                                <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                                </EditColumn>
                                            </EditFormSettings>
                                        </MasterTableView>
                                        <FilterMenu EnableImageSprites="False">
                                        </FilterMenu>
                                    </telerik:RadGrid>
                                    <asp:SqlDataSource ID="dsExistencias" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT * FROM VW_EXISTENCIAS"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <telerik:RadGrid ID="RadGrid2" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="0" DataSourceID="dsGiftInventory" GridLines="None" AllowSorting="True" Width="650px" Height="470px" OnItemInserted="RadGrid2_ItemInserted">
                                        <ClientSettings>
                                            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                        </ClientSettings>
                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsGiftInventory" CommandItemDisplay="Top" EditMode="InPlace">
                                            <CommandItemSettings ExportToPdfText="Export to PDF" />
                                            <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </RowIndicatorColumn>
                                            <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                                <HeaderStyle Width="20px" />
                                            </ExpandCollapseColumn>
                                            <Columns>
                                                <telerik:GridEditCommandColumn ButtonType="ImageButton"></telerik:GridEditCommandColumn>
                                                <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridDropDownColumn ListTextField="Name" ListValueField="ID" DataField="GiftID"
                                                    UniqueName="GiftID" SortExpression="GiftID" HeaderText="Obsequio" DataSourceID="dsLGifts"
                                                    AllowAutomaticLoadOnDemand="true"
                                                    AllowVirtualScrolling="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="DropDownList">
                                                </telerik:GridDropDownColumn>
                                                <telerik:GridBoundColumn DataField="Qty" DataType="System.Int32" FilterControlAltText="Filter Qty column" HeaderText="Cantidad" SortExpression="Qty" UniqueName="Qty">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Comments" FilterControlAltText="Filter Comments column" HeaderText="Comentarios" SortExpression="Comments" UniqueName="Comments">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="TimeStamp" DataType="System.DateTime" FilterControlAltText="Filter TimeStamp column" HeaderText="Fecha" SortExpression="TimeStamp" UniqueName="TimeStamp" ReadOnly="true">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="UserStamp" FilterControlAltText="Filter UserStamp column" HeaderText="Usuario" SortExpression="UserStamp" UniqueName="UserStamp" ReadOnly="true">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                            <EditFormSettings>
                                                <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                                </EditColumn>
                                            </EditFormSettings>
                                        </MasterTableView>
                                        <FilterMenu EnableImageSprites="False">
                                        </FilterMenu>
                                    </telerik:RadGrid>
                                    <asp:SqlDataSource ID="dsGiftInventory" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Server %>"
                                        DeleteCommand="DELETE FROM [GiftInventory] WHERE [ID] = @original_ID AND [GiftID] = @original_GiftID AND [Qty] = @original_Qty AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL)) AND [TimeStamp] = @original_TimeStamp AND [UserStamp] = @original_UserStamp"
                                        InsertCommand="INSERT INTO [GiftInventory] ([GiftID], [Qty], [Comments], [TimeStamp], [UserStamp]) VALUES (@GiftID, @Qty, @Comments, Getdate(), @UserStamp)"
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectCommand="SELECT * FROM [GiftInventory]"
                                        UpdateCommand="UPDATE [GiftInventory] SET [Qty] = @Qty, [Comments] = @Comments, [TimeStamp] = Getdate(), [UserStamp] = @UserStamp WHERE [ID] = @original_ID ">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_ID" Type="Int32" />
                                            <asp:Parameter Name="original_GiftID" Type="Int32" />
                                            <asp:Parameter Name="original_Qty" Type="Int32" />
                                            <asp:Parameter Name="original_Comments" Type="String" />
                                            <asp:Parameter Name="original_TimeStamp" Type="DateTime" />
                                            <asp:Parameter Name="original_UserStamp" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="GiftID" Type="Int32" />
                                            <asp:Parameter Name="Qty" Type="Int32" />
                                            <asp:Parameter Name="Comments" Type="String" />
                                            <asp:Parameter Name="TimeStamp" Type="DateTime" />
                                            <asp:SessionParameter Name="UserStamp" Type="String" SessionField="UserMail" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="GiftID" Type="Int32" />
                                            <asp:Parameter Name="Qty" Type="Int32" />
                                            <asp:Parameter Name="Comments" Type="String" />
                                            <asp:Parameter Name="TimeStamp" Type="DateTime" />
                                            <asp:SessionParameter Name="UserStamp" Type="String" SessionField="UserMail" />
                                            <asp:Parameter Name="original_ID" Type="Int32" />
                                            <asp:Parameter Name="original_GiftID" Type="Int32" />
                                            <asp:Parameter Name="original_Qty" Type="Int32" />
                                            <asp:Parameter Name="original_Comments" Type="String" />
                                            <asp:Parameter Name="original_TimeStamp" Type="DateTime" />
                                            <asp:Parameter Name="original_UserStamp" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="dsLGifts" runat="server" ConnectionString="<%$ ConnectionStrings:Server %>" SelectCommand="SELECT [ID], [Name] FROM [Gifts]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>

                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="RadPageView3">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowSorting="True" CellSpacing="0" DataSourceID="dsUsers" GridLines="None" Width="980px" Height="480px">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="NumEmp" DataSourceID="dsUsers" CommandItemDisplay="Top" EditMode="InPlace">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <Columns>
                                    <telerik:GridEditCommandColumn ButtonType="ImageButton"></telerik:GridEditCommandColumn>
                                    <telerik:GridBoundColumn DataField="NumEmp" DataType="System.Int32" FilterControlAltText="Filter NumEmp column" HeaderText="NumEmp" ReadOnly="false" SortExpression="NumEmp" UniqueName="NumEmp">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Mail" FilterControlAltText="Filter Mail column" HeaderText="Mail" SortExpression="Mail" UniqueName="Mail">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CC" FilterControlAltText="Filter CC column" HeaderText="CC" SortExpression="CC" UniqueName="CC">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Rol" FilterControlAltText="Filter Rol column" HeaderText="Rol" SortExpression="Rol" UniqueName="Rol">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Leader" FilterControlAltText="Filter Leader column" HeaderText="Leader" SortExpression="Leader" UniqueName="Leader">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCheckBoxColumn DataField="Active" DataType="System.Boolean" FilterControlAltText="Filter Active column" HeaderText="Active" SortExpression="Active" UniqueName="Active">
                                    </telerik:GridCheckBoxColumn>
                                    <telerik:GridCheckBoxColumn DataField="isAdmin" DataType="System.Boolean" FilterControlAltText="Filter isAdmin column" HeaderText="isAdmin" SortExpression="isAdmin" UniqueName="isAdmin">
                                    </telerik:GridCheckBoxColumn>

                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                            <FilterMenu EnableImageSprites="False">
                            </FilterMenu>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="dsUsers" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Server %>" DeleteCommand="DELETE FROM [Users] WHERE [NumEmp] = @original_NumEmp AND [Name] = @original_Name AND [Mail] = @original_Mail AND (([CC] = @original_CC) OR ([CC] IS NULL AND @original_CC IS NULL)) AND (([Rol] = @original_Rol) OR ([Rol] IS NULL AND @original_Rol IS NULL)) AND (([mailLeader] = @original_mailLeader) OR ([mailLeader] IS NULL AND @original_mailLeader IS NULL)) AND [Active] = @original_Active AND [isAdmin] = @original_isAdmin"
                            InsertCommand="INSERT INTO [Users] ([NumEmp], [Name], [Mail], [CC], [Rol], [Leader], [Active], [isAdmin]) VALUES (@NumEmp, @Name, @Mail, @CC, @Rol, @Leader, 1, @isAdmin)"
                            OldValuesParameterFormatString="original_{0}"
                            SelectCommand="SELECT * FROM [Users] WHERE ([Rol] &lt;&gt; @Rol) ORDER BY [Name]"
                            UpdateCommand="UPDATE [Users] SET [Name] = @Name, [Mail] = @Mail, [CC] = @CC, [Rol] = @Rol, [Leader] = @Leader, [Active] = @Active, [isAdmin] = @isAdmin WHERE [NumEmp] = @original_NumEmp ">
                            <DeleteParameters>
                                <asp:Parameter Name="original_NumEmp" Type="Int32" />
                                <asp:Parameter Name="original_Name" Type="String" />
                                <asp:Parameter Name="original_Mail" Type="String" />
                                <asp:Parameter Name="original_CC" Type="String" />
                                <asp:Parameter Name="original_Rol" Type="String" />
                                <asp:Parameter Name="original_mailLeader" Type="String" />
                                <asp:Parameter Name="original_Active" Type="Boolean" />
                                <asp:Parameter Name="original_isAdmin" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="NumEmp" Type="Int32" />
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Mail" Type="String" />
                                <asp:Parameter Name="CC" Type="String" />
                                <asp:Parameter Name="Rol" Type="String" />
                                <asp:Parameter Name="Leader" Type="String" />
                                <asp:Parameter Name="isAdmin" Type="Boolean" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="Sys" Name="Rol" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Mail" Type="String" />
                                <asp:Parameter Name="CC" Type="String" />
                                <asp:Parameter Name="Rol" Type="String" />
                                <asp:Parameter Name="Leader" Type="String" />
                                <asp:Parameter Name="Active" Type="Boolean" />
                                <asp:Parameter Name="isAdmin" Type="Boolean" />
                                <asp:Parameter Name="original_NumEmp" Type="Int32" />
                                <asp:Parameter Name="original_Name" Type="String" />
                                <asp:Parameter Name="original_Mail" Type="String" />
                                <asp:Parameter Name="original_CC" Type="String" />
                                <asp:Parameter Name="original_Rol" Type="String" />
                                <asp:Parameter Name="original_mailLeader" Type="String" />
                                <asp:Parameter Name="original_Active" Type="Boolean" />
                                <asp:Parameter Name="original_isAdmin" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView4" runat="server">
                        <table>
                            <tr>
                                <td>
                                    <div>
                                        <telerik:RadGrid ID="RadGrid5" runat="server" Width="980px"
                                            AllowAutomaticInserts="True" GridLines="None" AllowAutomaticDeletes="True" DataSourceID="SqlDataSource1" MasterTableView-DataKeyNames="ImageId"
                                            OnInsertCommand="RadGrid1_InsertCommand" CellSpacing="0" OnUpdateCommand="RadGrid1_UpdateCommand" Height="480px">
                                            <ClientSettings>
                                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                            </ClientSettings>
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ImageID" DataSourceID="SqlDataSource1"
                                                CommandItemDisplay="Top" EditMode="InPlace" CommandItemSettings-AddNewRecordText="Agregar Foto!">
                                                <CommandItemSettings AddNewRecordText="Agregar Foto!" ExportToPdfText="Export to PDF"></CommandItemSettings>
                                                <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>
                                                <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                                                <Columns>
                                                    <telerik:GridEditCommandColumn ButtonType="ImageButton" ItemStyle-Width="2%" HeaderStyle-Width="2%"></telerik:GridEditCommandColumn>
                                                    <%--<telerik:GridClientDeleteColumn ButtonType="ImageButton"></telerik:GridClientDeleteColumn>--%>
                                                    <telerik:GridButtonColumn CommandName="Delete" UniqueName="DeleteColumn" ButtonType="ImageButton" ConfirmTextFields="ImgeID" ConfirmTextFormatString="Está seguro que deseas eliminar la imagen:<b>'{0}'</b>" ConfirmTitle="Atención" ConfirmDialogType="RadWindow" ItemStyle-Width="2%" HeaderStyle-Width="2%"></telerik:GridButtonColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Nombre del archivo" UniqueName="ImageName" DataField="ImageName" ItemStyle-Width="5%" HeaderStyle-Width="5%">
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
                                                    <telerik:GridBoundColumn DataField="ImageID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ImageId" ReadOnly="True" SortExpression="ImageId" UniqueName="ImageID" Visible="true" ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="status" DataType="System.String" FilterControlAltText="Filter ID column" HeaderText="Estatus" ReadOnly="False" SortExpression="status" UniqueName="status" ItemStyle-Width="5%" HeaderStyle-Width="5%">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridImageColumn DataImageUrlFields="ImageName" UniqueName="Photo" DataType="System.String" DataImageUrlFormatString="~/Images/Photos/{0}" ImageAlign="Middle" ItemStyle-CssClass="imgAdmin" ImageWidth="120px" HeaderText="Foto" ItemStyle-Width="5%" HeaderStyle-Width="5%">
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
                                            DeleteCommand="DELETE FROM [Images] WHERE [ImageID] = @ImageID"
                                            InsertCommand="INSERT INTO [Images] ([ImageName],UserID,status) VALUES (@ImageName,@UserID,1)"
                                            SelectCommand="SELECT * FROM [Images]"
                                            UpdateCommand="Update Images set status=@status where ImageId=@ImageId">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ImageID" Type="Int32" />
                                            </DeleteParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="UserID" Type="Int32" SessionField="UserID" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ImageID" Type="Int32" />
                                                <asp:Parameter Name="status" Type="String" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ImageName" Type="String" />
                                                <asp:Parameter Name="UserID" Type="String" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </td>
        </tr>
    </table>

</asp:Content>
