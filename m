Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA746DA2
	for <lists+amd-gfx@lfdr.de>; Sat, 15 Jun 2019 03:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAF589613;
	Sat, 15 Jun 2019 01:50:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730073.outbound.protection.outlook.com [40.107.73.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0428189613
 for <amd-gfx@lists.freedesktop.org>; Sat, 15 Jun 2019 01:50:29 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB0043.namprd12.prod.outlook.com (10.174.107.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Sat, 15 Jun 2019 01:50:27 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1987.013; Sat, 15 Jun 2019
 01:50:27 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] Revert "drm/amdkfd: Fix sdma queue allocate race
 condition"
Thread-Topic: [PATCH 1/4] Revert "drm/amdkfd: Fix sdma queue allocate race
 condition"
Thread-Index: AQHVIxmI5JQU7MYMLkqz9R4iPJOgsqab8zOA
Date: Sat, 15 Jun 2019 01:50:27 +0000
Message-ID: <20f869be-70d6-ee80-c967-ecff57b15479@amd.com>
References: <1560562057-19810-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1560562057-19810-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b01a1ce1-e8fe-4e61-3a2d-08d6f133d6b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0043; 
x-ms-traffictypediagnostic: DM5PR1201MB0043:
x-microsoft-antispam-prvs: <DM5PR1201MB0043988EDB2443EB3CCDF758E6E90@DM5PR1201MB0043.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:529;
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(346002)(376002)(39860400002)(51234002)(189003)(199004)(71200400001)(31686004)(2906002)(14444005)(66066001)(26005)(256004)(71190400001)(186003)(386003)(86362001)(66446008)(66946007)(66476007)(53546011)(66556008)(64756008)(73956011)(6506007)(76176011)(99286004)(102836004)(316002)(31696002)(110136005)(6246003)(6436002)(5660300002)(68736007)(14454004)(486006)(53936002)(72206003)(478600001)(52116002)(36756003)(476003)(446003)(2616005)(6512007)(8676002)(7736002)(81156014)(305945005)(11346002)(8936002)(6116002)(25786009)(81166006)(229853002)(4326008)(6486002)(2501003)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0043;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6LXOYPFm5EM3F5hX0owJ098B5dFSozioYXUrxev4v4JrI3CdUs5DOnvgEkn+pnBT1B2PdW4DQDhEdfywGtBM/EymyKVO5OwyR2rDrDI4+j4bNJwWuuN+VsbHwZrmFJxXP2WYzkhi117l0f8pyFgGee8fY5Cx2/ULVb2VtK99ceK8vCmwPbKFPom20Up9hZ7lTE3+bGA3GYrLpTzDPqOPJSX4A0hSfuTUBRVRN421JqtPrpsThAsF606ikQ0k/sS1ZVgmg0sCvJEQrD+iMDRBZ+tETSE09TR4GG2Deljl8vKBzt7MVEESBp1PmDJHm6X9PK3sztQCcf0br68t8tMgx5hmU2kxcdcwLosPkuZQvnRgYUuJnp8Fbqc8UWyP4pglgOrF3hwbbmL+c/vyKJDc7O+FdZJ+YTtybIEr6E6zQwA=
Content-ID: <474176515AA51744923C29D282AACFBC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01a1ce1-e8fe-4e61-3a2d-08d6f133d6b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2019 01:50:27.2286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0043
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuTQwraT3sOrsi5NfNJSUMBbTdCH8959pRP8A6WWGjI=;
 b=FlGGUjK2iyZ/47EH6UuB5f8RBAt6cm1B1O0Mba/a9/g+x0SAeEeUshGmLGKOEOAWXI7YPwYujMOAPsuJ2hk3gDU6zrsebtz7lcjpGmZ7hfqwW2TcXgvTzAFxvG6A0pzOxSTr6zbfTZfqDbUVIKKcDAef70NHd0AiUn9QYN6ot58=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBqdXN0IGZpZ3VyZWQgb3V0IHByZXZpb3VzIHBhdGNoIGhhdmUgaXNzdWUuIE5ldyBwYXRjaCBp
cyBzaW1wbGUgYW5kIA0KbG9va3MgZ29vZCB0byBtZS4NCg0KVGhpcyBzZXJpZXMgaXMgUmV2aWV3
ZWQtYnk6IFBoaWxpcC5ZYW5nIDxwaGlsaXAueWFuZ0BhbWQuY29tPg0KDQpPbiAyMDE5LTA2LTE0
IDk6MjcgcC5tLiwgWmVuZywgT2FrIHdyb3RlOg0KPiBUaGlzIHJldmVydHMgY29tbWl0IDBhN2M3
MjgxYmRhYWU4Y2Y2M2Q3N2JlMjZhNGI0NjEyODExNGJkZWMuDQo+IFRoaXMgZml4IGlzIG5vdCBw
cm9wZXIuIGFsbG9jYXRlX21xZCBjYW4ndCBiZSBtb3ZlZCBiZWZvcmUNCj4gYWxsb2NhdGVfc2Rt
YV9xdWV1ZSBhcyBpdCBkZXBlbmRzIG9uIHEtPnByb3BlcnRpZXMtPnNkbWFfaWQNCj4gc2V0IGlu
IGxhdGVyLg0KPiANCj4gQ2hhbmdlLUlkOiBJZjQ5MzRhZmViZGE4Y2YzN2RmY2RlOWI1MGNlNTM2
NDNkNTI2NTg0ZA0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuYyAgfCAyNiArKysrKysrKysrKystLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gaW5kZXgg
MjUwNzk4Yi4uZDU2NmMyNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gQEAgLTExMzMsMjcgKzExMzMs
MjMgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0sIHN0cnVjdCBxdWV1ZSAqcSwNCj4gICAJaWYgKGRxbS0+dG90YWxfcXVldWVf
Y291bnQgPj0gbWF4X251bV9vZl9xdWV1ZXNfcGVyX2RldmljZSkgew0KPiAgIAkJcHJfd2Fybigi
Q2FuJ3QgY3JlYXRlIG5ldyB1c2VybW9kZSBxdWV1ZSBiZWNhdXNlICVkIHF1ZXVlcyB3ZXJlIGFs
cmVhZHkgY3JlYXRlZFxuIiwNCj4gICAJCQkJZHFtLT50b3RhbF9xdWV1ZV9jb3VudCk7DQo+IC0J
CXJldHVybiAtRVBFUk07DQo+ICsJCXJldHZhbCA9IC1FUEVSTTsNCj4gKwkJZ290byBvdXQ7DQo+
ICAgCX0NCj4gICANCj4gLQltcWRfbWdyID0gZHFtLT5tcWRfbWdyc1tnZXRfbXFkX3R5cGVfZnJv
bV9xdWV1ZV90eXBlKA0KPiAtCQkJcS0+cHJvcGVydGllcy50eXBlKV07DQo+IC0JcS0+bXFkX21l
bV9vYmogPSBtcWRfbWdyLT5hbGxvY2F0ZV9tcWQobXFkX21nci0+ZGV2LCAmcS0+cHJvcGVydGll
cyk7DQo+IC0JaWYgKCFxLT5tcWRfbWVtX29iaikNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+IC0N
Cj4gLQlkcW1fbG9jayhkcW0pOw0KPiAgIAlpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9R
VUVVRV9UWVBFX1NETUEgfHwNCj4gICAJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVf
VFlQRV9TRE1BX1hHTUkpIHsNCj4gICAJCXJldHZhbCA9IGFsbG9jYXRlX3NkbWFfcXVldWUoZHFt
LCBxKTsNCj4gICAJCWlmIChyZXR2YWwpDQo+IC0JCQlnb3RvIG91dF91bmxvY2s7DQo+ICsJCQln
b3RvIG91dDsNCj4gICAJfQ0KPiAgIA0KPiAgIAlyZXR2YWwgPSBhbGxvY2F0ZV9kb29yYmVsbChx
cGQsIHEpOw0KPiAgIAlpZiAocmV0dmFsKQ0KPiAgIAkJZ290byBvdXRfZGVhbGxvY2F0ZV9zZG1h
X3F1ZXVlOw0KPiAgIA0KPiArCW1xZF9tZ3IgPSBkcW0tPm1xZF9tZ3JzW2dldF9tcWRfdHlwZV9m
cm9tX3F1ZXVlX3R5cGUoDQo+ICsJCQlxLT5wcm9wZXJ0aWVzLnR5cGUpXTsNCj4gICAJLyoNCj4g
ICAJICogRXZpY3Rpb24gc3RhdGUgbG9naWM6IG1hcmsgYWxsIHF1ZXVlcyBhcyBldmljdGVkLCBl
dmVuIG9uZXMNCj4gICAJICogbm90IGN1cnJlbnRseSBhY3RpdmUuIFJlc3RvcmluZyBpbmFjdGl2
ZSBxdWV1ZXMgbGF0ZXIgb25seQ0KPiBAQCAtMTE2NSw4ICsxMTYxLDE0IEBAIHN0YXRpYyBpbnQg
Y3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1
Y3QgcXVldWUgKnEsDQo+ICAgCQlkcW0tPmFzaWNfb3BzLmluaXRfc2RtYV92bShkcW0sIHEsIHFw
ZCk7DQo+ICAgCXEtPnByb3BlcnRpZXMudGJhX2FkZHIgPSBxcGQtPnRiYV9hZGRyOw0KPiAgIAlx
LT5wcm9wZXJ0aWVzLnRtYV9hZGRyID0gcXBkLT50bWFfYWRkcjsNCj4gKwlxLT5tcWRfbWVtX29i
aiA9IG1xZF9tZ3ItPmFsbG9jYXRlX21xZChtcWRfbWdyLT5kZXYsICZxLT5wcm9wZXJ0aWVzKTsN
Cj4gKwlpZiAoIXEtPm1xZF9tZW1fb2JqKSB7DQo+ICsJCXJldHZhbCA9IC1FTk9NRU07DQo+ICsJ
CWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw7DQo+ICsJfQ0KPiAgIAltcWRfbWdyLT5pbml0
X21xZChtcWRfbWdyLCAmcS0+bXFkLCBxLT5tcWRfbWVtX29iaiwNCj4gICAJCQkJJnEtPmdhcnRf
bXFkX2FkZHIsICZxLT5wcm9wZXJ0aWVzKTsNCj4gKwlkcW1fbG9jayhkcW0pOw0KPiAgIA0KPiAg
IAlsaXN0X2FkZCgmcS0+bGlzdCwgJnFwZC0+cXVldWVzX2xpc3QpOw0KPiAgIAlxcGQtPnF1ZXVl
X2NvdW50Kys7DQo+IEBAIC0xMTkyLDEzICsxMTk0LDEzIEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1
ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUg
KnEsDQo+ICAgCWRxbV91bmxvY2soZHFtKTsNCj4gICAJcmV0dXJuIHJldHZhbDsNCj4gICANCj4g
K291dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOg0KPiArCWRlYWxsb2NhdGVfZG9vcmJlbGwocXBkLCBx
KTsNCj4gICBvdXRfZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlOg0KPiAgIAlpZiAocS0+cHJvcGVydGll
cy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEgfHwNCj4gICAJCXEtPnByb3BlcnRpZXMudHlw
ZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BX1hHTUkpDQo+ICAgCQlkZWFsbG9jYXRlX3NkbWFfcXVl
dWUoZHFtLCBxKTsNCj4gLW91dF91bmxvY2s6DQo+IC0JZHFtX3VubG9jayhkcW0pOw0KPiAtCW1x
ZF9tZ3ItPmZyZWVfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgcS0+bXFkX21lbV9vYmopOw0KPiArb3V0
Og0KPiAgIAlyZXR1cm4gcmV0dmFsOw0KPiAgIH0NCj4gICANCj4gDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
