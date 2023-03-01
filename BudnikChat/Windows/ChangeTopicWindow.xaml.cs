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
    /// Interaction logic for ChangeTopicWindow.xaml
    /// </summary>
    public partial class ChangeTopicWindow : Window
    {
        public Chatroom Chatroom { get; set; }

        public ChangeTopicWindow(Chatroom chatroom)
        {
            InitializeComponent();

            Chatroom = chatroom;
            this.DataContext = Chatroom;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            DataAccess.SaveChatroom(Chatroom);

            this.DialogResult = true;
        }
    }
}
