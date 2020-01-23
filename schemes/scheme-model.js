const db = require('../data/dbConfig.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
};

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({ id: Number(id) }).first();
}

function add(post) {
    return db('schemes')
        .insert(post, 'id')
        .then(ids => ({ id: ids[0] }));
}

function remove(id) {
    return db('schemes')
        .where('id', Number(id))
        .del();
}

function update(post, id) {
    return db('schemes')
        .where('id', Number(id))
        .update(post);
}


function findSteps(id) {
    return db('steps')
        .join('schemes', 'schemes.id', 'scheme_id')
        .select('*')
        .where('scheme_id', id);
}

function addStep(stepData, id) {
    stepData.scheme_id = id;
    return db('steps')
        .insert(stepData, 'id')
        .then(ids => ({ id: ids[0] }));
}

