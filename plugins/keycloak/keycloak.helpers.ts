/// <reference path="keycloak.globals.ts"/>
namespace HawtioKeycloak {

  export function doLogout() {
    if (userProfile && keycloak) {
      keycloak.logout();
    }
  }

}