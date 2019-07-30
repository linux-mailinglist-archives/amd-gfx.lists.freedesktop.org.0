Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6AD7AAC0
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 16:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEC26E55F;
	Tue, 30 Jul 2019 14:18:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B299B6E55F
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 14:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVtEuTcfQ2rWnM+qbYE0En+0lfMVn3d4l64YDb1I/sXl3rVHXUsj+cz70+56yhNQSB29PfO1eHnqb1+xBsCmQzkPtwLC3qZlUnKqDL99WtCPLRhxQLNiBoEyxI56CV1/2Y/wEQmZPUToVcCKTWP7zNulgFXQA6HCEzulcPdsiRrZzQJUyXAubS3nArFi4IquWninKCDtO9VTQZdlACEKYlAQlFHJ3k76hjhbYG5of4rrmHYbXLDgch16CBJMamfOLfSJchRW2iIAWVt+ubPGiu1iPQGRbV9yD0xG0cUHYV/4c2oZ2JTkHt+uV3jtOxLY9K3krw9kC1l/Txg5swzfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz8BwrZ6oatTj3iWPzqmxJV2lrxtktC5pd+Q9VsrebA=;
 b=kLpKUvJIVQkovAPz5iN/n2By3ekDt44JsWN5u3gwamfGdo0Bvg907DuLucA9jObHZ3T6i5IQjFjpAA5icQaO2O7vO1GgE0c7kgslygnHMTS3WldUKUvpAezW7KOtAxD4SGwbXKuIw9+BGfmOTQfK8Qy0Z9A4cEWjatphaegRAasQ4+UBNSYqzAbt0esipIQnQdtJO5yvCF2eA3GXR2b6dkb88eGNYjM6pVc9qgCqcUH7VVNMlRTQi2SQ21WhCRyRGXjeD0PQ17iDs1wchDkyKqs0y+hqa6ZwDkwekukFa5CdO+Y6XWawVUr4KedsuWdAbkSY78RU7OhIya6W/douVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0055.namprd12.prod.outlook.com (10.172.77.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 14:18:48 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2136.010; Tue, 30 Jul 2019
 14:18:48 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/display: Support uclk switching for DCN2
Thread-Topic: [PATCH 2/2] drm/amd/display: Support uclk switching for DCN2
Thread-Index: AQHVRt7L2dAuOZ4tFkSEGxRXUXKKQqbjNUQA
Date: Tue, 30 Jul 2019 14:18:48 +0000
Message-ID: <10498bcb-2a67-b602-80ed-950aba237f61@amd.com>
References: <20190730135733.14563-1-nicholas.kazlauskas@amd.com>
 <20190730135733.14563-2-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190730135733.14563-2-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::38) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69a2d1f2-4b8a-47ae-7fcb-08d714f8d6dd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0055; 
x-ms-traffictypediagnostic: CY4PR1201MB0055:
x-microsoft-antispam-prvs: <CY4PR1201MB005567D537B95E396C6EBA188CDC0@CY4PR1201MB0055.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(199004)(189003)(53936002)(6246003)(2501003)(31696002)(36756003)(8936002)(110136005)(6436002)(8676002)(6116002)(14454004)(26005)(4326008)(54906003)(81166006)(186003)(52116002)(6486002)(3846002)(102836004)(25786009)(58126008)(229853002)(81156014)(7736002)(6512007)(446003)(14444005)(305945005)(386003)(66066001)(478600001)(99286004)(316002)(65956001)(2906002)(65826007)(64126003)(64756008)(66946007)(66446008)(66556008)(65806001)(76176011)(476003)(486006)(66476007)(5660300002)(53546011)(31686004)(2616005)(11346002)(256004)(71190400001)(71200400001)(6506007)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0055;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WPh6auxdOT3ubUv7Ys9tOGJqKlhijWufsuObq0jPK0CREs3cY4ALqsrtAuivtFQNGVZXlB3uo8WMrc0l41ii2VH7XOiwKB2KR5leOQcHH9Os+icMvg/A854VygXK1CCxi+Lc9jFR8I0Ah2RusT/dbD/zdsCtNmSwaVeWjC/4ThqAf4o02Ohx9L9X14R3dEbZNxj+hT9fTbDfzqkT0T+W1dydFwYOBkclD3qPlBKi5jKHvf9eaOG1A11jEmeOCUYBUxP1pEotKx5do4MayrvZWMIr5Zs/lklQo43xFKo2OrxET4QnlnXzmlMTXNOxfL6Ul8E75xnrDfyndnFe3WuqKU4imfarY4OSWtkGXj0D9+rka5QbZodnkihtxuGgZq8woMqmdBi6l20IDF8J1dJOO/RqW9+Z1o2vJYnLHQEZtZs=
Content-ID: <F12356CEFA07EF43A9E643F49DE78C95@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a2d1f2-4b8a-47ae-7fcb-08d714f8d6dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 14:18:48.7668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz8BwrZ6oatTj3iWPzqmxJV2lrxtktC5pd+Q9VsrebA=;
 b=FZW+T/1H5MgIxA0ycDe0aQARlqERXGXbUhZ7qxVj/eJU4bVmpExJbuCO/87+DraUiShAl2ZIAw8aiZxRDZdVKPfdbRfNvY4jlNkb5tzQVM9X5/OfNI1VvH+/8/XcmNWI8jSSk3xH4I1l6sizkAcm2cfh3IDArvyZsu+OaxkXTOY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0zMCA5OjU3IGEubS4sIE5pY2hvbGFzIEthemxhdXNrYXMgd3JvdGU6DQo+IFtX
