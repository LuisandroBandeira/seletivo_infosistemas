
unit UnitEnderecoCep;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  /// <summary>
  /// <para>Classe utilizada para controlar os dados retornados da API http://viacep.com.br</para>
  /// </summary>
  /// <remarks>
  /// <para>-------------------------------------------------------</para>
  /// <para>Autor: Luisandro N. Bandeira - Data: 24/12/2020        </para>
  /// <para>-------------------------------------------------------</para>
  /// </remarks>
  TEnderecoCep = class(TJsonDTO)
  private
    FBairro: string;
    FCep: string;
    FComplemento: string;
    FDdd: Boolean;
    FGia: Boolean;
    FIbge: Boolean;
    FLocalidade: string;
    FLogradouro: string;
    FSiafi: Boolean;
    FUf: string;
    FErro: Boolean;
  published
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property Complemento: string read FComplemento write FComplemento;
    property Ddd: Boolean read FDdd write FDdd;
    property Gia: Boolean read FGia write FGia;
    property Ibge: Boolean read FIbge write FIbge;
    property Localidade: string read FLocalidade write FLocalidade;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Siafi: Boolean read FSiafi write FSiafi;
    property Uf: string read FUf write FUf;
    property erro: Boolean read FErro write FErro;
  end;
  
implementation

end.
