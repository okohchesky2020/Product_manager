import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'products.g.dart';

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'products', // optional
    databaseName: 'product_manager',
    databaseTables: [products],
    sequences: [seqIdentity],
    bundledDatabasePath: null);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

const products = SqfEntityTable(
    tableName: 'products',
    primaryKeyName: 'id',
    useSoftDeleting: false,
    primaryKeyType: PrimaryKeyType.integer_unique,
    fields: [
      SqfEntityField('quantity', DbType.integer),
      SqfEntityField('sellingPrice', DbType.integer),
      SqfEntityField('costPrice', DbType.integer),
      SqfEntityField('productImage', DbType.text),
      SqfEntityField('name', DbType.text),
    ]);