aHldDQo+IFdlIHdlcmUgcHJldmlvdXNseSBmb3JjaW5nIHRoZSB1Y2xrIGZvciBldmVyeSBzdGF0
ZSB0byBtYXggYW5kIHJlZHVjaW5nDQo+IHRoZSBzd2l0Y2ggdGltZSB0byBwcmV2ZW50IHVjbGsg
c3dpdGNoaW5nIGZyb20gb2NjdXJpbmcuIFRoaXMgd29ya2Fyb3VuZA0KPiB3YXMgcHJldmlvdXNs
eSBuZWVkZWQgaW4gb3JkZXIgdG8gYXZvaWQgaGFuZ3MgKyB1bmRlcmZsb3cgdW5kZXIgY2VydGFp
bg0KPiBkaXNwbGF5IGNvbmZpZ3VyYXRpb25zLg0KPiANCj4gTm93IHRoYXQgREMgaGFzIHRoZSBw
cm9wZXIgZml4IGNvbXBsZXRlIHdlIGNhbiBkcm9wIHRoZSBoYWNrcyBhbmQNCj4gaW1wcm92ZSBw
b3dlciBmb3IgbW9zdCBkaXNwbGF5IGNvbmZpZ3VyYXRpb25zLg0KPiANCj4gW0hvd10NCj4gV2Ug
c3RpbGwgbmVlZCB0aGUgZnVuY3Rpb24gcG9pbnRlcnMgaG9va2VkIHVwIHRvIGdyYWIgdGhlIHJl
YWwgdWNsaw0KPiBzdGF0ZXMgZnJvbSBwcGxpYi4gVGhlIHJlc3Qgb2YgdGhlIHByaW9yIGhhY2sg
Y2FuIGJlIHJldmVydGVkLg0KPiANCj4gVGhlIGtleSByZXF1aXJlbWVudHMgaGVyZSBhcmUgcmVh
bGx5IGp1c3QgREMgc3VwcG9ydCwgdXBkYXRlZCBmaXJtd2FyZSwNCj4gYW5kIHN1cHBvcnQgZm9y
IGRpc2FibGluZyBwLXN0YXRlIHN1cHBvcnQgd2hlbiBuZWVkZWQgaW4gcHBsaWIvc211Lg0KPiAN
Cj4gV2hlbiB0aGVzZSByZXF1aXJlbWVudHMgYXJlIG1ldCB1Y2xrIHN3aXRjaGluZyB3b3JrcyB3
aXRob3V0IHVuZGVyZmxvdw0KPiBvciBoYW5ncy4NCj4gDQo+IEZpeGVzOiAwMjMxNmU5NjNhNWEg
KCJkcm0vYW1kL2Rpc3BsYXk6IEZvcmNlIHVjbGsgdG8gbWF4IGZvciBldmVyeSBzdGF0ZSIpDQo+
IA0KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+IENjOiBIYXJyeSBXZW50bGFu
ZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6
bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KDQpTZXJpZXMgaXMNClJldmll
d2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkN
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jIHwgMTAgLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMNCj4gaW5kZXggZmYzMGY1Y2M0OTgxLi40MmQzNjY2ZjIwMzcg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jDQo+IEBAIC0yODE3LDkgKzI4MTcsNiBAQCBzdGF0aWMgdm9pZCBj
YXBfc29jX2Nsb2NrcygNCj4gIAkJCQkJCSYmIG1heF9jbG9ja3MudUNsb2NrSW5LaHogIT0gMCkN
Cj4gIAkJCWJiLT5jbG9ja19saW1pdHNbaV0uZHJhbV9zcGVlZF9tdHMgPSAobWF4X2Nsb2Nrcy51
Q2xvY2tJbktoeiAvIDEwMDApICogMTY7DQo+ICANCj4gLQkJLy8gSEFDSzogRm9yY2UgZXZlcnkg
dWNsayB0byBtYXggZm9yIG5vdyB0byAiZGlzYWJsZSIgdWNsayBzd2l0Y2hpbmcuDQo+IC0JCWJi
LT5jbG9ja19saW1pdHNbaV0uZHJhbV9zcGVlZF9tdHMgPSAobWF4X2Nsb2Nrcy51Q2xvY2tJbkto
eiAvIDEwMDApICogMTY7DQo+IC0NCj4gIAkJaWYgKChiYi0+Y2xvY2tfbGltaXRzW2ldLmZhYnJp
Y2Nsa19taHogPiAobWF4X2Nsb2Nrcy5mYWJyaWNDbG9ja0luS2h6IC8gMTAwMCkpDQo+ICAJCQkJ
CQkmJiBtYXhfY2xvY2tzLmZhYnJpY0Nsb2NrSW5LaHogIT0gMCkNCj4gIAkJCWJiLT5jbG9ja19s
aW1pdHNbaV0uZmFicmljY2xrX21oeiA9IChtYXhfY2xvY2tzLmZhYnJpY0Nsb2NrSW5LaHogLyAx
MDAwKTsNCj4gQEAgLTMwMzUsOCArMzAzMiw2IEBAIHN0YXRpYyBib29sIGluaXRfc29jX2JvdW5k
aW5nX2JveChzdHJ1Y3QgZGMgKmRjLA0KPiAgCQkJCWxlMzJfdG9fY3B1KGJiLT52bW1fcGFnZV9z
aXplX2J5dGVzKTsNCj4gIAkJZGNuMl8wX3NvYy5kcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5X3Vz
ID0NCj4gIAkJCQlmaXhlZDE2X3RvX2RvdWJsZV90b19jcHUoYmItPmRyYW1fY2xvY2tfY2hhbmdl
X2xhdGVuY3lfdXMpOw0KPiAtCQkvLyBIQUNLISEgTG93ZXIgdWNsb2NrIGxhdGVuY3kgc3dpdGNo
IHRpbWUgc28gd2UgZG9uJ3Qgc3dpdGNoDQo+IC0JCWRjbjJfMF9zb2MuZHJhbV9jbG9ja19jaGFu
Z2VfbGF0ZW5jeV91cyA9IDEwOw0KPiAgCQlkY24yXzBfc29jLndyaXRlYmFja19kcmFtX2Nsb2Nr
X2NoYW5nZV9sYXRlbmN5X3VzID0NCj4gIAkJCQlmaXhlZDE2X3RvX2RvdWJsZV90b19jcHUoYmIt
PndyaXRlYmFja19kcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5X3VzKTsNCj4gIAkJZGNuMl8wX3Nv
Yy5yZXR1cm5fYnVzX3dpZHRoX2J5dGVzID0NCj4gQEAgLTMwNzgsNyArMzA3Myw2IEBAIHN0YXRp
YyBib29sIGluaXRfc29jX2JvdW5kaW5nX2JveChzdHJ1Y3QgZGMgKmRjLA0KPiAgCQlzdHJ1Y3Qg
cHBfc211X252X2Nsb2NrX3RhYmxlIG1heF9jbG9ja3MgPSB7MH07DQo+ICAJCXVuc2lnbmVkIGlu
dCB1Y2xrX3N0YXRlc1s4XSA9IHswfTsNCj4gIAkJdW5zaWduZWQgaW50IG51bV9zdGF0ZXMgPSAw
Ow0KPiAtCQlpbnQgaTsNCj4gIAkJZW51bSBwcF9zbXVfc3RhdHVzIHN0YXR1czsNCj4gIAkJYm9v
bCBjbG9ja19saW1pdHNfYXZhaWxhYmxlID0gZmFsc2U7DQo+ICAJCWJvb2wgdWNsa19zdGF0ZXNf
YXZhaWxhYmxlID0gZmFsc2U7DQo+IEBAIC0zMTAwLDEwICszMDk0LDYgQEAgc3RhdGljIGJvb2wg
aW5pdF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsDQo+ICAJCQljbG9ja19saW1pdHNf
YXZhaWxhYmxlID0gKHN0YXR1cyA9PSBQUF9TTVVfUkVTVUxUX09LKTsNCj4gIAkJfQ0KPiAgDQo+
IC0JCS8vIEhBQ0s6IFVzZSB0aGUgbWF4IHVjbGtfc3RhdGVzIHZhbHVlIGZvciBhbGwgZWxlbWVu
dHMuDQo+IC0JCWZvciAoaSA9IDA7IGkgPCBudW1fc3RhdGVzOyBpKyspDQo+IC0JCQl1Y2xrX3N0
YXRlc1tpXSA9IHVjbGtfc3RhdGVzW251bV9zdGF0ZXMgLSAxXTsNCj4gLQ0KPiAgCQlpZiAoY2xv
Y2tfbGltaXRzX2F2YWlsYWJsZSAmJiB1Y2xrX3N0YXRlc19hdmFpbGFibGUgJiYgbnVtX3N0YXRl
cykNCj4gIAkJCXVwZGF0ZV9ib3VuZGluZ19ib3goZGMsICZkY24yXzBfc29jLCAmbWF4X2Nsb2Nr
cywgdWNsa19zdGF0ZXMsIG51bV9zdGF0ZXMpOw0KPiAgCQllbHNlIGlmIChjbG9ja19saW1pdHNf
YXZhaWxhYmxlKQ0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
