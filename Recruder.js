import { createStore } from 'redux';


/**
 * need:
 * wrapper that contains a singleton store
 * exposes CRUD operations
 *
 * CRUD operations must
 * know what part of state they're updating
 * know how the user wants the state to be updated
 *
 * store updates must
 * maintain immutable central state
 * notify components that depend on state
 */

let store;

/**
 * creates store with state provided by user
 * and reducer generated from state spec
 */
export function initStore(initialState) {
  const reducer = getReducer(initialState);
  store = createStore(reducer);
}

/**
 * action types in reducer are catch-alls
 * accessible via the name of the state to be updated
 *
 * e.g. data updates are done in purescript type classes
 * new data is passed to generated reducer with it's attribute name
 * as the action type and the new data as the payload
 */
function getReducer(initialState) {
  const actionTypeChecker = Object.keys(initialState)
    .reduce(function(acc, actionType) {
      acc[actionType] = true;
      return acc;
  }, {});

  return function(state = initialState, action) {
    if (actionTypeChecker[action.type]) {

      return {
        ...state,
        ...action,
      };

    }

    return state;
  };
}

/**
 * executes onSuccess with data associated with stateType in store's state
 * if exists
 */
function getValidTargetState(stateType, onSuccess) {
  const state = store.getState();
  const targetState = state[stateType];

  if (targetState !== undefined) {
    onSuccess(targetState);
  }
}


/**
 * the wrapper is a class that operates as an
 * adapter to the redux framework
 *
 * uses a singleton of the store
 *
 * uses a class and provides a util for multiple class extensions
 *
 * when the central state is updated, it notifies relevant observers
 * when a user wants to update the central state, they specify how and what
 * part of the state to update
 */

export default class Recruder {

  /**
   * TODO this doesn't batch updates
   * this doesn't diff state
   * React users will still have to hook into props manually
   */
  get(stateType, subscriber) {
    store.subscribe(() => {
      getValidTargetState(stateType, subscriber);
    });
  }


  /**
   * CRUD methods delegate to purescript adapters
   * the output of which is dispatched via the store
   * to update the central state
   */


  create(stateType, createSpec) {
    //getValidTargetState(stateType, targetState => {
    //  const data = create(targetState, createSpec);

    //  store.dispatch({
    //    type: stateType,
    //    data,
    //  });

    //});
  }

  read(stateType, filterSpec) {
  }

  update(stateType, createSpec, filterSpec) {
  }

  remove(stateType, filterSpec) {
  }

};
