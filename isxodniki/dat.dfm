object DM: TDM
  OldCreateOrder = False
  Left = 261
  Top = 164
  Height = 375
  Width = 544
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 35
    Top = 10
  end
  object Query1: TQuery
    DatabaseName = 'banks_ulya'
    SessionName = 'Session1_1'
    RequestLive = True
    Left = 40
    Top = 100
  end
  object Query2: TQuery
    DatabaseName = 'banks_ulya'
    SessionName = 'Session1_1'
    RequestLive = True
    Left = 110
    Top = 100
  end
  object Query3: TQuery
    DatabaseName = 'banks_ulya'
    SessionName = 'Session1_1'
    RequestLive = True
    Left = 175
    Top = 100
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 40
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 110
    Top = 145
  end
  object DataSource3: TDataSource
    DataSet = Query3
    Left = 175
    Top = 145
  end
  object Q_test: TQuery
    DatabaseName = 'banks_ulya'
    SessionName = 'Session1_1'
    RequestLive = True
    Left = 35
    Top = 220
  end
  object DataSource4: TDataSource
    DataSet = Q_test
    Left = 100
    Top = 220
  end
end
