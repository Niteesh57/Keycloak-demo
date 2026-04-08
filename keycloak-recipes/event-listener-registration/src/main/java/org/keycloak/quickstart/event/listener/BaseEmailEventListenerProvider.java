package org.keycloak.quickstart.event.listener;

import org.keycloak.email.EmailException;
import org.keycloak.email.EmailTemplateProvider;
import org.keycloak.events.EventListenerProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserModel;

import java.time.Year;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class BaseEmailEventListenerProvider implements EventListenerProvider {
    protected final KeycloakSession session;

    public BaseEmailEventListenerProvider(KeycloakSession session) {
        this.session = session;
    }

    protected String extractUserId(String resourcePath) {
        if (resourcePath == null) return null;
        String[] parts = resourcePath.split("/");
        if (parts.length >= 2 && "users".equals(parts[0])) {
            return parts[1];
        }
        return null;
    }

    protected void sendEmail(RealmModel realm, UserModel user, String subjectKey, String template, Map<String, Object> attributes) {
        try {
            EmailTemplateProvider emailTemplateProvider = session.getProvider(EmailTemplateProvider.class);
            
            Map<String, Object> bodyAttributes = new HashMap<>(attributes);
            bodyAttributes.put("realmName", realm.getDisplayName() != null ? realm.getDisplayName() : realm.getName());
            bodyAttributes.put("user", user);
            bodyAttributes.put("year", String.valueOf(Year.now().getValue()));

            List<Object> subjectAttributes = new ArrayList<>();
            subjectAttributes.add(realm.getName());

            emailTemplateProvider
                    .setRealm(realm)
                    .setUser(user)
                    .setAttribute("realmName", realm.getDisplayName() != null ? realm.getDisplayName() : realm.getName())
                    .send(subjectKey, subjectAttributes, template, bodyAttributes);
            
            System.out.println("Email sent successfully using template: " + template);
        } catch (EmailException e) {
            System.err.println("Failed to send email to " + user.getEmail() + ": " + e.getMessage());
        }
    }

    @Override
    public void close() {
        // No-op
    }
}
