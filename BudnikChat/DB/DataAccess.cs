using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace BudnikChat.DB
{
    public class DataAccess
    {
        public delegate void AddNewItem();
        public static event AddNewItem AddNewItemEvent;

        public static List<Employee> GetEmployees() => ChatDBEntities.GetContext().Employees.ToList();
        public static List<Chatroom> GetChatrooms() => ChatDBEntities.GetContext().Chatrooms.ToList();
        public static List<Department> GetDepartments() => ChatDBEntities.GetContext().Departments.ToList();

        public static Employee Login(string username, string password)
        {
            string hashPassword = StringToMD5(password);
            return GetEmployees().FirstOrDefault(x => x.Username == username && x.Password == password);
        }

        private static string StringToMD5(string password)
        {
            StringBuilder sb = new StringBuilder();
            var md5 = MD5.Create();

            byte[] hash = md5.ComputeHash(Encoding.UTF8.GetBytes(password));

            foreach (var b in hash)
            {
                sb.Append(b.ToString("x2"));
            }

            return sb.ToString();
        }

        public static void SaveChatroom(Chatroom chatroom)
        {
            if (chatroom.Id == 0)
                ChatDBEntities.GetContext().Chatrooms.Add(chatroom);

            ChatDBEntities.GetContext().SaveChanges();
            AddNewItemEvent?.Invoke();
        }

        public static void LeaveChatroom(Chatroom chatroom, Employee employee)
        {
            chatroom.EmployeeChatrooms.Remove(chatroom.EmployeeChatrooms.FirstOrDefault(x => x.Employee == employee));
            employee.EmployeeChatrooms.Remove(employee.EmployeeChatrooms.FirstOrDefault(x => x.Chatroom == chatroom));
            SaveChatroom(chatroom);
        }

        internal static void SendMessage(Chatroom chatroom, Employee employee, string message)
        {
            chatroom.ChatMessages.Add(new ChatMessage
            {
                Chatroom = chatroom,
                Employee = employee,
                Message = message,
                Date = DateTime.Now,
            });

            SaveChatroom(chatroom);
        }
    }
}
