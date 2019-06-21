Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088BC4EF9D
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 21:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904966E919;
	Fri, 21 Jun 2019 19:49:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770071.outbound.protection.outlook.com [40.107.77.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27A96E919
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 19:49:48 +0000 (UTC)
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3783.namprd12.prod.outlook.com (52.132.245.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 21 Jun 2019 19:49:45 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c%4]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 19:49:45 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: add sw_init to df_v1_7
Thread-Topic: [PATCH] drm/amdgpu: add sw_init to df_v1_7
Thread-Index: AQHVKEu39Ld6/heFiUaD7DkyevEDeqamg+bw
Date: Fri, 21 Jun 2019 19:49:45 +0000
Message-ID: <CH2PR12MB3831B4936856AD4B957FDE0585E70@CH2PR12MB3831.namprd12.prod.outlook.com>
References: <20190621153054.88153-1-jonathan.kim@amd.com>
 <8d2e2498-573d-d23a-62e3-3881c9b1c24e@amd.com>
In-Reply-To: <8d2e2498-573d-d23a-62e3-3881c9b1c24e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bf55807-b9c3-4097-16fb-08d6f6819cb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3783; 
x-ms-traffictypediagnostic: CH2PR12MB3783:
x-microsoft-antispam-prvs: <CH2PR12MB378348769B7FA1678AD60B5585E70@CH2PR12MB3783.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(366004)(376002)(346002)(13464003)(189003)(199004)(110136005)(25786009)(76176011)(7696005)(6506007)(8936002)(26005)(53546011)(102836004)(186003)(11346002)(476003)(486006)(53936002)(33656002)(71200400001)(446003)(71190400001)(7736002)(305945005)(478600001)(72206003)(2501003)(74316002)(52536014)(256004)(68736007)(229853002)(6246003)(9686003)(86362001)(316002)(6436002)(55016002)(66476007)(66946007)(66556008)(66446008)(64756008)(73956011)(14454004)(76116006)(3846002)(99286004)(6116002)(5660300002)(81166006)(81156014)(8676002)(66066001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3783;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:3; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hyZNrwsCN1wg0RtaTG/sfdQl0Lk5oeakc6MdxBwUtN2XtUJcPMVuwIkrx+zbYZMfPd3yrhRY3+vw0fuurm1c7ctsBKcjICrqDOnBk4nt8bExEbRFKkWZDsdVtOdPAE26xaREYO4UheDMqGnB7+lImNvnUKtY5VtWOHf/G9ZwJJGGGyBWq6/srEasXRy80ISLoowhNol1itl+mIJzukhCb60EUZlEH6DkKcxQEV6G4u/ANRmHj6Ss/1VYeD7VXwK+Sk6P3FPaTHJ70tIPRheYFcVboPL+HLAyh5jnAAzfVnUf5ES1wV6YgkoyvQ7++qCUjJwQqoYlRAHJj5Fzbk/ZqjnMXUIyoCFl9RglNf8mIBs/bTl5gvvDZGQzuj4Ijnx++/CVd1w9iQXD27r9RTf13n27aiYnOx6IRs1SsYNtqIw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf55807-b9c3-4097-16fb-08d6f6819cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 19:49:45.8076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3783
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMn2ijlhCfQz4nW038YIKD+mt5WWHHFsELbbADJeEno=;
 b=SQcYnzYFsYENfmiCwmfvdrp+KxS9+/zB5FX3BjMmxGzVNyeZGdsW43HYF8JajqwXqixubmMWWbOnyBR1GPcwOHuNhDPWw8Bgr8CVeKNYqu4iNX2pLQ6iXUlFKyMa3/eBc1uFNwfHDqUyXvMAI1GBhrqZHc1I5qlZuQGrSet2cks=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzLCBzb3JyeSBhYm91dCB0aGlzLiAgSSdsbCBiZSBtb3JlIHRob3JvdWdoIG5leHQgdGlt
ZS4gIFBhdGNoIHZlcmlmaWVkIHdpdGggdmVnYTIwIGFuZCB2ZWdhMTAgc3lzdGVtcy4NCg0KSm9u
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+IA0KU2VudDogRnJpZGF5LCBKdW5lIDIxLCAyMDE5IDEyOjEw
IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtpbSwgSm9uYXRoYW4gPEpv
bmF0aGFuLktpbUBhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogYWRk
IHN3X2luaXQgdG8gZGZfdjFfNw0KDQpPbiAyMDE5LTA2LTIxIDExOjMxIGEubS4sIEtpbSwgSm9u
YXRoYW4gd3JvdGU6DQo+IGNoYW5nZSBkZl9pbml0IHRvIGRmX3N3X2luaXQgZGYgMS43IHRvIHBy
ZXZlbnQgcmVncmVzc2lvbiBpc3N1ZXMgb24gDQo+IHByZS12ZWdhMjAgcHJvZHVjdHMgd2hlbiBj
YWxsYmFjayBpcyBjYWxsZWQgaW4gc3dfY29tbW9uX3N3X2luaXQuDQo+DQo+IENoYW5nZS1JZDog
STQ5NDEwMDNlYTRhOTliYTBlYTczNmM3ZWNjODgwMDE0ODQyM2MzNzkNCj4gU2lnbmVkLW9mZi1i
eTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEZl
bGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQpTbyB5b3VyIHByZXZpb3Vz
IHBhdGNoIGJyb2tlIHRoZSBidWlsZC4gUGxlYXNlIGF0IGxlYXN0IGJ1aWxkIHRlc3QgeW91ciBj
b2RlIGJlZm9yZSB5b3UgcHVzaC4gQnJlYWtpbmcgdGhlIGJ1aWxkIGlzIG5vdCBhY2NlcHRhYmxl
LiBJdCBzbG93cyBkb3duIGV2ZXJ5Ym9keSBlbHNlLiBJJ2xsIHRha2UgYSBsb29rIGlmIGFueXRo
aW5nIGVsc2UgY2FuIGJlIGNsZWFuZWQgdXAgd2l0aCB0aGVzZSBjYWxsYmFja3MgbGF0ZXIuDQoN
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMgfCA0ICsr
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jIA0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YxXzcuYw0KPiBpbmRleCA5OTM1Mzcx
ZGI3Y2UuLjg0NGMwMzg2ODI0OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZGZfdjFfNy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3Yx
XzcuYw0KPiBAQCAtMjksNyArMjksNyBAQA0KPiAgIA0KPiAgIHN0YXRpYyB1MzIgZGZfdjFfN19j
aGFubmVsX251bWJlcltdID0gezEsIDIsIDAsIDQsIDAsIDgsIDAsIDE2LCAyfTsNCj4gICANCj4g
LXN0YXRpYyB2b2lkIGRmX3YxXzdfaW5pdCAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+
ICtzdGF0aWMgdm9pZCBkZl92MV83X3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQo+ICAgew0KPiAgIH0NCj4gICANCj4gQEAgLTExMCw3ICsxMTAsNyBAQCBzdGF0aWMgdm9pZCBk
Zl92MV83X2VuYWJsZV9lY2NfZm9yY2VfcGFyX3dyX3JtdyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwNCj4gICB9DQo+ICAgDQo+ICAgY29uc3Qgc3RydWN0IGFtZGdwdV9kZl9mdW5jcyBkZl92
MV83X2Z1bmNzID0gew0KPiAtCS5pbml0ID0gZGZfdjFfN19pbml0LA0KPiArCS5zd19pbml0ID0g
ZGZfdjFfN19zd19pbml0LA0KPiAgIAkuZW5hYmxlX2Jyb2FkY2FzdF9tb2RlID0gZGZfdjFfN19l
bmFibGVfYnJvYWRjYXN0X21vZGUsDQo+ICAgCS5nZXRfZmJfY2hhbm5lbF9udW1iZXIgPSBkZl92
MV83X2dldF9mYl9jaGFubmVsX251bWJlciwNCj4gICAJLmdldF9oYm1fY2hhbm5lbF9udW1iZXIg
PSBkZl92MV83X2dldF9oYm1fY2hhbm5lbF9udW1iZXIsDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
