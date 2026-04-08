<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background-color: #f9fafb; margin: 0; padding: 0; color: #111827; }
        .container { max-width: 600px; margin: 40px auto; background: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); }
        .header { background: linear-gradient(135deg, #059669 0%, #10b981 100%); padding: 40px 20px; text-align: center; color: #ffffff; }
        .header h1 { margin: 0; font-size: 28px; font-weight: 700; letter-spacing: -0.025em; }
        .content { padding: 40px; line-height: 1.6; }
        .content p { margin-bottom: 20px; font-size: 16px; }
        .footer { background-color: #f3f4f6; padding: 20px; text-align: center; color: #6b7280; font-size: 14px; }
        .button { display: inline-block; background-color: #059669; color: #ffffff; padding: 14px 28px; border-radius: 8px; text-decoration: none; font-weight: 600; margin-top: 20px; }
        .info-box { background-color: #f0fdf4; border-left: 4px solid #059669; padding: 20px; margin: 25px 0; border-radius: 0 8px 8px 0; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Account Created</h1>
        </div>
        <div class="content">
            <p>Hello ${user.firstName!user.username},</p>
            <p>An administrator has created a new account for you on <strong>${realmName}</strong>.</p>
            
            <div class="info-box">
                <p style="margin: 0; font-weight: 600; color: #065f46;">Login Information</p>
                <p style="margin: 10px 0 0 0;">Username: <strong>${user.username}</strong></p>
            </div>

            <p>To get started, please log in and set up your profile using the link below:</p>
            <a href="${url.loginUrl}" class="button">Log In & Get Started</a>
            
            <p style="margin-top: 30px; font-size: 14px; color: #6b7280;">If you have any questions, please contact your administrator.</p>
        </div>
        <div class="footer">
            &copy; ${year} ${realmName}. All rights reserved.
        </div>
    </div>
</body>
</html>
