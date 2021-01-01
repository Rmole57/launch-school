"use strict";

let people = {
  collection: [],
  lastIndexKey: 0,
  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  rollCall: function() {
    this.collection.forEach(this.fullName);
    console.log();
  },

  add: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    person.indexKey = this.lastIndexKey;
    this.collection.push(person);
    this.lastIndexKey += 1;
  },

  getIndex: function(person) {
    let index = -1;
    this.collection.forEach(function(comparator, i) {
      if (comparator.indexKey === person.indexKey) {
        index = i;
      }
    });

    return index;
  },

  isInvalidPerson: function(person) {
    return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
  },

  remove: function(person) {
    let index = this.getIndex(person);
    if (this.isInvalidPerson(person)) {
      return;
    }

    if (index === -1) {
      return;
    }

    this.collection.splice(index, 1);
  },

  get: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    return this.collection[this.getIndex(person)];
  },

  update: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    let existingPersonId = this.getIndex(person);
    if (existingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonId] = person;
    }
  },
};

let me = {};
me.firstName = 'Rick';
me.lastName = 'Mole';

let friend = {
  firstName: 'John',
  lastName: 'Smith',
};

let mother = {
  firstName: 'Marie',
  lastName: 'Mole',
};

let father = {
  firstName: 'Richard',
  lastName: 'Mole',
};

people.add(me);
people.add(friend);
people.add(mother);
people.add(father);
people.rollCall();

people.remove(friend);
people.rollCall();

let bob = {
  firstName: 'Bob',
  lastName: 'Williams',
};

people.add(bob);
people.rollCall();
console.log(people.collection[people.getIndex(bob)]);

people.update({firstName: 'Bob', lastName: 'Williams', indexKey: 4, occupation: 'Therapist'});
console.log(people.collection[people.getIndex(bob)]);
people.rollCall();

people.update({firstName: 'Robert', lastName: 'Williams', indexKey: 4, occupation: 'Therapist'});
console.log(bob);
console.log(people.collection[people.getIndex(bob)]);
console.log(people.collection[people.getIndex({indexKey: 4})]);
people.rollCall();

people.add({firstName: 'Bob', lastName: 'Smith'});
console.log(people.collection[people.getIndex({indexKey: 5})]);
people.rollCall();
