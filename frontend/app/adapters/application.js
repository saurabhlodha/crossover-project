import DS from 'ember-data';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';
import Ember from 'ember';


export default DS.JSONAPIAdapter.extend(DataAdapterMixin, {
  session: Ember.inject.service('session'),

  host: 'http://localhost:3000',

  headers: Ember.computed(function() {
    var token = this.get('session.data.authenticated.user.auth_token');
    return { 'Authorization' : token };
  }).volatile(),

  authorizer: 'authorizer:devise',

  shouldReloadAll() { return true; },

  shouldReloadRecord() { return true; }

});