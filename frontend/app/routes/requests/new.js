import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Route.extend({
  session: service('session'),
  renderTemplate() {
    var isAdmin;
    var access_level = this.get('session.data.authenticated.user.access_level');
    if (access_level) {
      isAdmin   = access_level == 'admin';
    }
    this.render();
    if(true) {
      this.render("user-option", { outlet: "user-option", into: "requests.new" });
    }
  },
  model() {
    return this.store.findAll('user');
  }
});
