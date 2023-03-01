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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BudnikChat.Windows
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();

            cbRemeember.IsChecked = Properties.Settings.Default.IsRemeember;
            tbUsername.Text = Properties.Settings.Default.Login;
        }

        private void btnOk_Click(object sender, RoutedEventArgs e)
        {
            var username = tbUsername.Text;
            var password = pbPassword.Password;

            if ((App.Employee = DataAccess.Login(username, password)) != null)
            {
                new ChitchatWindow().Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("net");
            }

            UpdateSettings();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            UpdateSettings();
            this.Close();
        }

        private void UpdateSettings()
        {
            var isRemeember = (bool)cbRemeember.IsChecked;
            Properties.Settings.Default.IsRemeember = isRemeember;

            if (isRemeember)
                Properties.Settings.Default.Login = tbUsername.Text;
            else
                Properties.Settings.Default.Login = "";

            Properties.Settings.Default.Save();
        }
    }
}
