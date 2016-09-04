import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const { service } = Ember.inject;

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  session: service('session'),

  actions: {
    logout() {
      this.get('session').invalidate();
    }
  },

  afterModel() {
    console.log('transition complete');
    this.store.unloadAll('user');
    this.store.unloadAll('request');
    var access_level = this.get('session.data.authenticated.user');
    // console.log(access_level);
  },

  renderTemplate() {
    var isRegular, isManager, isAdmin;
    var access_level = this.get('session.data.authenticated.user.access_level');
    if (access_level) {
      access_level = access_level.toLowerCase();
      isRegular = access_level == 'user';
      isManager = access_level == 'agent';
      isAdmin   = access_level == 'admin';
    }

    this.render();

    if(isRegular) {
      this.render("requests-nav", { outlet: "requests-nav", into: "dashboard" });
    };

    if(isManager) {
      this.render("requests-nav", { outlet: "users-nav", into: "dashboard" });
    };

    if(isAdmin) {
      this.render("requests-nav", { outlet: "requests-nav", into: "dashboard" });
      this.render("users-nav", { outlet: "users-nav", into: "dashboard" });
    }
  }
  
});