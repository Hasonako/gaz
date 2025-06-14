using gaz.Main;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
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

            cmbRole.ItemsSource = dbConnect.entObj.UserRights.GroupBy(o => o.RightsName).ToList();
            cmbRole.SelectedValuePath = "id";
            cmbRole.DisplayMemberPath = "RightsName";
        }

        private void menuBack_Click(object sender, RoutedEventArgs e) => this.NavigationService.Navigate(new Empl());

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            // Проверка: имени
            if (string.IsNullOrWhiteSpace(txbName.Text))
            {
                MessageBox.Show("Введите имя сотрудника.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Проверка: логина
            if (string.IsNullOrWhiteSpace(txbLogin.Text))
            {
                MessageBox.Show("Введите логин.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
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

            // Проверка: логин должен быть уникальным
            var existingUser = dbConnect.entObj.Users.FirstOrDefault(u => u.login == txbLogin.Text.Trim());
            if (existingUser != null)
            {
                MessageBox.Show("Пользователь с таким логином уже существует.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Приведение данных
            string name = txbName.Text.Trim();
            string login = txbLogin.Text.Trim();
            string password = txbPassword.Text.Trim();
            var selectedRole = cmbRole.SelectedValue;

            if (selectedRole == null)
            {
                MessageBox.Show("Ошибка при выборе роли.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Создание нового пользователя
            User newUser = new User()
            {
                name = name,
                login = login,
                password = password,
                rights = (int)cmbRole.SelectedValue
            };

            // Сохранение
            try
            {
                dbConnect.entObj.Users.Add(newUser);
                dbConnect.entObj.SaveChanges();

                MessageBox.Show("Сотрудник успешно добавлен.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
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
