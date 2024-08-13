// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scaffold.dart';

class AccountSummariesStateMapper
    extends ClassMapperBase<AccountSummariesState> {
  AccountSummariesStateMapper._();

  static AccountSummariesStateMapper? _instance;
  static AccountSummariesStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountSummariesStateMapper._());
      AccountGroupSummaryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AccountSummariesState';

  static List<AccountGroupSummary> _$accountGroups(AccountSummariesState v) =>
      v.accountGroups;
  static const Field<AccountSummariesState, List<AccountGroupSummary>>
      _f$accountGroups = Field('accountGroups', _$accountGroups);

  @override
  final MappableFields<AccountSummariesState> fields = const {
    #accountGroups: _f$accountGroups,
  };

  static AccountSummariesState _instantiate(DecodingData data) {
    return AccountSummariesState(accountGroups: data.dec(_f$accountGroups));
  }

  @override
  final Function instantiate = _instantiate;

  static AccountSummariesState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AccountSummariesState>(map);
  }

  static AccountSummariesState fromJson(String json) {
    return ensureInitialized().decodeJson<AccountSummariesState>(json);
  }
}

mixin AccountSummariesStateMappable {
  String toJson() {
    return AccountSummariesStateMapper.ensureInitialized()
        .encodeJson<AccountSummariesState>(this as AccountSummariesState);
  }

  Map<String, dynamic> toMap() {
    return AccountSummariesStateMapper.ensureInitialized()
        .encodeMap<AccountSummariesState>(this as AccountSummariesState);
  }

  AccountSummariesStateCopyWith<AccountSummariesState, AccountSummariesState,
          AccountSummariesState>
      get copyWith => _AccountSummariesStateCopyWithImpl(
          this as AccountSummariesState, $identity, $identity);
  @override
  String toString() {
    return AccountSummariesStateMapper.ensureInitialized()
        .stringifyValue(this as AccountSummariesState);
  }

  @override
  bool operator ==(Object other) {
    return AccountSummariesStateMapper.ensureInitialized()
        .equalsValue(this as AccountSummariesState, other);
  }

  @override
  int get hashCode {
    return AccountSummariesStateMapper.ensureInitialized()
        .hashValue(this as AccountSummariesState);
  }
}

extension AccountSummariesStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AccountSummariesState, $Out> {
  AccountSummariesStateCopyWith<$R, AccountSummariesState, $Out>
      get $asAccountSummariesState =>
          $base.as((v, t, t2) => _AccountSummariesStateCopyWithImpl(v, t, t2));
}

