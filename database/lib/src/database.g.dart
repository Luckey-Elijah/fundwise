// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, Budget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateFormatMeta =
      const VerificationMeta('dateFormat');
  @override
  late final GeneratedColumn<String> dateFormat = GeneratedColumn<String>(
      'date_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currencyFormatMeta =
      const VerificationMeta('currencyFormat');
  @override
  late final GeneratedColumn<String> currencyFormat = GeneratedColumn<String>(
      'currency_format', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, dateFormat, currencyFormat];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<Budget> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_format')) {
      context.handle(
          _dateFormatMeta,
          dateFormat.isAcceptableOrUnknown(
              data['date_format']!, _dateFormatMeta));
    } else if (isInserting) {
      context.missing(_dateFormatMeta);
    }
    if (data.containsKey('currency_format')) {
      context.handle(
          _currencyFormatMeta,
          currencyFormat.isAcceptableOrUnknown(
              data['currency_format']!, _currencyFormatMeta));
    } else if (isInserting) {
      context.missing(_currencyFormatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Budget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Budget(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      dateFormat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_format'])!,
      currencyFormat: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}currency_format'])!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }
}

class Budget extends DataClass implements Insertable<Budget> {
  final int id;
  final String name;
  final String dateFormat;
  final String currencyFormat;
  const Budget(
      {required this.id,
      required this.name,
      required this.dateFormat,
      required this.currencyFormat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['date_format'] = Variable<String>(dateFormat);
    map['currency_format'] = Variable<String>(currencyFormat);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      name: Value(name),
      dateFormat: Value(dateFormat),
      currencyFormat: Value(currencyFormat),
    );
  }

  factory Budget.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Budget(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dateFormat: serializer.fromJson<String>(json['dateFormat']),
      currencyFormat: serializer.fromJson<String>(json['currencyFormat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dateFormat': serializer.toJson<String>(dateFormat),
      'currencyFormat': serializer.toJson<String>(currencyFormat),
    };
  }

  Budget copyWith(
          {int? id,
          String? name,
          String? dateFormat,
          String? currencyFormat}) =>
      Budget(
        id: id ?? this.id,
        name: name ?? this.name,
        dateFormat: dateFormat ?? this.dateFormat,
        currencyFormat: currencyFormat ?? this.currencyFormat,
      );
  @override
  String toString() {
    return (StringBuffer('Budget(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('currencyFormat: $currencyFormat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, dateFormat, currencyFormat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Budget &&
          other.id == this.id &&
          other.name == this.name &&
          other.dateFormat == this.dateFormat &&
          other.currencyFormat == this.currencyFormat);
}

class BudgetsCompanion extends UpdateCompanion<Budget> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> dateFormat;
  final Value<String> currencyFormat;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dateFormat = const Value.absent(),
    this.currencyFormat = const Value.absent(),
  });
  BudgetsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String dateFormat,
    required String currencyFormat,
  })  : name = Value(name),
        dateFormat = Value(dateFormat),
        currencyFormat = Value(currencyFormat);
  static Insertable<Budget> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? dateFormat,
    Expression<String>? currencyFormat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dateFormat != null) 'date_format': dateFormat,
      if (currencyFormat != null) 'currency_format': currencyFormat,
    });
  }

  BudgetsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? dateFormat,
      Value<String>? currencyFormat}) {
    return BudgetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dateFormat: dateFormat ?? this.dateFormat,
      currencyFormat: currencyFormat ?? this.currencyFormat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateFormat.present) {
      map['date_format'] = Variable<String>(dateFormat.value);
    }
    if (currencyFormat.present) {
      map['currency_format'] = Variable<String>(currencyFormat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('currencyFormat: $currencyFormat')
          ..write(')'))
        .toString();
  }
}

