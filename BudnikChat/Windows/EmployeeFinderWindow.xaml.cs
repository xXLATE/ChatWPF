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
    /// Interaction logic for EmployeeFinderWindow.xaml
    /// </summary>
    public partial class EmployeeFinderWindow : Window
    {
        public Chatroom Chatroom { get; set; }
        public List<Employee> Employees { get; set; }
        public List<Department> Departments { get; set; }

        public EmployeeFinderWindow(Chatroom chatroom)
        {
            InitializeComponent();

            Chatroom = chatroom;
            Employees = new List<Employee>();
            Departments = DataAccess.GetDepartments();

            this.DataContext = this;
        }

        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            ApplyFilters();
        }

        private void ApplyFilters()
        {
            Employees = new List<Employee>();
            var search = tbSearch.Text.ToLower();

            foreach (var department in Departments)
            {
                if (department.IsChecked)
                    Employees.AddRange(department.Employees);
            }
            Employees = Employees.FindAll(x => x.Name.ToLower().Contains(search));

            lvEmployees.ItemsSource = Employees;
        }

        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void lvEmployees_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var employee = lvEmployees.SelectedItem as Employee;

            if (employee == App.Employee || Chatroom.EmployeeChatrooms.Any(x => x.Employee == employee))
                return;

            if (Chatroom.Id == 0)
            {
                Chatroom.EmployeeChatrooms.Add(new EmployeeChatroom
                {
                    Employee = App.Employee,
                    Chatroom = Chatroom
                });
                Chatroom.EmployeeChatrooms.Add(new EmployeeChatroom
                {
                    Employee = employee,
                    Chatroom = Chatroom
                });

                new ChatWindow(Chatroom).Show();
            }
            else
            {
                Chatroom.EmployeeChatrooms.Add(new EmployeeChatroom
                {
                    Employee = employee,
                    Chatroom = Chatroom
                });
            }

            DataAccess.SaveChatroom(Chatroom);
            this.Close();
        }
    }
}
