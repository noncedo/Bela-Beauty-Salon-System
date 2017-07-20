<%@ Page Title="" Language="C#" MasterPageFile="~/masterClient.Master" AutoEventWireup="true" CodeBehind="SampleViewServices.aspx.cs" Inherits="baleflorbeaultysalon.SampleViewServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div>
       <asp:Table ID="Table1" runat="server" Width="821px" >
           <asp:TableRow>
               <asp:TableCell  Height="200px" Width="200px">
                   <asp:Image ID="Image1" runat="server" AlternateText="Service Name" ImageUrl="~/Images/imgServices/Bio Sculpture overlay.jpg" Height="100px" Width="100px" /><br />
                   <asp:Label ID="Label1" runat="server" Text="Label">Bio Sculpture Overlay</asp:Label><br />
                 <asp:Label ID="Label2" runat="server" Text="Label">R250.00</asp:Label><br />
                   <asp:Label ID="Label3" runat="server" Text="Label">Description</asp:Label><br />
                   <asp:Label ID="Label37" runat="server" Text="Label">45 min</asp:Label><br />
                   <asp:Button ID="Button1" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
               
               <asp:TableCell>
                   <asp:Image ID="Image2" runat="server" AlternateText="Service Name" ImageUrl="~/Images/imgServices/massage.jpg" Height="100px" Width="100px"  /><br />
                   <asp:Label ID="Label4" runat="server" Text="Label">Massage</asp:Label><br />
                 <asp:Label ID="Label5" runat="server" Text="Label">R150.00</asp:Label><br />
                   <asp:Label ID="Label6" runat="server" Text="Label">Description</asp:Label><br />
                   <asp:Label ID="Label38" runat="server" Text="Label">30 min</asp:Label><br />
                   <asp:Button ID="Button2" runat="server" Text="Book Now" CssClass="btn btn-primary"  />
               </asp:TableCell>
               <asp:TableCell>
                   <asp:Image ID="Image3" runat="server" AlternateText="Service Name" ImageUrl="~/Images/imgServices/waxing.jpg" Height="100px" Width="100px" /><br />
                   <asp:Label ID="Label7" runat="server" Text="Label">Leg Wax</asp:Label><br />
                 <asp:Label ID="Label8" runat="server" Text="Label">R50.00</asp:Label><br />
                   <asp:Label ID="Label9" runat="server" Text="Label">Description</asp:Label><br />
                   <asp:Label ID="Label39" runat="server" Text="Label">30 min</asp:Label><br />
                   <asp:Button ID="Button3" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
                <asp:TableCell>
                   <asp:Image ID="Image4" runat="server" AlternateText="Service Name" ImageUrl="~/Images/imgServices/back wax.jpg"  Height="100px" Width="100px" /><br />
                   <asp:Label ID="Label10" runat="server" Text="Label">Back Wax</asp:Label><br />
                 <asp:Label ID="Label11" runat="server" Text="Label">R100.00</asp:Label><br />
                   <asp:Label ID="Label12" runat="server" Text="Label">Description</asp:Label><br />
                    <asp:Label ID="Label40" runat="server" Text="Label">45 min</asp:Label><br />
                   <asp:Button ID="Button4" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
           </asp:TableRow>
           <asp:TableRow >
                <asp:TableCell>
                   <asp:Image ID="Image5" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/chin wax.jpg" /><br />
                   <asp:Label ID="Label13" runat="server" Text="Label">Chin Wax</asp:Label><br />
                 <asp:Label ID="Label14" runat="server" Text="Label">R50.00</asp:Label><br />
                   <asp:Label ID="Label15" runat="server" Text="Label">Description</asp:Label><br />
                    <asp:Label ID="Label41" runat="server" Text="Label">15 min</asp:Label><br />
                   <asp:Button ID="Button5" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
               <asp:TableCell >
                   <asp:Image ID="Image6" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/brow wax.jpg"  /><br />
                   <asp:Label ID="Label16" runat="server" Text="Label">Brow wax</asp:Label><br />
                 <asp:Label ID="Label17" runat="server" Text="Label">R50.00</asp:Label><br />
                   <asp:Label ID="Label18" runat="server" Text="Label">Description</asp:Label><br />
                   <asp:Label ID="Label42" runat="server" Text="Label">15 min</asp:Label><br />
                   <asp:Button ID="Button6" runat="server" Text="Book Now" CssClass="btn btn-primary"  />
               </asp:TableCell>
               <asp:TableCell>
                   <asp:Image ID="Image7" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/maniand pedi.jpg" /><br />
                   <asp:Label ID="Label19" runat="server" Text="Label">Mani and Pedi</asp:Label><br />
                 <asp:Label ID="Label20" runat="server" Text="Label">R550.00</asp:Label><br />
                   <asp:Label ID="Label21" runat="server" Text="Label">Description</asp:Label><br />
                   <asp:Label ID="Label43" runat="server" Text="Label">60 min</asp:Label><br />
                   <asp:Button ID="Button7" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
                <asp:TableCell>
                   <asp:Image ID="Image8" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/soak.jpg" /><br />
                   <asp:Label ID="Label22" runat="server" Text="Label">Arcylic Soak</asp:Label><br />
                 <asp:Label ID="Label23" runat="server" Text="Label">R70.00</asp:Label><br />
                   <asp:Label ID="Label24" runat="server" Text="Label">Description</asp:Label><br />
                    <asp:Label ID="Label44" runat="server" Text="Label">15 min</asp:Label><br />
                   <asp:Button ID="Button8" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
           </asp:TableRow>
           <asp:TableRow>
                <asp:TableCell>
                   <asp:Image ID="Image9" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/lash tint.jpg" /><br />
                   <asp:Label ID="Label25" runat="server" Text="Label">Lash tint</asp:Label><br />
                 <asp:Label ID="Label26" runat="server" Text="Label">R40.00</asp:Label><br />
                   <asp:Label ID="Label27" runat="server" Text="Label">Description</asp:Label><br />
                    <asp:Label ID="Label45" runat="server" Text="Label">15 min</asp:Label><br />
                   <asp:Button ID="Button9" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
               <asp:TableCell>
                   <asp:Image ID="Image10" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/Appertizer facial.jpg"  /><br />
                   <asp:Label ID="Label28" runat="server" Text="Label">Appetizer facial</asp:Label><br />
                 <asp:Label ID="Label29" runat="server" Text="Label">R150.00</asp:Label><br />
                   <asp:Label ID="Label30" runat="server" Text="Label">Description</asp:Label><br />
                   <asp:Label ID="Label46" runat="server" Text="Label">30 min</asp:Label><br />
                   <asp:Button ID="Button10" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
               <asp:TableCell>
                   <asp:Image ID="Image11" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/Arc.jpg"  /><br />
                   <asp:Label ID="Label31" runat="server" Text="Label">Nail and hand maintenance</asp:Label><br />
                 <asp:Label ID="Label32" runat="server" Text="Label">Price</asp:Label><br />
                   <asp:Label ID="Label33" runat="server" Text="Label">Description</asp:Label><br />
                   <asp:Label ID="Label47" runat="server" Text="Label">Duration</asp:Label><br />
                   <asp:Button ID="Button11" runat="server" Text="Book Now" CssClass="btn btn-primary" />
               </asp:TableCell>
                <asp:TableCell>
                   <asp:Image ID="Image12" runat="server" AlternateText="Service Name" Height="100px" Width="100px" ImageUrl="~/Images/imgServices/chest wax.jpg" /><br />
                   <asp:Label ID="Label34" runat="server" Text="Label">Chest wax</asp:Label><br />
                 <asp:Label ID="Label35" runat="server" Text="Label">R50.00</asp:Label><br />
                   <asp:Label ID="Label36" runat="server" Text="Label">Description</asp:Label><br />
                    <asp:Label ID="Label48" runat="server" Text="Label">45 min</asp:Label><br />
                   <asp:Button ID="Button12" runat="server" Text="Book Now" CssClass="btn btn-primary"  />
               </asp:TableCell>
           </asp:TableRow>
       </asp:Table>

   </div>






</asp:Content>
