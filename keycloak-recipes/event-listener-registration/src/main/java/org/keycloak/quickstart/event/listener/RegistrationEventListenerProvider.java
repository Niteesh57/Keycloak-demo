package org.keycloak.quickstart.event.listener;

import org.keycloak.events.Event;
import org.keycloak.events.EventType;
import org.keycloak.events.admin.AdminEvent;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserModel;

import java.util.Collections;

public class RegistrationEventListenerProvider extends BaseEmailEventListenerProvider {

    public RegistrationEventListenerProvider(KeycloakSession session) {
        super(session);
    }

    @Override
    public void onEvent(Event event) {
        if (event.getType() == EventType.REGISTER) {
            System.out.println("RegistrationEventListener: Processing registration for: " + event.getUserId());
            
            RealmModel realm = session.realms().getRealm(event.getRealmId());
            UserModel user = session.users().getUserById(realm, event.getUserId());

            if (user != null) {
                user.addRequiredAction(UserModel.RequiredAction.VERIFY_EMAIL);
                sendEmail(realm, user, "welcomeEmailSubject", "welcome-mail.ftl", Collections.emptyMap());
            }
        }
    }

    @Override
    public void onEvent(AdminEvent adminEvent, boolean b) {
        // Handled by other providers
    }
}
