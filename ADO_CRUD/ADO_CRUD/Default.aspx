<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ADO_CRUD.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADO.net CRUD</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 241px;
        }
        .tal{
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: lightgreen; ">
            <h1 style="text-align:center; padding: 5px;">ADO.net CRUD Operations</h1>
        </div>
        <div style="padding: 15px;">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Device ID :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbDeviceID" runat="server" Width="355px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Device Manufacturer :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbDeviceManufacturer" runat="server" Width="355px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Device Name :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbDeviceName" runat="server" Width="355px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Device Price :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbDevicePrice" runat="server" Width="355px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Button ID="btnSearchByID" runat="server" Text="Search by ID" OnClick="btnSearchByID_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnGenerateUniqueDeviceID" runat="server" Text="Generate DeviceID" OnClick="btnGenerateUniqueDeviceID_Click" />
                        <asp:Button ID="btnInsertData" runat="server" Text="Insert Data" OnClick="btnInsertData_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnUpdateData" runat="server" Text="Update Data" OnClick="btnUpdateData_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnDeleteData" runat="server" Text="Delete Data" OnClick="btnDeleteData_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" BorderStyle="Solid" CellPadding="4" Width="100%" ForeColor="#333333" GridLines="Both">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" CssClass="tal"/>
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
