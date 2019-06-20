Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7874D204
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 17:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6E96E59C;
	Thu, 20 Jun 2019 15:22:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FE16E59C
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 15:22:28 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3802.namprd12.prod.outlook.com (10.255.173.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 15:22:26 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 15:22:26 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: early merge post fix to df_v3_6 for xgmi
Thread-Topic: [PATCH] drm/amdgpu: early merge post fix to df_v3_6 for xgmi
Thread-Index: AQHVJ3uTGJ1SMJyIrEeGRdaJ1XpLY6akqPQA
Date: Thu, 20 Jun 2019 15:22:26 +0000
Message-ID: <88d3a299-044d-889c-885d-7e8b5b3c3a70@amd.com>
References: <20190620151924.86234-1-jonathan.kim@amd.com>
In-Reply-To: <20190620151924.86234-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: YT1PR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::34)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 426f707d-dd19-4af7-eda8-08d6f59319fc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3802; 
x-ms-traffictypediagnostic: DM6PR12MB3802:
x-microsoft-antispam-prvs: <DM6PR12MB3802315C5E545D5B32B157F992E40@DM6PR12MB3802.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(366004)(39860400002)(346002)(189003)(199004)(71200400001)(476003)(5660300002)(64756008)(76176011)(3846002)(6246003)(81166006)(65826007)(52116002)(14454004)(81156014)(6116002)(71190400001)(64126003)(72206003)(8676002)(256004)(86362001)(73956011)(66066001)(68736007)(66556008)(486006)(25786009)(8936002)(66946007)(53546011)(6436002)(229853002)(31686004)(65806001)(99286004)(386003)(65956001)(66476007)(66446008)(36756003)(446003)(31696002)(26005)(6506007)(11346002)(305945005)(110136005)(478600001)(2501003)(316002)(102836004)(7736002)(53936002)(6486002)(186003)(58126008)(2906002)(2616005)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3802;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: imhkDfs3hhkFIAQfaIofxcF08HwvUCbDj4VM3Y6GwYKwdCv4AlfkjUuBnrmbz1ek3o/wUgcyVO0dXB07rgUUbR+/GHXLPxMmkQ7Cb3GR1t4TsqvH9uN/+zXsUlceR8YMhoq0C9Ambi0MEEky0WMDmha78BdCToIo4MRy8K3dW/tFPh53+9icNUYpnvMC9cuyE8k/l8PQ7NwEX+MFwosq+v1o87u8xYRNQ5+aEZf6dQHOroays+9/WVHU9KU6H7l3YR8rYMy5q2F0145wlbVyqFb3XjfewHqtIYVe6eRzzrF736FnpLXkgXTq6yDbNaGIIks5vTiNwDxiQQyDNMQsz+T8w9zsYgMpSX7nw4vacDzX8gOj1rTUp60kUp//g6DfH/hncwOLkoGVFpNduGBdF7VwesqeRkPUaILta29/z4w=
Content-ID: <03832DDF589A3D42B99DDA8262B59A27@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426f707d-dd19-4af7-eda8-08d6f59319fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 15:22:26.7735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3802
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRC86/sCVTqp3fgRL5bL7LtmiiTw09P6y/UJn+/TNBI=;
 b=VtHzJ8MrqRJ3Q+ZVQ84CmdJsNiH1xYSX1F99fRZMCDh4w5JXyGw5lyr67j6BxFH+OgFT4V1jmjF0t4NfIGz3Y+Qz65tgAouqjNxKISE/PiSt6p64jf3+cMVPGsvbC8kcPYiCjBZk1+8wqks79cLyvOyNUWncBqgiSGK5GJUJv28=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wNi0yMCAxMToxOSwgS2ltLCBKb25hdGhhbiB3cm90ZToNCj4gZml4ZWQgZGYgcGVy
