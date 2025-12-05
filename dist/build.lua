--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        local value = nil
        if (select("#", ...) > 0) then value = module(...) else value = module(file) end
        ____moduleCache[file] = { value = value }
        return value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__ArrayAt(self, relativeIndex)
    local absoluteIndex = relativeIndex < 0 and #self + relativeIndex or relativeIndex
    if absoluteIndex >= 0 and absoluteIndex < #self then
        return self[absoluteIndex + 1]
    end
    return nil
end

local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value) == nil)
end

local function __TS__ArrayConcat(self, ...)
    local items = {...}
    local result = {}
    local len = 0
    for i = 1, #self do
        len = len + 1
        result[len] = self[i]
    end
    for i = 1, #items do
        local item = items[i]
        if __TS__ArrayIsArray(item) then
            for j = 1, #item do
                len = len + 1
                result[len] = item[j]
            end
        else
            len = len + 1
            result[len] = item
        end
    end
    return result
end

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        asyncDispose = __TS__Symbol("Symbol.asyncDispose"),
        dispose = __TS__Symbol("Symbol.dispose"),
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

local function __TS__ArrayEvery(self, callbackfn, thisArg)
    for i = 1, #self do
        if not callbackfn(thisArg, self[i], i - 1, self) then
            return false
        end
    end
    return true
end

local function __TS__ArrayFill(self, value, start, ____end)
    local relativeStart = start or 0
    local relativeEnd = ____end or #self
    if relativeStart < 0 then
        relativeStart = relativeStart + #self
    end
    if relativeEnd < 0 then
        relativeEnd = relativeEnd + #self
    end
    do
        local i = relativeStart
        while i < relativeEnd do
            self[i + 1] = value
            i = i + 1
        end
    end
    return self
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local function __TS__ArrayFind(self, predicate, thisArg)
    for i = 1, #self do
        local elem = self[i]
        if predicate(thisArg, elem, i - 1, self) then
            return elem
        end
    end
    return nil
end

local function __TS__ArrayFindIndex(self, callbackFn, thisArg)
    for i = 1, #self do
        if callbackFn(thisArg, self[i], i - 1, self) then
            return i - 1
        end
    end
    return -1
end

local __TS__Iterator
do
    local function iteratorGeneratorStep(self)
        local co = self.____coroutine
        local status, value = coroutine.resume(co)
        if not status then
            error(value, 0)
        end
        if coroutine.status(co) == "dead" then
            return
        end
        return true, value
    end
    local function iteratorIteratorStep(self)
        local result = self:next()
        if result.done then
            return
        end
        return true, result.value
    end
    local function iteratorStringStep(self, index)
        index = index + 1
        if index > #self then
            return
        end
        return index, string.sub(self, index, index)
    end
    function __TS__Iterator(iterable)
        if type(iterable) == "string" then
            return iteratorStringStep, iterable, 0
        elseif iterable.____coroutine ~= nil then
            return iteratorGeneratorStep, iterable
        elseif iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return iteratorIteratorStep, iterator
        else
            return ipairs(iterable)
        end
    end
end

