using gaz.Main;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
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
    public partial class EditEmpl : Page
    {
        private authorization EmplObj;
        public EditEmpl(object imp)
        {
            InitializeComponent();
            DataContext = imp;
            var mid = TypeDescriptor.GetProperties(DataContext)["id"].GetValue(DataContext);
            EmplObj = dbConnect.entObj.authorizations.FirstOrDefault(e => e.id == (int)mid);

            cmbRole.ItemsSource = dbConnect.entObj.UserRights.ToList();
            cmbRole.SelectedValuePath = "id";
            cmbRole.DisplayMemberPath = "RightsName";
        }

        private void menuBack_Click(object sender, RoutedEventArgs e) => this.NavigationService.Navigate(new Empl());

        private void menuDlt_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены?", "Удаление сотрудника", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                dbConnect.entObj.authorizations.Remove(EmplObj);
                dbConnect.entObj.SaveChanges();
                this.NavigationService.Navigate(new Empl());
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            // Проверка: имени
            if (string.IsNullOrWhiteSpace(txbName.Text))
            {
                MessageBox.Show("Введите имя сотрудника.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Проверка: пароля
            if (string.IsNullOrWhiteSpace(txbPassword.Text))
            {
                MessageBox.Show("Введите пароль.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Проверка: выбрана ли роль
            if (cmbRole.SelectedItem == null)
            {
                MessageBox.Show("Выберите роль сотрудника.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Проверка: имя содержит только русские и/или латинские буквы (без цифр, символов, пробелов)
            string namePattern = @"^[a-zA-Zа-яА-ЯёЁ]+$";
            if (!Regex.IsMatch(txbName.Text.Trim(), namePattern))
            {
                MessageBox.Show("Имя может содержать только русские или латинские буквы без пробелов и знаков.",
                                "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            string name = txbName.Text.Trim();
            string password = txbPassword.Text.Trim();
            var selectedRole = cmbRole.SelectedValue;

            if (selectedRole == null)
            {
                MessageBox.Show("Ошибка при выборе роли.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            EmplObj.name = name;
            EmplObj.password = password;
            EmplObj.rights = (int)cmbRole.SelectedValue;
            
            try
            {
                dbConnect.entObj.SaveChanges();
                MessageBox.Show("Данные успешно изменены.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                this.NavigationService.Navigate(new Empl());
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка при сохранении:\n" + ex.Message,
                    "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
