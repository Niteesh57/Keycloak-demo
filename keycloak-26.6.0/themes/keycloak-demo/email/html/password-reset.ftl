<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background-color: #f9fafb; margin: 0; padding: 0; color: #111827; }
        .container { max-width: 600px; margin: 40px auto; background: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); }
        .header { background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%); padding: 40px 20px; text-align: center; color: #ffffff; }
        .header h1 { margin: 0; font-size: 28px; font-weight: 700; letter-spacing: -0.025em; }
        .content { padding: 40px; line-height: 1.6; }
        .content p { margin-bottom: 20px; font-size: 16px; }
        .footer { background-color: #f3f4f6; padding: 20px; text-align: center; color: #6b7280; font-size: 14px; }
        .button { display: inline-block; background-color: #4f46e5; color: #ffffff; padding: 14px 28px; border-radius: 8px; text-decoration: none; font-weight: 600; margin-top: 20px; transition: background-color 0.2s; }
        .button:hover { background-color: #4338ca; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Reset Your Password</h1>
        </div>
        <div class="content">
            <p>Hello ${user.firstName!user.username},</p>
            <p>We received a request to reset the password for your account on <strong>${realmName}</strong>. No problem! Click the button below to choose a new one.</p>
            <a href="${link}" class="button">Reset Password</a>
            <p style="margin-top: 30px; font-size: 14px; color: #6b7280;">This link will expire in ${linkExpiration} minutes.</p>
            <p style="font-size: 14px; color: #6b7280;">If you didn't request a password reset, you can safely ignore this email. Your password will remain unchanged.</p>
        </div>
        <div class="footer">
            &copy; ${year} ${realmName}. All rights reserved.
        </div>
    </div>
</body>
</html>