class $PayeesTable extends Payees with TableInfo<$PayeesTable, Payee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PayeesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nextMeta = const VerificationMeta('next');
  @override
  late final GeneratedColumn<String> next = GeneratedColumn<String>(
      'next', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _budgetIdMeta =
      const VerificationMeta('budgetId');
  @override
  late final GeneratedColumn<int> budgetId = GeneratedColumn<int>(
      'budget_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES budgets (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, next, budgetId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payees';
  @override
  VerificationContext validateIntegrity(Insertable<Payee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('next')) {
      context.handle(
          _nextMeta, next.isAcceptableOrUnknown(data['next']!, _nextMeta));
    } else if (isInserting) {
      context.missing(_nextMeta);
    }
    if (data.containsKey('budget_id')) {
      context.handle(_budgetIdMeta,
          budgetId.isAcceptableOrUnknown(data['budget_id']!, _budgetIdMeta));
    } else if (isInserting) {
      context.missing(_budgetIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payee map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payee(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      next: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next'])!,
      budgetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget_id'])!,
    );
  }

  @override
  $PayeesTable createAlias(String alias) {
    return $PayeesTable(attachedDatabase, alias);
  }
}

class Payee extends DataClass implements Insertable<Payee> {
  final int id;
  final String next;
  final int budgetId;
  const Payee({required this.id, required this.next, required this.budgetId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['next'] = Variable<String>(next);
    map['budget_id'] = Variable<int>(budgetId);
    return map;
  }

  PayeesCompanion toCompanion(bool nullToAbsent) {
    return PayeesCompanion(
      id: Value(id),
      next: Value(next),
      budgetId: Value(budgetId),
    );
  }

  factory Payee.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payee(
      id: serializer.fromJson<int>(json['id']),
      next: serializer.fromJson<String>(json['next']),
      budgetId: serializer.fromJson<int>(json['budgetId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'next': serializer.toJson<String>(next),
      'budgetId': serializer.toJson<int>(budgetId),
    };
  }

  Payee copyWith({int? id, String? next, int? budgetId}) => Payee(
        id: id ?? this.id,
        next: next ?? this.next,
        budgetId: budgetId ?? this.budgetId,
      );
  @override
  String toString() {
    return (StringBuffer('Payee(')
          ..write('id: $id, ')
          ..write('next: $next, ')
          ..write('budgetId: $budgetId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, next, budgetId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payee &&
          other.id == this.id &&
          other.next == this.next &&
          other.budgetId == this.budgetId);
}

class PayeesCompanion extends UpdateCompanion<Payee> {
  final Value<int> id;
  final Value<String> next;
  final Value<int> budgetId;
  const PayeesCompanion({
    this.id = const Value.absent(),
    this.next = const Value.absent(),
    this.budgetId = const Value.absent(),
  });
  PayeesCompanion.insert({
    this.id = const Value.absent(),
    required String next,
    required int budgetId,
  })  : next = Value(next),
        budgetId = Value(budgetId);
  static Insertable<Payee> custom({
    Expression<int>? id,
    Expression<String>? next,
    Expression<int>? budgetId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (next != null) 'next': next,
      if (budgetId != null) 'budget_id': budgetId,
    });
  }

  PayeesCompanion copyWith(
      {Value<int>? id, Value<String>? next, Value<int>? budgetId}) {
    return PayeesCompanion(
      id: id ?? this.id,
      next: next ?? this.next,
      budgetId: budgetId ?? this.budgetId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (next.present) {
      map['next'] = Variable<String>(next.value);
    }
    if (budgetId.present) {
      map['budget_id'] = Variable<int>(budgetId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PayeesCompanion(')
          ..write('id: $id, ')
          ..write('next: $next, ')
          ..write('budgetId: $budgetId')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<AccountType>($AccountsTable.$convertertype);
  static const VerificationMeta _balanceMeta =
      const VerificationMeta('balance');
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
      'balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _clearedBalanceMeta =
      const VerificationMeta('clearedBalance');
  @override
  late final GeneratedColumn<int> clearedBalance = GeneratedColumn<int>(
      'cleared_balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unclearedBalanceMeta =
      const VerificationMeta('unclearedBalance');
  @override
  late final GeneratedColumn<int> unclearedBalance = GeneratedColumn<int>(
      'uncleared_balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _budgetIdMeta =
      const VerificationMeta('budgetId');
  @override
  late final GeneratedColumn<int> budgetId = GeneratedColumn<int>(
      'budget_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES budgets (id)'));
  static const VerificationMeta _payeeIdMeta =
      const VerificationMeta('payeeId');
  @override
  late final GeneratedColumn<int> payeeId = GeneratedColumn<int>(
      'payee_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES payees (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        balance,
        clearedBalance,
        unclearedBalance,
        budgetId,
        payeeId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('cleared_balance')) {
      context.handle(
          _clearedBalanceMeta,
          clearedBalance.isAcceptableOrUnknown(
              data['cleared_balance']!, _clearedBalanceMeta));
    } else if (isInserting) {
      context.missing(_clearedBalanceMeta);
    }
    if (data.containsKey('uncleared_balance')) {
      context.handle(
          _unclearedBalanceMeta,
          unclearedBalance.isAcceptableOrUnknown(
              data['uncleared_balance']!, _unclearedBalanceMeta));
    } else if (isInserting) {
      context.missing(_unclearedBalanceMeta);
    }
    if (data.containsKey('budget_id')) {
      context.handle(_budgetIdMeta,
          budgetId.isAcceptableOrUnknown(data['budget_id']!, _budgetIdMeta));
    } else if (isInserting) {
      context.missing(_budgetIdMeta);
    }
    if (data.containsKey('payee_id')) {
      context.handle(_payeeIdMeta,
          payeeId.isAcceptableOrUnknown(data['payee_id']!, _payeeIdMeta));
    } else if (isInserting) {
      context.missing(_payeeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $AccountsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      balance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}balance'])!,
      clearedBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cleared_balance'])!,
      unclearedBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}uncleared_balance'])!,
      budgetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget_id'])!,
      payeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payee_id'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, String, String> $convertertype =
      const EnumNameConverter<AccountType>(AccountType.values);
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final String name;
  final AccountType type;
  final int balance;
  final int clearedBalance;
  final int unclearedBalance;
  final int budgetId;
  final int payeeId;
  const Account(
      {required this.id,
      required this.name,
      required this.type,
      required this.balance,
      required this.clearedBalance,
      required this.unclearedBalance,
      required this.budgetId,
      required this.payeeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>($AccountsTable.$convertertype.toSql(type));
    }
    map['balance'] = Variable<int>(balance);
    map['cleared_balance'] = Variable<int>(clearedBalance);
    map['uncleared_balance'] = Variable<int>(unclearedBalance);
    map['budget_id'] = Variable<int>(budgetId);
    map['payee_id'] = Variable<int>(payeeId);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      balance: Value(balance),
      clearedBalance: Value(clearedBalance),
      unclearedBalance: Value(unclearedBalance),
      budgetId: Value(budgetId),
      payeeId: Value(payeeId),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $AccountsTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      balance: serializer.fromJson<int>(json['balance']),
      clearedBalance: serializer.fromJson<int>(json['clearedBalance']),
      unclearedBalance: serializer.fromJson<int>(json['unclearedBalance']),
      budgetId: serializer.fromJson<int>(json['budgetId']),
      payeeId: serializer.fromJson<int>(json['payeeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type':
          serializer.toJson<String>($AccountsTable.$convertertype.toJson(type)),
      'balance': serializer.toJson<int>(balance),
      'clearedBalance': serializer.toJson<int>(clearedBalance),
      'unclearedBalance': serializer.toJson<int>(unclearedBalance),
      'budgetId': serializer.toJson<int>(budgetId),
      'payeeId': serializer.toJson<int>(payeeId),
    };
  }

  Account copyWith(
          {int? id,
          String? name,
          AccountType? type,
          int? balance,
          int? clearedBalance,
          int? unclearedBalance,
          int? budgetId,
          int? payeeId}) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        balance: balance ?? this.balance,
        clearedBalance: clearedBalance ?? this.clearedBalance,
        unclearedBalance: unclearedBalance ?? this.unclearedBalance,
        budgetId: budgetId ?? this.budgetId,
        payeeId: payeeId ?? this.payeeId,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('balance: $balance, ')
          ..write('clearedBalance: $clearedBalance, ')
          ..write('unclearedBalance: $unclearedBalance, ')
          ..write('budgetId: $budgetId, ')
          ..write('payeeId: $payeeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, balance, clearedBalance,
      unclearedBalance, budgetId, payeeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.balance == this.balance &&
          other.clearedBalance == this.clearedBalance &&
          other.unclearedBalance == this.unclearedBalance &&
          other.budgetId == this.budgetId &&
          other.payeeId == this.payeeId);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<String> name;
  final Value<AccountType> type;
  final Value<int> balance;
  final Value<int> clearedBalance;
  final Value<int> unclearedBalance;
  final Value<int> budgetId;
  final Value<int> payeeId;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.balance = const Value.absent(),
    this.clearedBalance = const Value.absent(),
    this.unclearedBalance = const Value.absent(),
    this.budgetId = const Value.absent(),
    this.payeeId = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required AccountType type,
    required int balance,
    required int clearedBalance,
    required int unclearedBalance,
    required int budgetId,
    required int payeeId,
  })  : name = Value(name),
        type = Value(type),
        balance = Value(balance),
        clearedBalance = Value(clearedBalance),
        unclearedBalance = Value(unclearedBalance),
        budgetId = Value(budgetId),
        payeeId = Value(payeeId);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? balance,
    Expression<int>? clearedBalance,
    Expression<int>? unclearedBalance,
    Expression<int>? budgetId,
    Expression<int>? payeeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (balance != null) 'balance': balance,
      if (clearedBalance != null) 'cleared_balance': clearedBalance,
      if (unclearedBalance != null) 'uncleared_balance': unclearedBalance,
      if (budgetId != null) 'budget_id': budgetId,
      if (payeeId != null) 'payee_id': payeeId,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<AccountType>? type,
      Value<int>? balance,
      Value<int>? clearedBalance,
      Value<int>? unclearedBalance,
      Value<int>? budgetId,
      Value<int>? payeeId}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      clearedBalance: clearedBalance ?? this.clearedBalance,
      unclearedBalance: unclearedBalance ?? this.unclearedBalance,
      budgetId: budgetId ?? this.budgetId,
      payeeId: payeeId ?? this.payeeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>($AccountsTable.$convertertype.toSql(type.value));
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (clearedBalance.present) {
      map['cleared_balance'] = Variable<int>(clearedBalance.value);
    }
    if (unclearedBalance.present) {
      map['uncleared_balance'] = Variable<int>(unclearedBalance.value);
    }
    if (budgetId.present) {
      map['budget_id'] = Variable<int>(budgetId.value);
    }
    if (payeeId.present) {
      map['payee_id'] = Variable<int>(payeeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('balance: $balance, ')
          ..write('clearedBalance: $clearedBalance, ')
          ..write('unclearedBalance: $unclearedBalance, ')
          ..write('budgetId: $budgetId, ')
          ..write('payeeId: $payeeId')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hiddenMeta = const VerificationMeta('hidden');
  @override
  late final GeneratedColumn<bool> hidden = GeneratedColumn<bool>(
      'hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("hidden" IN (0, 1))'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _budgetedMeta =
      const VerificationMeta('budgeted');
  @override
  late final GeneratedColumn<int> budgeted = GeneratedColumn<int>(
      'budgeted', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _activityMeta =
      const VerificationMeta('activity');
  @override
  late final GeneratedColumn<int> activity = GeneratedColumn<int>(
      'activity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _balanceMeta =
      const VerificationMeta('balance');
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
      'balance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _budgetIdMeta =
      const VerificationMeta('budgetId');
  @override
  late final GeneratedColumn<int> budgetId = GeneratedColumn<int>(
      'budget_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES budgets (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, hidden, note, budgeted, activity, balance, budgetId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('hidden')) {
      context.handle(_hiddenMeta,
          hidden.isAcceptableOrUnknown(data['hidden']!, _hiddenMeta));
    } else if (isInserting) {
      context.missing(_hiddenMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('budgeted')) {
      context.handle(_budgetedMeta,
          budgeted.isAcceptableOrUnknown(data['budgeted']!, _budgetedMeta));
    } else if (isInserting) {
      context.missing(_budgetedMeta);
    }
    if (data.containsKey('activity')) {
      context.handle(_activityMeta,
          activity.isAcceptableOrUnknown(data['activity']!, _activityMeta));
    } else if (isInserting) {
      context.missing(_activityMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('budget_id')) {
      context.handle(_budgetIdMeta,
          budgetId.isAcceptableOrUnknown(data['budget_id']!, _budgetIdMeta));
    } else if (isInserting) {
      context.missing(_budgetIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      hidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}hidden'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      budgeted: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budgeted'])!,
      activity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}activity'])!,
      balance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}balance'])!,
      budgetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget_id'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final bool hidden;
  final String? note;
  final int budgeted;
  final int activity;
  final int balance;
  final int budgetId;
  const Category(
      {required this.id,
      required this.name,
      required this.hidden,
      this.note,
      required this.budgeted,
      required this.activity,
      required this.balance,
      required this.budgetId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['hidden'] = Variable<bool>(hidden);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['budgeted'] = Variable<int>(budgeted);
    map['activity'] = Variable<int>(activity);
    map['balance'] = Variable<int>(balance);
    map['budget_id'] = Variable<int>(budgetId);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      hidden: Value(hidden),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      budgeted: Value(budgeted),
      activity: Value(activity),
      balance: Value(balance),
      budgetId: Value(budgetId),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      hidden: serializer.fromJson<bool>(json['hidden']),
      note: serializer.fromJson<String?>(json['note']),
      budgeted: serializer.fromJson<int>(json['budgeted']),
      activity: serializer.fromJson<int>(json['activity']),
      balance: serializer.fromJson<int>(json['balance']),
      budgetId: serializer.fromJson<int>(json['budgetId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'hidden': serializer.toJson<bool>(hidden),
      'note': serializer.toJson<String?>(note),
      'budgeted': serializer.toJson<int>(budgeted),
      'activity': serializer.toJson<int>(activity),
      'balance': serializer.toJson<int>(balance),
      'budgetId': serializer.toJson<int>(budgetId),
    };
  }

  Category copyWith(
          {int? id,
          String? name,
          bool? hidden,
          Value<String?> note = const Value.absent(),
          int? budgeted,
          int? activity,
          int? balance,
          int? budgetId}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        hidden: hidden ?? this.hidden,
        note: note.present ? note.value : this.note,
        budgeted: budgeted ?? this.budgeted,
        activity: activity ?? this.activity,
        balance: balance ?? this.balance,
        budgetId: budgetId ?? this.budgetId,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hidden: $hidden, ')
          ..write('note: $note, ')
          ..write('budgeted: $budgeted, ')
          ..write('activity: $activity, ')
          ..write('balance: $balance, ')
          ..write('budgetId: $budgetId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, hidden, note, budgeted, activity, balance, budgetId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.hidden == this.hidden &&
          other.note == this.note &&
          other.budgeted == this.budgeted &&
          other.activity == this.activity &&
          other.balance == this.balance &&
          other.budgetId == this.budgetId);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> hidden;
  final Value<String?> note;
  final Value<int> budgeted;
  final Value<int> activity;
  final Value<int> balance;
  final Value<int> budgetId;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.hidden = const Value.absent(),
    this.note = const Value.absent(),
    this.budgeted = const Value.absent(),
    this.activity = const Value.absent(),
    this.balance = const Value.absent(),
    this.budgetId = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool hidden,
    this.note = const Value.absent(),
    required int budgeted,
    required int activity,
    required int balance,
    required int budgetId,
  })  : name = Value(name),
        hidden = Value(hidden),
        budgeted = Value(budgeted),
        activity = Value(activity),
        balance = Value(balance),
        budgetId = Value(budgetId);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? hidden,
    Expression<String>? note,
    Expression<int>? budgeted,
    Expression<int>? activity,
    Expression<int>? balance,
    Expression<int>? budgetId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (hidden != null) 'hidden': hidden,
      if (note != null) 'note': note,
      if (budgeted != null) 'budgeted': budgeted,
      if (activity != null) 'activity': activity,
      if (balance != null) 'balance': balance,
      if (budgetId != null) 'budget_id': budgetId,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? hidden,
      Value<String?>? note,
      Value<int>? budgeted,
      Value<int>? activity,
      Value<int>? balance,
      Value<int>? budgetId}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      hidden: hidden ?? this.hidden,
      note: note ?? this.note,
      budgeted: budgeted ?? this.budgeted,
      activity: activity ?? this.activity,
      balance: balance ?? this.balance,
      budgetId: budgetId ?? this.budgetId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hidden.present) {
      map['hidden'] = Variable<bool>(hidden.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (budgeted.present) {
      map['budgeted'] = Variable<int>(budgeted.value);
    }
    if (activity.present) {
      map['activity'] = Variable<int>(activity.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (budgetId.present) {
      map['budget_id'] = Variable<int>(budgetId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hidden: $hidden, ')
          ..write('note: $note, ')
          ..write('budgeted: $budgeted, ')
          ..write('activity: $activity, ')
          ..write('balance: $balance, ')
          ..write('budgetId: $budgetId')
          ..write(')'))
        .toString();
  }
}

class $FlagsTable extends Flags with TableInfo<$FlagsTable, Flag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _budgetIdMeta =
      const VerificationMeta('budgetId');
  @override
  late final GeneratedColumn<int> budgetId = GeneratedColumn<int>(
      'budget_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES budgets (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, color, note, budgetId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flags';
  @override
  VerificationContext validateIntegrity(Insertable<Flag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('budget_id')) {
      context.handle(_budgetIdMeta,
          budgetId.isAcceptableOrUnknown(data['budget_id']!, _budgetIdMeta));
    } else if (isInserting) {
      context.missing(_budgetIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Flag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Flag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      budgetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget_id'])!,
    );
  }

  @override
  $FlagsTable createAlias(String alias) {
    return $FlagsTable(attachedDatabase, alias);
  }
}

class Flag extends DataClass implements Insertable<Flag> {
  final int id;
  final String name;
  final String color;
  final String? note;
  final int budgetId;
  const Flag(
      {required this.id,
      required this.name,
      required this.color,
      this.note,
      required this.budgetId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['budget_id'] = Variable<int>(budgetId);
    return map;
  }

  FlagsCompanion toCompanion(bool nullToAbsent) {
    return FlagsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      budgetId: Value(budgetId),
    );
  }

  factory Flag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Flag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      note: serializer.fromJson<String?>(json['note']),
      budgetId: serializer.fromJson<int>(json['budgetId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'note': serializer.toJson<String?>(note),
      'budgetId': serializer.toJson<int>(budgetId),
    };
  }

  Flag copyWith(
          {int? id,
          String? name,
          String? color,
          Value<String?> note = const Value.absent(),
          int? budgetId}) =>
      Flag(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        note: note.present ? note.value : this.note,
        budgetId: budgetId ?? this.budgetId,
      );
  @override
  String toString() {
    return (StringBuffer('Flag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('note: $note, ')
          ..write('budgetId: $budgetId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, note, budgetId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Flag &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.note == this.note &&
          other.budgetId == this.budgetId);
}

class FlagsCompanion extends UpdateCompanion<Flag> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  final Value<String?> note;
  final Value<int> budgetId;
  const FlagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.note = const Value.absent(),
    this.budgetId = const Value.absent(),
  });
  FlagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
    this.note = const Value.absent(),
    required int budgetId,
  })  : name = Value(name),
        color = Value(color),
        budgetId = Value(budgetId);
  static Insertable<Flag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? note,
    Expression<int>? budgetId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (note != null) 'note': note,
      if (budgetId != null) 'budget_id': budgetId,
    });
  }

  FlagsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? color,
      Value<String?>? note,
      Value<int>? budgetId}) {
    return FlagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      note: note ?? this.note,
      budgetId: budgetId ?? this.budgetId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (budgetId.present) {
      map['budget_id'] = Variable<int>(budgetId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('note: $note, ')
          ..write('budgetId: $budgetId')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<TransactionStatus, String>
      status = GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TransactionStatus>(
              $TransactionsTable.$converterstatus);
  static const VerificationMeta _approvedMeta =
      const VerificationMeta('approved');
  @override
  late final GeneratedColumn<bool> approved = GeneratedColumn<bool>(
      'approved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("approved" IN (0, 1))'));
  static const VerificationMeta _flagNameMeta =
      const VerificationMeta('flagName');
  @override
  late final GeneratedColumn<String> flagName = GeneratedColumn<String>(
      'flag_name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES flags (name)'));
  static const VerificationMeta _flagColorMeta =
      const VerificationMeta('flagColor');
  @override
  late final GeneratedColumn<String> flagColor = GeneratedColumn<String>(
      'flag_color', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES flags (color)'));
  static const VerificationMeta _budgetIdMeta =
      const VerificationMeta('budgetId');
  @override
  late final GeneratedColumn<int> budgetId = GeneratedColumn<int>(
      'budget_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES budgets (id)'));
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  static const VerificationMeta _payeeIdMeta =
      const VerificationMeta('payeeId');
  @override
  late final GeneratedColumn<int> payeeId = GeneratedColumn<int>(
      'payee_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES payees (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        amount,
        note,
        status,
        approved,
        flagName,
        flagColor,
        budgetId,
        accountId,
        payeeId,
        categoryId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('approved')) {
      context.handle(_approvedMeta,
          approved.isAcceptableOrUnknown(data['approved']!, _approvedMeta));
    } else if (isInserting) {
      context.missing(_approvedMeta);
    }
    if (data.containsKey('flag_name')) {
      context.handle(_flagNameMeta,
          flagName.isAcceptableOrUnknown(data['flag_name']!, _flagNameMeta));
    }
    if (data.containsKey('flag_color')) {
      context.handle(_flagColorMeta,
          flagColor.isAcceptableOrUnknown(data['flag_color']!, _flagColorMeta));
    }
    if (data.containsKey('budget_id')) {
      context.handle(_budgetIdMeta,
          budgetId.isAcceptableOrUnknown(data['budget_id']!, _budgetIdMeta));
    } else if (isInserting) {
      context.missing(_budgetIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    }
    if (data.containsKey('payee_id')) {
      context.handle(_payeeIdMeta,
          payeeId.isAcceptableOrUnknown(data['payee_id']!, _payeeIdMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      status: $TransactionsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      approved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}approved'])!,
      flagName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag_name']),
      flagColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag_color']),
      budgetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget_id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id']),
      payeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payee_id']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TransactionStatus, String, String>
      $converterstatus =
      const EnumNameConverter<TransactionStatus>(TransactionStatus.values);
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final DateTime? date;
  final int? amount;
  final String? note;
  final TransactionStatus status;
  final bool approved;
  final String? flagName;
  final String? flagColor;
  final int budgetId;
  final int? accountId;
  final int? payeeId;
  final int? categoryId;
  const Transaction(
      {required this.id,
      this.date,
      this.amount,
      this.note,
      required this.status,
      required this.approved,
      this.flagName,
      this.flagColor,
      required this.budgetId,
      this.accountId,
      this.payeeId,
      this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<int>(amount);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    {
      map['status'] =
          Variable<String>($TransactionsTable.$converterstatus.toSql(status));
    }
    map['approved'] = Variable<bool>(approved);
    if (!nullToAbsent || flagName != null) {
      map['flag_name'] = Variable<String>(flagName);
    }
    if (!nullToAbsent || flagColor != null) {
      map['flag_color'] = Variable<String>(flagColor);
    }
    map['budget_id'] = Variable<int>(budgetId);
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<int>(accountId);
    }
    if (!nullToAbsent || payeeId != null) {
      map['payee_id'] = Variable<int>(payeeId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      status: Value(status),
      approved: Value(approved),
      flagName: flagName == null && nullToAbsent
          ? const Value.absent()
          : Value(flagName),
      flagColor: flagColor == null && nullToAbsent
          ? const Value.absent()
          : Value(flagColor),
      budgetId: Value(budgetId),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      payeeId: payeeId == null && nullToAbsent
          ? const Value.absent()
          : Value(payeeId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime?>(json['date']),
      amount: serializer.fromJson<int?>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
      status: $TransactionsTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      approved: serializer.fromJson<bool>(json['approved']),
      flagName: serializer.fromJson<String?>(json['flagName']),
      flagColor: serializer.fromJson<String?>(json['flagColor']),
      budgetId: serializer.fromJson<int>(json['budgetId']),
      accountId: serializer.fromJson<int?>(json['accountId']),
      payeeId: serializer.fromJson<int?>(json['payeeId']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime?>(date),
      'amount': serializer.toJson<int?>(amount),
      'note': serializer.toJson<String?>(note),
      'status': serializer
          .toJson<String>($TransactionsTable.$converterstatus.toJson(status)),
      'approved': serializer.toJson<bool>(approved),
      'flagName': serializer.toJson<String?>(flagName),
      'flagColor': serializer.toJson<String?>(flagColor),
      'budgetId': serializer.toJson<int>(budgetId),
      'accountId': serializer.toJson<int?>(accountId),
      'payeeId': serializer.toJson<int?>(payeeId),
      'categoryId': serializer.toJson<int?>(categoryId),
    };
  }

  Transaction copyWith(
          {int? id,
          Value<DateTime?> date = const Value.absent(),
          Value<int?> amount = const Value.absent(),
          Value<String?> note = const Value.absent(),
          TransactionStatus? status,
          bool? approved,
          Value<String?> flagName = const Value.absent(),
          Value<String?> flagColor = const Value.absent(),
          int? budgetId,
          Value<int?> accountId = const Value.absent(),
          Value<int?> payeeId = const Value.absent(),
          Value<int?> categoryId = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        date: date.present ? date.value : this.date,
        amount: amount.present ? amount.value : this.amount,
        note: note.present ? note.value : this.note,
        status: status ?? this.status,
        approved: approved ?? this.approved,
        flagName: flagName.present ? flagName.value : this.flagName,
        flagColor: flagColor.present ? flagColor.value : this.flagColor,
        budgetId: budgetId ?? this.budgetId,
        accountId: accountId.present ? accountId.value : this.accountId,
        payeeId: payeeId.present ? payeeId.value : this.payeeId,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('status: $status, ')
          ..write('approved: $approved, ')
          ..write('flagName: $flagName, ')
          ..write('flagColor: $flagColor, ')
          ..write('budgetId: $budgetId, ')
          ..write('accountId: $accountId, ')
          ..write('payeeId: $payeeId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, amount, note, status, approved,
      flagName, flagColor, budgetId, accountId, payeeId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.date == this.date &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.status == this.status &&
          other.approved == this.approved &&
          other.flagName == this.flagName &&
          other.flagColor == this.flagColor &&
          other.budgetId == this.budgetId &&
          other.accountId == this.accountId &&
          other.payeeId == this.payeeId &&
          other.categoryId == this.categoryId);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<DateTime?> date;
  final Value<int?> amount;
  final Value<String?> note;
  final Value<TransactionStatus> status;
  final Value<bool> approved;
  final Value<String?> flagName;
  final Value<String?> flagColor;
  final Value<int> budgetId;
  final Value<int?> accountId;
  final Value<int?> payeeId;
  final Value<int?> categoryId;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.status = const Value.absent(),
    this.approved = const Value.absent(),
    this.flagName = const Value.absent(),
    this.flagColor = const Value.absent(),
    this.budgetId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.payeeId = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    required TransactionStatus status,
    required bool approved,
    this.flagName = const Value.absent(),
    this.flagColor = const Value.absent(),
    required int budgetId,
    this.accountId = const Value.absent(),
    this.payeeId = const Value.absent(),
    this.categoryId = const Value.absent(),
  })  : status = Value(status),
        approved = Value(approved),
        budgetId = Value(budgetId);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? amount,
    Expression<String>? note,
    Expression<String>? status,
    Expression<bool>? approved,
    Expression<String>? flagName,
    Expression<String>? flagColor,
    Expression<int>? budgetId,
    Expression<int>? accountId,
    Expression<int>? payeeId,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (status != null) 'status': status,
      if (approved != null) 'approved': approved,
      if (flagName != null) 'flag_name': flagName,
      if (flagColor != null) 'flag_color': flagColor,
      if (budgetId != null) 'budget_id': budgetId,
      if (accountId != null) 'account_id': accountId,
      if (payeeId != null) 'payee_id': payeeId,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime?>? date,
      Value<int?>? amount,
      Value<String?>? note,
      Value<TransactionStatus>? status,
      Value<bool>? approved,
      Value<String?>? flagName,
      Value<String?>? flagColor,
      Value<int>? budgetId,
      Value<int?>? accountId,
      Value<int?>? payeeId,
      Value<int?>? categoryId}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      status: status ?? this.status,
      approved: approved ?? this.approved,
      flagName: flagName ?? this.flagName,
      flagColor: flagColor ?? this.flagColor,
      budgetId: budgetId ?? this.budgetId,
      accountId: accountId ?? this.accountId,
      payeeId: payeeId ?? this.payeeId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $TransactionsTable.$converterstatus.toSql(status.value));
    }
    if (approved.present) {
      map['approved'] = Variable<bool>(approved.value);
    }
    if (flagName.present) {
      map['flag_name'] = Variable<String>(flagName.value);
    }
    if (flagColor.present) {
      map['flag_color'] = Variable<String>(flagColor.value);
    }
    if (budgetId.present) {
      map['budget_id'] = Variable<int>(budgetId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (payeeId.present) {
      map['payee_id'] = Variable<int>(payeeId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('status: $status, ')
          ..write('approved: $approved, ')
          ..write('flagName: $flagName, ')
          ..write('flagColor: $flagColor, ')
          ..write('budgetId: $budgetId, ')
          ..write('accountId: $accountId, ')
          ..write('payeeId: $payeeId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

abstract class _$FundwiseDatabase extends GeneratedDatabase {
  _$FundwiseDatabase(QueryExecutor e) : super(e);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  late final $PayeesTable payees = $PayeesTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $FlagsTable flags = $FlagsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [budgets, payees, accounts, categories, flags, transactions];
}
