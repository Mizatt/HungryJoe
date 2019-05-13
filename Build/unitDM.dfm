object DM: TDM
  OldCreateOrder = False
  Height = 461
  Width = 683
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=HAMMERTIME'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=HAMMERTIME'
      'MARS=yes'
      'DATABASE=HungryJoe'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Transaction = FDTrans
    Left = 128
    Top = 48
  end
  object FDTrans: TFDTransaction
    Connection = FDConnection1
    Left = 224
    Top = 48
  end
  object FDEstoque: TFDTable
    IndexFieldNames = 'ID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'HungryJoe.dbo.Produto'
    TableName = 'HungryJoe.dbo.Produto'
    Left = 224
    Top = 120
    object FDEstoqueID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDEstoqueSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object FDEstoquePRO_ID_CATEGORIA: TIntegerField
      FieldName = 'PRO_ID_CATEGORIA'
      Origin = 'PRO_ID_CATEGORIA'
    end
    object FDEstoquePRO_ID_FORNECEDOR: TIntegerField
      FieldName = 'PRO_ID_FORNECEDOR'
      Origin = 'PRO_ID_FORNECEDOR'
    end
    object FDEstoquePRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Origin = 'PRO_DESCRICAO'
      Size = 50
    end
    object FDEstoquePRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Origin = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object FDEstoquePRO_EST_MINIMO: TIntegerField
      FieldName = 'PRO_EST_MINIMO'
      Origin = 'PRO_EST_MINIMO'
    end
    object FDEstoquePRO_ESTOQUE: TIntegerField
      FieldName = 'PRO_ESTOQUE'
      Origin = 'PRO_ESTOQUE'
    end
    object FDEstoqueDATA_INC: TSQLTimeStampField
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
  end
end
