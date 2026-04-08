<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background-color: #f9fafb; margin: 0; padding: 0; color: #111827; }
        .container { max-width: 600px; margin: 40px auto; background: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); }
        .header { background: linear-gradient(135deg, #2563eb 0%, #3b82f6 100%); padding: 40px 20px; text-align: center; color: #ffffff; }
        .header h1 { margin: 0; font-size: 28px; font-weight: 700; letter-spacing: -0.025em; }
        .content { padding: 40px; line-height: 1.6; }
        .content p { margin-bottom: 20px; font-size: 16px; }
        .footer { background-color: #f3f4f6; padding: 20px; text-align: center; color: #6b7280; font-size: 14px; }
        .update-notification { background-color: #eff6ff; border: 1px solid #bfdbfe; padding: 20px; border-radius: 8px; margin: 25px 0; display: flex; align-items: center; }
        .icon { font-size: 24px; margin-right: 15px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Permissions Updated</h1>
        </div>
        <div class="content">
            <p>Hello ${user.firstName!user.username},</p>
            <p>We're writing to let you know that your account permissions for <strong>${realmName}</strong> have been recently updated by an administrator.</p>
            
            <div class="update-notification">
                <span class="icon">ℹ️</span>
                <div>
                    <p style="margin: 0; font-weight: 600; color: #1e40af;">Access Levels Changed</p>
                    <p style="margin: 5px 0 0 0; color: #1e40af; font-size: 14px;">Your roles and access rights have been synchronized with the latest security policies.</p>
                </div>
            </div>

            <p>These changes are effective immediately. You may need to log out and log back in to see the updates in your current session.</p>
            
            <p style="margin-top: 30px; font-size: 14px; color: #6b7280;">If you believe this change was made in error, please contact your IT support team.</p>
        </div>
        <div class="footer">
            &copy; ${year} ${realmName}. All rights reserved.
        </div>
    </div>
</body>
</html>
