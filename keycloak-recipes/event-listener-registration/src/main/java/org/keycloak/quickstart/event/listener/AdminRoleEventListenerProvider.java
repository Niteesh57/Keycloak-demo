package org.keycloak.quickstart.event.listener;

import org.keycloak.events.Event;
import org.keycloak.events.admin.AdminEvent;
import org.keycloak.events.admin.OperationType;
import org.keycloak.events.admin.ResourceType;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserModel;

import java.util.Collections;

public class AdminRoleEventListenerProvider extends BaseEmailEventListenerProvider {

    public AdminRoleEventListenerProvider(KeycloakSession session) {
        super(session);
    }

    @Override
    public void onEvent(Event event) {
        // Handled by registration provider
    }

    @Override
    public void onEvent(AdminEvent adminEvent, boolean b) {
        if ((adminEvent.getResourceType() == ResourceType.REALM_ROLE_MAPPING || 
             adminEvent.getResourceType() == ResourceType.CLIENT_ROLE_MAPPING) && 
            (adminEvent.getOperationType() == OperationType.CREATE || adminEvent.getOperationType() == OperationType.DELETE)) {
            
            String userId = extractUserId(adminEvent.getResourcePath());
            if (userId != null) {
                RealmModel realm = session.realms().getRealm(adminEvent.getRealmId());
                UserModel user = session.users().getUserById(realm, userId);
                if (user != null) {
                    System.out.println("AdminRoleEventListener: Sending role update email to: " + userId);
                    sendEmail(realm, user, "roleUpdateEmailSubject", "role-update-mail.ftl", Collections.emptyMap());
                }
            }
        }
    }
}
