using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BudnikChat.DB
{
    public partial class ChatDBEntities
    {
        private static ChatDBEntities _context;

        public static ChatDBEntities GetContext()
        {
            if (_context == null)
                _context = new ChatDBEntities();

            return _context;
        }
    }
}