bW9uIHRvIDQNCj4gcmVtb3ZlZCB1bnJlcXVpcmVkIHJldCBpbiBzb2MxNQ0KPiByZW5hbWVkIGRm
IGluaXQgdG8gZGYgc3cgaW5pdCBhbmQgbW92ZWQgY2FsbGJhY2sgZnJvbSBzb2MxNSBodyBpbml0
IHRvDQo+IHNvYzE1IHN3IGluaXQNCj4NCj4gQ2hhbmdlLUlkOiBJYTk4OTc2MTI5MzdlNjUyZTdm
OGEwOWMxZDIzYmIxYzBlNmYzZDhmNw0KPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPEpv
bmF0aGFuLktpbUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCAgfCAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNf
Ni5jIHwgNCArKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgIHwg
NSArKy0tLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiBpbmRleCBiMjI3Yzk1
NmI4YTkuLmMzZWQwOWNkMjY3OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmgNCj4gQEAgLTczMiw3ICs3MzIsNyBAQCBzdHJ1Y3QgYW1kX3Bvd2VycGxheSB7DQo+ICAgfTsN
Cj4gICANCj4gICAjZGVmaW5lIEFNREdQVV9SRVNFVF9NQUdJQ19OVU0gNjQNCj4gLSNkZWZpbmUg
QU1ER1BVX01BWF9ERl9QRVJGTU9OUyAxNg0KPiArI2RlZmluZSBBTURHUFVfTUFYX0RGX1BFUkZN
T05TIDQNCj4gICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7DQo+ICAgCXN0cnVjdCBkZXZpY2UJCQkq
ZGV2Ow0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZQkJKmRkZXY7DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9kZl92M182LmMNCj4gaW5kZXggMTJlM2U2NzAxM2Q5Li5jNjUxNGM2MDlhZTYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCj4gQEAgLTExOCw3ICsxMTgsNyBA
QCBzdGF0aWMgc3NpemVfdCBkZl92M182X2dldF9kZl9jbnRyX2F2YWlsKHN0cnVjdCBkZXZpY2Ug
KmRldiwNCj4gICBzdGF0aWMgREVWSUNFX0FUVFIoZGZfY250cl9hdmFpbCwgU19JUlVHTywgZGZf
djNfNl9nZXRfZGZfY250cl9hdmFpbCwgTlVMTCk7DQo+ICAgDQo+ICAgLyogaW5pdCBwZXJmbW9u
cyAqLw0KPiAtc3RhdGljIHZvaWQgZGZfdjNfNl9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPiArc3RhdGljIHZvaWQgZGZfdjNfNl9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KPiAgIHsNCj4gICAJaW50IGksIHJldDsNCj4gICANCj4gQEAgLTQ5MCw3ICs0OTAs
NyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BtY19nZXRfY291bnQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQo+ICAgfQ0KPiAgIA0KPiAgIGNvbnN0IHN0cnVjdCBhbWRncHVfZGZfZnVuY3Mg
ZGZfdjNfNl9mdW5jcyA9IHsNCj4gLQkuaW5pdCA9IGRmX3YzXzZfaW5pdCwNCj4gKwkuaW5pdCA9
IGRmX3YzXzZfc3dfaW5pdCwNCg0KQWxzbyByZW5hbWUgdGhlIC5pbml0IGZpZWxkIGluIHN0cnVj
dCBhbWRncHVfZGZfZnVuY3MgdG8gLnN3X2luaXQuDQoNCldpdGggdGhhdCBmaXhlZCB0aGUgcGF0
Y2ggaXMgUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIA0KPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+DQoNCg0KPiAgIAkuZW5hYmxlX2Jyb2FkY2FzdF9tb2RlID0gZGZfdjNfNl9lbmFibGVfYnJv
YWRjYXN0X21vZGUsDQo+ICAgCS5nZXRfZmJfY2hhbm5lbF9udW1iZXIgPSBkZl92M182X2dldF9m
Yl9jaGFubmVsX251bWJlciwNCj4gICAJLmdldF9oYm1fY2hhbm5lbF9udW1iZXIgPSBkZl92M182
X2dldF9oYm1fY2hhbm5lbF9udW1iZXIsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0K
PiBpbmRleCAwYWZiY2M4MGVhNjEuLmQxZTdmNjIzZWVhOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jDQo+IEBAIC0xMDM0LDYgKzEwMzQsOCBAQCBzdGF0aWMgaW50IHNvYzE1
X2NvbW1vbl9zd19pbml0KHZvaWQgKmhhbmRsZSkNCj4gICAJaWYgKGFtZGdwdV9zcmlvdl92Zihh
ZGV2KSkNCj4gICAJCXhncHVfYWlfbWFpbGJveF9hZGRfaXJxX2lkKGFkZXYpOw0KPiAgIA0KPiAr
CWFkZXYtPmRmX2Z1bmNzLT5pbml0KGFkZXYpOw0KPiArDQo+ICAgCXJldHVybiAwOw0KPiAgIH0N
Cj4gICANCj4gQEAgLTEwNjcsNyArMTA2OSw2IEBAIHN0YXRpYyB2b2lkIHNvYzE1X2Rvb3JiZWxs
X3JhbmdlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgc3RhdGljIGludCBz
b2MxNV9jb21tb25faHdfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsNCj4gLQlp
bnQgcmV0Ow0KPiAgIA0KPiAgIAkvKiBlbmFibGUgcGNpZSBnZW4yLzMgbGluayAqLw0KPiAgIAlz
b2MxNV9wY2llX2dlbjNfZW5hYmxlKGFkZXYpOw0KPiBAQCAtMTA4Miw4ICsxMDgzLDYgQEAgc3Rh
dGljIGludCBzb2MxNV9jb21tb25faHdfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgCWlmIChhZGV2
LT5uYmlvX2Z1bmNzLT5yZW1hcF9oZHBfcmVnaXN0ZXJzKQ0KPiAgIAkJYWRldi0+bmJpb19mdW5j
cy0+cmVtYXBfaGRwX3JlZ2lzdGVycyhhZGV2KTsNCj4gICANCj4gLQlhZGV2LT5kZl9mdW5jcy0+
aW5pdChhZGV2KTsNCj4gLQ0KPiAgIAkvKiBlbmFibGUgdGhlIGRvb3JiZWxsIGFwZXJ0dXJlICov
DQo+ICAgCXNvYzE1X2VuYWJsZV9kb29yYmVsbF9hcGVydHVyZShhZGV2LCB0cnVlKTsNCj4gICAJ
LyogSFcgZG9vcmJlbGwgcm91dGluZyBwb2xpY3k6IGRvb3JiZWxsIHdyaXRpbmcgbm90DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
