using BudnikChat.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace BudnikChat.Windows
{
    /// <summary>
    /// Interaction logic for ChitchatWindow.xaml
    /// </summary>
    public partial class ChitchatWindow : Window
    {
        public string EmployeeName { get; set; }
        public List<Chatroom> Chatrooms { get; set; }

        public ChitchatWindow()
        {
            InitializeComponent();

            EmployeeName = App.Employee.Name;
            Chatrooms = App.Employee.EmployeeChatrooms.ToList().Select(x => x.Chatroom).ToList();

            DataAccess.AddNewItemEvent += DataAccess_AddNewItemEvent;

            this.DataContext = this;
        }

        private void DataAccess_AddNewItemEvent()
        {
            Chatrooms = App.Employee.EmployeeChatrooms.ToList().Select(x => x.Chatroom).ToList();

            lvChatrooms.ItemsSource = Chatrooms;
            lvChatrooms.Items.Refresh();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnFinder_Click(object sender, RoutedEventArgs e)
        {
            new EmployeeFinderWindow(new Chatroom()).ShowDialog();
        }

        private void lvChatrooms_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var chatroom = lvChatrooms.SelectedItem as Chatroom;
            if (chatroom != null)
                new ChatWindow(chatroom).Show();

            lvChatrooms.SelectedIndex = -1;
        }
    }
}
