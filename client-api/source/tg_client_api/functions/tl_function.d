/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.tl_function;

/// Common base of every generated TL function.
abstract class TlFunction
{
    /// The id of the concrete function.
    abstract uint tlIdValue() const nothrow;
}

/// Placeholder for a generic `!X` query argument in the `invoke*`
/// combinators. Callers substitute the real request type themselves.
abstract class TlObject
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
}
