# Extract File Contents

This PowerShell script recursively lists all files in a given folder and its subfolders, and displays the content of each file along with its relative path. You can choose to save the output to a file by using the `>` operator when running the script.

## Requirements

- PowerShell (included with Windows)

## Usage

### Adding the Script to the PATH Environment Variable

To use the `extract_file_contents.ps1` script as a native command, follow these steps:

1. Clone this repository or download the `extract_file_contents.ps1` script.
2. Create a folder named `scripts` in your user directory (e.g., `C:\Users\<YourUsername>\scripts`).
3. Move the `extract_file_contents.ps1` script into the `scripts` folder.
4. Press `Win + X` and choose "System" to open the System Properties window.
5. Click on "Advanced system settings" and then click the "Environment Variables..." button.
6. In the "System variables" section, find the `Path` variable, select it, and click the "Edit..." button.
7. Click the "New" button and add the full path to the `scripts` folder you created (e.g., `C:\Users\<YourUsername>\scripts`).
8. Click "OK" to close all open dialogs.

Now you can use the `extract_file_contents` command in any PowerShell window.

### Running the Script

1. Open a PowerShell window with administrative privileges (right-click on the PowerShell icon and select "Run as administrator").
2. Set the execution policy for the current session by executing the following command:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

3. Run the script with the following command:

```powershell
extract_file_contents -folderPath <folder_path> > <output_file>
```

Replace <folder_path> with the path to the folder you want to process, and <output_file> with the name of the output file you want to create (optional).

The script will display the contents of the files in the specified folder and its subfolders, and save them to the specified output file if provided.

## License

This project is released under the MIT License