abstract class AccountSummariesStateCopyWith<
    $R,
    $In extends AccountSummariesState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      AccountGroupSummary,
      AccountGroupSummaryCopyWith<$R, AccountGroupSummary,
          AccountGroupSummary>> get accountGroups;
  $R call({List<AccountGroupSummary>? accountGroups});
  AccountSummariesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AccountSummariesStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AccountSummariesState, $Out>
    implements AccountSummariesStateCopyWith<$R, AccountSummariesState, $Out> {
  _AccountSummariesStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AccountSummariesState> $mapper =
      AccountSummariesStateMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      AccountGroupSummary,
      AccountGroupSummaryCopyWith<$R, AccountGroupSummary,
          AccountGroupSummary>> get accountGroups => ListCopyWith(
      $value.accountGroups,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(accountGroups: v));
  @override
  $R call({List<AccountGroupSummary>? accountGroups}) =>
      $apply(FieldCopyWithData(
          {if (accountGroups != null) #accountGroups: accountGroups}));
  @override
  AccountSummariesState $make(CopyWithData data) => AccountSummariesState(
      accountGroups: data.get(#accountGroups, or: $value.accountGroups));

  @override
  AccountSummariesStateCopyWith<$R2, AccountSummariesState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AccountSummariesStateCopyWithImpl($value, $cast, t);
}

class AccountGroupSummaryMapper extends ClassMapperBase<AccountGroupSummary> {
  AccountGroupSummaryMapper._();

  static AccountGroupSummaryMapper? _instance;
  static AccountGroupSummaryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountGroupSummaryMapper._());
      AccountSummaryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AccountGroupSummary';

  static String _$label(AccountGroupSummary v) => v.label;
  static const Field<AccountGroupSummary, String> _f$label =
      Field('label', _$label);
  static String _$balance(AccountGroupSummary v) => v.balance;
  static const Field<AccountGroupSummary, String> _f$balance =
      Field('balance', _$balance);
  static List<AccountSummary> _$accounts(AccountGroupSummary v) => v.accounts;
  static const Field<AccountGroupSummary, List<AccountSummary>> _f$accounts =
      Field('accounts', _$accounts);
  static bool _$expanded(AccountGroupSummary v) => v.expanded;
  static const Field<AccountGroupSummary, bool> _f$expanded =
      Field('expanded', _$expanded, opt: true, def: false);
  static bool _$negative(AccountGroupSummary v) => v.negative;
  static const Field<AccountGroupSummary, bool> _f$negative =
      Field('negative', _$negative, opt: true, def: false);

  @override
  final MappableFields<AccountGroupSummary> fields = const {
    #label: _f$label,
    #balance: _f$balance,
    #accounts: _f$accounts,
    #expanded: _f$expanded,
    #negative: _f$negative,
  };

  static AccountGroupSummary _instantiate(DecodingData data) {
    return AccountGroupSummary(
        label: data.dec(_f$label),
        balance: data.dec(_f$balance),
        accounts: data.dec(_f$accounts),
        expanded: data.dec(_f$expanded),
        negative: data.dec(_f$negative));
  }

  @override
  final Function instantiate = _instantiate;

  static AccountGroupSummary fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AccountGroupSummary>(map);
  }

  static AccountGroupSummary fromJson(String json) {
    return ensureInitialized().decodeJson<AccountGroupSummary>(json);
  }
}

mixin AccountGroupSummaryMappable {
  String toJson() {
    return AccountGroupSummaryMapper.ensureInitialized()
        .encodeJson<AccountGroupSummary>(this as AccountGroupSummary);
  }

  Map<String, dynamic> toMap() {
    return AccountGroupSummaryMapper.ensureInitialized()
        .encodeMap<AccountGroupSummary>(this as AccountGroupSummary);
  }

  AccountGroupSummaryCopyWith<AccountGroupSummary, AccountGroupSummary,
          AccountGroupSummary>
      get copyWith => _AccountGroupSummaryCopyWithImpl(
          this as AccountGroupSummary, $identity, $identity);
  @override
  String toString() {
    return AccountGroupSummaryMapper.ensureInitialized()
        .stringifyValue(this as AccountGroupSummary);
  }

  @override
  bool operator ==(Object other) {
    return AccountGroupSummaryMapper.ensureInitialized()
        .equalsValue(this as AccountGroupSummary, other);
  }

  @override
  int get hashCode {
    return AccountGroupSummaryMapper.ensureInitialized()
        .hashValue(this as AccountGroupSummary);
  }
}

extension AccountGroupSummaryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AccountGroupSummary, $Out> {
  AccountGroupSummaryCopyWith<$R, AccountGroupSummary, $Out>
      get $asAccountGroupSummary =>
          $base.as((v, t, t2) => _AccountGroupSummaryCopyWithImpl(v, t, t2));
}

abstract class AccountGroupSummaryCopyWith<$R, $In extends AccountGroupSummary,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, AccountSummary,
      AccountSummaryCopyWith<$R, AccountSummary, AccountSummary>> get accounts;
  $R call(
      {String? label,
      String? balance,
      List<AccountSummary>? accounts,
      bool? expanded,
      bool? negative});
  AccountGroupSummaryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AccountGroupSummaryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AccountGroupSummary, $Out>
    implements AccountGroupSummaryCopyWith<$R, AccountGroupSummary, $Out> {
  _AccountGroupSummaryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AccountGroupSummary> $mapper =
      AccountGroupSummaryMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AccountSummary,
          AccountSummaryCopyWith<$R, AccountSummary, AccountSummary>>
      get accounts => ListCopyWith($value.accounts,
          (v, t) => v.copyWith.$chain(t), (v) => call(accounts: v));
  @override
  $R call(
          {String? label,
          String? balance,
          List<AccountSummary>? accounts,
          bool? expanded,
          bool? negative}) =>
      $apply(FieldCopyWithData({
        if (label != null) #label: label,
        if (balance != null) #balance: balance,
        if (accounts != null) #accounts: accounts,
        if (expanded != null) #expanded: expanded,
        if (negative != null) #negative: negative
      }));
  @override
  AccountGroupSummary $make(CopyWithData data) => AccountGroupSummary(
      label: data.get(#label, or: $value.label),
      balance: data.get(#balance, or: $value.balance),
      accounts: data.get(#accounts, or: $value.accounts),
      expanded: data.get(#expanded, or: $value.expanded),
      negative: data.get(#negative, or: $value.negative));

  @override
  AccountGroupSummaryCopyWith<$R2, AccountGroupSummary, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AccountGroupSummaryCopyWithImpl($value, $cast, t);
}

class AccountSummaryMapper extends ClassMapperBase<AccountSummary> {
  AccountSummaryMapper._();

  static AccountSummaryMapper? _instance;
  static AccountSummaryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountSummaryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AccountSummary';

  static String _$label(AccountSummary v) => v.label;
  static const Field<AccountSummary, String> _f$label = Field('label', _$label);
  static String _$balance(AccountSummary v) => v.balance;
  static const Field<AccountSummary, String> _f$balance =
      Field('balance', _$balance);
  static bool _$negative(AccountSummary v) => v.negative;
  static const Field<AccountSummary, bool> _f$negative =
      Field('negative', _$negative, opt: true, def: false);
  static Set<int> _$actions(AccountSummary v) => v.actions;
  static const Field<AccountSummary, Set<int>> _f$actions =
      Field('actions', _$actions, opt: true, def: const <int>{});

  @override
  final MappableFields<AccountSummary> fields = const {
    #label: _f$label,
    #balance: _f$balance,
    #negative: _f$negative,
    #actions: _f$actions,
  };

  static AccountSummary _instantiate(DecodingData data) {
    return AccountSummary(
        label: data.dec(_f$label),
        balance: data.dec(_f$balance),
        negative: data.dec(_f$negative),
        actions: data.dec(_f$actions));
  }

  @override
  final Function instantiate = _instantiate;

  static AccountSummary fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AccountSummary>(map);
  }

  static AccountSummary fromJson(String json) {
    return ensureInitialized().decodeJson<AccountSummary>(json);
  }
}

mixin AccountSummaryMappable {
  String toJson() {
    return AccountSummaryMapper.ensureInitialized()
        .encodeJson<AccountSummary>(this as AccountSummary);
  }

  Map<String, dynamic> toMap() {
    return AccountSummaryMapper.ensureInitialized()
        .encodeMap<AccountSummary>(this as AccountSummary);
  }

  AccountSummaryCopyWith<AccountSummary, AccountSummary, AccountSummary>
      get copyWith => _AccountSummaryCopyWithImpl(
          this as AccountSummary, $identity, $identity);
  @override
  String toString() {
    return AccountSummaryMapper.ensureInitialized()
        .stringifyValue(this as AccountSummary);
  }

  @override
  bool operator ==(Object other) {
    return AccountSummaryMapper.ensureInitialized()
        .equalsValue(this as AccountSummary, other);
  }

  @override
  int get hashCode {
    return AccountSummaryMapper.ensureInitialized()
        .hashValue(this as AccountSummary);
  }
}

extension AccountSummaryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AccountSummary, $Out> {
  AccountSummaryCopyWith<$R, AccountSummary, $Out> get $asAccountSummary =>
      $base.as((v, t, t2) => _AccountSummaryCopyWithImpl(v, t, t2));
}

abstract class AccountSummaryCopyWith<$R, $In extends AccountSummary, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? label, String? balance, bool? negative, Set<int>? actions});
  AccountSummaryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AccountSummaryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AccountSummary, $Out>
    implements AccountSummaryCopyWith<$R, AccountSummary, $Out> {
  _AccountSummaryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AccountSummary> $mapper =
      AccountSummaryMapper.ensureInitialized();
  @override
  $R call(
          {String? label,
          String? balance,
          bool? negative,
          Set<int>? actions}) =>
      $apply(FieldCopyWithData({
        if (label != null) #label: label,
        if (balance != null) #balance: balance,
        if (negative != null) #negative: negative,
        if (actions != null) #actions: actions
      }));
  @override
  AccountSummary $make(CopyWithData data) => AccountSummary(
      label: data.get(#label, or: $value.label),
      balance: data.get(#balance, or: $value.balance),
      negative: data.get(#negative, or: $value.negative),
      actions: data.get(#actions, or: $value.actions));

  @override
  AccountSummaryCopyWith<$R2, AccountSummary, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AccountSummaryCopyWithImpl($value, $cast, t);
}
