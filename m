Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B25A6B8C
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 16:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD2889590;
	Tue,  3 Sep 2019 14:32:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770089.outbound.protection.outlook.com [40.107.77.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED2889581
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 14:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6ZzordWUK+dSlgc3PRc6PJOES/K73y/W+kOtf+ppg/4eISnrh3U3A3yjBaUZr9Ump/0w2zp6AN3KQkapvBoNNoaZNKqpZkpbQ/359N97OtUAaK8daCoM54nDL+L3w+V7wqaVXt0+kXSXr1WQjgcs92EgyaAh9piM9UtWYUdN+9lX7Vt9HypC2w6OTgn6/2ToXoorCBkhQcq+RYfNsJibSlCXp1lshUeOOgUCdKkZn25ysiVMOhsR7+IwgJfe9xbnMk0K/krcRzwes5Jqprmx6UGaT7Lb6nsIFwbHxKrJpbEmXPiLNT6LXpPQrv4z+I+OnqxpuilFUS6PYV0RT1zPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn6QDFnvE1VmsKkhBAvlfbusM1znJFyN55WIyuYDoKA=;
 b=Hc8PS6HizKObEPXtIMT2kW9sPneenDFY3/stl6F4IQflwv4FH+QgdzVeYW/BjET24O/sSs5wgxxCjKJUa4uIrypxTrpL+3Xb75VZfLLxyD3kVAujQ5PUe/RrwDBTkfT3MxAcvbRsr9Mo+ynELKui4WFJTrb6gvf42BOK8jqf5Yg1124f38p3WkGggpEdnL2MIJM439QKvQD4T3BNFqjJXJsAhj5FOyRmV9nRN1YrAVjcXB/kufgNnDZ1ENbJ44Pn7qD6ILp2eGo6zsOQXjUh8Okd28cnt6+njRaFV/ejvVrU9jxgs+q2jE57cNCsN3WwJt28zjyPeYtTIZErhFzbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4037.namprd12.prod.outlook.com (20.180.17.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Tue, 3 Sep 2019 14:31:58 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::2d8f:b0c7:a4a7:7ea5]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::2d8f:b0c7:a4a7:7ea5%7]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 14:31:58 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/amdgpu: add sw_fini interface for df_funcs
