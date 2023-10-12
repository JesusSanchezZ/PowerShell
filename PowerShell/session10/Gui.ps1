# Ejemplo 1:
#     -- cargar ensamblado ----
# 

[reflection.assembly]::LoadWithPartialName("system.Windows.Forms")

$form = New-Object Windows.Forms.Form

$form.ShowDialog()

# Ejemplo 2:
$form = New-Object Windows.Forms.Form
$form.Width = 500
$form.Height = 300
$form.BackColor = "cyan"
$form.Text = "My First PowerShell Form"
#$form.ShowDialog()

# ejemplo 2.0 Creando una etiqueta
$label = New-Object Windows.Forms.Label
$label.Text = "Hi Friend!! How are you doing today?"

$label.Width=220
$label.Height=20

$label.Location = New-Object Drawing.Point 100,30
$label.BackColor='orange'

$form.Controls.Add($label)

#$form.ShowDialog()

# crear un textbox y configurar texto, tamaño y locación
$texfield = New-Object Windows.Forms.TextBox
$texfield.Location = New-Object Drawing.Point 100, 80
$texfield.Width=220
$texfield.Height=20

$form.Controls.Add($texfield)
#$form.ShowDialog()

# Crear un botón
$btn = New-Object Windows.Forms.Button
$btn.Location = New-Object Drawing.Point 100, 120
$btn.Width=200
$btn.Height=40
$btn.BackColor='yellow'
$btn.Text="Send these details to Admin"

# Añadir evento al boton
$btn.Add_Click(
    {
        $x=$textfield.Text;
        Write-Host $x

        [System.Windows.Forms.MessageBox]::Show("Details Accepted.", "admin says")
        $form.Close()
    }
)

$form.Controls.Add($btn)
$form.ShowDialog()