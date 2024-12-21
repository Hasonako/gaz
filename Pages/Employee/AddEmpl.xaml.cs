using gaz.Main;
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
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace gaz.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEmpl.xaml
    /// </summary>
    public partial class AddEmpl : Page
    {
        public AddEmpl()
        {
            InitializeComponent();

            cmbFilterRole.SelectedValuePath = "role";
            cmbFilterRole.DisplayMemberPath = "role";
            cmbFilterRole.ItemsSource = dbConnect.entObj.authorization.GroupBy(o => o.role).ToList();
        }

        private void menuBack_Click(object sender, RoutedEventArgs e) => this.NavigationService.Navigate(new Empl());

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            authorization emplObj = new authorization()
            {
                name = txbName.Text,
                login = txbLogin.Text,
                password = txbPassword.Text,
                role = cmbFilterRole.Text
            };
            dbConnect.entObj.authorization.Add(emplObj);
            dbConnect.entObj.SaveChanges();
            MessageBox.Show(
                "Сотрудник '" + emplObj.name + "' добавлен",
                "Уведомление",
                MessageBoxButton.OK,
                MessageBoxImage.Warning
                );
            this.NavigationService.Navigate(new Empl());
        }
    }
}
