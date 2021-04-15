<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Simple.aspx.cs" Inherits="Simple" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--Add these files for ProgressBar--%>
    <link href="ProgressBar/ProgressBarStyle.css" rel="stylesheet" />
    <script type="text/javascript" src="ProgressBar/jquery_min_1.8.3.js"></script>
    <script type="text/javascript" src="ProgressBar/ProgressBarJavaScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        Country:
        <asp:DropDownList ID="ddlCountries" runat="server">
            <asp:ListItem Text="All" Value="" />
            <asp:ListItem Text="USA" Value="USA" />
            <asp:ListItem Text="Brazil" Value="Brazil" />
            <asp:ListItem Text="France" Value="France" />
            <asp:ListItem Text="Germany" Value="Germany" />
        </asp:DropDownList>
        <%--Calling the ShowProgress() JavaScript Function--%>
        <asp:Button ID="btnSubmit" runat="server" Text="Load Customers"
            OnClick="btnSubmit_Click" OnClientClick="javascript:ShowProgress();" />
        <hr />
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="CustomerId" HeaderText="Customer Id" />
                <asp:BoundField DataField="ContactName" HeaderText="Contact Name" />
                <asp:BoundField DataField="City" HeaderText="City" />
            </Columns>
        </asp:GridView>
        <%--Add the Progress Bar Image--%>
        <div class="loading" align="center">
            Processing, please wait...<br /> <br />
            <img src="ProgressBar/loader.gif" alt="" />
        </div>
    </form>
</body>
</html>
