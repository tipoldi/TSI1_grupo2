
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using AdminWeb.Models;

namespace AdminWeb
{
    public class MyHub1 : Hub
    {
        //List<UserDetail> ConnectedUsers = new List<UserDetail>();

        static List<String> ConnectedUsersId = new List<string>();
        static List<String> ConnectedUsersUserName = new List<string>();


        public void Hello()
        {
            Clients.All.hello();
        }

        public void Send(string name, string message)
        {
            // Call the addNewMessageToPage method to update clients.
            Clients.All.addNewMessageToPage(name, message);
        }

        public void Connect(string userName)
        {
            var id = Context.ConnectionId;

            if (ConnectedUsersId.Count(x => x == id) == 0)
            {
                //ConnectedUsers.Add(new UserDetail { ConnectionId = id, UserName = userName });
                ConnectedUsersId.Add(id);
                ConnectedUsersUserName.Add(userName);
               

                // send to caller
                Clients.Caller.onConnected(id, userName, ConnectedUsersId.ToArray(), ConnectedUsersUserName.ToArray());

                // send to all except caller client
                Clients.AllExcept(id).onNewUserConnected(id, userName);
            }
        }

        //public void SendMessageToAll(string userName, string message);

        //public void SendPrivateMessage(string toUserId, string message);

        public override System.Threading.Tasks.Task OnDisconnected()
        {
            var item = ConnectedUsersId.FirstOrDefault(x => x == Context.ConnectionId);            

            if (item != null)
            {
                var index = ConnectedUsersId.IndexOf(Context.ConnectionId);
                var userName = ConnectedUsersUserName.ElementAt(index);
                ConnectedUsersId.RemoveAt(index);
                ConnectedUsersUserName.RemoveAt(index);

                var id = Context.ConnectionId;
                Clients.All.onUserDisconnected(id, userName);
            }

            return base.OnDisconnected();
        } 
    }
}