Thread-Topic: [PATCH] drm/amd/amdgpu: add sw_fini interface for df_funcs
Thread-Index: AQHVYj14acHkHXoH70+W8BeRAjvKVKcaA7pg
Date: Tue, 3 Sep 2019 14:31:58 +0000
Message-ID: <CH2PR12MB3831BE0A7E1335D273B1FD4585B90@CH2PR12MB3831.namprd12.prod.outlook.com>
References: <20190903095331.4531-1-Jack.Zhang1@amd.com>
In-Reply-To: <20190903095331.4531-1-Jack.Zhang1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:7a0:884:b46e:dff4:7f04:b4de]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c5f740e-d22f-4d40-75d8-08d7307b7a3e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4037; 
x-ms-traffictypediagnostic: CH2PR12MB4037:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4037F5E0E2AAD23CA519858685B90@CH2PR12MB4037.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(199004)(189003)(13464003)(316002)(2906002)(478600001)(9686003)(6306002)(6116002)(6436002)(76176011)(7696005)(229853002)(6506007)(81156014)(81166006)(66946007)(52536014)(53546011)(110136005)(53936002)(55016002)(186003)(6246003)(102836004)(8936002)(99286004)(25786009)(446003)(966005)(71190400001)(71200400001)(256004)(305945005)(74316002)(11346002)(4326008)(66476007)(66556008)(64756008)(66446008)(86362001)(2501003)(476003)(486006)(5660300002)(14454004)(7736002)(33656002)(46003)(8676002)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4037;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eR8HfSsOMA3g6+2U3UBa03AMgvQ4YSfj5QO4Jh2Y2BEkktd6aLMwXi7YLK0qd5I+b3p1BFC0JL0NOyb0oK5G+cZQxdjgeMLBDUQMMRgyNoHkjFnOR8hrSumknzJV43tQaDvMhKIHLVUfGRskaU5nYAEvsvVcLictMwIstfTtg9MnUh7jv3PC0AHfO7X0Mlt+dPEqQ/Vj/nJGDCjRpdgA9WY1wlG2E8hnqgg0Rbg7/sZ1J1lFhAg6gQ18+vRC0xItJdHQFyiDKFtBfU5+GfsGG+0hS4JTUHcmNI5ar75X6SKdU5pYDpAaW3lEZamSdQBFGAJv8WbAVT5Oih4E3Wckarv4p9/PwDDBlrudePVV6O/eaehtojXvI07UfJNtOT/nZ9IJY13hcP5dhuFMW4TI3befgueX/KvXIpj8Ome8hAA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5f740e-d22f-4d40-75d8-08d7307b7a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 14:31:58.4190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S490cZUKBU/ev2U384FD33+OjzhkOtB2Dbmuwmt4roh6Xzv6bAY5nqPWrRIZZhSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn6QDFnvE1VmsKkhBAvlfbusM1znJFyN55WIyuYDoKA=;
 b=xvdZ9W62k7qJT3618s8WOtMqOxr38qbOyfJZGL3ndXGXNP2TWIhEUwnOHcBkOdL/BZ5xa1EVgfja/OvEwfDRW/yv0yyogndZWR57hPF0qQwNhccOD2Pvn3Q+UGikZVLLCqEv1XgChGJlYEcLlEJ1x7sHWs0U7lVzLOVIrg+DyQE=
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFjayBaaGFuZw0KU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDMsIDIwMTkgNTo1NCBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpDYzogWmhhbmcsIEphY2sgKEppYW4pIDxKYWNrLlpoYW5nMUBhbWQuY29tPg0KU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kL2FtZGdwdTogYWRkIHN3X2ZpbmkgaW50ZXJmYWNlIGZvciBk
Zl9mdW5jcw0KDQpbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCmFkZCBzd19maW5pIGludGVy
ZmFjZSBvZiBkZl9mdW5jcy4NClRoaXMgaW50ZXJmYWNlIHdpbGwgcmVtb3ZlIHN5c2ZzIGZpbGUg
b2YgZGZfY250cl9hdmFpbCBmdW5jdGlvbi4NCg0KVGhlIG9sZCBiZWhhdmlvciBvbmx5IGNyZWF0
ZSBzeXNmcyBvZiBkZl9jbnRyX2F2YWlsIGluIHN3X2luaXQsIGJ1dCBuZXZlciByZW1vdmUgaXQg
Zm9yIGxhY2sgb2Ygc3dfZmluaSBpbnRlcmZhY2UuIFdpdGggdGhpcyxkcml2ZXIgd2lsbCByZXBv
cnQgY3JlYXRlIHN5c2ZzIGZhaWwgd2hlbiBpdCdzIGxvYWRlZCBmb3IgdGhlIHNlY29uZCB0aW1l
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBKYWNrIFpoYW5nIDxKYWNrLlpoYW5nMUBhbWQuY29tPg0KLS0t
DQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggIHwgMSArICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMgfCA1ICsrKysrICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9kZl92M182LmMgfCA4ICsrKysrKysrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYyAgIHwgMyArKysNCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCmluZGV4IGEyMzYyMTMuLmYyNjIyNmQg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCkBAIC02NTUsNiArNjU1LDcgQEAg
c3RydWN0IGFtZGdwdV9tbWlvX3JlbWFwIHsNCg0KIHN0cnVjdCBhbWRncHVfZGZfZnVuY3Mgew0K
ICAgICAgICB2b2lkICgqc3dfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KKyAg
ICAgICB2b2lkICgqc3dfZmluaSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KICAgICAg
ICB2b2lkICgqZW5hYmxlX2Jyb2FkY2FzdF9tb2RlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBlbmFibGUpOw0K
ICAgICAgICB1MzIgKCpnZXRfZmJfY2hhbm5lbF9udW1iZXIpKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YxXzcu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YxXzcuYw0KaW5kZXggODQ0YzAzOC4u
ZDYyMjEyOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YxXzcu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jDQpAQCAtMzMsNiAr
MzMsMTAgQEAgc3RhdGljIHZvaWQgZGZfdjFfN19zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KSAgeyAgfQ0KDQorc3RhdGljIHZvaWQgZGZfdjFfN19zd19maW5pKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KSB7IH0NCisNCiBzdGF0aWMgdm9pZCBkZl92MV83X2VuYWJsZV9icm9h
ZGNhc3RfbW9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGVuYWJsZSkgIHsgQEAgLTExMSw2ICsxMTUs
NyBAQCBzdGF0aWMgdm9pZCBkZl92MV83X2VuYWJsZV9lY2NfZm9yY2VfcGFyX3dyX3JtdyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCg0KIGNvbnN0IHN0cnVjdCBhbWRncHVfZGZfZnVuY3Mg
ZGZfdjFfN19mdW5jcyA9IHsNCiAgICAgICAgLnN3X2luaXQgPSBkZl92MV83X3N3X2luaXQsDQor
ICAgICAgIC5zd19maW5pID0gZGZfdjFfN19zd19maW5pLA0KICAgICAgICAuZW5hYmxlX2Jyb2Fk
Y2FzdF9tb2RlID0gZGZfdjFfN19lbmFibGVfYnJvYWRjYXN0X21vZGUsDQogICAgICAgIC5nZXRf
ZmJfY2hhbm5lbF9udW1iZXIgPSBkZl92MV83X2dldF9mYl9jaGFubmVsX251bWJlciwNCiAgICAg
ICAgLmdldF9oYm1fY2hhbm5lbF9udW1iZXIgPSBkZl92MV83X2dldF9oYm1fY2hhbm5lbF9udW1i
ZXIsIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCmluZGV4IGRlZWU0ZjQuLjE2ZmJk
MmJjOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQpAQCAtMjIwLDYgKzIy
MCwxMyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQogICAgICAgICAgICAgICAgYWRldi0+ZGZfcGVyZm1vbl9jb25maWdfYXNzaWduX21h
c2tbaV0gPSAwOyAgfQ0KDQorc3RhdGljIHZvaWQgZGZfdjNfNl9zd19maW5pKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KSB7DQorDQorICAgICAgIGRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5k
ZXYsICZkZXZfYXR0cl9kZl9jbnRyX2F2YWlsKTsNCisNCit9DQorDQogc3RhdGljIHZvaWQgZGZf
djNfNl9lbmFibGVfYnJvYWRjYXN0X21vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGVuYWJsZSkgIHsg
QEAgLTUzNyw2ICs1NDQsNyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BtY19nZXRfY291bnQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQoNCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2RmX2Z1bmNz
IGRmX3YzXzZfZnVuY3MgPSB7DQogICAgICAgIC5zd19pbml0ID0gZGZfdjNfNl9zd19pbml0LA0K
KyAgICAgICAuc3dfZmluaSA9IGRmX3YzXzZfc3dfZmluaSwNCiAgICAgICAgLmVuYWJsZV9icm9h
ZGNhc3RfbW9kZSA9IGRmX3YzXzZfZW5hYmxlX2Jyb2FkY2FzdF9tb2RlLA0KICAgICAgICAuZ2V0
X2ZiX2NoYW5uZWxfbnVtYmVyID0gZGZfdjNfNl9nZXRfZmJfY2hhbm5lbF9udW1iZXIsDQogICAg
ICAgIC5nZXRfaGJtX2NoYW5uZWxfbnVtYmVyID0gZGZfdjNfNl9nZXRfaGJtX2NoYW5uZWxfbnVt
YmVyLCBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCmluZGV4IGQ0MDdlMjkuLmNiMjI5NzAg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAtMTIzOSw2ICsxMjM5LDkgQEAg
c3RhdGljIGludCBzb2MxNV9jb21tb25fc3dfaW5pdCh2b2lkICpoYW5kbGUpDQoNCiBzdGF0aWMg
aW50IHNvYzE1X2NvbW1vbl9zd19maW5pKHZvaWQgKmhhbmRsZSkgIHsNCisgICAgICAgc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7DQor
DQorICAgICAgIGFkZXYtPmRmX2Z1bmNzLT5zd19maW5pKGFkZXYpOw0KICAgICAgICByZXR1cm4g
MDsNCiB9DQoNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