local __TS__ArrayFrom
do
    local function arrayLikeStep(self, index)
        index = index + 1
        if index > self.length then
            return
        end
        return index, self[index]
    end
    local function arrayLikeIterator(arr)
        if type(arr.length) == "number" then
            return arrayLikeStep, arr, 0
        end
        return __TS__Iterator(arr)
    end
    function __TS__ArrayFrom(arrayLike, mapFn, thisArg)
        local result = {}
        if mapFn == nil then
            for ____, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = v
            end
        else
            local i = 0
            for ____, v in arrayLikeIterator(arrayLike) do
                local ____mapFn_3 = mapFn
                local ____thisArg_1 = thisArg
                local ____v_2 = v
                local ____i_0 = i
                i = ____i_0 + 1
                result[#result + 1] = ____mapFn_3(____thisArg_1, ____v_2, ____i_0)
            end
        end
        return result
    end
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k + 1, len do
        if self[i] == searchElement then
            return true
        end
    end
    return false
end

local function __TS__ArrayIndexOf(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    if len == 0 then
        return -1
    end
    if fromIndex >= len then
        return -1
    end
    if fromIndex < 0 then
        fromIndex = len + fromIndex
        if fromIndex < 0 then
            fromIndex = 0
        end
    end
    for i = fromIndex + 1, len do
        if self[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

local function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local parts = {}
    for i = 1, #self do
        parts[i] = tostring(self[i])
    end
    return table.concat(parts, separator)
end

local function __TS__ArrayMap(self, callbackfn, thisArg)
    local result = {}
    for i = 1, #self do
        result[i] = callbackfn(thisArg, self[i], i - 1, self)
    end
    return result
end

local function __TS__ArrayPush(self, ...)
    local items = {...}
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__ArrayPushArray(self, items)
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__ArrayReduce(self, callbackFn, ...)
    local len = #self
    local k = 0
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, len do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReduceRight(self, callbackFn, ...)
    local len = #self
    local k = len - 1
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, 1, -1 do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReverse(self)
    local i = 1
    local j = #self
    while i < j do
        local temp = self[j]
        self[j] = self[i]
        self[i] = temp
        i = i + 1
        j = j - 1
    end
    return self
end

local function __TS__ArrayUnshift(self, ...)
    local items = {...}
    local numItemsToInsert = #items
    if numItemsToInsert == 0 then
        return #self
    end
    for i = #self, 1, -1 do
        self[i + numItemsToInsert] = self[i]
    end
    for i = 1, numItemsToInsert do
        self[i] = items[i]
    end
    return #self
end

local function __TS__ArraySort(self, compareFn)
    if compareFn ~= nil then
        table.sort(
            self,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(self)
    end
    return self
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    first = first or 0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    last = last or len
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local function __TS__ArraySome(self, callbackfn, thisArg)
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            return true
        end
    end
    return false
end

local function __TS__ArraySplice(self, ...)
    local args = {...}
    local len = #self
    local actualArgumentCount = __TS__CountVarargs(...)
    local start = args[1]
    local deleteCount = args[2]
    if start < 0 then
        start = len + start
        if start < 0 then
            start = 0
        end
    elseif start > len then
        start = len
    end
    local itemCount = actualArgumentCount - 2
    if itemCount < 0 then
        itemCount = 0
    end
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - start
    else
        actualDeleteCount = deleteCount or 0
        if actualDeleteCount < 0 then
            actualDeleteCount = 0
        end
        if actualDeleteCount > len - start then
            actualDeleteCount = len - start
        end
    end
    local out = {}
    for k = 1, actualDeleteCount do
        local from = start + k
        if self[from] ~= nil then
            out[k] = self[from]
        end
    end
    if itemCount < actualDeleteCount then
        for k = start + 1, len - actualDeleteCount do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
        for k = len - actualDeleteCount + itemCount + 1, len do
            self[k] = nil
        end
    elseif itemCount > actualDeleteCount then
        for k = len - actualDeleteCount, start + 1, -1 do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
    end
    local j = start + 1
    for i = 3, actualArgumentCount do
        self[j] = args[i]
        j = j + 1
    end
    for k = #self, len - actualDeleteCount + itemCount + 1, -1 do
        self[k] = nil
    end
    return out
end

local function __TS__ArrayToObject(self)
    local object = {}
    for i = 1, #self do
        object[i - 1] = self[i]
    end
    return object
end

local function __TS__ArrayFlat(self, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = self[i]
        if depth > 0 and __TS__ArrayIsArray(value) then
            local toAdd
            if depth == 1 then
                toAdd = value
            else
                toAdd = __TS__ArrayFlat(value, depth - 1)
            end
            for j = 1, #toAdd do
                local val = toAdd[j]
                len = len + 1
                result[len] = val
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArrayFlatMap(self, callback, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = callback(thisArg, self[i], i - 1, self)
        if __TS__ArrayIsArray(value) then
            for j = 1, #value do
                len = len + 1
                result[len] = value[j]
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArraySetLength(self, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    for i = length + 1, #self do
        self[i] = nil
    end
    return length
end

local __TS__Unpack = table.unpack or unpack

local function __TS__ArrayToReversed(self)
    local copy = {__TS__Unpack(self)}
    __TS__ArrayReverse(copy)
    return copy
end

local function __TS__ArrayToSorted(self, compareFn)
    local copy = {__TS__Unpack(self)}
    __TS__ArraySort(copy, compareFn)
    return copy
end

local function __TS__ArrayToSpliced(self, start, deleteCount, ...)
    local copy = {__TS__Unpack(self)}
    __TS__ArraySplice(copy, start, deleteCount, ...)
    return copy
end

local function __TS__ArrayWith(self, index, value)
    local copy = {__TS__Unpack(self)}
    copy[index + 1] = value
    return copy
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local __TS__Promise
do
    local function makeDeferredPromiseFactory()
        local resolve
        local reject
        local function executor(____, res, rej)
            resolve = res
            reject = rej
        end
        return function()
            local promise = __TS__New(__TS__Promise, executor)
            return promise, resolve, reject
        end
    end
    local makeDeferredPromise = makeDeferredPromiseFactory()
    local function isPromiseLike(value)
        return __TS__InstanceOf(value, __TS__Promise)
    end
    local function doNothing(self)
    end
    local ____pcall = _G.pcall
    __TS__Promise = __TS__Class()
    __TS__Promise.name = "__TS__Promise"
    function __TS__Promise.prototype.____constructor(self, executor)
        self.state = 0
        self.fulfilledCallbacks = {}
        self.rejectedCallbacks = {}
        self.finallyCallbacks = {}
        local success, ____error = ____pcall(
            executor,
            nil,
            function(____, v) return self:resolve(v) end,
            function(____, err) return self:reject(err) end
        )
        if not success then
            self:reject(____error)
        end
    end
    function __TS__Promise.resolve(value)
        if __TS__InstanceOf(value, __TS__Promise) then
            return value
        end
        local promise = __TS__New(__TS__Promise, doNothing)
        promise.state = 1
        promise.value = value
        return promise
    end
    function __TS__Promise.reject(reason)
        local promise = __TS__New(__TS__Promise, doNothing)
        promise.state = 2
        promise.rejectionReason = reason
        return promise
    end
    __TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
        local promise, resolve, reject = makeDeferredPromise()
        self:addCallbacks(
            onFulfilled and self:createPromiseResolvingCallback(onFulfilled, resolve, reject) or resolve,
            onRejected and self:createPromiseResolvingCallback(onRejected, resolve, reject) or reject
        )
        return promise
    end
    function __TS__Promise.prototype.addCallbacks(self, fulfilledCallback, rejectedCallback)
        if self.state == 1 then
            return fulfilledCallback(nil, self.value)
        end
        if self.state == 2 then
            return rejectedCallback(nil, self.rejectionReason)
        end
        local ____self_fulfilledCallbacks_0 = self.fulfilledCallbacks
        ____self_fulfilledCallbacks_0[#____self_fulfilledCallbacks_0 + 1] = fulfilledCallback
        local ____self_rejectedCallbacks_1 = self.rejectedCallbacks
        ____self_rejectedCallbacks_1[#____self_rejectedCallbacks_1 + 1] = rejectedCallback
    end
    function __TS__Promise.prototype.catch(self, onRejected)
        return self["then"](self, nil, onRejected)
    end
    function __TS__Promise.prototype.finally(self, onFinally)
        if onFinally then
            local ____self_finallyCallbacks_2 = self.finallyCallbacks
            ____self_finallyCallbacks_2[#____self_finallyCallbacks_2 + 1] = onFinally
            if self.state ~= 0 then
                onFinally(nil)
            end
        end
        return self
    end
    function __TS__Promise.prototype.resolve(self, value)
        if isPromiseLike(value) then
            return value:addCallbacks(
                function(____, v) return self:resolve(v) end,
                function(____, err) return self:reject(err) end
            )
        end
        if self.state == 0 then
            self.state = 1
            self.value = value
            return self:invokeCallbacks(self.fulfilledCallbacks, value)
        end
    end
    function __TS__Promise.prototype.reject(self, reason)
        if self.state == 0 then
            self.state = 2
            self.rejectionReason = reason
            return self:invokeCallbacks(self.rejectedCallbacks, reason)
        end
    end
    function __TS__Promise.prototype.invokeCallbacks(self, callbacks, value)
        local callbacksLength = #callbacks
        local finallyCallbacks = self.finallyCallbacks
        local finallyCallbacksLength = #finallyCallbacks
        if callbacksLength ~= 0 then
            for i = 1, callbacksLength - 1 do
                callbacks[i](callbacks, value)
            end
            if finallyCallbacksLength == 0 then
                return callbacks[callbacksLength](callbacks, value)
            end
            callbacks[callbacksLength](callbacks, value)
        end
        if finallyCallbacksLength ~= 0 then
            for i = 1, finallyCallbacksLength - 1 do
                finallyCallbacks[i](finallyCallbacks)
            end
            return finallyCallbacks[finallyCallbacksLength](finallyCallbacks)
        end
    end
    function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
        return function(____, value)
            local success, resultOrError = ____pcall(f, nil, value)
            if not success then
                return reject(nil, resultOrError)
            end
            return self:handleCallbackValue(resultOrError, resolve, reject)
        end
    end
    function __TS__Promise.prototype.handleCallbackValue(self, value, resolve, reject)
        if isPromiseLike(value) then
            local nextpromise = value
            if nextpromise.state == 1 then
                return resolve(nil, nextpromise.value)
            elseif nextpromise.state == 2 then
                return reject(nil, nextpromise.rejectionReason)
            else
                return nextpromise:addCallbacks(resolve, reject)
            end
        else
            return resolve(nil, value)
        end
    end
end

local __TS__AsyncAwaiter, __TS__Await
do
    local ____coroutine = _G.coroutine or ({})
    local cocreate = ____coroutine.create
    local coresume = ____coroutine.resume
    local costatus = ____coroutine.status
    local coyield = ____coroutine.yield
    function __TS__AsyncAwaiter(generator)
        return __TS__New(
            __TS__Promise,
            function(____, resolve, reject)
                local fulfilled, step, resolved, asyncCoroutine
                function fulfilled(self, value)
                    local success, resultOrError = coresume(asyncCoroutine, value)
                    if success then
                        return step(resultOrError)
                    end
                    return reject(nil, resultOrError)
                end
                function step(result)
                    if resolved then
                        return
                    end
                    if costatus(asyncCoroutine) == "dead" then
                        return resolve(nil, result)
                    end
                    return __TS__Promise.resolve(result):addCallbacks(fulfilled, reject)
                end
                resolved = false
                asyncCoroutine = cocreate(generator)
                local success, resultOrError = coresume(
                    asyncCoroutine,
                    function(____, v)
                        resolved = true
                        return __TS__Promise.resolve(v):addCallbacks(resolve, reject)
                    end
                )
                if success then
                    return step(resultOrError)
                else
                    return reject(nil, resultOrError)
                end
            end
        )
    end
    function __TS__Await(thing)
        return coyield(thing)
    end
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local function __TS__CloneDescriptor(____bindingPattern0)
    local value
    local writable
    local set
    local get
    local configurable
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    configurable = ____bindingPattern0.configurable
    get = ____bindingPattern0.get
    set = ____bindingPattern0.set
    writable = ____bindingPattern0.writable
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = get ~= nil or set ~= nil
    local hasValueOrWritableAttribute = writable ~= nil or value ~= nil
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

local function __TS__Decorate(self, originalValue, decorators, context)
    local result = originalValue
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator ~= nil then
                local ____decorator_result_0 = decorator(self, result, context)
                if ____decorator_result_0 == nil then
                    ____decorator_result_0 = result
                end
                result = ____decorator_result_0
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end

local function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

local __TS__DescriptorGet
do
    local getmetatable = _G.getmetatable
    local ____rawget = _G.rawget
    function __TS__DescriptorGet(self, metatable, key)
        while metatable do
            local rawResult = ____rawget(metatable, key)
            if rawResult ~= nil then
                return rawResult
            end
            local descriptors = ____rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor ~= nil then
                    if descriptor.get then
                        return descriptor.get(self)
                    end
                    return descriptor.value
                end
            end
            metatable = getmetatable(metatable)
        end
    end
end

local __TS__DescriptorSet
do
    local getmetatable = _G.getmetatable
    local ____rawget = _G.rawget
    local rawset = _G.rawset
    function __TS__DescriptorSet(self, metatable, key, value)
        while metatable do
            local descriptors = ____rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor ~= nil then
                    if descriptor.set then
                        descriptor.set(self, value)
                    else
                        if descriptor.writable == false then
                            error(
                                ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                                0
                            )
                        end
                        descriptor.value = value
                    end
                    return
                end
            end
            metatable = getmetatable(metatable)
        end
        rawset(self, key, value)
    end
end

local __TS__SetDescriptor
do
    local getmetatable = _G.getmetatable
    local function descriptorIndex(self, key)
        return __TS__DescriptorGet(
            self,
            getmetatable(self),
            key
        )
    end
    local function descriptorNewIndex(self, key, value)
        return __TS__DescriptorSet(
            self,
            getmetatable(self),
            key,
            value
        )
    end
    function __TS__SetDescriptor(target, key, desc, isPrototype)
        if isPrototype == nil then
            isPrototype = false
        end
        local ____isPrototype_0
        if isPrototype then
            ____isPrototype_0 = target
        else
            ____isPrototype_0 = getmetatable(target)
        end
        local metatable = ____isPrototype_0
        if not metatable then
            metatable = {}
            setmetatable(target, metatable)
        end
        local value = rawget(target, key)
        if value ~= nil then
            rawset(target, key, nil)
        end
        if not rawget(metatable, "_descriptors") then
            metatable._descriptors = {}
        end
        metatable._descriptors[key] = __TS__CloneDescriptor(desc)
        metatable.__index = descriptorIndex
        metatable.__newindex = descriptorNewIndex
    end
end

local function __TS__DecorateLegacy(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator ~= nil then
                local oldResult = result
                if key == nil then
                    result = decorator(nil, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(nil, target, key, descriptor) or descriptor
                    local isSimpleValue = desc.configurable == true and desc.writable == true and not desc.get and not desc.set
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(nil, target, key, desc)
                else
                    result = decorator(nil, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(nil, target, key, paramIndex) end
end

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        if debug == nil then
            return nil
        end
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        elseif _VERSION == "Lua 5.1" then
            return string.sub(
                debug.traceback("", level),
                2
            )
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0")
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (description .. "\n") .. tostring(self.stack)
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_1 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, __TS__New)
        local metatable = getmetatable(self)
        if metatable and not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        return self.message ~= "" and (self.name .. ": ") .. self.message or self.name
    end
    Error = ____initErrorClass_1(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_3 = initErrorClass
        local ____class_2 = __TS__Class()
        ____class_2.name = ____class_2.name
        __TS__ClassExtends(____class_2, Error)
        function ____class_2.prototype.____constructor(self, ...)
            ____class_2.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_3(nil, ____class_2, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

local function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

local function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(__TS__StringAccess(iterable, index))
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

local function __TS__FunctionBind(fn, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        __TS__ArrayUnshift(
            args,
            __TS__Unpack(boundArgs)
        )
        return fn(__TS__Unpack(args))
    end
end

local __TS__Generator
do
    local function generatorIterator(self)
        return self
    end
    local function generatorNext(self, ...)
        local co = self.____coroutine
        if coroutine.status(co) == "dead" then
            return {done = true}
        end
        local status, value = coroutine.resume(co, ...)
        if not status then
            error(value, 0)
        end
        return {
            value = value,
            done = coroutine.status(co) == "dead"
        }
    end
    function __TS__Generator(fn)
        return function(...)
            local args = {...}
            local argsLength = __TS__CountVarargs(...)
            return {
                ____coroutine = coroutine.create(function() return fn(__TS__Unpack(args, 1, argsLength)) end),
                [Symbol.iterator] = generatorIterator,
                next = generatorNext
            }
        end
    end
end

local function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

local function __TS__LuaIteratorSpread(self, state, firstKey)
    local results = {}
    local key, value = self(state, firstKey)
    while key do
        results[#results + 1] = {key, value}
        key, value = self(state, key)
    end
    return __TS__Unpack(results)
end

local Map
do
    Map = __TS__Class()
    Map.name = "Map"
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            for ____, kvp in ipairs(array) do
                self:set(kvp[1], kvp[2])
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[key]
            local previous = self.previousKey[key]
            if next ~= nil and previous ~= nil then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next ~= nil then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous ~= nil then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[key] = nil
            self.previousKey[key] = nil
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return self.nextKey[key] ~= nil or self.lastKey == key
    end
    function Map.prototype.set(self, key, value)
        local isNewValue = not self:has(key)
        if isNewValue then
            self.size = self.size + 1
        end
        self.items[key] = value
        if self.firstKey == nil then
            self.firstKey = key
            self.lastKey = key
        elseif isNewValue then
            self.nextKey[self.lastKey] = key
            self.previousKey[key] = self.lastKey
            self.lastKey = key
        end
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, items[key]}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.values(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = items[key]}
                key = nextKey[key]
                return result
            end
        }
    end
    Map[Symbol.species] = Map
end

local function __TS__MapGroupBy(items, keySelector)
    local result = __TS__New(Map)
    local i = 0
    for ____, item in __TS__Iterator(items) do
        local key = keySelector(nil, item, i)
        if result:has(key) then
            local ____temp_0 = result:get(key)
            ____temp_0[#____temp_0 + 1] = item
        else
            result:set(key, {item})
        end
        i = i + 1
    end
    return result
end

local __TS__Match = string.match

local __TS__MathAtan2 = math.atan2 or math.atan

local __TS__MathModf = math.modf

local function __TS__NumberIsNaN(value)
    return value ~= value
end

local function __TS__MathSign(val)
    if __TS__NumberIsNaN(val) or val == 0 then
        return val
    end
    if val < 0 then
        return -1
    end
    return 1
end

local function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local function __TS__MathTrunc(val)
    if not __TS__NumberIsFinite(val) or val == 0 then
        return val
    end
    return val > 0 and math.floor(val) or math.ceil(val)
end

local function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return value and 1 or 0
    else
        return 0 / 0
    end
end

local function __TS__NumberIsInteger(value)
    return __TS__NumberIsFinite(value) and math.floor(value) == value
end

local function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = __TS__Match(numberString, "^%s*-?0[xX]")
            if hexMatch ~= nil then
                base = 16
                numberString = (__TS__Match(hexMatch, "-")) and "-" .. __TS__StringSubstring(numberString, #hexMatch) or __TS__StringSubstring(numberString, #hexMatch)
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local allowedDigits = base <= 10 and __TS__StringSubstring(parseIntBasePattern, 0, base) or __TS__StringSubstring(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
        local number = tonumber((__TS__Match(numberString, pattern)), base)
        if number == nil then
            return 0 / 0
        end
        if number >= 0 then
            return math.floor(number)
        else
            return math.ceil(number)
        end
    end
end

local function __TS__ParseFloat(numberString)
    local infinityMatch = __TS__Match(numberString, "^%s*(-?Infinity)")
    if infinityMatch ~= nil then
        return __TS__StringAccess(infinityMatch, 0) == "-" and -math.huge or math.huge
    end
    local number = tonumber((__TS__Match(numberString, "^%s*(-?%d+%.?%d*)")))
    return number or 0 / 0
end

local __TS__NumberToString
do
    local radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
    function __TS__NumberToString(self, radix)
        if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
            return tostring(self)
        end
        radix = math.floor(radix)
        if radix < 2 or radix > 36 then
            error("toString() radix argument must be between 2 and 36", 0)
        end
        local integer, fraction = __TS__MathModf(math.abs(self))
        local result = ""
        if radix == 8 then
            result = string.format("%o", integer)
        elseif radix == 16 then
            result = string.format("%x", integer)
        else
            repeat
                do
                    result = __TS__StringAccess(radixChars, integer % radix) .. result
                    integer = math.floor(integer / radix)
                end
            until not (integer ~= 0)
        end
        if fraction ~= 0 then
            result = result .. "."
            local delta = 1e-16
            repeat
                do
                    fraction = fraction * radix
                    delta = delta * radix
                    local digit = math.floor(fraction)
                    result = result .. __TS__StringAccess(radixChars, digit)
                    fraction = fraction - digit
                end
            until not (fraction >= delta)
        end
        if self < 0 then
            result = "-" .. result
        end
        return result
    end
end

local function __TS__NumberToFixed(self, fractionDigits)
    if math.abs(self) >= 1e+21 or self ~= self then
        return tostring(self)
    end
    local f = math.floor(fractionDigits or 0)
    if f < 0 or f > 99 then
        error("toFixed() digits argument must be between 0 and 99", 0)
    end
    return string.format(
        ("%." .. tostring(f)) .. "f",
        self
    )
end

local function __TS__ObjectDefineProperty(target, key, desc)
    local luaKey = type(key) == "number" and key + 1 or key
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = desc.get ~= nil or desc.set ~= nil
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        local ____desc_set_4 = desc.set
        local ____desc_get_5 = desc.get
        local ____desc_configurable_0 = desc.configurable
        if ____desc_configurable_0 == nil then
            ____desc_configurable_0 = valueExists
        end
        local ____desc_enumerable_1 = desc.enumerable
        if ____desc_enumerable_1 == nil then
            ____desc_enumerable_1 = valueExists
        end
        local ____desc_writable_2 = desc.writable
        if ____desc_writable_2 == nil then
            ____desc_writable_2 = valueExists
        end
        local ____temp_3
        if desc.value ~= nil then
            ____temp_3 = desc.value
        else
            ____temp_3 = value
        end
        descriptor = {
            set = ____desc_set_4,
            get = ____desc_get_5,
            configurable = ____desc_configurable_0,
            enumerable = ____desc_enumerable_1,
            writable = ____desc_writable_2,
            value = ____temp_3
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

local function __TS__ObjectEntries(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = {key, obj[key]}
    end
    return result
end

local function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

local function __TS__ObjectGroupBy(items, keySelector)
    local result = {}
    local i = 0
    for ____, item in __TS__Iterator(items) do
        local key = keySelector(nil, item, i)
        if result[key] ~= nil then
            local ____result_key_0 = result[key]
            ____result_key_0[#____result_key_0 + 1] = item
        else
            result[key] = {item}
        end
        i = i + 1
    end
    return result
end

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

local function __TS__ObjectValues(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = obj[key]
    end
    return result
end

local function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = item.value
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = item
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = data
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        reject(nil, reason)
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == 2 then
                results[i + 1] = {status = "rejected", reason = item.rejectionReason}
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = {status = "fulfilled", value = item}
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = {status = "fulfilled", value = data}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                rejections[#rejections + 1] = item.rejectionReason
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    if #pending == 0 then
        return __TS__Promise.reject("No promises to resolve with .any()")
    end
    local numResolved = 0
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, data)
                        resolve(nil, data)
                    end,
                    function(____, reason)
                        rejections[#rejections + 1] = reason
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(nil, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, value) return resolve(nil, value) end,
                    function(____, reason) return reject(nil, reason) end
                )
            end
        end
    )
end

local Set
do
    Set = __TS__Class()
    Set.name = "Set"
    function Set.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "Set"
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local array = values
            for ____, value in ipairs(array) do
                self:add(value)
            end
        end
    end
    function Set.prototype.add(self, value)
        local isNewValue = not self:has(value)
        if isNewValue then
            self.size = self.size + 1
        end
        if self.firstKey == nil then
            self.firstKey = value
            self.lastKey = value
        elseif isNewValue then
            self.nextKey[self.lastKey] = value
            self.previousKey[value] = self.lastKey
            self.lastKey = value
        end
        return self
    end
    function Set.prototype.clear(self)
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Set.prototype.delete(self, value)
        local contains = self:has(value)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[value]
            local previous = self.previousKey[value]
            if next ~= nil and previous ~= nil then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next ~= nil then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous ~= nil then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[value] = nil
            self.previousKey[value] = nil
        end
        return contains
    end
    function Set.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return self.nextKey[value] ~= nil or self.lastKey == value
    end
    Set.prototype[Symbol.iterator] = function(self)
        return self:values()
    end
    function Set.prototype.entries(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, key}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.values(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.union(self, other)
        local result = __TS__New(Set, self)
        for ____, item in __TS__Iterator(other) do
            result:add(item)
        end
        return result
    end
    function Set.prototype.intersection(self, other)
        local result = __TS__New(Set)
        for ____, item in __TS__Iterator(self) do
            if other:has(item) then
                result:add(item)
            end
        end
        return result
    end
    function Set.prototype.difference(self, other)
        local result = __TS__New(Set, self)
        for ____, item in __TS__Iterator(other) do
            result:delete(item)
        end
        return result
    end
    function Set.prototype.symmetricDifference(self, other)
        local result = __TS__New(Set, self)
        for ____, item in __TS__Iterator(other) do
            if self:has(item) then
                result:delete(item)
            else
                result:add(item)
            end
        end
        return result
    end
    function Set.prototype.isSubsetOf(self, other)
        for ____, item in __TS__Iterator(self) do
            if not other:has(item) then
                return false
            end
        end
        return true
    end
    function Set.prototype.isSupersetOf(self, other)
        for ____, item in __TS__Iterator(other) do
            if not self:has(item) then
                return false
            end
        end
        return true
    end
    function Set.prototype.isDisjointFrom(self, other)
        for ____, item in __TS__Iterator(self) do
            if other:has(item) then
                return false
            end
        end
        return true
    end
    Set[Symbol.species] = Set
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

local WeakMap
do
    WeakMap = __TS__Class()
    WeakMap.name = "WeakMap"
    function WeakMap.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "WeakMap"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self.items[value[1]] = value[2]
            end
        else
            for ____, kvp in ipairs(entries) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function WeakMap.prototype.delete(self, key)
        local contains = self:has(key)
        self.items[key] = nil
        return contains
    end
    function WeakMap.prototype.get(self, key)
        return self.items[key]
    end
    function WeakMap.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function WeakMap.prototype.set(self, key, value)
        self.items[key] = value
        return self
    end
    WeakMap[Symbol.species] = WeakMap
end

local WeakSet
do
    WeakSet = __TS__Class()
    WeakSet.name = "WeakSet"
    function WeakSet.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "WeakSet"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self.items[result.value] = true
            end
        else
            for ____, value in ipairs(values) do
                self.items[value] = true
            end
        end
    end
    function WeakSet.prototype.add(self, value)
        self.items[value] = true
        return self
    end
    function WeakSet.prototype.delete(self, value)
        local contains = self:has(value)
        self.items[value] = nil
        return contains
    end
    function WeakSet.prototype.has(self, value)
        return self.items[value] == true
    end
    WeakSet[Symbol.species] = WeakSet
end

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            elseif __TS__StringIncludes(_VERSION, "Lua 5.0") then
                trace = originalTraceback((("[Level " .. tostring(level)) .. "] ") .. tostring(message))
            else
                trace = originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            local function stringReplacer(____, file, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap ~= nil and fileSourceMap[line] ~= nil then
                    local chunkName = (__TS__Match(file, "%[string \"([^\"]+)\"%]"))
                    local sourceName = string.gsub(chunkName, ".lua$", ".ts")
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (sourceName .. ":") .. tostring(data)
                    end
                    return (data.file .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return stringReplacer(nil, file, line) end
            )
            return result
        end
    end
end

local function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        for i = 0, #iterable - 1 do
            arr[i + 1] = __TS__StringAccess(iterable, i)
        end
    else
        local len = 0
        for ____, item in __TS__Iterator(iterable) do
            len = len + 1
            arr[len] = item
        end
    end
    return __TS__Unpack(arr)
end

local function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

local function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or 0 / 0
end

local function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

local function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return self .. string.sub(
        fillString,
        1,
        math.floor(maxLength)
    )
end

local function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return string.sub(
        fillString,
        1,
        math.floor(maxLength)
    ) .. self
end

local __TS__StringReplace
do
    local sub = string.sub
    function __TS__StringReplace(source, searchValue, replaceValue)
        local startPos, endPos = string.find(source, searchValue, nil, true)
        if not startPos then
            return source
        end
        local before = sub(source, 1, startPos - 1)
        local replacement = type(replaceValue) == "string" and replaceValue or replaceValue(nil, searchValue, startPos - 1, source)
        local after = sub(source, endPos + 1)
        return (before .. replacement) .. after
    end
end

local __TS__StringSplit
do
    local sub = string.sub
    local find = string.find
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local result = {}
        local resultIndex = 1
        if separator == nil or separator == "" then
            for i = 1, #source do
                result[resultIndex] = sub(source, i, i)
                resultIndex = resultIndex + 1
            end
        else
            local currentPos = 1
            while resultIndex <= limit do
                local startPos, endPos = find(source, separator, currentPos, true)
                if not startPos then
                    break
                end
                result[resultIndex] = sub(source, currentPos, startPos - 1)
                resultIndex = resultIndex + 1
                currentPos = endPos + 1
            end
            if resultIndex <= limit then
                result[resultIndex] = sub(source, currentPos)
            end
        end
        return result
    end
end

local __TS__StringReplaceAll
do
    local sub = string.sub
    local find = string.find
    function __TS__StringReplaceAll(source, searchValue, replaceValue)
        if type(replaceValue) == "string" then
            local concat = table.concat(
                __TS__StringSplit(source, searchValue),
                replaceValue
            )
            if #searchValue == 0 then
                return (replaceValue .. concat) .. replaceValue
            end
            return concat
        end
        local parts = {}
        local partsIndex = 1
        if #searchValue == 0 then
            parts[1] = replaceValue(nil, "", 0, source)
            partsIndex = 2
            for i = 1, #source do
                parts[partsIndex] = sub(source, i, i)
                parts[partsIndex + 1] = replaceValue(nil, "", i, source)
                partsIndex = partsIndex + 2
            end
        else
            local currentPos = 1
            while true do
                local startPos, endPos = find(source, searchValue, currentPos, true)
                if not startPos then
                    break
                end
                parts[partsIndex] = sub(source, currentPos, startPos - 1)
                parts[partsIndex + 1] = replaceValue(nil, searchValue, startPos - 1, source)
                partsIndex = partsIndex + 2
                currentPos = endPos + 1
            end
            parts[partsIndex] = sub(source, currentPos)
        end
        return table.concat(parts)
    end
end

local function __TS__StringSlice(self, start, ____end)
    if start == nil or start ~= start then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if length ~= length or length <= 0 then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

local function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

local __TS__SymbolRegistryFor, __TS__SymbolRegistryKeyFor
do
    local symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not symbolRegistry[key] then
            symbolRegistry[key] = __TS__Symbol(key)
        end
        return symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(symbolRegistry) do
            if symbolRegistry[key] == sym then
                return key
            end
        end
        return nil
    end
end

local function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

local function __TS__Using(self, cb, ...)
    local args = {...}
    local thrownError
    local ok, result = xpcall(
        function() return cb(__TS__Unpack(args)) end,
        function(err)
            thrownError = err
            return thrownError
        end
    )
    local argArray = {__TS__Unpack(args)}
    do
        local i = #argArray - 1
        while i >= 0 do
            local ____self_0 = argArray[i + 1]
            ____self_0[Symbol.dispose](____self_0)
            i = i - 1
        end
    end
    if not ok then
        error(thrownError, 0)
    end
    return result
end

local function __TS__UsingAsync(self, cb, ...)
    local args = {...}
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local thrownError
        local ok, result = xpcall(
            function() return cb(
                nil,
                __TS__Unpack(args)
            ) end,
            function(err)
                thrownError = err
                return thrownError
            end
        )
        local argArray = {__TS__Unpack(args)}
        do
            local i = #argArray - 1
            while i >= 0 do
                if argArray[i + 1][Symbol.dispose] ~= nil then
                    local ____self_0 = argArray[i + 1]
                    ____self_0[Symbol.dispose](____self_0)
                end
                if argArray[i + 1][Symbol.asyncDispose] ~= nil then
                    local ____self_1 = argArray[i + 1]
                    __TS__Await(____self_1[Symbol.asyncDispose](____self_1))
                end
                i = i - 1
            end
        end
        if not ok then
            error(thrownError, 0)
        end
        return ____awaiter_resolve(nil, result)
    end)
end

return {
  __TS__ArrayAt = __TS__ArrayAt,
  __TS__ArrayConcat = __TS__ArrayConcat,
  __TS__ArrayEntries = __TS__ArrayEntries,
  __TS__ArrayEvery = __TS__ArrayEvery,
  __TS__ArrayFill = __TS__ArrayFill,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__ArrayFindIndex = __TS__ArrayFindIndex,
  __TS__ArrayFrom = __TS__ArrayFrom,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayIndexOf = __TS__ArrayIndexOf,
  __TS__ArrayIsArray = __TS__ArrayIsArray,
  __TS__ArrayJoin = __TS__ArrayJoin,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayPush = __TS__ArrayPush,
  __TS__ArrayPushArray = __TS__ArrayPushArray,
  __TS__ArrayReduce = __TS__ArrayReduce,
  __TS__ArrayReduceRight = __TS__ArrayReduceRight,
  __TS__ArrayReverse = __TS__ArrayReverse,
  __TS__ArrayUnshift = __TS__ArrayUnshift,
  __TS__ArraySort = __TS__ArraySort,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__ArraySome = __TS__ArraySome,
  __TS__ArraySplice = __TS__ArraySplice,
  __TS__ArrayToObject = __TS__ArrayToObject,
  __TS__ArrayFlat = __TS__ArrayFlat,
  __TS__ArrayFlatMap = __TS__ArrayFlatMap,
  __TS__ArraySetLength = __TS__ArraySetLength,
  __TS__ArrayToReversed = __TS__ArrayToReversed,
  __TS__ArrayToSorted = __TS__ArrayToSorted,
  __TS__ArrayToSpliced = __TS__ArrayToSpliced,
  __TS__ArrayWith = __TS__ArrayWith,
  __TS__AsyncAwaiter = __TS__AsyncAwaiter,
  __TS__Await = __TS__Await,
  __TS__Class = __TS__Class,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__CloneDescriptor = __TS__CloneDescriptor,
  __TS__CountVarargs = __TS__CountVarargs,
  __TS__Decorate = __TS__Decorate,
  __TS__DecorateLegacy = __TS__DecorateLegacy,
  __TS__DecorateParam = __TS__DecorateParam,
  __TS__Delete = __TS__Delete,
  __TS__DelegatedYield = __TS__DelegatedYield,
  __TS__DescriptorGet = __TS__DescriptorGet,
  __TS__DescriptorSet = __TS__DescriptorSet,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__FunctionBind = __TS__FunctionBind,
  __TS__Generator = __TS__Generator,
  __TS__InstanceOf = __TS__InstanceOf,
  __TS__InstanceOfObject = __TS__InstanceOfObject,
  __TS__Iterator = __TS__Iterator,
  __TS__LuaIteratorSpread = __TS__LuaIteratorSpread,
  Map = Map,
  __TS__MapGroupBy = __TS__MapGroupBy,
  __TS__Match = __TS__Match,
  __TS__MathAtan2 = __TS__MathAtan2,
  __TS__MathModf = __TS__MathModf,
  __TS__MathSign = __TS__MathSign,
  __TS__MathTrunc = __TS__MathTrunc,
  __TS__New = __TS__New,
  __TS__Number = __TS__Number,
  __TS__NumberIsFinite = __TS__NumberIsFinite,
  __TS__NumberIsInteger = __TS__NumberIsInteger,
  __TS__NumberIsNaN = __TS__NumberIsNaN,
  __TS__ParseInt = __TS__ParseInt,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__NumberToString = __TS__NumberToString,
  __TS__NumberToFixed = __TS__NumberToFixed,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ObjectDefineProperty = __TS__ObjectDefineProperty,
  __TS__ObjectEntries = __TS__ObjectEntries,
  __TS__ObjectFromEntries = __TS__ObjectFromEntries,
  __TS__ObjectGetOwnPropertyDescriptor = __TS__ObjectGetOwnPropertyDescriptor,
  __TS__ObjectGetOwnPropertyDescriptors = __TS__ObjectGetOwnPropertyDescriptors,
  __TS__ObjectGroupBy = __TS__ObjectGroupBy,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ObjectRest = __TS__ObjectRest,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Promise = __TS__Promise,
  __TS__PromiseAll = __TS__PromiseAll,
  __TS__PromiseAllSettled = __TS__PromiseAllSettled,
  __TS__PromiseAny = __TS__PromiseAny,
  __TS__PromiseRace = __TS__PromiseRace,
  Set = Set,
  __TS__SetDescriptor = __TS__SetDescriptor,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread,
  WeakMap = WeakMap,
  WeakSet = WeakSet,
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Spread = __TS__Spread,
  __TS__StringAccess = __TS__StringAccess,
  __TS__StringCharAt = __TS__StringCharAt,
  __TS__StringCharCodeAt = __TS__StringCharCodeAt,
  __TS__StringEndsWith = __TS__StringEndsWith,
  __TS__StringIncludes = __TS__StringIncludes,
  __TS__StringPadEnd = __TS__StringPadEnd,
  __TS__StringPadStart = __TS__StringPadStart,
  __TS__StringReplace = __TS__StringReplace,
  __TS__StringReplaceAll = __TS__StringReplaceAll,
  __TS__StringSlice = __TS__StringSlice,
  __TS__StringSplit = __TS__StringSplit,
  __TS__StringStartsWith = __TS__StringStartsWith,
  __TS__StringSubstr = __TS__StringSubstr,
  __TS__StringSubstring = __TS__StringSubstring,
  __TS__StringTrim = __TS__StringTrim,
  __TS__StringTrimEnd = __TS__StringTrimEnd,
  __TS__StringTrimStart = __TS__StringTrimStart,
  __TS__Symbol = __TS__Symbol,
  Symbol = Symbol,
  __TS__SymbolRegistryFor = __TS__SymbolRegistryFor,
  __TS__SymbolRegistryKeyFor = __TS__SymbolRegistryKeyFor,
  __TS__TypeOf = __TS__TypeOf,
  __TS__Unpack = __TS__Unpack,
  __TS__Using = __TS__Using,
  __TS__UsingAsync = __TS__UsingAsync
}
 end,
["lib"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
____exports.FacingDirections = {"north", "south", "east", "west"}
local function clockwise(self, dir)
    local map = {
        up = dir,
        down = dir,
        north = "east",
        south = "west",
        east = "south",
        west = "north"
    }
    return map[dir]
end
local function counter_clockwise(self, dir)
    local map = {
        up = dir,
        down = dir,
        north = "west",
        south = "east",
        east = "north",
        west = "south"
    }
    return map[dir]
end
local function reverse(self, dir)
    local map = {
        up = "down",
        down = "up",
        north = "south",
        south = "north",
        east = "west",
        west = "east"
    }
    return map[dir]
end
function ____exports.move_point(self, point, dir)
    local pnt = __TS__ObjectAssign({}, point)
    local map = {
        up = function() return pnt.y + 1 end,
        down = function() return pnt.y - 1 end,
        north = function() return pnt.z - 1 end,
        south = function() return pnt.z + 1 end,
        east = function() return pnt.x - 1 end,
        west = function() return pnt.x + 1 end
    }
    map[dir](map)
    return pnt
end
____exports.TurtleApi = __TS__Class()
local TurtleApi = ____exports.TurtleApi
TurtleApi.name = "TurtleApi"
function TurtleApi.prototype.____constructor(self, point, direction)
    if point == nil then
        point = {x = 0, y = 0, z = 0}
    end
    if direction == nil then
        direction = "north"
    end
    self.point = point
    self.direction = direction
end
function TurtleApi.prototype.getDirection(self)
    return self.direction
end
function TurtleApi.prototype.getLocation(self)
    return self.point
end
function TurtleApi.prototype.turnLeft(self)
    self.direction = counter_clockwise(nil, self.direction)
    turtle.turnLeft()
end
function TurtleApi.prototype.turnRight(self)
    self.direction = clockwise(nil, self.direction)
    turtle.turnRight()
end
function TurtleApi.prototype.forward(self)
    self:ensureFuel()
    self.point = ____exports.move_point(nil, self.point, self.direction)
    turtle.forward()
end
function TurtleApi.prototype.back(self)
    self:ensureFuel()
    self.point = ____exports.move_point(
        nil,
        self.point,
        reverse(nil, self.direction)
    )
    turtle.back()
end
function TurtleApi.prototype.up(self)
    self:ensureFuel()
    self.point = ____exports.move_point(nil, self.point, "up")
    turtle.up()
end
function TurtleApi.prototype.down(self)
    self:ensureFuel()
    self.point = ____exports.move_point(nil, self.point, "down")
    turtle.down()
end
function TurtleApi.prototype.getItemDetail(self, index)
    return turtle.getItemDetail(index)
end
function TurtleApi.prototype.select(self, index)
    turtle.select(index)
end
function TurtleApi.prototype.turnTo(self, dir)
    if dir ~= self.direction then
        if dir == counter_clockwise(nil, self.direction) then
            self:turnLeft()
        else
            self:turnRight()
        end
    end
end
function TurtleApi.prototype.turnToAxis(self, dir)
    if dir ~= reverse(nil, dir) then
        self:turnTo(dir)
    end
end
function TurtleApi.prototype.move(self, dir)
    if dir == "up" then
        self:up()
    elseif dir == "down" then
        self:down()
    else
        self:turnTo(dir)
        self:forward()
    end
end
function TurtleApi.prototype.dig(self, dir)
    if dir == "up" then
        if turtle.detectUp() then
            turtle.digUp()
        end
    elseif dir == "down" then
        if turtle.detectDown() then
            turtle.digDown()
        end
    else
        self:turnTo(dir)
        if turtle.detect() then
            turtle.dig()
        end
    end
end
function TurtleApi.prototype.digMove(self, dir)
    self:dig(dir)
    self:move(dir)
end
function TurtleApi.prototype.ensureFuel(self)
    local need_fuel = turtle.getFuelLevel() == 0
    while need_fuel do
        local found_item = self:selectItem({"minecraft:coal", "minecraft:coal_block", "minecaft:charcoal"})
        if found_item then
            turtle.refuel(1)
            need_fuel = turtle.getFuelLevel() == 0
        else
            print("ERROR: could not find fuel")
            sleep(5)
        end
    end
end
function TurtleApi.prototype.selectItem(self, item)
    local items = __TS__ArrayIsArray(item) and item or ({item})
    do
        local j = 1
        while j <= 16 do
            local detail = self:getItemDetail(j)
            if detail and __TS__ArrayIncludes(items, detail.name) then
                self:select(j)
                return true
            end
            j = j + 1
        end
    end
    return false
end
____exports.RectanglePrism = __TS__Class()
local RectanglePrism = ____exports.RectanglePrism
RectanglePrism.name = "RectanglePrism"
function RectanglePrism.prototype.____constructor(self, p1, p2)
    self.p1 = p1
    self.p2 = p2
end
function RectanglePrism.prototype.isInside(self, point)
    return point.x > math.min(self.p1.x, self.p2.x) and point.x < math.max(self.p1.x, self.p2.x) and point.y > math.min(self.p1.y, self.p2.y) and point.y < math.max(self.p1.y, self.p2.y) and point.z > math.min(self.p1.z, self.p2.z) and point.z < math.max(self.p1.z, self.p2.z)
end
return ____exports
 end,
["input"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ParseInt = ____lualib.__TS__ParseInt
local ____exports = {}
local ____lib = require("lib")
local FacingDirections = ____lib.FacingDirections
local function directionAutoComplete(partial)
    local possible = {}
    for ____, facing in ipairs(FacingDirections) do
        if __TS__StringStartsWith(facing, partial) then
            possible[#possible + 1] = __TS__StringSlice(facing, #partial)
        end
    end
    return possible
end
local function isFacingDirection(self, x)
    return __TS__ArrayIncludes(FacingDirections, x)
end
function ____exports.readDirection(self, prompt)
    while true do
        print(prompt)
        local answer = read(nil, nil, directionAutoComplete)
        if isFacingDirection(nil, answer) then
            return answer
        end
    end
end
local LOCATION_REGEX = "^(-?%d+) (-?%d+) (-?%d+)"
local PARTIAL_LOCATION_REGEX = "^-?(%d+( (-?(%d+( (-?(%d+)?)?)?)?)?)?)?"
local LOCATION_CHARS = " -0123456789"
local function locationAutoComplete(partial)
    local possible = {}
    for ____, char in __TS__Iterator(LOCATION_CHARS) do
        local match = {string.match(partial .. char, PARTIAL_LOCATION_REGEX)}
        print(partial .. char, match[1])
        if #match ~= 0 then
            possible[#possible + 1] = char
        end
    end
    return possible
end
function ____exports.readLocation(self, prompt)
    while true do
        print(prompt)
        local answer = read(nil, nil, locationAutoComplete)
        local match = {string.match(answer, LOCATION_REGEX)}
        if #match ~= 0 then
            return {
                x = __TS__ParseInt(match[1]),
                y = __TS__ParseInt(match[2]),
                z = __TS__ParseInt(match[3])
            }
        end
    end
end
function ____exports.readTurtleLocation(self)
    local location = ____exports.readLocation(nil, "Enter Starting Location:")
    print(location)
    local direction = ____exports.readDirection(nil, "Enter Starting Facing Direction:")
    print(direction)
    return {location, direction}
end
return ____exports
 end,
["programs.test"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lib = require("lib")
local TurtleApi = ____lib.TurtleApi
function ____exports.default(self)
    local api = __TS__New(TurtleApi)
    while true do
        api:digMove("north")
        api:digMove("east")
        api:digMove("south")
        api:digMove("west")
        api:digMove("up")
        api:digMove("down")
    end
end
return ____exports
 end,
["programs.mine"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local ____exports = {}
local ____input = require("input")
local readTurtleLocation = ____input.readTurtleLocation
local ____lib = require("lib")
local TurtleApi = ____lib.TurtleApi
local RectanglePrism = ____lib.RectanglePrism
local function minePlus(self, api, start, ____end)
    local rect = __TS__New(RectanglePrism, start, ____end)
    local loc = api:getLocation()
    if rect:isInside(__TS__ObjectAssign({}, loc, {y = loc.y + 1})) then
        api:dig("up")
    end
    if rect:isInside(__TS__ObjectAssign({}, loc, {y = loc.y - 1})) then
        api:dig("down")
    end
    if rect:isInside(__TS__ObjectAssign({}, loc, {x = loc.x - 1})) then
        api:dig("east")
    end
    if rect:isInside(__TS__ObjectAssign({}, loc, {x = loc.x + 1})) then
        api:dig("west")
    end
end
function ____exports.default(self)
    local starting_location = readTurtleLocation(nil)
    local api = __TS__New(
        TurtleApi,
        table.unpack(starting_location)
    )
    while true do
        api:digMove("north")
        api:digMove("north")
        api:digMove("east")
        api:digMove("east")
        api:digMove("south")
        api:digMove("south")
        api:digMove("west")
        api:digMove("west")
        api:digMove("up")
        api:digMove("up")
        api:digMove("down")
        api:digMove("down")
    end
end
return ____exports
 end,
["programs.pokemon_data"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.POKEMON_DATA = "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"
return ____exports
 end,
["programs.pokemon"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____pokemon_data = require("programs.pokemon_data")
local POKEMON_DATA = ____pokemon_data.POKEMON_DATA
local ____base64 = require("lua.base64")
local decode = ____base64.decode
local ____libdeflate = require("lua.libdeflate")
local DecompressZlib = ____libdeflate.DecompressZlib
local POKEMON_BYTES = DecompressZlib(
    nil,
    decode(POKEMON_DATA)
)
local function drawPixel(self, terminal, xPos, yPos)
    terminal.setCursorPos(xPos, yPos)
    terminal.write(" ")
end
local function drawPokemonPixel(self, terminal, color, index)
    terminal.setBackgroundColour(2 ^ color)
    local x = index % 37
    local y = math.floor(index / 37)
    drawPixel(nil, terminal, x + 1, y + 1)
end
local function drawPokemon(self, terminal, number)
    local palette_start = (number - 1) * 512
    do
        local index = 0
        while index < 16 do
            local palette_index = palette_start + index * 3
            local b1, b2, b3 = string.byte(POKEMON_BYTES, palette_index + 1, palette_index + 3)
            local color = bit32.bor(
                bit32.bor(
                    bit32.lshift(b1, 16),
                    bit32.lshift(b2, 8)
                ),
                b3
            )
            terminal.setPaletteColor(2 ^ index, color)
            index = index + 1
        end
    end
    local pixel_start = palette_start + 16 * 3
    do
        local index = 0
        while index < 37 * 25 do
            local byte = string.byte(POKEMON_BYTES, pixel_start + index / 2 + 1)
            local high = bit32.rshift(byte, 4)
            local low = bit32.band(byte, 15)
            drawPokemonPixel(nil, terminal, index % 2, index)
            drawPokemonPixel(nil, terminal, (index + 1) % 2, index + 1)
            index = index + 2
        end
    end
end
local function pickPokemon(self)
    if math.random(1, 4) == 1 then
        local better = {428, 134, 282}
        local random = math.random(1, #better)
        return better[random]
    else
        return math.random(1, 1025)
    end
end
function ____exports.default(self)
    local monitor = peripheral.wrap("left")
    monitor.setTextScale(0.5)
    monitor.clear()
    drawPokemon(nil, monitor, 1)
end
return ____exports
 end,
["lua.libdeflate"] = function(...) 
--[[--
LibDeflate 1.0.2-release <br>
Pure Lua compressor and decompressor with high compression ratio using
DEFLATE/zlib format.

@file LibDeflate.lua
@author Haoqian He (Github: SafeteeWoW; World of Warcraft: Safetyy-Illidan(US))
@copyright LibDeflate <2018-2020> Haoqian He
@license zlib License

This library is implemented according to the following specifications. <br>
Report a bug if LibDeflate is not fully compliant with those specs. <br>
Both compressors and decompressors have been implemented in the library.<br>
1. RFC1950: DEFLATE Compressed Data Format Specification version 1.3 <br>
https://tools.ietf.org/html/rfc1951 <br>
2. RFC1951: ZLIB Compressed Data Format Specification version 3.3 <br>
https://tools.ietf.org/html/rfc1950 <br>

This library requires Lua 5.1/5.2/5.3/5.4 interpreter or LuaJIT v2.0+. <br>
This library does not have any dependencies. <br>
Note at the time of this release, Lua 5.4 final is not released yet. <br>
For Lua 5.4, This library is tested with its rc6 version. <br>
<br>
This file "LibDeflate.lua" is the only source file of
the library. <br>
Submit suggestions or report bugs to
https://github.com/safeteeWow/LibDeflate/issues
]]

--[[
zlib License

(C) 2018-2020 Haoqian He

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.


Credits and Disclaimer:
The following projects are used to the help to test the correctness
of this program. The code of this program (LibDeflate.lua) does not
use their code directly, but uses their ideas and algorithms. Their original
licenses shall be comply when used.

1. zlib, by Jean-loup Gailly (compression) and Mark Adler (decompression).
	http://www.zlib.net/
	Licensed under zlib License. http://www.zlib.net/zlib_license.html
	For the compression algorithm.
2. puff, by Mark Adler. https://github.com/madler/zlib/tree/master/contrib/puff
	Licensed under zlib License. http://www.zlib.net/zlib_license.html
	For the decompression algorithm.
3. LibCompress, by jjsheets and Galmok of European Stormrage (Horde)
	https://www.wowace.com/projects/libcompress
	Licensed under GPLv2.
	https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
	For the code to create customized codec.
4. WeakAuras2,
	https://github.com/WeakAuras/WeakAuras2
	Licensed under GPLv2.
	For the 6bit encoding and decoding.
]]

--[[
	Curseforge auto-packaging replacements:

	Project Date: @project-date-iso@
	Project Hash: @project-hash@
	Project Version: @project-version@
--]]

local LibDeflate

do
	-- Semantic version. all lowercase.
	-- Suffix can be alpha1, alpha2, beta1, beta2, rc1, rc2, etc.
	-- NOTE: Two version numbers needs to modify.
	-- 1. On the top of LibDeflate.lua
	-- 2. _VERSION
	-- 3. _MINOR

	-- version to store the official version of LibDeflate
	local _VERSION = "1.0.2-release"

	-- When MAJOR is changed, I should name it as LibDeflate2
	local _MAJOR = "LibDeflate"

	-- Update this whenever a new version, for LibStub version registration.
	-- 0 : v0.x
	-- 1 : v1.0.0
	-- 2 : v1.0.1
	-- 3 : v1.0.2
	local _MINOR = 3

	local _COPYRIGHT =
	"LibDeflate ".._VERSION
	.." Copyright (C) 2018-2020 Haoqian He."
	.." Licensed under the zlib License"

	-- Register in the World of Warcraft library "LibStub" if detected.
	if LibStub then
		local lib, minor = LibStub:GetLibrary(_MAJOR, true)
		if lib and minor and minor >= _MINOR then -- No need to update.
			return lib
		else -- Update or first time register
			LibDeflate = LibStub:NewLibrary(_MAJOR, _MINOR)
			-- NOTE: It is important that new version has implemented
			-- all exported APIs and tables in the old version,
			-- so the old library is fully garbage collected,
			-- and we 100% ensure the backward compatibility.
		end
	else -- "LibStub" is not detected.
		LibDeflate = {}
	end

	LibDeflate._VERSION = _VERSION
	LibDeflate._MAJOR = _MAJOR
	LibDeflate._MINOR = _MINOR
	LibDeflate._COPYRIGHT = _COPYRIGHT
end

-- localize Lua api for faster access.
local assert = assert
local error = error
local pairs = pairs
local string_byte = string.byte
local string_char = string.char
local string_find = string.find
local string_gsub = string.gsub
local string_sub = string.sub
local table_concat = table.concat
local table_sort = table.sort
local tostring = tostring
local type = type

-- Converts i to 2^i, (0<=i<=32)
-- This is used to implement bit left shift and bit right shift.
-- "x >> y" in C:   "(x-x%_pow2[y])/_pow2[y]" in Lua
-- "x << y" in C:   "x*_pow2[y]" in Lua
local _pow2 = {}

-- Converts any byte to a character, (0<=byte<=255)
local _byte_to_char = {}

-- _reverseBitsTbl[len][val] stores the bit reverse of
-- the number with bit length "len" and value "val"
-- For example, decimal number 6 with bits length 5 is binary 00110
-- It's reverse is binary 01100,
-- which is decimal 12 and 12 == _reverseBitsTbl[5][6]
-- 1<=len<=9, 0<=val<=2^len-1
-- The reason for 1<=len<=9 is that the max of min bitlen of huffman code
-- of a huffman alphabet is 9?
local _reverse_bits_tbl = {}

-- Convert a LZ77 length (3<=len<=258) to
-- a deflate literal/LZ77_length code (257<=code<=285)
local _length_to_deflate_code = {}

-- convert a LZ77 length (3<=len<=258) to
-- a deflate literal/LZ77_length code extra bits.
local _length_to_deflate_extra_bits = {}

-- Convert a LZ77 length (3<=len<=258) to
-- a deflate literal/LZ77_length code extra bit length.
local _length_to_deflate_extra_bitlen = {}

-- Convert a small LZ77 distance (1<=dist<=256) to a deflate code.
local _dist256_to_deflate_code = {}

-- Convert a small LZ77 distance (1<=dist<=256) to
-- a deflate distance code extra bits.
local _dist256_to_deflate_extra_bits = {}

-- Convert a small LZ77 distance (1<=dist<=256) to
-- a deflate distance code extra bit length.
local _dist256_to_deflate_extra_bitlen = {}

-- Convert a literal/LZ77_length deflate code to LZ77 base length
-- The key of the table is (code - 256), 257<=code<=285
local _literal_deflate_code_to_base_len = {
	3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31,
	35, 43, 51, 59, 67, 83, 99, 115, 131, 163, 195, 227, 258,
}

-- Convert a literal/LZ77_length deflate code to base LZ77 length extra bits
-- The key of the table is (code - 256), 257<=code<=285
local _literal_deflate_code_to_extra_bitlen = {
	0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2,
	3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0,
}

-- Convert a distance deflate code to base LZ77 distance. (0<=code<=29)
local _dist_deflate_code_to_base_dist = {
	[0] = 1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193,
	257, 385, 513, 769, 1025, 1537, 2049, 3073, 4097, 6145,
	8193, 12289, 16385, 24577,
}

-- Convert a distance deflate code to LZ77 bits length. (0<=code<=29)
local _dist_deflate_code_to_extra_bitlen = {
	[0] = 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
	7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13,
}

-- The code order of the first huffman header in the dynamic deflate block.
-- See the page 12 of RFC1951
local _rle_codes_huffman_bitlen_order = {16, 17, 18,
	0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15,
}

-- The following tables are used by fixed deflate block.
-- The value of these tables are assigned at the bottom of the source.

-- The huffman code of the literal/LZ77_length deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_code

-- Convert huffman code of the literal/LZ77_length to deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_to_deflate_code

-- The bit length of the huffman code of literal/LZ77_length deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_bitlen

-- The count of each bit length of the literal/LZ77_length deflate codes,
-- in fixed deflate block.
local _fix_block_literal_huffman_bitlen_count

-- The huffman code of the distance deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_code

-- Convert huffman code of the distance to deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_to_deflate_code

-- The bit length of the huffman code of the distance deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_bitlen

-- The count of each bit length of the huffman code of
-- the distance deflate codes,
-- in fixed deflate block.
local _fix_block_dist_huffman_bitlen_count

for i = 0, 255 do
	_byte_to_char[i] = string_char(i)
end

do
	local pow = 1
	for i = 0, 32 do
		_pow2[i] = pow
		pow = pow * 2
	end
end

for i = 1, 9 do
	_reverse_bits_tbl[i] = {}
	for j=0, _pow2[i+1]-1 do
		local reverse = 0
		local value = j
		for _ = 1, i do
			-- The following line is equivalent to "res | (code %2)" in C.
			reverse = reverse - reverse%2
				+ (((reverse%2==1) or (value % 2) == 1) and 1 or 0)
			value = (value-value%2)/2
			reverse = reverse * 2
		end
		_reverse_bits_tbl[i][j] = (reverse-reverse%2)/2
	end
end

-- The source code is written according to the pattern in the numbers
-- in RFC1951 Page10.
do
	local a = 18
	local b = 16
	local c = 265
	local bitlen = 1
	for len = 3, 258 do
		if len <= 10 then
			_length_to_deflate_code[len] = len + 254
			_length_to_deflate_extra_bitlen[len] = 0
		elseif len == 258 then
			_length_to_deflate_code[len] = 285
			_length_to_deflate_extra_bitlen[len] = 0
		else
			if len > a then
				a = a + b
				b = b * 2
				c = c + 4
				bitlen = bitlen + 1
			end
			local t = len-a-1+b/2
			_length_to_deflate_code[len] = (t-(t%(b/8)))/(b/8) + c
			_length_to_deflate_extra_bitlen[len] = bitlen
			_length_to_deflate_extra_bits[len] = t % (b/8)
		end
	end
end

-- The source code is written according to the pattern in the numbers
-- in RFC1951 Page11.
do
	_dist256_to_deflate_code[1] = 0
	_dist256_to_deflate_code[2] = 1
	_dist256_to_deflate_extra_bitlen[1] = 0
	_dist256_to_deflate_extra_bitlen[2] = 0

	local a = 3
	local b = 4
	local code = 2
	local bitlen = 0
	for dist = 3, 256 do
		if dist > b then
			a = a * 2
			b = b * 2
			code = code + 2
			bitlen = bitlen + 1
		end
		_dist256_to_deflate_code[dist] = (dist <= a) and code or (code+1)
		_dist256_to_deflate_extra_bitlen[dist] = (bitlen < 0) and 0 or bitlen
		if b >= 8 then
			_dist256_to_deflate_extra_bits[dist] = (dist-b/2-1) % (b/4)
		end
	end
end

--- Calculate the Adler-32 checksum of the string. <br>
-- See RFC1950 Page 9 https://tools.ietf.org/html/rfc1950 for the
-- definition of Adler-32 checksum.
-- @param str [string] the input string to calcuate its Adler-32 checksum.
-- @return [integer] The Adler-32 checksum, which is greater or equal to 0,
-- and less than 2^32 (4294967296).
function LibDeflate:Adler32(str)
	-- This function is loop unrolled by better performance.
	--
	-- Here is the minimum code:
	--
	-- local a = 1
	-- local b = 0
	-- for i=1, #str do
	-- 		local s = string.byte(str, i, i)
	-- 		a = (a+s)%65521
	-- 		b = (b+a)%65521
	-- 		end
	-- return b*65536+a
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:Adler32(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	local strlen = #str

	local i = 1
	local a = 1
	local b = 0
	while i <= strlen - 15 do
		local x1, x2, x3, x4, x5, x6, x7, x8,
			x9, x10, x11, x12, x13, x14, x15, x16 = string_byte(str, i, i+15)
		b = (b+16*a+16*x1+15*x2+14*x3+13*x4+12*x5+11*x6+10*x7+9*x8+8*x9
			+7*x10+6*x11+5*x12+4*x13+3*x14+2*x15+x16)%65521
		a = (a+x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16)%65521
		i =  i + 16
	end
	while (i <= strlen) do
		local x = string_byte(str, i, i)
		a = (a + x) % 65521
		b = (b + a) % 65521
		i = i + 1
	end
	return (b*65536+a) % 4294967296
end

-- Compare adler32 checksum.
-- adler32 should be compared with a mod to avoid sign problem
-- 4072834167 (unsigned) is the same adler32 as -222133129
local function IsEqualAdler32(actual, expected)
	return (actual % 4294967296) == (expected % 4294967296)
end

--- Create a preset dictionary.
--
-- This function is not fast, and the memory consumption of the produced
-- dictionary is about 50 times of the input string. Therefore, it is suggestted
-- to run this function only once in your program.
--
-- It is very important to know that if you do use a preset dictionary,
-- compressors and decompressors MUST USE THE SAME dictionary. That is,
-- dictionary must be created using the same string. If you update your program
-- with a new dictionary, people with the old version won't be able to transmit
-- data with people with the new version. Therefore, changing the dictionary
-- must be very careful.
--
-- The parameters "strlen" and "adler32" add a layer of verification to ensure
-- the parameter "str" is not modified unintentionally during the program
-- development.
--
-- @usage local dict_str = "1234567890"
--
-- -- print(dict_str:len(), LibDeflate:Adler32(dict_str))
-- -- Hardcode the print result below to verify it to avoid acciently
-- -- modification of 'str' during the program development.
-- -- string length: 10, Adler-32: 187433486,
-- -- Don't calculate string length and its Adler-32 at run-time.
--
-- local dict = LibDeflate:CreateDictionary(dict_str, 10, 187433486)
--
-- @param str [string] The string used as the preset dictionary. <br>
-- You should put stuffs that frequently appears in the dictionary
-- string and preferablely put more frequently appeared stuffs toward the end
-- of the string. <br>
-- Empty string and string longer than 32768 bytes are not allowed.
-- @param strlen [integer] The length of 'str'. Please pass in this parameter
-- as a hardcoded constant, in order to verify the content of 'str'. The value
-- of this parameter should be known before your program runs.
-- @param adler32 [integer] The Adler-32 checksum of 'str'. Please pass in this
-- parameter as a hardcoded constant, in order to verify the content of 'str'.
-- The value of this parameter should be known before your program runs.
-- @return  [table] The dictionary used for preset dictionary compression and
-- decompression.
-- @raise error if 'strlen' does not match the length of 'str',
-- or if 'adler32' does not match the Adler-32 checksum of 'str'.
function LibDeflate:CreateDictionary(str, strlen, adler32)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	if type(strlen) ~= "number" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'strlen' - number expected got '%s'."):format(
			type(strlen)), 2)
	end
	if type(adler32) ~= "number" then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'adler32' - number expected got '%s'."):format(
			type(adler32)), 2)
	end
	if strlen ~= #str then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
				.." 'strlen' does not match the actual length of 'str'."
				.." 'strlen': %u, '#str': %u ."
				.." Please check if 'str' is modified unintentionally.")
			:format(strlen, #str))
	end
	if strlen == 0 then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'str' - Empty string is not allowed."), 2)
	end
	if strlen > 32768 then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
			.." 'str' - string longer than 32768 bytes is not allowed."
			 .." Got %d bytes."):format(strlen), 2)
	end
	local actual_adler32 = self:Adler32(str)
	if not IsEqualAdler32(adler32, actual_adler32) then
		error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32):"
				.." 'adler32' does not match the actual adler32 of 'str'."
				.." 'adler32': %u, 'Adler32(str)': %u ."
				.." Please check if 'str' is modified unintentionally.")
			:format(adler32, actual_adler32))
	end

	local dictionary = {}
	dictionary.adler32 = adler32
	dictionary.hash_tables = {}
	dictionary.string_table = {}
	dictionary.strlen = strlen
	local string_table = dictionary.string_table
	local hash_tables = dictionary.hash_tables
	string_table[1] = string_byte(str, 1, 1)
	string_table[2] = string_byte(str, 2, 2)
	if strlen >= 3 then
		local i = 1
		local hash = string_table[1]*256+string_table[2]
		while i <= strlen - 2 - 3 do
			local x1, x2, x3, x4 = string_byte(str, i+2, i+5)
			string_table[i+2] = x1
			string_table[i+3] = x2
			string_table[i+4] = x3
			string_table[i+5] = x4
			hash = (hash*256+x1)%16777216
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
			hash = (hash*256+x2)%16777216
			t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
			hash = (hash*256+x3)%16777216
			t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
			hash = (hash*256+x4)%16777216
			t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
		end
		while i <= strlen - 2 do
			local x = string_byte(str, i+2)
			string_table[i+2] = x
			hash = (hash*256+x)%16777216
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = i-strlen
			i = i + 1
		end
	end
	return dictionary
end

-- Check if the dictionary is valid.
-- @param dictionary The preset dictionary for compression and decompression.
-- @return true if valid, false if not valid.
-- @return if not valid, the error message.
local function IsValidDictionary(dictionary)
	if type(dictionary) ~= "table" then
		return false, ("'dictionary' - table expected got '%s'.")
			:format(type(dictionary))
	end
	if type(dictionary.adler32) ~= "number"
		or type(dictionary.string_table) ~= "table"
		or type(dictionary.strlen) ~= "number"
		or dictionary.strlen <= 0
		or dictionary.strlen > 32768
		or dictionary.strlen ~= #dictionary.string_table
		or type(dictionary.hash_tables) ~= "table"
		then
		return false, ("'dictionary' - corrupted dictionary.")
			:format(type(dictionary))
	end
	return true, ""
end

--[[
	key of the configuration table is the compression level,
	and its value stores the compression setting.
	These numbers come from zlib source code.

	Higher compression level usually means better compression.
	(Because LibDeflate uses a simplified version of zlib algorithm,
	there is no guarantee that higher compression level does not create
	bigger file than lower level, but I can say it's 99% likely)

	Be careful with the high compression level. This is a pure lua
	implementation compressor/decompressor, which is significant slower than
	a C/C++ equivalant compressor/decompressor. Very high compression level
	costs significant more CPU time, and usually compression size won't be
	significant smaller when you increase compression level by 1, when the
	level is already very high. Benchmark yourself if you can afford it.

	See also https://github.com/madler/zlib/blob/master/doc/algorithm.txt,
	https://github.com/madler/zlib/blob/master/deflate.c for more information.

	The meaning of each field:
	@field 1 use_lazy_evaluation:
		true/false. Whether the program uses lazy evaluation.
		See what is "lazy evaluation" in the link above.
		lazy_evaluation improves ratio, but relatively slow.
	@field 2 good_prev_length:
		Only effective if lazy is set, Only use 1/4 of max_chain,
		if prev length of lazy match is above this.
	@field 3 max_insert_length/max_lazy_match:
		If not using lazy evaluation,
		insert new strings in the hash table only if the match length is not
		greater than this length.
		If using lazy evaluation, only continue lazy evaluation,
		if previous match length is strictly smaller than this value.
	@field 4 nice_length:
		Number. Don't continue to go down the hash chain,
		if match length is above this.
	@field 5 max_chain:
		Number. The maximum number of hash chains we look.
--]]
local _compression_level_configs = {
	[0] = {false, nil, 0, 0, 0}, -- level 0, no compression
	[1] = {false, nil, 4, 8, 4}, -- level 1, similar to zlib level 1
	[2] = {false, nil, 5, 18, 8}, -- level 2, similar to zlib level 2
	[3] = {false, nil, 6, 32, 32},	-- level 3, similar to zlib level 3
	[4] = {true, 4,	4, 16, 16},	-- level 4, similar to zlib level 4
	[5] = {true, 8,	16,	32,	32}, -- level 5, similar to zlib level 5
	[6] = {true, 8,	16,	128, 128}, -- level 6, similar to zlib level 6
	[7] = {true, 8,	32,	128, 256}, -- (SLOW) level 7, similar to zlib level 7
	[8] = {true, 32, 128, 258, 1024} , --(SLOW) level 8,similar to zlib level 8
	[9] = {true, 32, 258, 258, 4096},
		-- (VERY SLOW) level 9, similar to zlib level 9
}

-- Check if the compression/decompression arguments is valid
-- @param str The input string.
-- @param check_dictionary if true, check if dictionary is valid.
-- @param dictionary The preset dictionary for compression and decompression.
-- @param check_configs if true, check if config is valid.
-- @param configs The compression configuration table
-- @return true if valid, false if not valid.
-- @return if not valid, the error message.
local function IsValidArguments(str,
	check_dictionary, dictionary,
	check_configs, configs)

	if type(str) ~= "string" then
		return false,
			("'str' - string expected got '%s'."):format(type(str))
	end
	if check_dictionary then
		local dict_valid, dict_err = IsValidDictionary(dictionary)
		if not dict_valid then
			return false, dict_err
		end
	end
	if check_configs then
		local type_configs = type(configs)
		if type_configs ~= "nil" and type_configs ~= "table" then
			return false,
			("'configs' - nil or table expected got '%s'.")
				:format(type(configs))
		end
		if type_configs == "table" then
			for k, v in pairs(configs) do
				if k ~= "level" and k ~= "strategy" then
					return false,
					("'configs' - unsupported table key in the configs: '%s'.")
					:format(k)
				elseif k == "level" and not _compression_level_configs[v] then
					return false,
					("'configs' - unsupported 'level': %s."):format(tostring(v))
				elseif k == "strategy" and v ~= "fixed" and v ~= "huffman_only"
						and v ~= "dynamic" then
						-- random_block_type is for testing purpose
					return false, ("'configs' - unsupported 'strategy': '%s'.")
						:format(tostring(v))
				end
			end
		end
	end
	return true, ""
end



--[[ --------------------------------------------------------------------------
	Compress code
--]] --------------------------------------------------------------------------

-- partial flush to save memory
local _FLUSH_MODE_MEMORY_CLEANUP = 0
-- full flush with partial bytes
local _FLUSH_MODE_OUTPUT = 1
-- write bytes to get to byte boundary
local _FLUSH_MODE_BYTE_BOUNDARY = 2
-- no flush, just get num of bits written so far
local _FLUSH_MODE_NO_FLUSH = 3

--[[
	Create an empty writer to easily write stuffs as the unit of bits.
	Return values:
	1. WriteBits(code, bitlen):
	2. WriteString(str):
	3. Flush(mode):
--]]
local function CreateWriter()
	local buffer_size = 0
	local cache = 0
	local cache_bitlen = 0
	local total_bitlen = 0
	local buffer = {}
	-- When buffer is big enough, flush into result_buffer to save memory.
	local result_buffer = {}

	-- Write bits with value "value" and bit length of "bitlen" into writer.
	-- @param value: The value being written
	-- @param bitlen: The bit length of "value"
	-- @return nil
	local function WriteBits(value, bitlen)
		cache = cache + value * _pow2[cache_bitlen]
		cache_bitlen = cache_bitlen + bitlen
		total_bitlen = total_bitlen + bitlen
		-- Only bulk to buffer every 4 bytes. This is quicker.
		if cache_bitlen >= 32 then
			buffer_size = buffer_size + 1
			buffer[buffer_size] =
				_byte_to_char[cache % 256]
				.._byte_to_char[((cache-cache%256)/256 % 256)]
				.._byte_to_char[((cache-cache%65536)/65536 % 256)]
				.._byte_to_char[((cache-cache%16777216)/16777216 % 256)]
			local rshift_mask = _pow2[32 - cache_bitlen + bitlen]
			cache = (value - value%rshift_mask)/rshift_mask
			cache_bitlen = cache_bitlen - 32
		end
	end

	-- Write the entire string into the writer.
	-- @param str The string being written
	-- @return nil
	local function WriteString(str)
		for _ = 1, cache_bitlen, 8 do
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_char(cache % 256)
			cache = (cache-cache%256)/256
		end
		cache_bitlen = 0
		buffer_size = buffer_size + 1
		buffer[buffer_size] = str
		total_bitlen = total_bitlen + #str*8
	end

	-- Flush current stuffs in the writer and return it.
	-- This operation will free most of the memory.
	-- @param mode See the descrtion of the constant and the source code.
	-- @return The total number of bits stored in the writer right now.
	-- for byte boundary mode, it includes the padding bits.
	-- for output mode, it does not include padding bits.
	-- @return Return the outputs if mode is output.
	local function FlushWriter(mode)
		if mode == _FLUSH_MODE_NO_FLUSH then
			return total_bitlen
		end

		if mode == _FLUSH_MODE_OUTPUT
			or mode == _FLUSH_MODE_BYTE_BOUNDARY then
			-- Full flush, also output cache.
			-- Need to pad some bits if cache_bitlen is not multiple of 8.
			local padding_bitlen = (8 - cache_bitlen % 8) % 8

			if cache_bitlen > 0 then
				-- padding with all 1 bits, mainly because "\000" is not
				-- good to be tranmitted. I do this so "\000" is a little bit
				-- less frequent.
				cache = cache - _pow2[cache_bitlen]
					+ _pow2[cache_bitlen+padding_bitlen]
				for _ = 1, cache_bitlen, 8 do
					buffer_size = buffer_size + 1
					buffer[buffer_size] = _byte_to_char[cache % 256]
					cache = (cache-cache%256)/256
				end

				cache = 0
				cache_bitlen = 0
			end
			if mode == _FLUSH_MODE_BYTE_BOUNDARY then
				total_bitlen = total_bitlen + padding_bitlen
				return total_bitlen
			end
		end

		local flushed = table_concat(buffer)
		buffer = {}
		buffer_size = 0
		result_buffer[#result_buffer+1] = flushed

		if mode == _FLUSH_MODE_MEMORY_CLEANUP then
			return total_bitlen
		else
			return total_bitlen, table_concat(result_buffer)
		end
	end

	return WriteBits, WriteString, FlushWriter
end

-- Push an element into a max heap
-- @param heap A max heap whose max element is at index 1.
-- @param e The element to be pushed. Assume element "e" is a table
--  and comparison is done via its first entry e[1]
-- @param heap_size current number of elements in the heap.
--  NOTE: There may be some garbage stored in
--  heap[heap_size+1], heap[heap_size+2], etc..
-- @return nil
local function MinHeapPush(heap, e, heap_size)
	heap_size = heap_size + 1
	heap[heap_size] = e
	local value = e[1]
	local pos = heap_size
	local parent_pos = (pos-pos%2)/2

	while (parent_pos >= 1 and heap[parent_pos][1] > value) do
		local t = heap[parent_pos]
		heap[parent_pos] = e
		heap[pos] = t
		pos = parent_pos
		parent_pos = (parent_pos-parent_pos%2)/2
	end
end

-- Pop an element from a max heap
-- @param heap A max heap whose max element is at index 1.
-- @param heap_size current number of elements in the heap.
-- @return the poped element
-- Note: This function does not change table size of "heap" to save CPU time.
local function MinHeapPop(heap, heap_size)
	local top = heap[1]
	local e = heap[heap_size]
	local value = e[1]
	heap[1] = e
	heap[heap_size] = top
	heap_size = heap_size - 1

	local pos = 1
	local left_child_pos = pos * 2
	local right_child_pos = left_child_pos + 1

	while (left_child_pos <= heap_size) do
		local left_child = heap[left_child_pos]
		if (right_child_pos <= heap_size
			and heap[right_child_pos][1] < left_child[1]) then
			local right_child = heap[right_child_pos]
			if right_child[1] < value then
				heap[right_child_pos] = e
				heap[pos] = right_child
				pos = right_child_pos
				left_child_pos = pos * 2
				right_child_pos = left_child_pos + 1
			else
				break
			end
		else
			if left_child[1] < value then
				heap[left_child_pos] = e
				heap[pos] = left_child
				pos = left_child_pos
				left_child_pos = pos * 2
				right_child_pos = left_child_pos + 1
			else
				break
			end
		end
	end

	return top
end

-- Deflate defines a special huffman tree, which is unique once the bit length
-- of huffman code of all symbols are known.
-- @param bitlen_count Number of symbols with a specific bitlen
-- @param symbol_bitlen The bit length of a symbol
-- @param max_symbol The max symbol among all symbols,
--		which is (number of symbols - 1)
-- @param max_bitlen The max huffman bit length among all symbols.
-- @return The huffman code of all symbols.
local function GetHuffmanCodeFromBitlen(bitlen_counts, symbol_bitlens
		, max_symbol, max_bitlen)
	local huffman_code = 0
	local next_codes = {}
	local symbol_huffman_codes = {}
	for bitlen = 1, max_bitlen do
		huffman_code = (huffman_code+(bitlen_counts[bitlen-1] or 0))*2
		next_codes[bitlen] = huffman_code
	end
	for symbol = 0, max_symbol do
		local bitlen = symbol_bitlens[symbol]
		if bitlen then
			huffman_code = next_codes[bitlen]
			next_codes[bitlen] = huffman_code + 1

			-- Reverse the bits of huffman code,
			-- because most signifant bits of huffman code
			-- is stored first into the compressed data.
			-- @see RFC1951 Page5 Section 3.1.1
			if bitlen <= 9 then -- Have cached reverse for small bitlen.
				symbol_huffman_codes[symbol] =
					_reverse_bits_tbl[bitlen][huffman_code]
			else
				local reverse = 0
				for _ = 1, bitlen do
					reverse = reverse - reverse%2
						+ (((reverse%2==1)
							or (huffman_code % 2) == 1) and 1 or 0)
					huffman_code = (huffman_code-huffman_code%2)/2
					reverse = reverse*2
				end
				symbol_huffman_codes[symbol] = (reverse-reverse%2)/2
			end
		end
	end
	return symbol_huffman_codes
end

-- A helper function to sort heap elements
-- a[1], b[1] is the huffman frequency
-- a[2], b[2] is the symbol value.
local function SortByFirstThenSecond(a, b)
	return a[1] < b[1] or
		(a[1] == b[1] and a[2] < b[2])
end

-- Calculate the huffman bit length and huffman code.
-- @param symbol_count: A table whose table key is the symbol, and table value
--		is the symbol frenquency (nil means 0 frequency).
-- @param max_bitlen: See description of return value.
-- @param max_symbol: The maximum symbol
-- @return a table whose key is the symbol, and the value is the huffman bit
--		bit length. We guarantee that all bit length <= max_bitlen.
--		For 0<=symbol<=max_symbol, table value could be nil if the frequency
--		of the symbol is 0 or nil.
-- @return a table whose key is the symbol, and the value is the huffman code.
-- @return a number indicating the maximum symbol whose bitlen is not 0.
local function GetHuffmanBitlenAndCode(symbol_counts, max_bitlen, max_symbol)
	local heap_size
	local max_non_zero_bitlen_symbol = -1
	local leafs = {}
	local heap = {}
	local symbol_bitlens = {}
	local symbol_codes = {}
	local bitlen_counts = {}

	--[[
		tree[1]: weight, temporarily used as parent and bitLengths
		tree[2]: symbol
		tree[3]: left child
		tree[4]: right child
	--]]
	local number_unique_symbols = 0
	for symbol, count in pairs(symbol_counts) do
		number_unique_symbols = number_unique_symbols + 1
		leafs[number_unique_symbols] = {count, symbol}
	end

	if (number_unique_symbols == 0) then
		-- no code.
		return {}, {}, -1
	elseif (number_unique_symbols == 1) then
		-- Only one code. In this case, its huffman code
		-- needs to be assigned as 0, and bit length is 1.
		-- This is the only case that the return result
		-- represents an imcomplete huffman tree.
		local symbol = leafs[1][2]
		symbol_bitlens[symbol] = 1
		symbol_codes[symbol] = 0
		return symbol_bitlens, symbol_codes, symbol
	else
		table_sort(leafs, SortByFirstThenSecond)
		heap_size = number_unique_symbols
		for i = 1, heap_size do
			heap[i] = leafs[i]
		end

		while (heap_size > 1) do
			-- Note: pop does not change table size of heap
			local leftChild = MinHeapPop(heap, heap_size)
			heap_size = heap_size - 1
			local rightChild = MinHeapPop(heap, heap_size)
			heap_size = heap_size - 1
			local newNode =
				{leftChild[1]+rightChild[1], -1, leftChild, rightChild}
			MinHeapPush(heap, newNode, heap_size)
			heap_size = heap_size + 1
		end

		-- Number of leafs whose bit length is greater than max_len.
		local number_bitlen_overflow = 0

		-- Calculate bit length of all nodes
		local fifo = {heap[1], 0, 0, 0} -- preallocate some spaces.
		local fifo_size = 1
		local index = 1
		heap[1][1] = 0
		while (index <= fifo_size) do -- Breath first search
			local e = fifo[index]
			local bitlen = e[1]
			local symbol = e[2]
			local left_child = e[3]
			local right_child = e[4]
			if left_child then
				fifo_size = fifo_size + 1
				fifo[fifo_size] = left_child
				left_child[1] = bitlen + 1
			end
			if right_child then
				fifo_size = fifo_size + 1
				fifo[fifo_size] = right_child
				right_child[1] = bitlen + 1
			end
			index = index + 1

			if (bitlen > max_bitlen) then
				number_bitlen_overflow = number_bitlen_overflow + 1
				bitlen = max_bitlen
			end
			if symbol >= 0 then
				symbol_bitlens[symbol] = bitlen
				max_non_zero_bitlen_symbol =
					(symbol > max_non_zero_bitlen_symbol)
					and symbol or max_non_zero_bitlen_symbol
				bitlen_counts[bitlen] = (bitlen_counts[bitlen] or 0) + 1
			end
		end

		-- Resolve bit length overflow
		-- @see ZLib/trees.c:gen_bitlen(s, desc), for reference
		if (number_bitlen_overflow > 0) then
			repeat
				local bitlen = max_bitlen - 1
				while ((bitlen_counts[bitlen] or 0) == 0) do
					bitlen = bitlen - 1
				end
				-- move one leaf down the tree
				bitlen_counts[bitlen] = bitlen_counts[bitlen] - 1
				-- move one overflow item as its brother
				bitlen_counts[bitlen+1] = (bitlen_counts[bitlen+1] or 0) + 2
				bitlen_counts[max_bitlen] = bitlen_counts[max_bitlen] - 1
				number_bitlen_overflow = number_bitlen_overflow - 2
			until (number_bitlen_overflow <= 0)

			index = 1
			for bitlen = max_bitlen, 1, -1 do
				local n = bitlen_counts[bitlen] or 0
				while (n > 0) do
					local symbol = leafs[index][2]
					symbol_bitlens[symbol] = bitlen
					n = n - 1
					index = index + 1
				end
			end
		end

		symbol_codes = GetHuffmanCodeFromBitlen(bitlen_counts, symbol_bitlens,
				max_symbol, max_bitlen)
		return symbol_bitlens, symbol_codes, max_non_zero_bitlen_symbol
	end
end

-- Calculate the first huffman header in the dynamic huffman block
-- @see RFC1951 Page 12
-- @param lcode_bitlen: The huffman bit length of literal/LZ77_length.
-- @param max_non_zero_bitlen_lcode: The maximum literal/LZ77_length symbol
--		whose huffman bit length is not zero.
-- @param dcode_bitlen: The huffman bit length of LZ77 distance.
-- @param max_non_zero_bitlen_dcode: The maximum LZ77 distance symbol
--		whose huffman bit length is not zero.
-- @return The run length encoded codes.
-- @return The extra bits. One entry for each rle code that needs extra bits.
--		(code == 16 or 17 or 18).
-- @return The count of appearance of each rle codes.
local function RunLengthEncodeHuffmanBitlen(
		lcode_bitlens,
		max_non_zero_bitlen_lcode,
		dcode_bitlens,
		max_non_zero_bitlen_dcode)
	local rle_code_tblsize = 0
	local rle_codes = {}
	local rle_code_counts = {}
	local rle_extra_bits_tblsize = 0
	local rle_extra_bits = {}
	local prev = nil
	local count = 0

	-- If there is no distance code, assume one distance code of bit length 0.
	-- RFC1951: One distance code of zero bits means that
	-- there are no distance codes used at all (the data is all literals).
	max_non_zero_bitlen_dcode = (max_non_zero_bitlen_dcode < 0)
			and 0 or max_non_zero_bitlen_dcode
	local max_code = max_non_zero_bitlen_lcode+max_non_zero_bitlen_dcode+1

	for code = 0, max_code+1 do
		local len = (code <= max_non_zero_bitlen_lcode)
			and (lcode_bitlens[code] or 0)
			or ((code <= max_code)
			and (dcode_bitlens[code-max_non_zero_bitlen_lcode-1] or 0) or nil)
		if len == prev then
			count = count + 1
			if len ~= 0 and count == 6 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = 16
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] = 3
				rle_code_counts[16] = (rle_code_counts[16] or 0) + 1
				count = 0
			elseif len == 0 and count == 138 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = 18
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] = 127
				rle_code_counts[18] = (rle_code_counts[18] or 0) + 1
				count = 0
			end
		else
			if count == 1 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 1
			elseif count == 2 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = prev
				rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 2
			elseif count >= 3 then
				rle_code_tblsize = rle_code_tblsize + 1
				local rleCode = (prev ~= 0) and 16 or (count <= 10 and 17 or 18)
				rle_codes[rle_code_tblsize] = rleCode
				rle_code_counts[rleCode] = (rle_code_counts[rleCode] or 0) + 1
				rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
				rle_extra_bits[rle_extra_bits_tblsize] =
					(count <= 10) and (count - 3) or (count - 11)
			end

			prev = len
			if len and len ~= 0 then
				rle_code_tblsize = rle_code_tblsize + 1
				rle_codes[rle_code_tblsize] = len
				rle_code_counts[len] = (rle_code_counts[len] or 0) + 1
				count = 0
			else
				count = 1
			end
		end
	end

	return rle_codes, rle_extra_bits, rle_code_counts
end

-- Load the string into a table, in order to speed up LZ77.
-- Loop unrolled 16 times to speed this function up.
-- @param str The string to be loaded.
-- @param t The load destination
-- @param start str[index] will be the first character to be loaded.
-- @param end str[index] will be the last character to be loaded
-- @param offset str[index] will be loaded into t[index-offset]
-- @return t
local function LoadStringToTable(str, t, start, stop, offset)
	local i = start - offset
	while i <= stop - 15 - offset do
		t[i], t[i+1], t[i+2], t[i+3], t[i+4], t[i+5], t[i+6], t[i+7], t[i+8],
		t[i+9], t[i+10], t[i+11], t[i+12], t[i+13], t[i+14], t[i+15] =
			string_byte(str, i + offset, i + 15 + offset)
		i = i + 16
	end
	while (i <= stop - offset) do
		t[i] = string_byte(str, i + offset, i + offset)
		i = i + 1
	end
	return t
end

-- Do LZ77 process. This function uses the majority of the CPU time.
-- @see zlib/deflate.c:deflate_fast(), zlib/deflate.c:deflate_slow()
-- @see https://github.com/madler/zlib/blob/master/doc/algorithm.txt
-- This function uses the algorithms used above. You should read the
-- algorithm.txt above to understand what is the hash function and the
-- lazy evaluation.
--
-- The special optimization used here is hash functions used here.
-- The hash function is just the multiplication of the three consective
-- characters. So if the hash matches, it guarantees 3 characters are matched.
-- This optimization can be implemented because Lua table is a hash table.
--
-- @param level integer that describes compression level.
-- @param string_table table that stores the value of string to be compressed.
--			The index of this table starts from 1.
--			The caller needs to make sure all values needed by this function
--			are loaded.
--			Assume "str" is the origin input string into the compressor
--			str[block_start]..str[block_end+3] needs to be loaded into
--			string_table[block_start-offset]..string_table[block_end-offset]
--			If dictionary is presented, the last 258 bytes of the dictionary
--			needs to be loaded into sing_table[-257..0]
--			(See more in the description of offset.)
-- @param hash_tables. The table key is the hash value (0<=hash<=16777216=256^3)
--			The table value is an array0 that stores the indexes of the
--			input data string to be compressed, such that
--			hash == str[index]*str[index+1]*str[index+2]
--			Indexes are ordered in this array.
-- @param block_start The indexes of the input data string to be compressed.
--				that starts the LZ77 block.
-- @param block_end The indexes of the input data string to be compressed.
--				that stores the LZ77 block.
-- @param offset str[index] is stored in string_table[index-offset],
--			This offset is mainly an optimization to limit the index
--			of string_table, so lua can access this table quicker.
-- @param dictionary See LibDeflate:CreateDictionary
-- @return literal/LZ77_length deflate codes.
-- @return the extra bits of literal/LZ77_length deflate codes.
-- @return the count of each literal/LZ77 deflate code.
-- @return LZ77 distance deflate codes.
-- @return the extra bits of LZ77 distance deflate codes.
-- @return the count of each LZ77 distance deflate code.
local function GetBlockLZ77Result(level, string_table, hash_tables, block_start,
		block_end, offset, dictionary)
	local config = _compression_level_configs[level]
	local config_use_lazy
		, config_good_prev_length
		, config_max_lazy_match
		, config_nice_length
		, config_max_hash_chain =
			config[1], config[2], config[3], config[4], config[5]

	local config_max_insert_length = (not config_use_lazy)
		and config_max_lazy_match or 2147483646
	local config_good_hash_chain =
		(config_max_hash_chain-config_max_hash_chain%4/4)

	local hash

	local dict_hash_tables
	local dict_string_table
	local dict_string_len = 0

	if dictionary then
		dict_hash_tables = dictionary.hash_tables
		dict_string_table = dictionary.string_table
		dict_string_len = dictionary.strlen
		assert(block_start == 1)
		if block_end >= block_start and dict_string_len >= 2 then
			hash = dict_string_table[dict_string_len-1]*65536
				+ dict_string_table[dict_string_len]*256 + string_table[1]
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = -1
		end
		if block_end >= block_start+1 and dict_string_len >= 1 then
			hash = dict_string_table[dict_string_len]*65536
				+ string_table[1]*256 + string_table[2]
			local t = hash_tables[hash]
			if not t then t = {}; hash_tables[hash] = t end
			t[#t+1] = 0
		end
	end

	local dict_string_len_plus3 = dict_string_len + 3

	hash = (string_table[block_start-offset] or 0)*256
		+ (string_table[block_start+1-offset] or 0)

	local lcodes = {}
	local lcode_tblsize = 0
	local lcodes_counts = {}
	local dcodes = {}
	local dcodes_tblsize = 0
	local dcodes_counts = {}

	local lextra_bits = {}
	local lextra_bits_tblsize = 0
	local dextra_bits = {}
	local dextra_bits_tblsize = 0

	local match_available = false
	local prev_len
	local prev_dist
	local cur_len = 0
	local cur_dist = 0

	local index = block_start
	local index_end = block_end + (config_use_lazy and 1 or 0)

	-- the zlib source code writes separate code for lazy evaluation and
	-- not lazy evaluation, which is easier to understand.
	-- I put them together, so it is a bit harder to understand.
	-- because I think this is easier for me to maintain it.
	while (index <= index_end) do
		local string_table_index = index - offset
		local offset_minus_three = offset - 3
		prev_len = cur_len
		prev_dist = cur_dist
		cur_len = 0

		hash = (hash*256+(string_table[string_table_index+2] or 0))%16777216

		local chain_index
		local cur_chain
		local hash_chain = hash_tables[hash]
		local chain_old_size
		if not hash_chain then
			chain_old_size = 0
			hash_chain = {}
			hash_tables[hash] = hash_chain
			if dict_hash_tables then
				cur_chain = dict_hash_tables[hash]
				chain_index = cur_chain and #cur_chain or 0
			else
				chain_index = 0
			end
		else
			chain_old_size = #hash_chain
			cur_chain = hash_chain
			chain_index = chain_old_size
		end

		if index <= block_end then
			hash_chain[chain_old_size+1] = index
		end

		if (chain_index > 0 and index + 2 <= block_end
			and (not config_use_lazy or prev_len < config_max_lazy_match)) then

			local depth =
				(config_use_lazy and prev_len >= config_good_prev_length)
				and config_good_hash_chain or config_max_hash_chain

			local max_len_minus_one = block_end - index
			max_len_minus_one = (max_len_minus_one >= 257) and 257 or max_len_minus_one
			max_len_minus_one = max_len_minus_one + string_table_index
			local string_table_index_plus_three = string_table_index + 3

			while chain_index >= 1 and depth > 0 do
				local prev = cur_chain[chain_index]

				if index - prev > 32768 then
					break
				end
				if prev < index then
					local sj = string_table_index_plus_three

					if prev >= -257 then
						local pj = prev - offset_minus_three
						while (sj <= max_len_minus_one
								and string_table[pj]
								== string_table[sj]) do
							sj = sj + 1
							pj = pj + 1
						end
					else
						local pj = dict_string_len_plus3 + prev
						while (sj <= max_len_minus_one
								and dict_string_table[pj]
								== string_table[sj]) do
							sj = sj + 1
							pj = pj + 1
						end
					end
					local j = sj - string_table_index
					if j > cur_len then
						cur_len = j
						cur_dist = index - prev
					end
					if cur_len >= config_nice_length then
						break
					end
				end

				chain_index = chain_index - 1
				depth = depth - 1
				if chain_index == 0 and prev > 0 and dict_hash_tables then
					cur_chain = dict_hash_tables[hash]
					chain_index = cur_chain and #cur_chain or 0
				end
			end
		end

		if not config_use_lazy then
			prev_len, prev_dist = cur_len, cur_dist
		end
		if ((not config_use_lazy or match_available)
			and (prev_len > 3 or (prev_len == 3 and prev_dist < 4096))
			and cur_len <= prev_len )then
			local code = _length_to_deflate_code[prev_len]
			local length_extra_bits_bitlen =
				_length_to_deflate_extra_bitlen[prev_len]
			local dist_code, dist_extra_bits_bitlen, dist_extra_bits
			if prev_dist <= 256 then -- have cached code for small distance.
				dist_code = _dist256_to_deflate_code[prev_dist]
				dist_extra_bits = _dist256_to_deflate_extra_bits[prev_dist]
				dist_extra_bits_bitlen =
					_dist256_to_deflate_extra_bitlen[prev_dist]
			else
				dist_code = 16
				dist_extra_bits_bitlen = 7
				local a = 384
				local b = 512

				while true do
					if prev_dist <= a then
						dist_extra_bits = (prev_dist-(b/2)-1) % (b/4)
						break
					elseif prev_dist <= b then
						dist_extra_bits = (prev_dist-(b/2)-1) % (b/4)
						dist_code = dist_code + 1
						break
					else
						dist_code = dist_code + 2
						dist_extra_bits_bitlen = dist_extra_bits_bitlen + 1
						a = a*2
						b = b*2
					end
				end
			end
			lcode_tblsize = lcode_tblsize + 1
			lcodes[lcode_tblsize] = code
			lcodes_counts[code] = (lcodes_counts[code] or 0) + 1

			dcodes_tblsize = dcodes_tblsize + 1
			dcodes[dcodes_tblsize] = dist_code
			dcodes_counts[dist_code] = (dcodes_counts[dist_code] or 0) + 1

			if length_extra_bits_bitlen > 0 then
				local lenExtraBits = _length_to_deflate_extra_bits[prev_len]
				lextra_bits_tblsize = lextra_bits_tblsize + 1
				lextra_bits[lextra_bits_tblsize] = lenExtraBits
			end
			if dist_extra_bits_bitlen > 0 then
				dextra_bits_tblsize = dextra_bits_tblsize + 1
				dextra_bits[dextra_bits_tblsize] = dist_extra_bits
			end

			for i=index+1, index+prev_len-(config_use_lazy and 2 or 1) do
				hash = (hash*256+(string_table[i-offset+2] or 0))%16777216
				if prev_len <= config_max_insert_length then
					hash_chain = hash_tables[hash]
					if not hash_chain then
						hash_chain = {}
						hash_tables[hash] = hash_chain
					end
					hash_chain[#hash_chain+1] = i
				end
			end
			index = index + prev_len - (config_use_lazy and 1 or 0)
			match_available = false
		elseif (not config_use_lazy) or match_available then
			local code = string_table[config_use_lazy
				and (string_table_index-1) or string_table_index]
			lcode_tblsize = lcode_tblsize + 1
			lcodes[lcode_tblsize] = code
			lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
			index = index + 1
		else
			match_available = true
			index = index + 1
		end
	end

	-- Write "end of block" symbol
	lcode_tblsize = lcode_tblsize + 1
	lcodes[lcode_tblsize] = 256
	lcodes_counts[256] = (lcodes_counts[256] or 0) + 1

	return lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits
		, dcodes_counts
end

-- Get the header data of dynamic block.
-- @param lcodes_count The count of each literal/LZ77_length codes.
-- @param dcodes_count The count of each Lz77 distance codes.
-- @return a lots of stuffs.
-- @see RFC1951 Page 12
local function GetBlockDynamicHuffmanHeader(lcodes_counts, dcodes_counts)
	local lcodes_huffman_bitlens, lcodes_huffman_codes
		, max_non_zero_bitlen_lcode =
		GetHuffmanBitlenAndCode(lcodes_counts, 15, 285)
	local dcodes_huffman_bitlens, dcodes_huffman_codes
		, max_non_zero_bitlen_dcode =
		GetHuffmanBitlenAndCode(dcodes_counts, 15, 29)

	local rle_deflate_codes, rle_extra_bits, rle_codes_counts =
		RunLengthEncodeHuffmanBitlen(lcodes_huffman_bitlens
		,max_non_zero_bitlen_lcode, dcodes_huffman_bitlens
		, max_non_zero_bitlen_dcode)

	local rle_codes_huffman_bitlens, rle_codes_huffman_codes =
		GetHuffmanBitlenAndCode(rle_codes_counts, 7, 18)

	local HCLEN = 0
	for i = 1, 19 do
		local symbol = _rle_codes_huffman_bitlen_order[i]
		local length = rle_codes_huffman_bitlens[symbol] or 0
		if length ~= 0 then
			HCLEN = i
		end
	end

	HCLEN = HCLEN - 4
	local HLIT = max_non_zero_bitlen_lcode + 1 - 257
	local HDIST = max_non_zero_bitlen_dcode + 1 - 1
	if HDIST < 0 then HDIST = 0 end

	return HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens
		, rle_codes_huffman_codes, rle_deflate_codes, rle_extra_bits
		, lcodes_huffman_bitlens, lcodes_huffman_codes
		, dcodes_huffman_bitlens, dcodes_huffman_codes
end

-- Get the size of dynamic block without writing any bits into the writer.
-- @param ... Read the source code of GetBlockDynamicHuffmanHeader()
-- @return the bit length of the dynamic block
local function GetDynamicHuffmanBlockSize(lcodes, dcodes, HCLEN
	, rle_codes_huffman_bitlens, rle_deflate_codes
	, lcodes_huffman_bitlens, dcodes_huffman_bitlens)

	local block_bitlen = 17 -- 1+2+5+5+4
	block_bitlen = block_bitlen + (HCLEN+4)*3

	for i = 1, #rle_deflate_codes do
		local code = rle_deflate_codes[i]
		block_bitlen = block_bitlen + rle_codes_huffman_bitlens[code]
		if code >= 16 then
			block_bitlen = block_bitlen +
			((code == 16) and 2 or (code == 17 and 3 or 7))
		end
	end

	local length_code_count = 0
	for i = 1, #lcodes do
		local code = lcodes[i]
		local huffman_bitlen = lcodes_huffman_bitlens[code]
		block_bitlen = block_bitlen + huffman_bitlen
		if code > 256 then -- Length code
			length_code_count = length_code_count + 1
			if code > 264 and code < 285 then -- Length code with extra bits
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[code-256]
				block_bitlen = block_bitlen + extra_bits_bitlen
			end
			local dist_code = dcodes[length_code_count]
			local dist_huffman_bitlen = dcodes_huffman_bitlens[dist_code]
			block_bitlen = block_bitlen + dist_huffman_bitlen

			if dist_code > 3 then -- dist code with extra bits
				local dist_extra_bits_bitlen = (dist_code-dist_code%2)/2 - 1
				block_bitlen = block_bitlen + dist_extra_bits_bitlen
			end
		end
	end
	return block_bitlen
end

-- Write dynamic block.
-- @param ... Read the source code of GetBlockDynamicHuffmanHeader()
local function CompressDynamicHuffmanBlock(WriteBits, is_last_block
		, lcodes, lextra_bits, dcodes, dextra_bits, HLIT, HDIST, HCLEN
		, rle_codes_huffman_bitlens, rle_codes_huffman_codes
		, rle_deflate_codes, rle_extra_bits
		, lcodes_huffman_bitlens, lcodes_huffman_codes
		, dcodes_huffman_bitlens, dcodes_huffman_codes)

	WriteBits(is_last_block and 1 or 0, 1) -- Last block identifier
	WriteBits(2, 2) -- Dynamic Huffman block identifier

	WriteBits(HLIT, 5)
	WriteBits(HDIST, 5)
	WriteBits(HCLEN, 4)

	for i = 1, HCLEN+4 do
		local symbol = _rle_codes_huffman_bitlen_order[i]
		local length = rle_codes_huffman_bitlens[symbol] or 0
		WriteBits(length, 3)
	end

	local rleExtraBitsIndex = 1
	for i=1, #rle_deflate_codes do
		local code = rle_deflate_codes[i]
		WriteBits(rle_codes_huffman_codes[code]
			, rle_codes_huffman_bitlens[code])
		if code >= 16 then
			local extraBits = rle_extra_bits[rleExtraBitsIndex]
			WriteBits(extraBits, (code == 16) and 2 or (code == 17 and 3 or 7))
			rleExtraBitsIndex = rleExtraBitsIndex + 1
		end
	end

	local length_code_count = 0
	local length_code_with_extra_count = 0
	local dist_code_with_extra_count = 0

	for i=1, #lcodes do
		local deflate_codee = lcodes[i]
		local huffman_code = lcodes_huffman_codes[deflate_codee]
		local huffman_bitlen = lcodes_huffman_bitlens[deflate_codee]
		WriteBits(huffman_code, huffman_bitlen)
		if deflate_codee > 256 then -- Length code
			length_code_count = length_code_count + 1
			if deflate_codee > 264 and deflate_codee < 285 then
				-- Length code with extra bits
				length_code_with_extra_count = length_code_with_extra_count + 1
				local extra_bits = lextra_bits[length_code_with_extra_count]
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[deflate_codee-256]
				WriteBits(extra_bits, extra_bits_bitlen)
			end
			-- Write distance code
			local dist_deflate_code = dcodes[length_code_count]
			local dist_huffman_code = dcodes_huffman_codes[dist_deflate_code]
			local dist_huffman_bitlen =
				dcodes_huffman_bitlens[dist_deflate_code]
			WriteBits(dist_huffman_code, dist_huffman_bitlen)

			if dist_deflate_code > 3 then -- dist code with extra bits
				dist_code_with_extra_count = dist_code_with_extra_count + 1
				local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
				local dist_extra_bits_bitlen =
					(dist_deflate_code-dist_deflate_code%2)/2 - 1
				WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
			end
		end
	end
end

-- Get the size of fixed block without writing any bits into the writer.
-- @param lcodes literal/LZ77_length deflate codes
-- @param decodes LZ77 distance deflate codes
-- @return the bit length of the fixed block
local function GetFixedHuffmanBlockSize(lcodes, dcodes)
	local block_bitlen = 3
	local length_code_count = 0
	for i=1, #lcodes do
		local code = lcodes[i]
		local huffman_bitlen = _fix_block_literal_huffman_bitlen[code]
		block_bitlen = block_bitlen + huffman_bitlen
		if code > 256 then -- Length code
			length_code_count = length_code_count + 1
			if code > 264 and code < 285 then -- Length code with extra bits
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[code-256]
				block_bitlen = block_bitlen + extra_bits_bitlen
			end
			local dist_code = dcodes[length_code_count]
			block_bitlen = block_bitlen + 5

			if dist_code > 3 then -- dist code with extra bits
				local dist_extra_bits_bitlen =
					(dist_code-dist_code%2)/2 - 1
				block_bitlen = block_bitlen + dist_extra_bits_bitlen
			end
		end
	end
	return block_bitlen
end

-- Write fixed block.
-- @param lcodes literal/LZ77_length deflate codes
-- @param decodes LZ77 distance deflate codes
local function CompressFixedHuffmanBlock(WriteBits, is_last_block,
		lcodes, lextra_bits, dcodes, dextra_bits)
	WriteBits(is_last_block and 1 or 0, 1) -- Last block identifier
	WriteBits(1, 2) -- Fixed Huffman block identifier
	local length_code_count = 0
	local length_code_with_extra_count = 0
	local dist_code_with_extra_count = 0
	for i=1, #lcodes do
		local deflate_code = lcodes[i]
		local huffman_code = _fix_block_literal_huffman_code[deflate_code]
		local huffman_bitlen = _fix_block_literal_huffman_bitlen[deflate_code]
		WriteBits(huffman_code, huffman_bitlen)
		if deflate_code > 256 then -- Length code
			length_code_count = length_code_count + 1
			if deflate_code > 264 and deflate_code < 285 then
				-- Length code with extra bits
				length_code_with_extra_count = length_code_with_extra_count + 1
				local extra_bits = lextra_bits[length_code_with_extra_count]
				local extra_bits_bitlen =
					_literal_deflate_code_to_extra_bitlen[deflate_code-256]
				WriteBits(extra_bits, extra_bits_bitlen)
			end
			-- Write distance code
			local dist_code = dcodes[length_code_count]
			local dist_huffman_code = _fix_block_dist_huffman_code[dist_code]
			WriteBits(dist_huffman_code, 5)

			if dist_code > 3 then -- dist code with extra bits
				dist_code_with_extra_count = dist_code_with_extra_count + 1
				local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
				local dist_extra_bits_bitlen = (dist_code-dist_code%2)/2 - 1
				WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
			end
		end
	end
end

-- Get the size of store block without writing any bits into the writer.
-- @param block_start The start index of the origin input string
-- @param block_end The end index of the origin input string
-- @param Total bit lens had been written into the compressed result before,
-- because store block needs to shift to byte boundary.
-- @return the bit length of the fixed block
local function GetStoreBlockSize(block_start, block_end, total_bitlen)
	assert(block_end-block_start+1 <= 65535)
	local block_bitlen = 3
	total_bitlen = total_bitlen + 3
	local padding_bitlen = (8-total_bitlen%8)%8
	block_bitlen = block_bitlen + padding_bitlen
	block_bitlen = block_bitlen + 32
	block_bitlen = block_bitlen + (block_end - block_start + 1) * 8
	return block_bitlen
end

-- Write the store block.
-- @param ... lots of stuffs
-- @return nil
local function CompressStoreBlock(WriteBits, WriteString, is_last_block, str
	, block_start, block_end, total_bitlen)
	assert(block_end-block_start+1 <= 65535)
	WriteBits(is_last_block and 1 or 0, 1) -- Last block identifer.
	WriteBits(0, 2) -- Store block identifier.
	total_bitlen = total_bitlen + 3
	local padding_bitlen = (8-total_bitlen%8)%8
	if padding_bitlen > 0 then
		WriteBits(_pow2[padding_bitlen]-1, padding_bitlen)
	end
	local size = block_end - block_start + 1
	WriteBits(size, 16)

	-- Write size's one's complement
	local comp = (255 - size % 256) + (255 - (size-size%256)/256)*256
	WriteBits(comp, 16)

	WriteString(str:sub(block_start, block_end))
end

-- Do the deflate
-- Currently using a simple way to determine the block size
-- (This is why the compression ratio is little bit worse than zlib when
-- the input size is very large
-- The first block is 64KB, the following block is 32KB.
-- After each block, there is a memory cleanup operation.
-- This is not a fast operation, but it is needed to save memory usage, so
-- the memory usage does not grow unboundly. If the data size is less than
-- 64KB, then memory cleanup won't happen.
-- This function determines whether to use store/fixed/dynamic blocks by
-- calculating the block size of each block type and chooses the smallest one.
local function Deflate(configs, WriteBits, WriteString, FlushWriter, str
	, dictionary)
	local string_table = {}
	local hash_tables = {}
	local is_last_block = nil
	local block_start
	local block_end
	local bitlen_written
	local total_bitlen = FlushWriter(_FLUSH_MODE_NO_FLUSH)
	local strlen = #str
	local offset

	local level
	local strategy
	if configs then
		if configs.level then
			level = configs.level
		end
		if configs.strategy then
			strategy = configs.strategy
		end
	end

	if not level then
		if strlen < 2048 then
			level = 7
		elseif strlen > 65536 then
			level = 3
		else
			level = 5
		end
	end

	while not is_last_block do
		if not block_start then
			block_start = 1
			block_end = 64*1024 - 1
			offset = 0
		else
			block_start = block_end + 1
			block_end = block_end + 32*1024
			offset = block_start - 32*1024 - 1
		end

		if block_end >= strlen then
			block_end = strlen
			is_last_block = true
		else
			is_last_block = false
		end

		local lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits
			, dcodes_counts

		local HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens
			, rle_codes_huffman_codes, rle_deflate_codes
			, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes
			, dcodes_huffman_bitlens, dcodes_huffman_codes

		local dynamic_block_bitlen
		local fixed_block_bitlen
		local store_block_bitlen

		if level ~= 0 then

			-- GetBlockLZ77 needs block_start to block_end+3 to be loaded.
			LoadStringToTable(str, string_table, block_start, block_end + 3
				, offset)
			if block_start == 1 and dictionary then
				local dict_string_table = dictionary.string_table
				local dict_strlen = dictionary.strlen
				for i=0, (-dict_strlen+1)<-257
					and -257 or (-dict_strlen+1), -1 do
					string_table[i] = dict_string_table[dict_strlen+i]
				end
			end

			if strategy == "huffman_only" then
				lcodes = {}
				LoadStringToTable(str, lcodes, block_start, block_end
					, block_start-1)
				lextra_bits = {}
				lcodes_counts = {}
				lcodes[block_end - block_start+2] = 256 -- end of block
				for i=1, block_end - block_start+2 do
					local code = lcodes[i]
					lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
				end
				dcodes = {}
				dextra_bits = {}
				dcodes_counts = {}
			else
				lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits
				, dcodes_counts = GetBlockLZ77Result(level, string_table
				, hash_tables, block_start, block_end, offset, dictionary
				)
			end

			HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens
				, rle_codes_huffman_codes, rle_deflate_codes
				, rle_extra_bits, lcodes_huffman_bitlens, lcodes_huffman_codes
				, dcodes_huffman_bitlens, dcodes_huffman_codes =
				GetBlockDynamicHuffmanHeader(lcodes_counts, dcodes_counts)
			dynamic_block_bitlen = GetDynamicHuffmanBlockSize(
					lcodes, dcodes, HCLEN, rle_codes_huffman_bitlens
					, rle_deflate_codes, lcodes_huffman_bitlens
					, dcodes_huffman_bitlens)
			fixed_block_bitlen = GetFixedHuffmanBlockSize(lcodes, dcodes)
		end

		store_block_bitlen = GetStoreBlockSize(block_start, block_end
			, total_bitlen)

		local min_bitlen = store_block_bitlen
		min_bitlen = (fixed_block_bitlen and fixed_block_bitlen < min_bitlen)
			and fixed_block_bitlen or min_bitlen
		min_bitlen = (dynamic_block_bitlen
			and dynamic_block_bitlen < min_bitlen)
			and dynamic_block_bitlen or min_bitlen

		if level == 0 or (strategy ~= "fixed" and strategy ~= "dynamic" and
			store_block_bitlen == min_bitlen) then
			CompressStoreBlock(WriteBits, WriteString, is_last_block
				, str, block_start, block_end, total_bitlen)
			total_bitlen = total_bitlen + store_block_bitlen
		elseif strategy ~= "dynamic" and (
			strategy == "fixed" or fixed_block_bitlen == min_bitlen) then
			CompressFixedHuffmanBlock(WriteBits, is_last_block,
					lcodes, lextra_bits, dcodes, dextra_bits)
			total_bitlen = total_bitlen + fixed_block_bitlen
		elseif strategy == "dynamic" or dynamic_block_bitlen == min_bitlen then
			CompressDynamicHuffmanBlock(WriteBits, is_last_block, lcodes
				, lextra_bits, dcodes, dextra_bits, HLIT, HDIST, HCLEN
				, rle_codes_huffman_bitlens, rle_codes_huffman_codes
				, rle_deflate_codes, rle_extra_bits
				, lcodes_huffman_bitlens, lcodes_huffman_codes
				, dcodes_huffman_bitlens, dcodes_huffman_codes)
			total_bitlen = total_bitlen + dynamic_block_bitlen
		end

		if is_last_block then
			bitlen_written = FlushWriter(_FLUSH_MODE_NO_FLUSH)
		else
			bitlen_written = FlushWriter(_FLUSH_MODE_MEMORY_CLEANUP)
		end

		assert(bitlen_written == total_bitlen)

		-- Memory clean up, so memory consumption does not always grow linearly
		-- , even if input string is > 64K.
		-- Not a very efficient operation, but this operation won't happen
		-- when the input data size is less than 64K.
		if not is_last_block then
			local j
			if dictionary and block_start == 1 then
				j = 0
				while (string_table[j]) do
					string_table[j] = nil
					j = j - 1
				end
			end
			dictionary = nil
			j = 1
			for i = block_end-32767, block_end do
				string_table[j] = string_table[i-offset]
				j = j + 1
			end

			for k, t in pairs(hash_tables) do
				local tSize = #t
				if tSize > 0 and block_end+1 - t[1] > 32768 then
					if tSize == 1 then
						hash_tables[k] = nil
					else
						local new = {}
						local newSize = 0
						for i = 2, tSize do
							j = t[i]
							if block_end+1 - j <= 32768 then
								newSize = newSize + 1
								new[newSize] = j
							end
						end
						hash_tables[k] = new
					end
				end
			end
		end
	end
end

--- The description to compression configuration table. <br>
-- Any field can be nil to use its default. <br>
-- Table with keys other than those below is an invalid table.
-- @class table
-- @name compression_configs
-- @field level The compression level ranged from 0 to 9. 0 is no compression.
-- 9 is the slowest but best compression. Use nil for default level.
-- @field strategy The compression strategy. "fixed" to only use fixed deflate
-- compression block. "dynamic" to only use dynamic block. "huffman_only" to
-- do no LZ77 compression. Only do huffman compression.


-- @see LibDeflate:CompressDeflate(str, configs)
-- @see LibDeflate:CompressDeflateWithDict(str, dictionary, configs)
local function CompressDeflateInternal(str, dictionary, configs)
	local WriteBits, WriteString, FlushWriter = CreateWriter()
	Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
	local total_bitlen, result = FlushWriter(_FLUSH_MODE_OUTPUT)
	local padding_bitlen = (8-total_bitlen%8)%8
	return result, padding_bitlen
end

-- @see LibDeflate:CompressZlib
-- @see LibDeflate:CompressZlibWithDict
local function CompressZlibInternal(str, dictionary, configs)
	local WriteBits, WriteString, FlushWriter = CreateWriter()

	local CM = 8 -- Compression method
	local CINFO = 7 --Window Size = 32K
	local CMF = CINFO*16+CM
	WriteBits(CMF, 8)

	local FDIST = dictionary and 1 or 0
	local FLEVEL = 2 -- Default compression
	local FLG = FLEVEL*64+FDIST*32
	local FCHECK = (31-(CMF*256+FLG)%31)
	-- The FCHECK value must be such that CMF and FLG,
	-- when viewed as a 16-bit unsigned integer stored
	-- in MSB order (CMF*256 + FLG), is a multiple of 31.
	FLG = FLG + FCHECK
	WriteBits(FLG, 8)

	if FDIST == 1 then
		local adler32 = dictionary.adler32
		local byte0 = adler32 % 256
		adler32 = (adler32 - byte0) / 256
		local byte1 = adler32 % 256
		adler32 = (adler32 - byte1) / 256
		local byte2 = adler32 % 256
		adler32 = (adler32 - byte2) / 256
		local byte3 = adler32 % 256
		WriteBits(byte3, 8)
		WriteBits(byte2, 8)
		WriteBits(byte1, 8)
		WriteBits(byte0, 8)
	end

	Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
	FlushWriter(_FLUSH_MODE_BYTE_BOUNDARY)

	local adler32 = LibDeflate:Adler32(str)

	-- Most significant byte first
	local byte3 = adler32%256
	adler32 = (adler32 - byte3) / 256
	local byte2 = adler32%256
	adler32 = (adler32 - byte2) / 256
	local byte1 = adler32%256
	adler32 = (adler32 - byte1) / 256
	local byte0 = adler32%256

	WriteBits(byte0, 8)
	WriteBits(byte1, 8)
	WriteBits(byte2, 8)
	WriteBits(byte3, 8)
	local total_bitlen, result = FlushWriter(_FLUSH_MODE_OUTPUT)
	local padding_bitlen = (8-total_bitlen%8)%8
	return result, padding_bitlen
end

--- Compress using the raw deflate format.
-- @param str [string] The data to be compressed.
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- 0 <= bits < 8  <br>
-- This means the most significant "bits" of the last byte of the returned
-- compressed data are padding bits and they don't affect decompression.
-- You don't need to use this value unless you want to do some postprocessing
-- to the compressed data.
-- @see compression_configs
-- @see LibDeflate:DecompressDeflate
function LibDeflate:CompressDeflate(str, configs)
	local arg_valid, arg_err = IsValidArguments(str, false, nil, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressDeflate(str, configs): "
			..arg_err), 2)
	end
	return CompressDeflateInternal(str, nil, configs)
end

--- Compress using the raw deflate format with a preset dictionary.
-- @param str [string] The data to be compressed.
-- @param dictionary [table] The preset dictionary produced by
-- LibDeflate:CreateDictionary
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- 0 <= bits < 8  <br>
-- This means the most significant "bits" of the last byte of the returned
-- compressed data are padding bits and they don't affect decompression.
-- You don't need to use this value unless you want to do some postprocessing
-- to the compressed data.
-- @see compression_configs
-- @see LibDeflate:CreateDictionary
-- @see LibDeflate:DecompressDeflateWithDict
function LibDeflate:CompressDeflateWithDict(str, dictionary, configs)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary
		, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressDeflateWithDict"
			.."(str, dictionary, configs): "
			..arg_err), 2)
	end
	return CompressDeflateInternal(str, dictionary, configs)
end

--- Compress using the zlib format.
-- @param str [string] the data to be compressed.
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- Should always be 0.
-- Zlib formatted compressed data never has padding bits at the end.
-- @see compression_configs
-- @see LibDeflate:DecompressZlib
function LibDeflate:CompressZlib(str, configs)
	local arg_valid, arg_err = IsValidArguments(str, false, nil, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressZlib(str, configs): "
			..arg_err), 2)
	end
	return CompressZlibInternal(str, nil, configs)
end

--- Compress using the zlib format with a preset dictionary.
-- @param str [string] the data to be compressed.
-- @param dictionary [table] A preset dictionary produced
-- by LibDeflate:CreateDictionary()
-- @param configs [table/nil] The configuration table to control the compression
-- . If nil, use the default configuration.
-- @return [string] The compressed data.
-- @return [integer] The number of bits padded at the end of output.
-- Should always be 0.
-- Zlib formatted compressed data never has padding bits at the end.
-- @see compression_configs
-- @see LibDeflate:CreateDictionary
-- @see LibDeflate:DecompressZlibWithDict
function LibDeflate:CompressZlibWithDict(str, dictionary, configs)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary
		, true, configs)
	if not arg_valid then
		error(("Usage: LibDeflate:CompressZlibWithDict"
			.."(str, dictionary, configs): "
			..arg_err), 2)
	end
	return CompressZlibInternal(str, dictionary, configs)
end

--[[ --------------------------------------------------------------------------
	Decompress code
--]] --------------------------------------------------------------------------

--[[
	Create a reader to easily reader stuffs as the unit of bits.
	Return values:
	1. ReadBits(bitlen)
	2. ReadBytes(bytelen, buffer, buffer_size)
	3. Decode(huffman_bitlen_count, huffman_symbol, min_bitlen)
	4. ReaderBitlenLeft()
	5. SkipToByteBoundary()
--]]
local function CreateReader(input_string)
	local input = input_string
	local input_strlen = #input_string
	local input_next_byte_pos = 1
	local cache_bitlen = 0
	local cache = 0

	-- Read some bits.
	-- To improve speed, this function does not
	-- check if the input has been exhausted.
	-- Use ReaderBitlenLeft() < 0 to check it.
	-- @param bitlen the number of bits to read
	-- @return the data is read.
	local function ReadBits(bitlen)
		local rshift_mask = _pow2[bitlen]
		local code
		if bitlen <= cache_bitlen then
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
			cache_bitlen = cache_bitlen - bitlen
		else -- Whether input has been exhausted is not checked.
			local lshift_mask = _pow2[cache_bitlen]
			local byte1, byte2, byte3, byte4 = string_byte(input
				, input_next_byte_pos, input_next_byte_pos+3)
			-- This requires lua number to be at least double ()
			cache = cache + ((byte1 or 0)+(byte2 or 0)*256
				+ (byte3 or 0)*65536+(byte4 or 0)*16777216)*lshift_mask
			input_next_byte_pos = input_next_byte_pos + 4
			cache_bitlen = cache_bitlen + 32 - bitlen
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
		end
		return code
	end

	-- Read some bytes from the reader.
	-- Assume reader is on the byte boundary.
	-- @param bytelen The number of bytes to be read.
	-- @param buffer The byte read will be stored into this buffer.
	-- @param buffer_size The buffer will be modified starting from
	--	buffer[buffer_size+1], ending at buffer[buffer_size+bytelen-1]
	-- @return the new buffer_size
	local function ReadBytes(bytelen, buffer, buffer_size)
		assert(cache_bitlen % 8 == 0)

		local byte_from_cache = (cache_bitlen/8 < bytelen)
			and (cache_bitlen/8) or bytelen
		for _=1, byte_from_cache do
			local byte = cache % 256
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_char(byte)
			cache = (cache - byte) / 256
		end
		cache_bitlen = cache_bitlen - byte_from_cache*8
		bytelen = bytelen - byte_from_cache
		if (input_strlen - input_next_byte_pos - bytelen + 1) * 8
			+ cache_bitlen < 0 then
			return -1 -- out of input
		end
		for i=input_next_byte_pos, input_next_byte_pos+bytelen-1 do
			buffer_size = buffer_size + 1
			buffer[buffer_size] = string_sub(input, i, i)
		end

		input_next_byte_pos = input_next_byte_pos + bytelen
		return buffer_size
	end

	-- Decode huffman code
	-- To improve speed, this function does not check
	-- if the input has been exhausted.
	-- Use ReaderBitlenLeft() < 0 to check it.
	-- Credits for Mark Adler. This code is from puff:Decode()
	-- @see puff:Decode(...)
	-- @param huffman_bitlen_count
	-- @param huffman_symbol
	-- @param min_bitlen The minimum huffman bit length of all symbols
	-- @return The decoded deflate code.
	--	Negative value is returned if decoding fails.
	local function Decode(huffman_bitlen_counts, huffman_symbols, min_bitlen)
		local code = 0
		local first = 0
		local index = 0
		local count
		if min_bitlen > 0 then
			if cache_bitlen < 15 and input then
				local lshift_mask = _pow2[cache_bitlen]
				local byte1, byte2, byte3, byte4 =
					string_byte(input, input_next_byte_pos
					, input_next_byte_pos+3)
				-- This requires lua number to be at least double ()
				cache = cache + ((byte1 or 0)+(byte2 or 0)*256
					+(byte3 or 0)*65536+(byte4 or 0)*16777216)*lshift_mask
				input_next_byte_pos = input_next_byte_pos + 4
				cache_bitlen = cache_bitlen + 32
			end

			local rshift_mask = _pow2[min_bitlen]
			cache_bitlen = cache_bitlen - min_bitlen
			code = cache % rshift_mask
			cache = (cache - code) / rshift_mask
			-- Reverse the bits
			code = _reverse_bits_tbl[min_bitlen][code]

			count = huffman_bitlen_counts[min_bitlen]
			if code < count then
				return huffman_symbols[code]
			end
			index = count
			first = count * 2
			code = code * 2
		end

		for bitlen = min_bitlen+1, 15 do
			local bit
			bit = cache % 2
			cache = (cache - bit) / 2
			cache_bitlen = cache_bitlen - 1

			code = (bit==1) and (code + 1 - code % 2) or code
			count = huffman_bitlen_counts[bitlen] or 0
			local diff = code - first
			if diff < count then
				return huffman_symbols[index + diff]
			end
			index = index + count
			first = first + count
			first = first * 2
			code = code * 2
		end
		-- invalid literal/length or distance code
		-- in fixed or dynamic block (run out of code)
		return -10
	end

	local function ReaderBitlenLeft()
		return (input_strlen - input_next_byte_pos + 1) * 8 + cache_bitlen
	end

	local function SkipToByteBoundary()
		local skipped_bitlen = cache_bitlen%8
		local rshift_mask = _pow2[skipped_bitlen]
		cache_bitlen = cache_bitlen - skipped_bitlen
		cache = (cache - cache % rshift_mask) / rshift_mask
	end

	return ReadBits, ReadBytes, Decode, ReaderBitlenLeft, SkipToByteBoundary
end

-- Create a deflate state, so I can pass in less arguments to functions.
-- @param str the whole string to be decompressed.
-- @param dictionary The preset dictionary. nil if not provided.
--		This dictionary should be produced by LibDeflate:CreateDictionary(str)
-- @return The decomrpess state.
local function CreateDecompressState(str, dictionary)
	local ReadBits, ReadBytes, Decode, ReaderBitlenLeft
		, SkipToByteBoundary = CreateReader(str)
	local state =
	{
		ReadBits = ReadBits,
		ReadBytes = ReadBytes,
		Decode = Decode,
		ReaderBitlenLeft = ReaderBitlenLeft,
		SkipToByteBoundary = SkipToByteBoundary,
		buffer_size = 0,
		buffer = {},
		result_buffer = {},
		dictionary = dictionary,
	}
	return state
end

-- Get the stuffs needed to decode huffman codes
-- @see puff.c:construct(...)
-- @param huffman_bitlen The huffman bit length of the huffman codes.
-- @param max_symbol The maximum symbol
-- @param max_bitlen The min huffman bit length of all codes
-- @return zero or positive for success, negative for failure.
-- @return The count of each huffman bit length.
-- @return A table to convert huffman codes to deflate codes.
-- @return The minimum huffman bit length.
local function GetHuffmanForDecode(huffman_bitlens, max_symbol, max_bitlen)
	local huffman_bitlen_counts = {}
	local min_bitlen = max_bitlen
	for symbol = 0, max_symbol do
		local bitlen = huffman_bitlens[symbol] or 0
		min_bitlen = (bitlen > 0 and bitlen < min_bitlen)
			and bitlen or min_bitlen
		huffman_bitlen_counts[bitlen] = (huffman_bitlen_counts[bitlen] or 0)+1
	end

	if huffman_bitlen_counts[0] == max_symbol+1 then -- No Codes
		return 0, huffman_bitlen_counts, {}, 0 -- Complete, but decode will fail
	end

	local left = 1
	for len = 1, max_bitlen do
		left = left * 2
		left = left - (huffman_bitlen_counts[len] or 0)
		if left < 0 then
			return left -- Over-subscribed, return negative
		end
	end

	-- Generate offsets info symbol table for each length for sorting
	local offsets = {}
	offsets[1] = 0
	for len = 1, max_bitlen-1 do
		offsets[len + 1] = offsets[len] + (huffman_bitlen_counts[len] or 0)
	end

	local huffman_symbols = {}
	for symbol = 0, max_symbol do
		local bitlen = huffman_bitlens[symbol] or 0
		if bitlen ~= 0 then
			local offset = offsets[bitlen]
			huffman_symbols[offset] = symbol
			offsets[bitlen] = offsets[bitlen] + 1
		end
	end

	-- Return zero for complete set, positive for incomplete set.
	return left, huffman_bitlen_counts, huffman_symbols, min_bitlen
end

-- Decode a fixed or dynamic huffman blocks, excluding last block identifier
-- and block type identifer.
-- @see puff.c:codes()
-- @param state decompression state that will be modified by this function.
--	@see CreateDecompressState
-- @param ... Read the source code
-- @return 0 on success, other value on failure.
local function DecodeUntilEndOfBlock(state, lcodes_huffman_bitlens
	, lcodes_huffman_symbols, lcodes_huffman_min_bitlen
	, dcodes_huffman_bitlens, dcodes_huffman_symbols
	, dcodes_huffman_min_bitlen)
	local buffer, buffer_size, ReadBits, Decode, ReaderBitlenLeft
		, result_buffer =
		state.buffer, state.buffer_size, state.ReadBits, state.Decode
		, state.ReaderBitlenLeft, state.result_buffer
	local dictionary = state.dictionary
	local dict_string_table
	local dict_strlen

	local buffer_end = 1
	if dictionary and not buffer[0] then
		-- If there is a dictionary, copy the last 258 bytes into
		-- the string_table to make the copy in the main loop quicker.
		-- This is done only once per decompression.
		dict_string_table = dictionary.string_table
		dict_strlen = dictionary.strlen
		buffer_end = -dict_strlen + 1
		for i=0, (-dict_strlen+1)<-257 and -257 or (-dict_strlen+1), -1 do
			buffer[i] = _byte_to_char[dict_string_table[dict_strlen+i]]
		end
	end

	repeat
		local symbol = Decode(lcodes_huffman_bitlens
			, lcodes_huffman_symbols, lcodes_huffman_min_bitlen)
		if symbol < 0 or symbol > 285 then
		-- invalid literal/length or distance code in fixed or dynamic block
			return -10
		elseif symbol < 256 then -- Literal
			buffer_size = buffer_size + 1
			buffer[buffer_size] = _byte_to_char[symbol]
		elseif symbol > 256 then -- Length code
			symbol = symbol - 256
			local bitlen = _literal_deflate_code_to_base_len[symbol]
			bitlen = (symbol >= 8)
				 and (bitlen
				 + ReadBits(_literal_deflate_code_to_extra_bitlen[symbol]))
					or bitlen
			symbol = Decode(dcodes_huffman_bitlens, dcodes_huffman_symbols
				, dcodes_huffman_min_bitlen)
			if symbol < 0 or symbol > 29 then
			-- invalid literal/length or distance code in fixed or dynamic block
				return -10
			end
			local dist = _dist_deflate_code_to_base_dist[symbol]
			dist = (dist > 4) and (dist
				+ ReadBits(_dist_deflate_code_to_extra_bitlen[symbol])) or dist

			local char_buffer_index = buffer_size-dist+1
			if char_buffer_index < buffer_end then
			-- distance is too far back in fixed or dynamic block
				return -11
			end
			if char_buffer_index >= -257 then
				for _=1, bitlen do
					buffer_size = buffer_size + 1
					buffer[buffer_size] = buffer[char_buffer_index]
					char_buffer_index = char_buffer_index + 1
				end
			else
				char_buffer_index = dict_strlen + char_buffer_index
				for _=1, bitlen do
					buffer_size = buffer_size + 1
					buffer[buffer_size] =
					_byte_to_char[dict_string_table[char_buffer_index]]
					char_buffer_index = char_buffer_index + 1
				end
			end
		end

		if ReaderBitlenLeft() < 0 then
			return 2 -- available inflate data did not terminate
		end

		if buffer_size >= 65536 then
			result_buffer[#result_buffer+1] =
				table_concat(buffer, "", 1, 32768)
			for i=32769, buffer_size do
				buffer[i-32768] = buffer[i]
			end
			buffer_size = buffer_size - 32768
			buffer[buffer_size+1] = nil
			-- NOTE: buffer[32769..end] and buffer[-257..0] are not cleared.
			-- This is why "buffer_size" variable is needed.
		end
	until symbol == 256

	state.buffer_size = buffer_size

	return 0
end

-- Decompress a store block
-- @param state decompression state that will be modified by this function.
-- @return 0 if succeeds, other value if fails.
local function DecompressStoreBlock(state)
	local buffer, buffer_size, ReadBits, ReadBytes, ReaderBitlenLeft
		, SkipToByteBoundary, result_buffer =
		state.buffer, state.buffer_size, state.ReadBits, state.ReadBytes
		, state.ReaderBitlenLeft, state.SkipToByteBoundary, state.result_buffer

	SkipToByteBoundary()
	local bytelen = ReadBits(16)
	if ReaderBitlenLeft() < 0 then
		return 2 -- available inflate data did not terminate
	end
	local bytelenComp = ReadBits(16)
	if ReaderBitlenLeft() < 0 then
		return 2 -- available inflate data did not terminate
	end

	if bytelen % 256 + bytelenComp % 256 ~= 255 then
		return -2 -- Not one's complement
	end
	if (bytelen-bytelen % 256)/256
		+ (bytelenComp-bytelenComp % 256)/256 ~= 255 then
		return -2 -- Not one's complement
	end

	-- Note that ReadBytes will skip to the next byte boundary first.
	buffer_size = ReadBytes(bytelen, buffer, buffer_size)
	if buffer_size < 0 then
		return 2 -- available inflate data did not terminate
	end

	-- memory clean up when there are enough bytes in the buffer.
	if buffer_size >= 65536 then
		result_buffer[#result_buffer+1] = table_concat(buffer, "", 1, 32768)
		for i=32769, buffer_size do
			buffer[i-32768] = buffer[i]
		end
		buffer_size = buffer_size - 32768
		buffer[buffer_size+1] = nil
	end
	state.buffer_size = buffer_size
	return 0
end

-- Decompress a fixed block
-- @param state decompression state that will be modified by this function.
-- @return 0 if succeeds other value if fails.
local function DecompressFixBlock(state)
	return DecodeUntilEndOfBlock(state
		, _fix_block_literal_huffman_bitlen_count
		, _fix_block_literal_huffman_to_deflate_code, 7
		, _fix_block_dist_huffman_bitlen_count
		, _fix_block_dist_huffman_to_deflate_code, 5)
end

-- Decompress a dynamic block
-- @param state decompression state that will be modified by this function.
-- @return 0 if success, other value if fails.
local function DecompressDynamicBlock(state)
	local ReadBits, Decode = state.ReadBits, state.Decode
	local nlen = ReadBits(5) + 257
	local ndist = ReadBits(5) + 1
	local ncode = ReadBits(4) + 4
	if nlen > 286 or ndist > 30 then
		-- dynamic block code description: too many length or distance codes
		return -3
	end

	local rle_codes_huffman_bitlens = {}

	for i = 1, ncode do
		rle_codes_huffman_bitlens[_rle_codes_huffman_bitlen_order[i]] =
			ReadBits(3)
	end

	local rle_codes_err, rle_codes_huffman_bitlen_counts,
		rle_codes_huffman_symbols, rle_codes_huffman_min_bitlen =
		GetHuffmanForDecode(rle_codes_huffman_bitlens, 18, 7)
	if rle_codes_err ~= 0 then -- Require complete code set here
		-- dynamic block code description: code lengths codes incomplete
		return -4
	end

	local lcodes_huffman_bitlens = {}
	local dcodes_huffman_bitlens = {}
	-- Read length/literal and distance code length tables
	local index = 0
	while index < nlen + ndist do
		local symbol -- Decoded value
		local bitlen -- Last length to repeat

		symbol = Decode(rle_codes_huffman_bitlen_counts
			, rle_codes_huffman_symbols, rle_codes_huffman_min_bitlen)

		if symbol < 0 then
			return symbol -- Invalid symbol
		elseif symbol < 16 then
			if index < nlen then
				lcodes_huffman_bitlens[index] = symbol
			else
				dcodes_huffman_bitlens[index-nlen] = symbol
			end
			index = index + 1
		else
			bitlen = 0
			if symbol == 16 then
				if index == 0 then
					-- dynamic block code description: repeat lengths
					-- with no first length
					return -5
				end
				if index-1 < nlen then
					bitlen = lcodes_huffman_bitlens[index-1]
				else
					bitlen = dcodes_huffman_bitlens[index-nlen-1]
				end
				symbol = 3 + ReadBits(2)
			elseif symbol == 17 then -- Repeat zero 3..10 times
				symbol = 3 + ReadBits(3)
			else -- == 18, repeat zero 11.138 times
				symbol = 11 + ReadBits(7)
			end
			if index + symbol > nlen + ndist then
				-- dynamic block code description:
				-- repeat more than specified lengths
				return -6
			end
			while symbol > 0 do -- Repeat last or zero symbol times
				symbol = symbol - 1
				if index < nlen then
					lcodes_huffman_bitlens[index] = bitlen
				else
					dcodes_huffman_bitlens[index-nlen] = bitlen
				end
				index = index + 1
			end
		end
	end

	if (lcodes_huffman_bitlens[256] or 0) == 0 then
		-- dynamic block code description: missing end-of-block code
		return -9
	end

	local lcodes_err, lcodes_huffman_bitlen_counts
		, lcodes_huffman_symbols, lcodes_huffman_min_bitlen =
		GetHuffmanForDecode(lcodes_huffman_bitlens, nlen-1, 15)
	--dynamic block code description: invalid literal/length code lengths,
	-- Incomplete code ok only for single length 1 code
	if (lcodes_err ~=0 and (lcodes_err < 0
		or nlen ~= (lcodes_huffman_bitlen_counts[0] or 0)
			+(lcodes_huffman_bitlen_counts[1] or 0))) then
		return -7
	end

	local dcodes_err, dcodes_huffman_bitlen_counts
		, dcodes_huffman_symbols, dcodes_huffman_min_bitlen =
		GetHuffmanForDecode(dcodes_huffman_bitlens, ndist-1, 15)
	-- dynamic block code description: invalid distance code lengths,
	-- Incomplete code ok only for single length 1 code
	if (dcodes_err ~=0 and (dcodes_err < 0
		or ndist ~= (dcodes_huffman_bitlen_counts[0] or 0)
			+ (dcodes_huffman_bitlen_counts[1] or 0))) then
		return -8
	end

	-- Build buffman table for literal/length codes
	return DecodeUntilEndOfBlock(state, lcodes_huffman_bitlen_counts
		, lcodes_huffman_symbols, lcodes_huffman_min_bitlen
		, dcodes_huffman_bitlen_counts, dcodes_huffman_symbols
		, dcodes_huffman_min_bitlen)
end

-- Decompress a deflate stream
-- @param state: a decompression state
-- @return the decompressed string if succeeds. nil if fails.
local function Inflate(state)
	local ReadBits = state.ReadBits

	local is_last_block
	while not is_last_block do
		is_last_block = (ReadBits(1) == 1)
		local block_type = ReadBits(2)
		local status
		if block_type == 0 then
			status = DecompressStoreBlock(state)
		elseif block_type == 1 then
			status = DecompressFixBlock(state)
		elseif block_type == 2 then
			status = DecompressDynamicBlock(state)
		else
			return nil, -1 -- invalid block type (type == 3)
		end
		if status ~= 0 then
			return nil, status
		end
	end

	state.result_buffer[#state.result_buffer+1] =
		table_concat(state.buffer, "", 1, state.buffer_size)
	local result = table_concat(state.result_buffer)
	return result
end

-- @see LibDeflate:DecompressDeflate(str)
-- @see LibDeflate:DecompressDeflateWithDict(str, dictionary)
local function DecompressDeflateInternal(str, dictionary)
	local state = CreateDecompressState(str, dictionary)
	local result, status = Inflate(state)
	if not result then
		return nil, status
	end

	local bitlen_left = state.ReaderBitlenLeft()
	local bytelen_left = (bitlen_left - bitlen_left % 8) / 8
	return result, bytelen_left
end

-- @see LibDeflate:DecompressZlib(str)
-- @see LibDeflate:DecompressZlibWithDict(str)
local function DecompressZlibInternal(str, dictionary)
	local state = CreateDecompressState(str, dictionary)
	local ReadBits = state.ReadBits

	local CMF = ReadBits(8)
	if state.ReaderBitlenLeft() < 0 then
		return nil, 2 -- available inflate data did not terminate
	end
	local CM = CMF % 16
	local CINFO = (CMF - CM) / 16
	if CM ~= 8 then
		return nil, -12 -- invalid compression method
	end
	if CINFO > 7 then
		return nil, -13 -- invalid window size
	end

	local FLG = ReadBits(8)
	if state.ReaderBitlenLeft() < 0 then
		return nil, 2 -- available inflate data did not terminate
	end
	if (CMF*256+FLG)%31 ~= 0 then
		return nil, -14 -- invalid header checksum
	end

	local FDIST = ((FLG-FLG%32)/32 % 2)
	local FLEVEL = ((FLG-FLG%64)/64 % 4) -- luacheck: ignore FLEVEL

	if FDIST == 1 then
		if not dictionary then
			return nil, -16 -- need dictonary, but dictionary is not provided.
		end
		local byte3 = ReadBits(8)
		local byte2 = ReadBits(8)
		local byte1 = ReadBits(8)
		local byte0 = ReadBits(8)
		local actual_adler32 = byte3*16777216+byte2*65536+byte1*256+byte0
		if state.ReaderBitlenLeft() < 0 then
			return nil, 2 -- available inflate data did not terminate
		end
		if not IsEqualAdler32(actual_adler32, dictionary.adler32) then
			return nil, -17 -- dictionary adler32 does not match
		end
	end
	local result, status = Inflate(state)
	if not result then
		return nil, status
	end
	state.SkipToByteBoundary()

	local adler_byte0 = ReadBits(8)
	local adler_byte1 = ReadBits(8)
	local adler_byte2 = ReadBits(8)
	local adler_byte3 = ReadBits(8)
	if state.ReaderBitlenLeft() < 0 then
		return nil, 2 -- available inflate data did not terminate
	end

	local adler32_expected = adler_byte0*16777216
		+ adler_byte1*65536 + adler_byte2*256 + adler_byte3
	local adler32_actual = LibDeflate:Adler32(result)
	if not IsEqualAdler32(adler32_expected, adler32_actual) then
		return nil, -15 -- Adler32 checksum does not match
	end

	local bitlen_left = state.ReaderBitlenLeft()
	local bytelen_left = (bitlen_left - bitlen_left % 8) / 8
	return result, bytelen_left
end

--- Decompress a raw deflate compressed data.
-- @param str [string] The data to be decompressed.
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressDeflate
function LibDeflate:DecompressDeflate(str)
	local arg_valid, arg_err = IsValidArguments(str)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressDeflate(str): "
			..arg_err), 2)
	end
	return DecompressDeflateInternal(str)
end

--- Decompress a raw deflate compressed data with a preset dictionary.
-- @param str [string] The data to be decompressed.
-- @param dictionary [table] The preset dictionary used by
-- LibDeflate:CompressDeflateWithDict when the compressed data is produced.
-- Decompression and compression must use the same dictionary.
-- Otherwise wrong decompressed data could be produced without generating any
-- error.
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressDeflateWithDict
function LibDeflate:DecompressDeflateWithDict(str, dictionary)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressDeflateWithDict(str, dictionary): "
			..arg_err), 2)
	end
	return DecompressDeflateInternal(str, dictionary)
end

--- Decompress a zlib compressed data.
-- @param str [string] The data to be decompressed
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressZlib
function LibDeflate:DecompressZlib(str)
	local arg_valid, arg_err = IsValidArguments(str)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressZlib(str): "
			..arg_err), 2)
	end
	return DecompressZlibInternal(str)
end

--- Decompress a zlib compressed data with a preset dictionary.
-- @param str [string] The data to be decompressed
-- @param dictionary [table] The preset dictionary used by
-- LibDeflate:CompressDeflateWithDict when the compressed data is produced.
-- Decompression and compression must use the same dictionary.
-- Otherwise wrong decompressed data could be produced without generating any
-- error.
-- @return [string/nil] If the decompression succeeds, return the decompressed
-- data. If the decompression fails, return nil. You should check if this return
-- value is non-nil to know if the decompression succeeds.
-- @return [integer] If the decompression succeeds, return the number of
-- unprocessed bytes in the input compressed data. This return value is a
-- positive integer if the input data is a valid compressed data appended by an
-- arbitary non-empty string. This return value is 0 if the input data does not
-- contain any extra bytes.<br>
-- If the decompression fails (The first return value of this function is nil),
-- this return value is undefined.
-- @see LibDeflate:CompressZlibWithDict
function LibDeflate:DecompressZlibWithDict(str, dictionary)
	local arg_valid, arg_err = IsValidArguments(str, true, dictionary)
	if not arg_valid then
		error(("Usage: LibDeflate:DecompressZlibWithDict(str, dictionary): "
			..arg_err), 2)
	end
	return DecompressZlibInternal(str, dictionary)
end

-- Calculate the huffman code of fixed block
do
	_fix_block_literal_huffman_bitlen = {}
	for sym=0, 143 do
		_fix_block_literal_huffman_bitlen[sym] = 8
	end
	for sym=144, 255 do
		_fix_block_literal_huffman_bitlen[sym] = 9
	end
	for sym=256, 279 do
	    _fix_block_literal_huffman_bitlen[sym] = 7
	end
	for sym=280, 287 do
		_fix_block_literal_huffman_bitlen[sym] = 8
	end

	_fix_block_dist_huffman_bitlen = {}
	for dist=0, 31 do
		_fix_block_dist_huffman_bitlen[dist] = 5
	end
	local status
	status, _fix_block_literal_huffman_bitlen_count
		, _fix_block_literal_huffman_to_deflate_code =
		GetHuffmanForDecode(_fix_block_literal_huffman_bitlen, 287, 9)
	assert(status == 0)
	status, _fix_block_dist_huffman_bitlen_count,
		_fix_block_dist_huffman_to_deflate_code =
		GetHuffmanForDecode(_fix_block_dist_huffman_bitlen, 31, 5)
	assert(status == 0)

	_fix_block_literal_huffman_code =
		GetHuffmanCodeFromBitlen(_fix_block_literal_huffman_bitlen_count
		, _fix_block_literal_huffman_bitlen, 287, 9)
	_fix_block_dist_huffman_code =
		GetHuffmanCodeFromBitlen(_fix_block_dist_huffman_bitlen_count
		, _fix_block_dist_huffman_bitlen, 31, 5)
end

-- Encoding algorithms
-- Prefix encoding algorithm
-- implemented by Galmok of European Stormrage (Horde), galmok@gmail.com
-- From LibCompress <https://www.wowace.com/projects/libcompress>,
-- which is licensed under GPLv2
-- The code has been modified by the author of LibDeflate.
------------------------------------------------------------------------------

-- to be able to match any requested byte value, the search
-- string must be preprocessed characters to escape with %:
-- ( ) . % + - * ? [ ] ^ $
-- "illegal" byte values:
-- 0 is replaces %z
local _gsub_escape_table = {
	["\000"] = "%z", ["("] = "%(", [")"] = "%)", ["."] = "%.",
	["%"] = "%%", ["+"] = "%+", ["-"] = "%-", ["*"] = "%*",
	["?"] = "%?", ["["] = "%[", ["]"] = "%]", ["^"] = "%^",
	["$"] = "%$",
}

local function escape_for_gsub(str)
	return str:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", _gsub_escape_table)
end

--- Create a custom codec with encoder and decoder. <br>
-- This codec is used to convert an input string to make it not contain
-- some specific bytes.
-- This created codec and the parameters of this function do NOT take
-- localization into account. One byte (0-255) in the string is exactly one
-- character (0-255).
-- Credits to LibCompress.
-- @param reserved_chars [string] The created encoder will ensure encoded
-- data does not contain any single character in reserved_chars. This parameter
-- should be non-empty.
-- @param escape_chars [string] The escape character(s) used in the created
-- codec. The codec converts any character included in reserved\_chars /
-- escape\_chars / map\_chars to (one escape char + one character not in
-- reserved\_chars / escape\_chars / map\_chars).
-- You usually only need to provide a length-1 string for this parameter.
-- Length-2 string is only needed when
-- reserved\_chars + escape\_chars + map\_chars is longer than 127.
-- This parameter should be non-empty.
-- @param map_chars [string] The created encoder will map every
-- reserved\_chars:sub(i, i) (1 <= i <= #map\_chars) to map\_chars:sub(i, i).
-- This parameter CAN be empty string.
-- @return [table/nil] If the codec cannot be created, return nil.<br>
-- If the codec can be created according to the given
-- parameters, return the codec, which is a encode/decode table.
-- The table contains two functions: <br>
-- t:Encode(str) returns the encoded string. <br>
-- t:Decode(str) returns the decoded string if succeeds. nil if fails.
-- @return [nil/string] If the codec is successfully created, return nil.
-- If not, return a string that describes the reason why the codec cannot be
-- created.
-- @usage
-- -- Create an encoder/decoder that maps all "\000" to "\003",
-- -- and escape "\001" (and "\002" and "\003") properly
-- local codec = LibDeflate:CreateCodec("\000\001", "\002", "\003")
--
-- local encoded = codec:Encode(SOME_STRING)
-- -- "encoded" does not contain "\000" or "\001"
-- local decoded = codec:Decode(encoded)
-- -- assert(decoded == SOME_STRING)
function LibDeflate:CreateCodec(reserved_chars, escape_chars
	, map_chars)
	-- select a default escape character
	if type(reserved_chars) ~= "string"
		or type(escape_chars) ~= "string"
		or type(map_chars) ~= "string" then
			error(
				"Usage: LibDeflate:CreateCodec(reserved_chars,"
				.." escape_chars, map_chars):"
				.." All arguments must be string.", 2)
	end

	if escape_chars == "" then
		return nil, "No escape characters supplied."
	end
	if #reserved_chars < #map_chars then
		return nil, "The number of reserved characters must be"
			.." at least as many as the number of mapped chars."
	end
	if reserved_chars == "" then
		return nil, "No characters to encode."
	end

	local encode_bytes = reserved_chars..escape_chars..map_chars
	-- build list of bytes not available as a suffix to a prefix byte
	local taken = {}
	for i = 1, #encode_bytes do
		local byte = string_byte(encode_bytes, i, i)
		if taken[byte] then -- Modified by LibDeflate:
			return nil, "There must be no duplicate characters in the"
				.." concatenation of reserved_chars, escape_chars and"
				.." map_chars."
		end
		taken[byte] = true
	end

	-- Modified by LibDeflate:
	-- Store the patterns and replacement in tables for later use.
	-- This function is modified that loadstring() lua api is no longer used.
	local decode_patterns = {}
	local decode_repls = {}

	-- the encoding can be a single gsub
	-- , but the decoding can require multiple gsubs
	local encode_search = {}
	local encode_translate = {}

	-- map single byte to single byte
	if #map_chars > 0 then
		local decode_search = {}
		local decode_translate = {}
		for i = 1, #map_chars do
			local from = string_sub(reserved_chars, i, i)
			local to = string_sub(map_chars, i, i)
			encode_translate[from] = to
			encode_search[#encode_search+1] = from
			decode_translate[to] = from
			decode_search[#decode_search+1] = to
		end
		decode_patterns[#decode_patterns+1] =
			"([".. escape_for_gsub(table_concat(decode_search)).."])"
		decode_repls[#decode_repls+1] = decode_translate
	end

	local escape_char_index = 1
	local escape_char = string_sub(escape_chars
		, escape_char_index, escape_char_index)
	-- map single byte to double-byte
	local r = 0 -- suffix char value to the escapeChar

	local decode_search = {}
	local decode_translate = {}
	for i = 1, #encode_bytes do
		local c = string_sub(encode_bytes, i, i)
		if not encode_translate[c] then
			-- this loop will update escapeChar and r
			while r >= 256 or taken[r] do
			-- Bug in LibCompress r81
			-- while r < 256 and taken[r] do
				r = r + 1
				if r > 255 then -- switch to next escapeChar
					decode_patterns[#decode_patterns+1] =
						escape_for_gsub(escape_char)
						.."(["
						.. escape_for_gsub(table_concat(decode_search)).."])"
					decode_repls[#decode_repls+1] = decode_translate

					escape_char_index = escape_char_index + 1
					escape_char = string_sub(escape_chars, escape_char_index
						, escape_char_index)
					r = 0
					decode_search = {}
					decode_translate = {}

					-- Fixes Another bug in LibCompress r82.
					-- LibCompress checks this error condition
					-- right after "if r > 255 then"
					-- This is why error case should also be tested.
					if not escape_char or escape_char == "" then
						-- actually I don't need to check
						-- "not ecape_char", but what if Lua changes
						-- the behavior of string.sub() in the future?
						-- we are out of escape chars and we need more!
						return nil, "Out of escape characters."
					end
				end
			end

			local char_r = _byte_to_char[r]
			encode_translate[c] = escape_char..char_r
			encode_search[#encode_search+1] = c
			decode_translate[char_r] = c
			decode_search[#decode_search+1] = char_r
			r = r + 1
		end
		if i == #encode_bytes then
			decode_patterns[#decode_patterns+1] =
				escape_for_gsub(escape_char).."(["
				.. escape_for_gsub(table_concat(decode_search)).."])"
			decode_repls[#decode_repls+1] = decode_translate
		end
	end

	local codec = {}

	local encode_pattern = "(["
		.. escape_for_gsub(table_concat(encode_search)).."])"
	local encode_repl = encode_translate

	function codec:Encode(str)
		if type(str) ~= "string" then
			error(("Usage: codec:Encode(str):"
				.." 'str' - string expected got '%s'."):format(type(str)), 2)
		end
		return string_gsub(str, encode_pattern, encode_repl)
	end

	local decode_tblsize = #decode_patterns
	local decode_fail_pattern = "(["
		.. escape_for_gsub(reserved_chars).."])"

	function codec:Decode(str)
		if type(str) ~= "string" then
			error(("Usage: codec:Decode(str):"
				.." 'str' - string expected got '%s'."):format(type(str)), 2)
		end
		if string_find(str, decode_fail_pattern) then
			return nil
		end
		for i = 1, decode_tblsize do
			str = string_gsub(str, decode_patterns[i], decode_repls[i])
		end
		return str
	end

	return codec
end

local _addon_channel_codec

local function GenerateWoWAddonChannelCodec()
	return LibDeflate:CreateCodec("\000", "\001", "")
end

--- Encode the string to make it ready to be transmitted in World of
-- Warcraft addon channel. <br>
-- The encoded string is guaranteed to contain no NULL ("\000") character.
-- @param str [string] The string to be encoded.
-- @return The encoded string.
-- @see LibDeflate:DecodeForWoWAddonChannel
function LibDeflate:EncodeForWoWAddonChannel(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:EncodeForWoWAddonChannel(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	if not _addon_channel_codec then
		_addon_channel_codec = GenerateWoWAddonChannelCodec()
	end
	return _addon_channel_codec:Encode(str)
end

--- Decode the string produced by LibDeflate:EncodeForWoWAddonChannel
-- @param str [string] The string to be decoded.
-- @return [string/nil] The decoded string if succeeds. nil if fails.
-- @see LibDeflate:EncodeForWoWAddonChannel
function LibDeflate:DecodeForWoWAddonChannel(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:DecodeForWoWAddonChannel(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	if not _addon_channel_codec then
		_addon_channel_codec = GenerateWoWAddonChannelCodec()
	end
	return _addon_channel_codec:Decode(str)
end

-- For World of Warcraft Chat Channel Encoding
-- implemented by Galmok of European Stormrage (Horde), galmok@gmail.com
-- From LibCompress <https://www.wowace.com/projects/libcompress>,
-- which is licensed under GPLv2
-- The code has been modified by the author of LibDeflate.
-- Following byte values are not allowed:
-- \000, s, S, \010, \013, \124, %
-- Because SendChatMessage will error
-- if an UTF8 multibyte character is incomplete,
-- all character values above 127 have to be encoded to avoid this.
-- This costs quite a bit of bandwidth (about 13-14%)
-- Also, because drunken status is unknown for the received
-- , strings used with SendChatMessage should be terminated with
-- an identifying byte value, after which the server MAY add "...hic!"
-- or as much as it can fit(!).
-- Pass the identifying byte as a reserved character to this function
-- to ensure the encoding doesn't contain that value.
-- or use this: local message, match = arg1:gsub("^(.*)\029.-$", "%1")
-- arg1 is message from channel, \029 is the string terminator
-- , but may be used in the encoded datastream as well. :-)
-- This encoding will expand data anywhere from:
-- 0% (average with pure ascii text)
-- 53.5% (average with random data valued zero to 255)
-- 100% (only encoding data that encodes to two bytes)
local function GenerateWoWChatChannelCodec()
	local r = {}
	for i = 128, 255 do
		r[#r+1] = _byte_to_char[i]
	end

	local reserved_chars = "sS\000\010\013\124%"..table_concat(r)
	return LibDeflate:CreateCodec(reserved_chars
		, "\029\031", "\015\020")
end

local _chat_channel_codec

--- Encode the string to make it ready to be transmitted in World of
-- Warcraft chat channel. <br>
-- See also https://wow.gamepedia.com/ValidChatMessageCharacters
-- @param str [string] The string to be encoded.
-- @return [string] The encoded string.
-- @see LibDeflate:DecodeForWoWChatChannel
function LibDeflate:EncodeForWoWChatChannel(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:EncodeForWoWChatChannel(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	if not _chat_channel_codec then
		_chat_channel_codec = GenerateWoWChatChannelCodec()
	end
	return _chat_channel_codec:Encode(str)
end

--- Decode the string produced by LibDeflate:EncodeForWoWChatChannel.
-- @param str [string] The string to be decoded.
-- @return [string/nil] The decoded string if succeeds. nil if fails.
-- @see LibDeflate:EncodeForWoWChatChannel
function LibDeflate:DecodeForWoWChatChannel(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:DecodeForWoWChatChannel(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	if not _chat_channel_codec then
		_chat_channel_codec = GenerateWoWChatChannelCodec()
	end
	return _chat_channel_codec:Decode(str)
end

-- Credits to WeakAuras <https://github.com/WeakAuras/WeakAuras2>,
-- and Galmok (galmok@gmail.com) for the 6 bit encoding algorithm.
-- The result of encoding will be 25% larger than the
-- origin string, but every single byte of the encoding result will be
-- printable characters as the following.
local _byte_to_6bit_char = {
	[0]="a", "b", "c", "d", "e", "f", "g", "h",
	"i", "j", "k", "l", "m", "n", "o", "p",
	"q", "r", "s", "t", "u", "v", "w", "x",
	"y", "z", "A", "B", "C", "D", "E", "F",
	"G", "H", "I", "J", "K", "L", "M", "N",
	"O", "P", "Q", "R", "S", "T", "U", "V",
	"W", "X", "Y", "Z", "0", "1", "2", "3",
	"4", "5", "6", "7", "8", "9", "(", ")",
}

local _6bit_to_byte = {
	[97]=0,[98]=1,[99]=2,[100]=3,[101]=4,[102]=5,[103]=6,[104]=7,
	[105]=8,[106]=9,[107]=10,[108]=11,[109]=12,[110]=13,[111]=14,[112]=15,
	[113]=16,[114]=17,[115]=18,[116]=19,[117]=20,[118]=21,[119]=22,[120]=23,
	[121]=24,[122]=25,[65]=26,[66]=27,[67]=28,[68]=29,[69]=30,[70]=31,
	[71]=32,[72]=33,[73]=34,[74]=35,[75]=36,[76]=37,[77]=38,[78]=39,
	[79]=40,[80]=41,[81]=42,[82]=43,[83]=44,[84]=45,[85]=46,[86]=47,
	[87]=48,[88]=49,[89]=50,[90]=51,[48]=52,[49]=53,[50]=54,[51]=55,
	[52]=56,[53]=57,[54]=58,[55]=59,[56]=60,[57]=61,[40]=62,[41]=63,
}

--- Encode the string to make it printable. <br>
--
-- Credis to WeakAuras2, this function is equivalant to the implementation
-- it is using right now. <br>
-- The encoded string will be 25% larger than the origin string. However, every
-- single byte of the encoded string will be one of 64 printable ASCII
-- characters, which are can be easier copied, pasted and displayed.
-- (26 lowercase letters, 26 uppercase letters, 10 numbers digits,
-- left parenthese, or right parenthese)
-- @param str [string] The string to be encoded.
-- @return [string] The encoded string.
function LibDeflate:EncodeForPrint(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:EncodeForPrint(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	local strlen = #str
	local strlenMinus2 = strlen - 2
	local i = 1
	local buffer = {}
	local buffer_size = 0
	while i <= strlenMinus2 do
		local x1, x2, x3 = string_byte(str, i, i+2)
		i = i + 3
		local cache = x1+x2*256+x3*65536
		local b1 = cache % 64
		cache = (cache - b1) / 64
		local b2 = cache % 64
		cache = (cache - b2) / 64
		local b3 = cache % 64
		local b4 = (cache - b3) / 64
		buffer_size = buffer_size + 1
		buffer[buffer_size] =
			_byte_to_6bit_char[b1].._byte_to_6bit_char[b2]
			.._byte_to_6bit_char[b3].._byte_to_6bit_char[b4]
	end

	local cache = 0
	local cache_bitlen = 0
	while i <= strlen do
		local x = string_byte(str, i, i)
		cache = cache + x * _pow2[cache_bitlen]
		cache_bitlen = cache_bitlen + 8
		i = i + 1
	end
	while cache_bitlen > 0 do
		local bit6 = cache % 64
		buffer_size = buffer_size + 1
		buffer[buffer_size] = _byte_to_6bit_char[bit6]
		cache = (cache - bit6) / 64
		cache_bitlen = cache_bitlen - 6
	end

	return table_concat(buffer)
end

--- Decode the printable string produced by LibDeflate:EncodeForPrint.
-- "str" will have its prefixed and trailing control characters or space
-- removed before it is decoded, so it is easier to use if "str" comes form
-- user copy and paste with some prefixed or trailing spaces.
-- Then decode fails if the string contains any characters cant be produced by
-- LibDeflate:EncodeForPrint. That means, decode fails if the string contains a
-- characters NOT one of 26 lowercase letters, 26 uppercase letters,
-- 10 numbers digits, left parenthese, or right parenthese.
-- @param str [string] The string to be decoded
-- @return [string/nil] The decoded string if succeeds. nil if fails.
function LibDeflate:DecodeForPrint(str)
	if type(str) ~= "string" then
		error(("Usage: LibDeflate:DecodeForPrint(str):"
			.." 'str' - string expected got '%s'."):format(type(str)), 2)
	end
	str = str:gsub("^[%c ]+", "")
	str = str:gsub("[%c ]+$", "")

	local strlen = #str
	if strlen == 1 then
		return nil
	end
	local strlenMinus3 = strlen - 3
	local i = 1
	local buffer = {}
	local buffer_size = 0
	while i <= strlenMinus3 do
		local x1, x2, x3, x4 = string_byte(str, i, i+3)
		x1 = _6bit_to_byte[x1]
		x2 = _6bit_to_byte[x2]
		x3 = _6bit_to_byte[x3]
		x4 = _6bit_to_byte[x4]
		if not (x1 and x2 and x3 and x4) then
			return nil
		end
		i = i + 4
		local cache = x1+x2*64+x3*4096+x4*262144
		local b1 = cache % 256
		cache = (cache - b1) / 256
		local b2 = cache % 256
		local b3 = (cache - b2) / 256
		buffer_size = buffer_size + 1
		buffer[buffer_size] =
			_byte_to_char[b1].._byte_to_char[b2].._byte_to_char[b3]
	end

	local cache  = 0
	local cache_bitlen = 0
	while i <= strlen do
		local x = string_byte(str, i, i)
		x =  _6bit_to_byte[x]
		if not x then
			return nil
		end
		cache = cache + x * _pow2[cache_bitlen]
		cache_bitlen = cache_bitlen + 6
		i = i + 1
	end

	while cache_bitlen >= 8 do
		local byte = cache % 256
		buffer_size = buffer_size + 1
		buffer[buffer_size] = _byte_to_char[byte]
		cache = (cache - byte) / 256
		cache_bitlen = cache_bitlen - 8
	end

	return table_concat(buffer)
end

local function InternalClearCache()
	_chat_channel_codec = nil
	_addon_channel_codec = nil
end

-- For test. Don't use the functions in this table for real application.
-- Stuffs in this table is subject to change.
LibDeflate.internals = {
	LoadStringToTable = LoadStringToTable,
	IsValidDictionary = IsValidDictionary,
	IsEqualAdler32 = IsEqualAdler32,
	_byte_to_6bit_char = _byte_to_6bit_char,
	_6bit_to_byte = _6bit_to_byte,
	InternalClearCache = InternalClearCache,
}

--[[-- Commandline options
@class table
@name CommandlineOptions
@usage lua LibDeflate.lua [OPTION] [INPUT] [OUTPUT]
\-0    store only. no compression.
\-1    fastest compression.
\-9    slowest and best compression.
\-d    do decompression instead of compression.
\--dict <filename> specify the file that contains
the entire preset dictionary.
\-h    give this help.
\--strategy <fixed/huffman_only/dynamic> specify a special compression strategy.
\-v    print the version and copyright info.
\--zlib  use zlib format instead of raw deflate.
]]

-- currently no plan to support stdin and stdout.
-- Because Lua in Windows does not set stdout with binary mode.
if io and os and debug and _G.arg then
	local io = io
	local os = os
	local debug = debug
	local arg = _G.arg
	local debug_info = debug.getinfo(1)
	if debug_info.source == arg[0]
		or debug_info.short_src == arg[0] then
	-- We are indeed runnning THIS file from the commandline.
		local input
		local output
		local i = 1
		local status
		local is_zlib = false
		local is_decompress = false
		local level
		local strategy
		local dictionary
		while (arg[i]) do
			local a = arg[i]
			if a == "-h" then
				print(LibDeflate._COPYRIGHT
					.."\nUsage: lua LibDeflate.lua [OPTION] [INPUT] [OUTPUT]\n"
					.."  -0    store only. no compression.\n"
					.."  -1    fastest compression.\n"
					.."  -9    slowest and best compression.\n"
					.."  -d    do decompression instead of compression.\n"
					.."  --dict <filename> specify the file that contains"
					.." the entire preset dictionary.\n"
					.."  -h    give this help.\n"
					.."  --strategy <fixed/huffman_only/dynamic>"
					.." specify a special compression strategy.\n"
					.."  -v    print the version and copyright info.\n"
					.."  --zlib  use zlib format instead of raw deflate.\n")
				os.exit(0)
			elseif a == "-v" then
				print(LibDeflate._COPYRIGHT)
				os.exit(0)
			elseif a:find("^%-[0-9]$") then
				level = tonumber(a:sub(2, 2))
			elseif a == "-d" then
				is_decompress = true
			elseif a == "--dict" then
				i = i + 1
				local dict_filename = arg[i]
				if not dict_filename then
					io.stderr:write("You must speicify the dict filename")
					os.exit(1)
				end
				local dict_file, dict_status = io.open(dict_filename, "rb")
				if not dict_file then
					io.stderr:write(
					("LibDeflate: Cannot read the dictionary file '%s': %s")
					:format(dict_filename, dict_status))
					os.exit(1)
				end
				local dict_str = dict_file:read("*all")
				dict_file:close()
				-- In your lua program, you should pass in adler32 as a CONSTANT
				-- , so it actually prevent you from modifying dictionary
				-- unintentionally during the program development. I do this
				-- here just because no convenient way to verify in commandline.
				dictionary = LibDeflate:CreateDictionary(dict_str,
					#dict_str, LibDeflate:Adler32(dict_str))
			elseif a == "--strategy" then
				-- Not sure if I should check error here
				-- If I do, redudant code.
				i = i + 1
				strategy = arg[i]
			elseif a == "--zlib" then
				is_zlib = true
			elseif a:find("^%-") then
				io.stderr:write(("LibDeflate: Invalid argument: %s")
						:format(a))
				os.exit(1)
			else
				if not input then
					input, status = io.open(a, "rb")
					if not input then
						io.stderr:write(
							("LibDeflate: Cannot read the file '%s': %s")
							:format(a, tostring(status)))
						os.exit(1)
					end
				elseif not output then
					output, status = io.open(a, "wb")
					if not output then
						io.stderr:write(
							("LibDeflate: Cannot write the file '%s': %s")
							:format(a, tostring(status)))
						os.exit(1)
					end
				end
			end
			i = i + 1
		end -- while (arg[i])

		if not input or not output then
			io.stderr:write("LibDeflate:"
				.." You must specify both input and output files.")
			os.exit(1)
		end

		local input_data = input:read("*all")
		local configs = {
			level = level,
			strategy = strategy,
		}
		local output_data
		if not is_decompress then
			if not is_zlib then
				if not dictionary then
					output_data =
					LibDeflate:CompressDeflate(input_data, configs)
				else
					output_data =
					LibDeflate:CompressDeflateWithDict(input_data, dictionary
						, configs)
				end
			else
				if not dictionary then
					output_data =
					LibDeflate:CompressZlib(input_data, configs)
				else
					output_data =
					LibDeflate:CompressZlibWithDict(input_data, dictionary
						, configs)
				end
			end
		else
			if not is_zlib then
				if not dictionary then
					output_data = LibDeflate:DecompressDeflate(input_data)
				else
					output_data = LibDeflate:DecompressDeflateWithDict(
						input_data, dictionary)
				end
			else
				if not dictionary then
					output_data = LibDeflate:DecompressZlib(input_data)
				else
					output_data = LibDeflate:DecompressZlibWithDict(
						input_data, dictionary)
				end
			end
		end

		if not output_data then
			io.stderr:write("LibDeflate: Decompress fails.")
			os.exit(1)
		end

		output:write(output_data)
		if input and input ~= io.stdin then
			input:close()
		end
		if output and output ~= io.stdout then
			output:close()
		end

		io.stderr:write(("Successfully writes %d bytes"):format(
			output_data:len()))
		os.exit(0)
	end
end

return LibDeflate end,
["lua.base64"] = function(...) 
--[[

 base64 -- v1.5.3 public domain Lua base64 encoder/decoder
 no warranty implied; use at your own risk

 Needs bit32.extract function. If not present it's implemented using BitOp
 or Lua 5.3 native bit operators. For Lua 5.1 fallbacks to pure Lua
 implementation inspired by Rici Lake's post:
   http://ricilake.blogspot.co.uk/2007/10/iterating-bits-in-lua.html

 author: Ilya Kolbin (iskolbin@gmail.com)
 url: github.com/iskolbin/lbase64

 COMPATIBILITY

 Lua 5.1+, LuaJIT

 LICENSE

 See end of file for license information.

--]]


local base64 = {}

local extract = _G.bit32 and _G.bit32.extract -- Lua 5.2/Lua 5.3 in compatibility mode
if not extract then
	if _G.bit then -- LuaJIT
		local shl, shr, band = _G.bit.lshift, _G.bit.rshift, _G.bit.band
		extract = function( v, from, width )
			return band( shr( v, from ), shl( 1, width ) - 1 )
		end
	elseif _G._VERSION == "Lua 5.1" then
		extract = function( v, from, width )
			local w = 0
			local flag = 2^from
			for i = 0, width-1 do
				local flag2 = flag + flag
				if v % flag2 >= flag then
					w = w + 2^i
				end
				flag = flag2
			end
			return w
		end
	else -- Lua 5.3+
		extract = load[[return function( v, from, width )
			return ( v >> from ) & ((1 << width) - 1)
		end]]()
	end
end


function base64.makeencoder( s62, s63, spad )
	local encoder = {}
	for b64code, char in pairs{[0]='A','B','C','D','E','F','G','H','I','J',
		'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y',
		'Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n',
		'o','p','q','r','s','t','u','v','w','x','y','z','0','1','2',
		'3','4','5','6','7','8','9',s62 or '+',s63 or'/',spad or'='} do
		encoder[b64code] = char:byte()
	end
	return encoder
end

function base64.makedecoder( s62, s63, spad )
	local decoder = {}
	for b64code, charcode in pairs( base64.makeencoder( s62, s63, spad )) do
		decoder[charcode] = b64code
	end
	return decoder
end

local DEFAULT_ENCODER = base64.makeencoder()
local DEFAULT_DECODER = base64.makedecoder()

local char, concat = string.char, table.concat

function base64.encode( str, encoder, usecaching )
	encoder = encoder or DEFAULT_ENCODER
	local t, k, n = {}, 1, #str
	local lastn = n % 3
	local cache = {}
	for i = 1, n-lastn, 3 do
		local a, b, c = str:byte( i, i+2 )
		local v = a*0x10000 + b*0x100 + c
		local s
		if usecaching then
			s = cache[v]
			if not s then
				s = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])
				cache[v] = s
			end
		else
			s = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])
		end
		t[k] = s
		k = k + 1
	end
	if lastn == 2 then
		local a, b = str:byte( n-1, n )
		local v = a*0x10000 + b*0x100
		t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[64])
	elseif lastn == 1 then
		local v = str:byte( n )*0x10000
		t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[64], encoder[64])
	end
	return concat( t )
end

function base64.decode( b64, decoder, usecaching )
	decoder = decoder or DEFAULT_DECODER
	local pattern = '[^%w%+%/%=]'
	if decoder then
		local s62, s63
		for charcode, b64code in pairs( decoder ) do
			if b64code == 62 then s62 = charcode
			elseif b64code == 63 then s63 = charcode
			end
		end
		pattern = ('[^%%w%%%s%%%s%%=]'):format( char(s62), char(s63) )
	end
	b64 = b64:gsub( pattern, '' )
	local cache = usecaching and {}
	local t, k = {}, 1
	local n = #b64
	local padding = b64:sub(-2) == '==' and 2 or b64:sub(-1) == '=' and 1 or 0
	for i = 1, padding > 0 and n-4 or n, 4 do
		local a, b, c, d = b64:byte( i, i+3 )
		local s
		if usecaching then
			local v0 = a*0x1000000 + b*0x10000 + c*0x100 + d
			s = cache[v0]
			if not s then
				local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]
				s = char( extract(v,16,8), extract(v,8,8), extract(v,0,8))
				cache[v0] = s
			end
		else
			local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]
			s = char( extract(v,16,8), extract(v,8,8), extract(v,0,8))
		end
		t[k] = s
		k = k + 1
	end
	if padding == 1 then
		local a, b, c = b64:byte( n-3, n-1 )
		local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40
		t[k] = char( extract(v,16,8), extract(v,8,8))
	elseif padding == 2 then
		local a, b = b64:byte( n-3, n-2 )
		local v = decoder[a]*0x40000 + decoder[b]*0x1000
		t[k] = char( extract(v,16,8))
	end
	return concat( t )
end

return base64

--[[
------------------------------------------------------------------------------
This software is available under 2 licenses -- choose whichever you prefer.
------------------------------------------------------------------------------
ALTERNATIVE A - MIT License
Copyright (c) 2018 Ilya Kolbin
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
------------------------------------------------------------------------------
ALTERNATIVE B - Public Domain (www.unlicense.org)
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or distribute this
software, either in source code form or as a compiled binary, for any purpose,
commercial or non-commercial, and by any means.
In jurisdictions that recognize copyright laws, the author or authors of this
software dedicate any and all copyright interest in the software to the public
domain. We make this dedication for the benefit of the public at large and to
the detriment of our heirs and successors. We intend this dedication to be an
overt act of relinquishment in perpetuity of all present and future rights to
this software under copyright law.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
------------------------------------------------------------------------------
--]]
 end,
["main"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayEntries = ____lualib.__TS__ArrayEntries
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__ParseInt = ____lualib.__TS__ParseInt
local ____exports = {}
local ____test = require("programs.test")
local test_program = ____test.default
local ____mine = require("programs.mine")
local mine_program = ____mine.default
local ____pokemon = require("programs.pokemon")
local poke_program = ____pokemon.default
print("Nate's ComputerCraft OS")
local programs = {{"test", test_program}, {"mine", mine_program}, {"pokemon", poke_program}}
for ____, ____value in __TS__Iterator(__TS__ArrayEntries(programs)) do
    local index = ____value[1]
    local value = ____value[2]
    print((tostring(index) .. ": ") .. value[1])
end
local value = __TS__ParseInt(read())
local ____self_0 = programs[value + 1]
____self_0[2](____self_0)
return ____exports
 end,
}
return require("main", ...)
