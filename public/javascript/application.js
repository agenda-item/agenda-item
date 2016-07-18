Vue.component('agendaItem', {
  template: '#agenda-item-template',
  props: ['agendaItem'],
  methods: {
    postData: function() {
      console.log(this)
      this.$http.post('/api/agenda-items/' + this.agendaItem.id, this.agendaItem, {emulateJSON:true}).then(function(response) {
        console.log("agenda item updated");
      }).error(function(error) {
        console.log(error);
        console.log("erroring");
      }.bind(this));
    }
  }
});

new Vue({
  el: '#app',
  data: function(){
    return {
      agendaItems: []
    }
  },
  created: function() {
    this.$http.get('/api/agenda-items').then(function(response){
      this.agendaItems = response.json();
    }.bind(this));
  }
});

// #############################
// Component for meetings-header  
// Within the meetings.erb file 
// #############################

Vue.component('meetings-header', {
  template: '#meetings-header-template',
  data: function() {
    return {
      meetingDetails: []
    }
  },
  created: function() {
    this.$http.get('/api/meetings').then(function(response){
      this.meetingDetails = response.json();
    }.bind(this));
  }
});

{/*############################
Component for list-users
Within the meetings.erb file
############################*/}

Vue.component('list-users', {
  template: '#list-users-template',
  props: ['agendaItem'],
  computed: {
    allVotes: function () {
      // takes in agenda item & vote type
      // gets all the votes related to the agenda item
      // filters them by vote type
      return this.agendaItem.votes
    }
  }
});

{/*############################
Component for agenda-items
Within the meetings.erb file
############################*/}

Vue.component('agenda-items', {
  template: '#agenda-items-template',
  data: function() {
    return {
      agendaItems: []
    }
  },
  created: function() {
    this.$http.get('/api/agenda-items').then(function(response){
      this.agendaItems = response.json();
    }.bind(this));
  },
  methods: {
    postData: function() {
      console.log(this)
      this.$http.post('/api/agenda-items/1', this.agendaItem.discussion).then(function(response) {
        console.log("agenda item updated");
      }).error(function(error) {
        console.log(error);
      }.bind(this));
    }
  },
});

{/*#############################
Component for meetings-footer
Within the meetings.erb file
#############################*/}

Vue.component('meetings-footer', {
  template: '#meetings-footer-template',
  data: function() {
    return {
      meetingFooterDetails: []
    }
  },
  created: function() {
    this.$http.get('/api/meetings').then(function(response){
      this.meetingFooterDetails = response.json();
    }.bind(this));
  }
});

new Vue({
  el: '#app'
});

// #################################
// Component for agenda selection
// Within the select_status.erb file
// #################################

Vue.component('agendaItem', {
  template: '#agenda-item-template',
  props: ['agendaItem', 'selected', 'options'],
  methods: {
    postData: function() {
      console.log(this)
      this.$http.post('/api/agenda-items/' + this.agendaItem.id, this.agendaItem, {emulateJSON:true}).then(function(response) {
        console.log("agenda item updated");
      }).error(function(error) {
        console.log(error);
        console.log("erroring");
      }.bind(this));
    }
  }
});

new Vue({
  el: '#app',
  data: {
    agendaItem: {},
    selected: '--',
    options: [
      { status: 'passed', value: 'passed' },
      { text: 'defeated', value: 'defeated' },
      { text: 'amended', value: 'amended' },
      { text: 'active', value: 'active' },
      { text: 'carried forward', value: 'carried forward' },
      { text: 'completed', value: 'completed' }
    ]      
  },
  created: function() {
    this.$http.get('/api/agenda-items/2').then(function(response){
      this.agendaItem = response.json();
    }.bind(this));
  }
});
