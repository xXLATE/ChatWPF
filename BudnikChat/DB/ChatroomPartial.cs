using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BudnikChat.DB
{
    public partial class Chatroom
    {
        public DateTime? LastMessage => ChatMessages.Count == 0 ? null : ChatMessages.LastOrDefault().Date;
    }
}
