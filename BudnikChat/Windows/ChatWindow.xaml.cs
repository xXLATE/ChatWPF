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
    /// Interaction logic for ChatWindow.xaml
    /// </summary>
    public partial class ChatWindow : Window
    {
        public Chatroom Chatroom { get; set; }

        public ChatWindow(Chatroom chatroom)
        {
            InitializeComponent();

            Chatroom = chatroom;

            Title += chatroom.Topic;

            DataAccess.AddNewItemEvent += DataAccess_AddNewItemEvent;

            this.DataContext = Chatroom;
        }

        private void DataAccess_AddNewItemEvent()
        {
            this.DataContext = Chatroom;

            Title = $"Topic: {Chatroom.Topic}";

            lvEmployees.ItemsSource = Chatroom.EmployeeChatrooms;
            lvEmployees.Items.Refresh();

            lvMessages.ItemsSource = Chatroom.ChatMessages;
            lvMessages.Items.Refresh();
        }

        private void btnAddUser_Click(object sender, RoutedEventArgs e)
        {
            new EmployeeFinderWindow(Chatroom).ShowDialog();
        }

        private void btnChangeTopic_Click(object sender, RoutedEventArgs e)
        {
            new ChangeTopicWindow(Chatroom).ShowDialog();
        }

        private void btnLeaveChatroom_Click(object sender, RoutedEventArgs e)
        {
            DataAccess.LeaveChatroom(Chatroom, App.Employee);
            this.Close();
        }

        private void btnSend_Click(object sender, RoutedEventArgs e)
        {
            DataAccess.SendMessage(Chatroom, App.Employee, tbMessage.Text);
        }
    }
}
