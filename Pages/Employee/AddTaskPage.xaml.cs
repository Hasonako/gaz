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

namespace gaz.Pages.Employee
{
    /// <summary>
    /// Interaction logic for AddTaskPage.xaml
    /// </summary>
    public partial class AddTaskPage : Page
    {
        public AddTaskPage()
        {
            InitializeComponent();

            cmbEmp.ItemsSource = dbConnect.entObj.authorizations.ToList();
            cmbEmp.DisplayMemberPath = "name";
            cmbEmp.SelectedValuePath = "id";
        }

        private void menuBack_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            // Проверка: выбран ли сотрудник
            if (cmbEmp.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, выберите сотрудника.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Проверка: наименование задачи
            if (string.IsNullOrWhiteSpace(txbName.Text))
            {
                MessageBox.Show("Введите название задачи.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Проверка: описание задачи
            if (string.IsNullOrWhiteSpace(txbDescription.Text))
            {
                MessageBox.Show("Введите описание задачи.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Приведение данных
            var selectedUser = cmbEmp.SelectedItem as authorization;
            if (selectedUser == null)
            {
                MessageBox.Show("Ошибка при получении данных о сотруднике.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Создание объекта задачи
            UserTask taskObj = new UserTask()
            {
                EmployeeId = (int)cmbEmp.SelectedValue,
                TaskName = txbName.Text.Trim(),
                Description = txbDescription.Text.Trim()
            };

            // Сохранение в базу
            try
            {
                dbConnect.entObj.UserTasks.Add(taskObj);
                dbConnect.entObj.SaveChanges();
                MessageBox.Show("Задача успешно добавлена.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Произошла ошибка при сохранении задачи:\n" + ex.Message,
                    "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
