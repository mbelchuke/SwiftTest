﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EcomCountry_List.aspx.vb" Inherits="Dynamicweb.Admin.eComBackend.EcomCountry_List" %>

<%@ Register Assembly="Dynamicweb.Controls" Namespace="Dynamicweb.Controls" TagPrefix="dw" %>
<%@ Register TagPrefix="ecom" Namespace="Dynamicweb.Admin.eComBackend" Assembly="Dynamicweb.Admin" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <dw:ControlResources ID="ControlResources1" IncludePrototype="true" IncludeUIStylesheet="true" runat="server"></dw:ControlResources>
    <script type="text/javascript" src="../js/ecomLists.js"></script>
    <script type="text/javascript">
        var addAllMsg = '<%= AddAllMessage %>';
        function addAllCountries() {
            if (confirm(addAllMsg)) selectCountry('-1');
            else $('CountryLayer').hide();
        }
    </script>
</head>
<body class="screen-container">
    <div class="card">
        <form id="form1" runat="server" enableviewstate="false">
            <input type="hidden" name="selctedRowID" id="selctedRowID" />
            <ecom:Toolbar ID="Toolbar" runat="server"></ecom:Toolbar>
            <dw:List ID="List1" runat="server" Title="" ShowTitle="false" StretchContent="false" PageSize="25">
                <Filters></Filters>
                <Columns>
                    <dw:ListColumn ID="colCode" runat="server" Name="Landekode" EnableSorting="true" Width="200" />
                    <dw:ListColumn ID="colName" runat="server" Name="Navn" EnableSorting="true" />
                    <dw:ListColumn ID="colVat" runat="server" Name="Moms" EnableSorting="false" />
                    <dw:ListColumn ID="colCurrency" runat="server" Name="Valutakode" EnableSorting="false" />
                    <dw:ListColumn ID="colPayment" runat="server" Name="Betaling" EnableSorting="false" />
                    <dw:ListColumn ID="colShipping" runat="server" Name="Forsendelse" EnableSorting="false" />
                </Columns>
            </dw:List>
        </form>
    </div>

</body>
</html>