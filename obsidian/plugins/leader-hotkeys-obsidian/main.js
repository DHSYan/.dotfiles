'use strict';

var obsidian = require('obsidian');

/*! *****************************************************************************
Copyright (c) Microsoft Corporation.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
***************************************************************************** */
/* global Reflect, Promise */

var extendStatics = function(d, b) {
    extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
    return extendStatics(d, b);
};

function __extends(d, b) {
    extendStatics(d, b);
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
}

function __awaiter(thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
}

function __generator(thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
}

function __values(o) {
    var s = typeof Symbol === "function" && Symbol.iterator, m = s && o[s], i = 0;
    if (m) return m.call(o);
    if (o && typeof o.length === "number") return {
        next: function () {
            if (o && i >= o.length) o = void 0;
            return { value: o && o[i++], done: !o };
        }
    };
    throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
}

function __read(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
        while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    }
    catch (error) { e = { error: error }; }
    finally {
        try {
            if (r && !r.done && (m = i["return"])) m.call(i);
        }
        finally { if (e) throw e.error; }
    }
    return ar;
}

function __spread() {
    for (var ar = [], i = 0; i < arguments.length; i++)
        ar = ar.concat(__read(arguments[i]));
    return ar;
}

// endregion
// region Fundamental Domain
var PressKind;
(function (PressKind) {
    PressKind[PressKind["ModifierOnly"] = 0] = "ModifierOnly";
    PressKind[PressKind["SpecialKey"] = 1] = "SpecialKey";
    PressKind[PressKind["NormalKey"] = 2] = "NormalKey";
})(PressKind || (PressKind = {}));
var KeyPress = /** @class */ (function () {
    function KeyPress(key, shift, alt, ctrl, meta) {
        var _this = this;
        this.text = function () {
            var metaRepr = _this.meta ? '⌘ + ' : '';
            var altRepr = _this.alt ? 'Alt + ' : '';
            var ctrlRepr = _this.ctrl ? 'Ctrl + ' : '';
            var shiftRepr = _this.shift ? '⇧ + ' : '';
            return metaRepr + ctrlRepr + altRepr + shiftRepr + _this.key;
        };
        this.kbd = function () {
            var result = document.createElement('kbd');
            result.addClass('setting-hotkey');
            result.setText(_this.text());
            result.style.padding = '2px';
            result.style.margin = '5px';
            result.style.border = '1px solid rgba(255,255,255,.25)';
            result.style.borderRadius = '3px';
            return result;
        };
        this.asHash = function () {
            return _this.text();
        };
        this.kind = function () {
            if (_this.key === null ||
                _this.key === undefined ||
                ['Alt', 'Control', 'Shift', 'Meta', 'AltGraph'].includes(_this.key)) {
                return PressKind.ModifierOnly;
            }
            if (['Enter', 'Escape', 'Backspace'].includes(_this.key)) {
                return PressKind.SpecialKey;
            }
            return PressKind.NormalKey;
        };
        this.key = key;
        this.shift = shift;
        this.alt = alt;
        this.ctrl = ctrl;
        this.meta = meta;
    }
    // region static constructors
    KeyPress.ctrl = function (key) {
        return new KeyPress(key, false, false, true, false);
    };
    KeyPress.alt = function (key) {
        return new KeyPress(key, false, true, false, false);
    };
    KeyPress.shift = function (key) {
        return new KeyPress(key, true, false, false, false);
    };
    KeyPress.meta = function (key) {
        return new KeyPress(key, false, false, false, true);
    };
    KeyPress.just = function (key) {
        return new KeyPress(key, false, false, false, false);
    };
    KeyPress.ctrlAlt = function (key) {
        return new KeyPress(key, false, true, true, false);
    };
    KeyPress.fromEvent = function (event) {
        var key = event.key;
        var shift = event.shiftKey;
        var ctrl = event.ctrlKey;
        var alt = event.altKey;
        var meta = event.metaKey;
        return new KeyPress(key, shift, alt, ctrl, meta);
    };
    KeyPress.fromCustom = function (binding) {
        var modifiers = binding.modifiers;
        var key = binding.key;
        var shift = modifiers.contains('Shift');
        var ctrl = modifiers.contains('Ctrl');
        var alt = modifiers.contains('Alt');
        var meta = modifiers.contains('Meta');
        return new KeyPress(key, shift, ctrl, alt, meta);
    };
    KeyPress.of = function (keyPressLike) {
        return new KeyPress(keyPressLike.key, keyPressLike.shift, keyPressLike.alt, keyPressLike.ctrl, keyPressLike.meta);
    };
    return KeyPress;
}());
var KeyMap = /** @class */ (function () {
    function KeyMap(commandID, sequence) {
        var _this = this;
        this.text = function () {
            return (_this.commandID +
                ' = ' +
                _this.sequence.map(function (press) { return press.text(); }).join(' => '));
        };
        this.sequence = sequence;
        this.commandID = commandID;
    }
    KeyMap.of = function (keyMapLike) {
        // FIXME : Theoretically possible to create a keymap without a commandID.
        var sequence = keyMapLike.sequence || [];
        var presses = sequence.map(KeyPress.of);
        var command = keyMapLike.commandID;
        return new KeyMap(command, presses);
    };
    KeyMap.prototype[Symbol.iterator] = function () {
        return this.sequence.values();
    };
    return KeyMap;
}());
var TrieNode = /** @class */ (function () {
    function TrieNode() {
        this.children = new Map();
    }
    TrieNode.prototype.child = function (key) {
        return this.children.get(key);
    };
    TrieNode.prototype.addChild = function (key, child) {
        this.value = null;
        this.children.set(key, child);
    };
    TrieNode.prototype.leaves = function () {
        if (this.isLeaf()) {
            return [this];
        }
        var result = [];
        this.children.forEach(function (child, _) {
            result = result.concat(child.leaves());
        });
        return result;
    };
    TrieNode.prototype.leafValues = function () {
        return this.leaves().map(function (node) { return node.value; });
    };
    TrieNode.prototype.isLeaf = function () {
        return this.children.size === 0;
    };
    TrieNode.prototype.setValue = function (value) {
        this.value = value;
    };
    return TrieNode;
}());
var Trie = /** @class */ (function () {
    function Trie() {
        this.root = new TrieNode();
    }
    Trie.from = function (iter) {
        var trie = new Trie();
        trie.addAll(iter);
        return trie;
    };
    Trie.prototype.addAll = function (iter) {
        var e_1, _a;
        try {
            for (var iter_1 = __values(iter), iter_1_1 = iter_1.next(); !iter_1_1.done; iter_1_1 = iter_1.next()) {
                var item = iter_1_1.value;
                this.add(item);
            }
        }
        catch (e_1_1) { e_1 = { error: e_1_1 }; }
        finally {
            try {
                if (iter_1_1 && !iter_1_1.done && (_a = iter_1.return)) _a.call(iter_1);
            }
            finally { if (e_1) throw e_1.error; }
        }
        return this;
    };
    Trie.prototype.add = function (composite) {
        var e_2, _a;
        // FIXME : Honestly, very sus implementation
        var lastSeenNode = this.root;
        try {
            for (var composite_1 = __values(composite), composite_1_1 = composite_1.next(); !composite_1_1.done; composite_1_1 = composite_1.next()) {
                var component = composite_1_1.value;
                var key = component.asHash();
                var child = lastSeenNode.child(key) || new TrieNode();
                lastSeenNode.addChild(key, child);
                lastSeenNode = child;
            }
        }
        catch (e_2_1) { e_2 = { error: e_2_1 }; }
        finally {
            try {
                if (composite_1_1 && !composite_1_1.done && (_a = composite_1.return)) _a.call(composite_1);
            }
            finally { if (e_2) throw e_2.error; }
        }
        if (lastSeenNode.value !== undefined) {
            throw new Error('Duplicate keymap');
        }
        lastSeenNode.setValue(composite);
        return this;
    };
    Trie.prototype.bestMatch = function (sequence) {
        var e_3, _a;
        var lastNode = this.root;
        try {
            for (var sequence_1 = __values(sequence), sequence_1_1 = sequence_1.next(); !sequence_1_1.done; sequence_1_1 = sequence_1.next()) {
                var keyPress = sequence_1_1.value;
                var key = keyPress.asHash();
                var child = lastNode.child(key);
                if (!child) {
                    return null;
                }
                lastNode = child;
            }
        }
        catch (e_3_1) { e_3 = { error: e_3_1 }; }
        finally {
            try {
                if (sequence_1_1 && !sequence_1_1.done && (_a = sequence_1.return)) _a.call(sequence_1);
            }
            finally { if (e_3) throw e_3.error; }
        }
        return lastNode;
    };
    return Trie;
}());
var MatchKind;
(function (MatchKind) {
    MatchKind[MatchKind["NoMatch"] = 0] = "NoMatch";
    MatchKind[MatchKind["PartialMatch"] = 1] = "PartialMatch";
    MatchKind[MatchKind["FullMatch"] = 2] = "FullMatch";
})(MatchKind || (MatchKind = {}));
var MatchState;
(function (MatchState) {
    MatchState[MatchState["EmptyMatch"] = 0] = "EmptyMatch";
    MatchState[MatchState["StartedMatch"] = 1] = "StartedMatch";
    MatchState[MatchState["RetainedMatch"] = 2] = "RetainedMatch";
    MatchState[MatchState["ImprovedMatch"] = 3] = "ImprovedMatch";
    MatchState[MatchState["SuccessMatch"] = 4] = "SuccessMatch";
    MatchState[MatchState["InvalidMatch"] = 5] = "InvalidMatch";
})(MatchState || (MatchState = {}));
var MatchStateKind;
(function (MatchStateKind) {
    MatchStateKind[MatchStateKind["Initial"] = 0] = "Initial";
    MatchStateKind[MatchStateKind["Flow"] = 1] = "Flow";
    MatchStateKind[MatchStateKind["Terminal"] = 2] = "Terminal";
})(MatchStateKind || (MatchStateKind = {}));
var MatchMachine = /** @class */ (function () {
    function MatchMachine(trie) {
        var _this = this;
        this.advance = function (keypress) {
            var macroState = _this.stateKind();
            var wasAlreadySearching = macroState === MatchStateKind.Flow;
            if (macroState === MatchStateKind.Terminal) {
                // Reset and try again.
                _this.currentState = MatchState.EmptyMatch;
                _this.currentSequence = [];
                _this.currentMatches = [];
                return _this.advance(keypress);
            }
            if (keypress.kind() === PressKind.ModifierOnly) {
                _this.currentState = [MatchState.EmptyMatch, MatchState.InvalidMatch, MatchState.SuccessMatch].includes(_this.currentState)
                    ? MatchState.EmptyMatch
                    : MatchState.RetainedMatch;
                return _this.currentState;
            }
            _this.currentSequence.push(keypress);
            var bestMatch = _this.trie.bestMatch(_this.currentSequence);
            var matchKind = interpretMatch(bestMatch);
            _this.currentMatches = bestMatch ? bestMatch.leafValues() : [];
            switch (matchKind) {
                case MatchKind.NoMatch:
                    _this.currentSequence = [];
                    _this.currentState = wasAlreadySearching
                        ? MatchState.InvalidMatch
                        : MatchState.EmptyMatch;
                    break;
                case MatchKind.PartialMatch:
                    _this.currentState = wasAlreadySearching
                        ? MatchState.ImprovedMatch
                        : MatchState.StartedMatch;
                    break;
                case MatchKind.FullMatch:
                    _this.currentState = wasAlreadySearching
                        ? MatchState.SuccessMatch
                        : // Very sus to reach success state at first try.
                            MatchState.SuccessMatch;
                    break;
            }
            return _this.currentState;
        };
        this.allMatches = function () {
            return _this.currentMatches;
        };
        this.fullMatch = function () {
            var numMatches = _this.allMatches().length;
            var isFullMatch = _this.currentState === MatchState.SuccessMatch;
            // Sanity checking.
            if (isFullMatch && numMatches !== 1) {
                writeConsole('State Machine in FullMatch state, but availableHotkeys.length contains more than 1 element. This is definitely a bug.');
                return null;
            }
            if (isFullMatch && numMatches === 1) {
                return _this.currentMatches[0];
            }
            return null;
        };
        this.stateKind = function () {
            if (_this.currentState === MatchState.EmptyMatch) {
                return MatchStateKind.Initial;
            }
            var flowStates = [
                MatchState.StartedMatch,
                MatchState.RetainedMatch,
                MatchState.ImprovedMatch,
            ];
            return flowStates.includes(_this.currentState)
                ? MatchStateKind.Flow
                : MatchStateKind.Terminal;
        };
        this.trie = trie;
        this.currentState = MatchState.EmptyMatch;
        this.currentSequence = [];
        this.currentMatches = [];
    }
    return MatchMachine;
}());
var MatchHandler = /** @class */ (function () {
    function MatchHandler(parent) {
        var _this = this;
        this.handleKeyDown = function (event) {
            var keypress = KeyPress.fromEvent(event);
            console.debug(keypress);
            var machineState = _this.machine.advance(keypress);
            writeConsole("An keypress resulted in a " + MatchState[machineState] + " state.");
            if (_this.machine.stateKind() !== MatchStateKind.Initial) {
                event.preventDefault();
                if (machineState === MatchState.SuccessMatch) {
                    var keymap = _this.machine.fullMatch();
                    _this.emit(keymap);
                }
            }
        };
        this.parent = parent;
        this.setKeymap(parent.settings.hotkeys);
    }
    MatchHandler.prototype.emit = function (keymap) {
        if (keymap) {
            this.parent.invokeCommand(keymap.commandID);
            return;
        }
        writeConsole('Fully matched an prefix, but without a corresponding Keymap. This is definitely a bug.');
    };
    MatchHandler.prototype.setKeymap = function (keymaps) {
        this.trie = Trie.from(keymaps || []);
        this.machine = new MatchMachine(this.trie);
    };
    MatchHandler.prototype.findMatchingKeymaps = function (presses) {
        var matches = this.trie.bestMatch(presses);
        return matches ? matches.leafValues() : [];
    };
    return MatchHandler;
}());
// endregion
// region Recording of new keymaps
var RecordingState;
(function (RecordingState) {
    RecordingState[RecordingState["EmptySequence"] = 0] = "EmptySequence";
    RecordingState[RecordingState["FirstKey"] = 1] = "FirstKey";
    RecordingState[RecordingState["AddedKeys"] = 2] = "AddedKeys";
    RecordingState[RecordingState["WaitingInput"] = 3] = "WaitingInput";
    RecordingState[RecordingState["DeletedKey"] = 4] = "DeletedKey";
    RecordingState[RecordingState["PendingAddition"] = 5] = "PendingAddition";
    RecordingState[RecordingState["PendingDeletion"] = 6] = "PendingDeletion";
    RecordingState[RecordingState["FinishedMapping"] = 7] = "FinishedMapping";
})(RecordingState || (RecordingState = {}));
var PendingChoice;
(function (PendingChoice) {
    PendingChoice[PendingChoice["KeepLiteral"] = 0] = "KeepLiteral";
    PendingChoice[PendingChoice["DiscardLiteral"] = 1] = "DiscardLiteral";
    PendingChoice[PendingChoice["DeletePrevious"] = 2] = "DeletePrevious";
    PendingChoice[PendingChoice["Finish"] = 3] = "Finish";
    PendingChoice[PendingChoice["Unknown"] = 4] = "Unknown";
})(PendingChoice || (PendingChoice = {}));
var RecordingMachine = /** @class */ (function () {
    function RecordingMachine() {
        var _this = this;
        this.advance = function (keyPress) {
            var classification = keyPress.kind();
            if (classification === PressKind.ModifierOnly) {
                return _this.currentState;
            }
            if (_this.currentState === RecordingState.FinishedMapping) {
                // Explicitly state that it can be re-started without loss.
                _this.currentState = RecordingState.WaitingInput;
                return _this.advance(keyPress);
            }
            if (_this.currentState === RecordingState.PendingAddition ||
                _this.currentState === RecordingState.PendingDeletion) {
                var previousLiteral = _this.currentSequence.pop();
                var action = _this.interpretAction(keyPress);
                switch (action) {
                    case PendingChoice.KeepLiteral:
                        _this.currentSequence.push(previousLiteral);
                        _this.currentState = RecordingState.AddedKeys;
                        break;
                    case PendingChoice.DiscardLiteral:
                        _this.currentState = RecordingState.WaitingInput;
                        break;
                    case PendingChoice.DeletePrevious:
                        _this.currentSequence.pop();
                        _this.currentState = RecordingState.DeletedKey;
                        break;
                    case PendingChoice.Finish:
                        _this.currentState = RecordingState.FinishedMapping;
                        break;
                    default:
                        _this.currentSequence.push(previousLiteral);
                        break;
                }
            }
            else {
                _this.currentSequence.push(keyPress);
                if (classification === PressKind.SpecialKey) {
                    _this.currentState =
                        keyPress.key === 'Enter'
                            ? RecordingState.PendingAddition
                            : RecordingState.PendingDeletion;
                }
                else {
                    _this.currentState =
                        _this.currentSequence.length === 1
                            ? RecordingState.FirstKey
                            : RecordingState.AddedKeys;
                }
            }
            return _this.currentState;
        };
        this.presses = function () {
            return _this.currentSequence;
        };
        this.documentRepresentation = function () {
            return _this.presses().map(function (press) { return press.kbd(); });
        };
        this.currentState = RecordingState.EmptySequence;
        this.currentSequence = [];
    }
    RecordingMachine.prototype.interpretAction = function (keypress) {
        if (keypress.ctrl && keypress.alt && keypress.key === 'Enter') {
            return PendingChoice.Finish;
        }
        if (keypress.key === 'Enter') {
            return PendingChoice.KeepLiteral;
        }
        else if (keypress.key === 'Backspace' &&
            this.currentState === RecordingState.PendingDeletion) {
            return PendingChoice.DeletePrevious;
        }
        else if (keypress.key === 'Backspace' &&
            this.currentState === RecordingState.PendingAddition) {
            return PendingChoice.DiscardLiteral;
        }
        return PendingChoice.Unknown;
    };
    return RecordingMachine;
}());
var RecordingModal = /** @class */ (function (_super) {
    __extends(RecordingModal, _super);
    function RecordingModal(parent, commandId) {
        var _this = _super.call(this, parent.app) || this;
        _this.onOpen = function () {
            _this.renderContent(_this.registerMachine.documentRepresentation());
            document.addEventListener('keydown', _this.handleKeyDown);
        };
        _this.onClose = function () {
            document.removeEventListener('keydown', _this.handleKeyDown);
            _this.parent.display();
        };
        _this.handleKeyDown = function (event) {
            event.preventDefault();
            var keyPress = KeyPress.fromEvent(event);
            var registerState = _this.registerMachine.advance(keyPress);
            _this.currentSequence = _this.registerMachine.presses();
            writeConsole("An keypress resulted in " + RecordingState[registerState] + " state.");
            switch (registerState) {
                case RecordingState.EmptySequence:
                case RecordingState.WaitingInput:
                case RecordingState.FirstKey:
                case RecordingState.DeletedKey:
                case RecordingState.AddedKeys:
                    _this.renderNormally();
                    return;
                case RecordingState.PendingDeletion:
                case RecordingState.PendingAddition:
                    _this.renderPending(registerState);
                    return;
                case RecordingState.FinishedMapping:
                    _this.saveSequence();
                    return;
            }
        };
        _this.renderContent = function (inKeySequence, inAdditionalContent) {
            var _a;
            var elements = inKeySequence || [];
            var additionalContent = inAdditionalContent || [];
            _this.contentEl.empty();
            var command = document.createElement('kbd');
            command.setText(_this.commandId);
            var header = document.createElement('h3');
            header.setText('Adding keymap for command ');
            header.appendChild(command);
            var introText = document.createElement('div');
            introText.addClass('setting-hotkey');
            introText.style.overflow = 'auto';
            if (elements.length === 0) {
                var prompt_1 = document.createElement('span');
                prompt_1.setText('Waiting for keyboard input.');
                introText.appendChild(prompt_1);
            }
            else {
                introText.append.apply(introText, __spread(elements));
            }
            _this.contentEl.appendChild(header);
            _this.contentEl.appendChild(introText);
            if (additionalContent) {
                (_a = _this.contentEl).append.apply(_a, __spread(additionalContent));
            }
            new obsidian.Setting(_this.contentEl).addButton(function (button) {
                button.setButtonText('Save');
                button.onClick(function () {
                    _this.saveSequence();
                });
            });
        };
        _this.saveSequence = function () {
            var conflicts = _this.parent.conflicts(_this.currentSequence);
            if (conflicts.length >= 1) {
                // todo handle this properly
                createNotice('There are conflicts with your keyPresses!');
            }
            else {
                var newKeyMap = new KeyMap(_this.commandId, _this.currentSequence);
                _this.parent.addKeymap(newKeyMap);
                var sequenceRepr = newKeyMap.sequence
                    .map(function (key) { return key.text(); })
                    .join(' => ');
                createNotice("Command  " + _this.commandId + "\n           can now be invoked by " + sequenceRepr);
                _this.close();
            }
        };
        _this.renderNormally = function () {
            _this.renderContent(_this.registerMachine.documentRepresentation());
        };
        _this.renderPending = function (mappingState) {
            // Inplace mutation :(
            var elements = _this.registerMachine.documentRepresentation();
            var lastElement = elements[elements.length - 1];
            lastElement.style.opacity = '0.5';
            var enter = KeyPress.just('Enter').kbd();
            enter.style.borderColor = 'green';
            var backspace = KeyPress.just('Backspace').kbd();
            backspace.style.borderColor = 'red';
            var ctrlAltEnter = KeyPress.ctrlAlt('Enter').kbd();
            var pressLiteral = lastElement.cloneNode(true);
            pressLiteral.style.opacity = '1';
            var discardOrRemoves = mappingState === RecordingState.PendingAddition
                ? ' will discard this input.'
                : ' will delete the previous input.';
            var confirmText = document.createElement('p');
            confirmText.append('Did you mean literal ', pressLiteral, '?', document.createElement('br'), enter, ' will add it to the sequence.', document.createElement('br'), backspace, discardOrRemoves, document.createElement('br'), ctrlAltEnter, ' will discard pending changes and complete.');
            _this.renderContent(elements, [confirmText]);
        };
        _this.parent = parent;
        _this.commandId = commandId;
        _this.registerMachine = new RecordingMachine();
        _this.currentSequence = [];
        return _this;
    }
    return RecordingModal;
}(obsidian.Modal));
var CommandModal = /** @class */ (function (_super) {
    __extends(CommandModal, _super);
    function CommandModal(parent) {
        var _this = _super.call(this, parent.app) || this;
        _this.parent = parent;
        return _this;
    }
    CommandModal.prototype.onOpen = function () {
        var _this = this;
        var title = document.createElement('h3');
        title.setText('Leader Hotkeys: pick a command to create a keymap.');
        this.contentEl.appendChild(title);
        var setting = new obsidian.Setting(this.contentEl);
        setting.addDropdown(function (dropdown) {
            var e_4, _a;
            dropdown.selectEl.addClass('leader-hotkeys-command');
            try {
                for (var _b = __values(_this.parent.obsidianCommands()), _c = _b.next(); !_c.done; _c = _b.next()) {
                    var command = _c.value;
                    dropdown.addOption(command.id, command.name);
                }
            }
            catch (e_4_1) { e_4 = { error: e_4_1 }; }
            finally {
                try {
                    if (_c && !_c.done && (_a = _b.return)) _a.call(_b);
                }
                finally { if (e_4) throw e_4.error; }
            }
            var placeHolder = new Option('Select a Command', 'placeholder', true);
            placeHolder.setAttribute('disabled', 'true');
            placeHolder.setAttribute('selected', 'true');
            placeHolder.setAttribute('hidden', 'true');
            dropdown.selectEl.append(placeHolder);
            dropdown.setValue('placeholder');
            dropdown.onChange(function (selectedId) {
                _this.commandId = selectedId;
            });
            dropdown.selectEl.focus();
        });
        setting.addButton(function (button) {
            button.setButtonText('OK');
            button.onClick(function () {
                if (_this.commandId === null ||
                    _this.commandId === undefined ||
                    _this.commandId === '') {
                    createNotice('Select a command to register');
                    return;
                }
                var registerer = new RecordingModal(_this.parent, _this.commandId);
                registerer.open();
                _this.close();
            });
        });
    };
    return CommandModal;
}(obsidian.Modal));
// endregion
var LeaderSettingsTab = /** @class */ (function (_super) {
    __extends(LeaderSettingsTab, _super);
    function LeaderSettingsTab(plugin) {
        var _this = _super.call(this, plugin.app, plugin) || this;
        _this.plugin = plugin;
        _this.app = plugin.app;
        return _this;
    }
    LeaderSettingsTab.prototype.display = function () {
        var _this = this;
        this.refreshCommands();
        var containerEl = this.containerEl;
        containerEl.empty();
        containerEl.createEl('h2', { text: 'Leader Hotkeys Plugin - Settings' });
        containerEl.createEl('h3', { text: 'Existing Hotkeys' });
        for (var i = 0; i < this.currentKeymaps().length; i++) {
            this.displayExisting(i);
        }
        new obsidian.Setting(containerEl).addButton(function (button) {
            button.setButtonText('New Keymap').onClick(function () {
                new CommandModal(_this).open();
            });
        });
    };
    LeaderSettingsTab.prototype.refreshCommands = function () {
        this.commands = listCommands(this.app);
    };
    LeaderSettingsTab.prototype.conflicts = function (keyPresses) {
        // todo validate properly
        return this.plugin.findMatchingKeymaps(keyPresses) || [];
    };
    LeaderSettingsTab.prototype.obsidianCommands = function () {
        return this.commands;
    };
    LeaderSettingsTab.prototype.addKeymap = function (keymap) {
        writeConsole("Adding keymap: " + keymap.text());
        var newHotkeys = __spread(this.currentKeymaps()).concat(keymap);
        this.saveKeymap(newHotkeys);
    };
    LeaderSettingsTab.prototype.removeKeymap = function (positionId) {
        var currentHotkeys = this.currentKeymaps();
        var toRemove = currentHotkeys[positionId];
        writeConsole("Removing keymap: " + toRemove.text());
        var newKeymap = [];
        for (var i = 0; i < currentHotkeys.length; i++) {
            if (i !== positionId) {
                newKeymap.push(currentHotkeys[i]);
            }
        }
        this.saveKeymap(newKeymap);
    };
    LeaderSettingsTab.prototype.updateKeymap = function (positionId, keyMap) {
        writeConsole("Updating keymap at position " + positionId + ": " + keyMap.text());
        var keyMaps = __spread(this.currentKeymaps());
        keyMaps[positionId] = keyMap;
        this.saveKeymap(keyMaps);
    };
    LeaderSettingsTab.prototype.saveKeymap = function (keymaps) {
        this.plugin.persistKeymaps(keymaps);
    };
    LeaderSettingsTab.prototype.displayExisting = function (positionId) {
        var _this = this;
        var containerEl = this.containerEl;
        var thisKeymap = this.currentKeymaps()[positionId];
        var setting = new obsidian.Setting(containerEl);
        setting.addDropdown(function (dropdown) {
            var e_5, _a;
            try {
                for (var _b = __values(_this.commands), _c = _b.next(); !_c.done; _c = _b.next()) {
                    var command = _c.value;
                    dropdown.addOption(command.id, command.name);
                }
            }
            catch (e_5_1) { e_5 = { error: e_5_1 }; }
            finally {
                try {
                    if (_c && !_c.done && (_a = _b.return)) _a.call(_b);
                }
                finally { if (e_5) throw e_5.error; }
            }
            dropdown.onChange(function (newCommand) {
                var newKeyMap = KeyMap.of(thisKeymap);
                newKeyMap.commandID = newCommand;
                _this.updateKeymap(positionId, newKeyMap);
            });
            dropdown.setValue(thisKeymap.commandID);
            dropdown.selectEl.addClass('leader-hotkeys-command');
        });
        setting.addExtraButton(function (button) {
            button
                .setIcon('cross')
                .setTooltip('Delete shortcut')
                .extraSettingsEl.addClass('leader-hotkeys-delete');
            button.onClick(function () {
                _this.removeKeymap(positionId);
                _this.display();
            });
        });
        setting.infoEl.remove();
        var settingControl = setting.settingEl.children[0];
        var keySetter = document.createElement('div');
        keySetter.addClass('setting-hotkey');
        var kbds = thisKeymap.sequence.map(function (press) { return press.kbd(); });
        keySetter.append.apply(keySetter, __spread(kbds));
        keySetter.addEventListener('click', function (_) {
            return new RecordingModal(_this, thisKeymap.commandID).open();
        });
        settingControl.insertBefore(keySetter, settingControl.children[0]);
        var appendText = document.createElement('span');
        appendText.addClass('leader-hotkeys-setting-append-text');
        appendText.setText('to');
        settingControl.insertBefore(appendText, settingControl.children[1]);
    };
    LeaderSettingsTab.prototype.currentSettings = function () {
        return this.plugin.settings;
    };
    LeaderSettingsTab.prototype.currentKeymaps = function () {
        return this.currentSettings().hotkeys;
    };
    return LeaderSettingsTab;
}(obsidian.PluginSettingTab));
var LeaderHotkeys = /** @class */ (function (_super) {
    __extends(LeaderHotkeys, _super);
    function LeaderHotkeys() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.registerEventsAndCallbacks = function () { return __awaiter(_this, void 0, void 0, function () {
            var workspaceContainer, openModalCommand;
            var _this = this;
            return __generator(this, function (_a) {
                writeConsole('Registering necessary event callbacks');
                workspaceContainer = this.app.workspace.containerEl;
                this.registerDomEvent(workspaceContainer, 'keydown', this.matchHandler.handleKeyDown);
                writeConsole('Registered workspace "keydown" event callbacks.');
                openModalCommand = {
                    id: 'register-modal',
                    name: 'Open Register Modal',
                    callback: function () {
                        _this.settingsTab.refreshCommands();
                        new CommandModal(_this.settingsTab).open();
                    },
                };
                this.addCommand(openModalCommand);
                writeConsole('Registered open modal command');
                return [2 /*return*/];
            });
        }); };
        _this.loadSavedSettings = function () { return __awaiter(_this, void 0, void 0, function () {
            var savedSettings;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        writeConsole('Loading previously saved settings.');
                        return [4 /*yield*/, this.loadData()];
                    case 1:
                        savedSettings = (_a.sent()) || {};
                        try {
                            savedSettings.hotkeys = (savedSettings.hotkeys || []).map(KeyMap.of);
                            this.settings = savedSettings;
                            writeConsole('Loaded previous settings.');
                        }
                        catch (err) {
                            writeConsole('A failure occured while parsing the saved settings.');
                            createNotice('A failure occured while loading the saved settings. Fallbacking to defaults.');
                            // todo : Retrocompatibility?
                            //  Harder than i thought since LeaderKey isn't saved here.
                            //  Would need to keep the old command ,
                            //  lookup the binding and convert it to the new one.
                            this.settings = defaultSettings;
                        }
                        this.matchHandler = new MatchHandler(this);
                        return [2 /*return*/];
                }
            });
        }); };
        return _this;
    }
    LeaderHotkeys.prototype.onload = function () {
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        writeConsole('Started Loading.');
                        return [4 /*yield*/, this.loadSavedSettings()];
                    case 1:
                        _a.sent();
                        return [4 /*yield*/, this.registerEventsAndCallbacks()];
                    case 2:
                        _a.sent();
                        this.settingsTab = new LeaderSettingsTab(this);
                        this.addSettingTab(this.settingsTab);
                        writeConsole('Registered Setting Tab.');
                        writeConsole('Finished Loading.');
                        return [2 /*return*/];
                }
            });
        });
    };
    LeaderHotkeys.prototype.onunload = function () {
        writeConsole('Unloading plugin.');
    };
    LeaderHotkeys.prototype.invokeCommand = function (commandID) {
        if (commandID) {
            // todo remove any typing
            var app = this.app;
            app.commands.executeCommandById(commandID);
        }
    };
    LeaderHotkeys.prototype.findMatchingKeymaps = function (presses) {
        return this.matchHandler.findMatchingKeymaps(presses);
    };
    LeaderHotkeys.prototype.persistKeymaps = function (newKeymaps) {
        var _this = this;
        this.settings.hotkeys = newKeymaps;
        this.saveData(this.settings)
            .then(function () {
            _this.matchHandler.setKeymap(newKeymaps);
        })
            .catch(function () {
            createNotice('Error while Saving Keymaps.');
        });
    };
    return LeaderHotkeys;
}(obsidian.Plugin));
// region consts and utils
var listCommands = function (app) {
    // todo remove any type
    var anyApp = app;
    var commands = anyApp.commands.commands;
    return Object.values(commands);
};
var interpretMatch = function (bestMatch) {
    if (!bestMatch) {
        return MatchKind.NoMatch;
    }
    if (bestMatch.isLeaf()) {
        return MatchKind.FullMatch;
    }
    return MatchKind.PartialMatch;
};
var defaultHotkeys = [
    new KeyMap('editor:focus-left', [KeyPress.ctrl('b'), KeyPress.just('h')]),
    new KeyMap('editor:focus-right', [KeyPress.ctrl('b'), KeyPress.just('l')]),
    new KeyMap('editor:focus-top', [KeyPress.ctrl('b'), KeyPress.just('k')]),
    new KeyMap('editor:focus-bottom', [KeyPress.ctrl('b'), KeyPress.just('j')]),
    new KeyMap('command-palette:open', [
        KeyPress.ctrl('q'),
        KeyPress.just('1'),
        KeyPress.just('2'),
        KeyPress.just('2'),
    ]),
    new KeyMap('command-palette:open', [
        KeyPress.ctrl(' '),
        KeyPress.just('p'),
        KeyPress.just('a'),
        KeyPress.just('l'),
        KeyPress.just('l'),
        KeyPress.just('e'),
        KeyPress.just('t'),
        KeyPress.just('t'),
        KeyPress.just('e'),
    ]),
];
var defaultSettings = {
    hotkeys: defaultHotkeys,
};
var writeConsole = function (message) {
    console.debug(" Leader Hotkeys: " + message);
};
var createNotice = function (message) {
    new obsidian.Notice('Leader Hotkeys: ' + message);
};
// endregion

module.exports = LeaderHotkeys;


/* nosourcemap */