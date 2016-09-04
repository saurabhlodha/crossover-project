import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('dashboard');
  this.resource('users', function() {
    this.route('new');
    this.route('edit', {path: '/edit/:user_id'});
  });
  this.resource('requests', function() {
    this.route('new');
    this.route('edit', {path: '/edit/:request_id'});
    this.route('show', {path: '/show/:request_id'});
  });
  this.route('signup');
  this.route('travelplan');
});

export default Router;
