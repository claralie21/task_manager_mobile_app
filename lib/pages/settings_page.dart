import 'package:flutter/material.dart';
import 'package:task_manager_mobile_app/utils/todo_list.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final String userName = "Jane Doe";
  final String userEmail = "jane.doe@example.com";
  final String profileImageUrl = "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'My Settings',
        ),
        centerTitle: true, 
        backgroundColor: Colors.orangeAccent.shade400,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Handle edit profile navigation
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Allows the content to scroll if it exceeds screen height
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // --- Profile Picture and Name ---
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    // Use NetworkImage for URL or AssetImage for local file
                    backgroundImage: NetworkImage(profileImageUrl), 
                    backgroundColor: Colors.grey.shade300,
                  ),
                  // Optional: Add an icon to change the picture
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Text(
              userName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

            Text(
              userEmail,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),

            // --- Additional Info/Menu Items ---
            const Divider(),
            const SizedBox(height: 10),

            ProfileMenuItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                // Navigate to settings screen
              },
            ),
            ProfileMenuItem(
              icon: Icons.check_circle,
              title: 'Completed Tasks',
              onTap: () {
                // Navigate to order history
              },
            ),
            ProfileMenuItem(
              icon: Icons.pending_rounded,
              title: 'Pending Tasks',
              onTap: () {
                // Navigate to order history
              },
            ),
            ProfileMenuItem(
              icon: Icons.stacked_line_chart,
              title: 'Weekly Statistics',
              onTap: () {
                // Navigate to order history
              },
            ),
            ProfileMenuItem(
              icon: Icons.logout,
              title: 'Logout',
              isDestructive: true,
              onTap: () {
                // Handle user logout
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isDestructive ? Colors.red.withOpacity(0.1) : Colors.blue.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: isDestructive ? Colors.red : Colors.blue,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.red : null,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: onTap,
    );
  }
}