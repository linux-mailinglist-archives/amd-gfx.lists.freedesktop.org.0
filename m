Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3FCBE78
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 17:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766C06EBC5;
	Fri,  4 Oct 2019 15:03:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810083.outbound.protection.outlook.com [40.107.81.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6B96EBC5
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 15:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQQjsQYuYNcMH0VjFjmvQ52Yre+K4erMTNU6lzv6drLqGJRlK4tpLxfgdJh+NQFua0seLo5RvFrmfBOM/7uDbdrzHAUIdqnUNcx+PFoNGJaCbRNyHBfb46yw4TbuE0EgC/OBIJ3MrT+sH0rjueUTyN6tNISO0VZFacIL+CKzyTR/Byjxc0KphU2IvQbIY1X05EFhbJLroSoQJdYw1HWnrfsQdIHeF3MThkQSuTDG6JSagMXb/Id9FVE3YK6VT2DK3bTtxdoe6xrVNRzdUDQidSQ5JHtLLKFarwoIngHEH1wAKP9LCPdWwqIOhT4eTBPnx0z/7H61AIv//80aPireTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Q4eA49f+13ffkRQWLCOiCN5Nxr2UE04WwB1flonlRI=;
 b=j0r0uKNsImuOEEKwRX7nOln+WHyNQ7F/4Xpw1zAHBsLZjL1klSMnA6NtU2VaWbuv1kZajHtY3Oer/22Wn7HkYsqm6I3u1Ju1PDiL6Q14lZ+x3c0PYPNVJ2KTBwB42vQO6RTf1och29pA/UN/pdWhCn7vkc6rGBFce/1BfE2O3eY9cxFSOd3m4bkRzOgtHdO8MfFD1PNkTTWcWeHn//BIKyg/gogLy/82A5xGNGcffhDVmudNseGfeHOE9LXauYHr9C3SlAJgJoXUrwlfoV8N10tICpN2AJHUw4H5Qf+jrzi/n0HY6IqkME5imXxqTw1aeSau6HCnp9qNoRM4jmxztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1947.namprd12.prod.outlook.com (10.175.90.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 15:03:50 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 15:03:50 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix memory leak
Thread-Topic: [PATCH] drm/amdgpu: fix memory leak
Thread-Index: AQHVerrrYEdKBFKqKkOcoBjkShw1xKdKlF4A
Date: Fri, 4 Oct 2019 15:03:50 +0000
Message-ID: <cf190720-189c-3efe-4eb8-27c23865e050@amd.com>
References: <20191004135155.6527-1-nirmoy.das@amd.com>
In-Reply-To: <20191004135155.6527-1-nirmoy.das@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0034.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::47) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 970bca86-e9c0-4af3-7c8b-08d748dc1048
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1947:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1947B7102BD70392D0C0DF93839E0@DM5PR12MB1947.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(189003)(199004)(66574012)(66946007)(99286004)(54906003)(110136005)(8936002)(66446008)(66476007)(14454004)(64756008)(66556008)(6636002)(5660300002)(6512007)(6246003)(6436002)(316002)(229853002)(58126008)(36756003)(7736002)(14444005)(81166006)(256004)(4326008)(65806001)(478600001)(71200400001)(8676002)(305945005)(65956001)(25786009)(6486002)(186003)(52116002)(2906002)(6116002)(86362001)(102836004)(71190400001)(31686004)(11346002)(476003)(446003)(486006)(46003)(6506007)(2616005)(76176011)(386003)(81156014)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1947;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i+G/cbydbJUS29NKoF057gMJEQwR8ZahHxSwl2/G4Qv2sV03s7ItMR0c0tV2lY7ghNNqaHTs5Q/v1qaDkM8ReSLMcXCaHsdaa0xOXpUoIh7qIs1J9wozpjf5vVL5wnXcmzLs6qupeHYvKbzY+TMssvATJNoRxUhqyHh3nxVt3JW20AYDgOUpCH8aR0BmG7fTdnQbFMdyT9g+w13xgzNBV4mqpwFMB9sqIRaR83FPki1j1ZkGnlR6ml+qInqjtjQXN7VGCZwjwisJtu0vNJDkeQqzyBdwMrQJnSs1B7mp3Qv32c595O/I8g8Z/vkZ+cRoxroaJXA/t5fre5buz2bblMMEMYCzWslRamZ4a3WEK0bv64s7wgkLLnqfmgBwa7ZZyztBZ1yxtFCi6WMrt3kXvQ13AqtvvgWHN3yQ3NDYbGs=
Content-ID: <3BF6FD1671CEDB459BE824E1ED757FD0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970bca86-e9c0-4af3-7c8b-08d748dc1048
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 15:03:50.3513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVLN3i+cXvOR/yaPcdCt/BBLvUQkf0d/uCQD/rz6n4BPb5zDH7oib4Hxrlv7y5ET
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Q4eA49f+13ffkRQWLCOiCN5Nxr2UE04WwB1flonlRI=;
 b=iqy0okU6yJ7llSE8EUfMfn4QTku/mCF6jfo/o1ZFcAjWB4iuME9XKxIa+BWEuix5qSs/06EprTHFAtPGpgcsF++F9R51WtGQMeyCE3ilrZx1Ns3YLyk8TERqKpZQ05pcXNzhrIl51nvE3PnUXPIYkzyaQvRtN2kX4tu4oVwpG+U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDQuMTAuMTkgdW0gMTU6NTEgc2NocmllYiBOaXJtb3kgRGFzOg0KPiBjbGVhbnVwIGVycm9y
IGhhbmRsaW5nIGNvZGUgYW5kIG1ha2Ugc3VyZSB0ZW1wb3JhcnkgaW5mbyBhcnJheQ0KPiB3aXRo
IHRoZSBoYW5kbGVzIGFyZSBmcmVlZCBieSBhbWRncHVfYm9fbGlzdF9wdXQoKSBvbg0KPiBpZHJf
cmVwbGFjZSgpJ3MgZmFpbHVyZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmly
bW95LmRhc0BhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9ib19saXN0LmMgfCAxNCArKysrKysrLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYw0KPiBpbmRleCA3YmNmODZjNjE5OTkuLjYx
ZTM4ZTQzYWQxZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2JvX2xpc3QuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Ym9fbGlzdC5jDQo+IEBAIC0yNzAsNyArMjcwLDcgQEAgaW50IGFtZGdwdV9ib19saXN0X2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgDQo+ICAgCXIgPSBhbWRn
cHVfYm9fY3JlYXRlX2xpc3RfZW50cnlfYXJyYXkoJmFyZ3MtPmluLCAmaW5mbyk7DQo+ICAgCWlm
IChyKQ0KPiAtCQlnb3RvIGVycm9yX2ZyZWU7DQo+ICsJCXJldHVybiByOw0KPiAgIA0KPiAgIAlz
d2l0Y2ggKGFyZ3MtPmluLm9wZXJhdGlvbikgew0KPiAgIAljYXNlIEFNREdQVV9CT19MSVNUX09Q
X0NSRUFURToNCj4gQEAgLTI4Myw4ICsyODMsNyBAQCBpbnQgYW1kZ3B1X2JvX2xpc3RfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gICAJCXIgPSBpZHJfYWxsb2Mo
JmZwcml2LT5ib19saXN0X2hhbmRsZXMsIGxpc3QsIDEsIDAsIEdGUF9LRVJORUwpOw0KPiAgIAkJ
bXV0ZXhfdW5sb2NrKCZmcHJpdi0+Ym9fbGlzdF9sb2NrKTsNCj4gICAJCWlmIChyIDwgMCkgew0K
PiAtCQkJYW1kZ3B1X2JvX2xpc3RfcHV0KGxpc3QpOw0KPiAtCQkJcmV0dXJuIHI7DQo+ICsJCQln
b3RvIGVycm9yX3B1dF9saXN0Ow0KPiAgIAkJfQ0KPiAgIA0KPiAgIAkJaGFuZGxlID0gcjsNCj4g
QEAgLTMwNiw5ICszMDUsOCBAQCBpbnQgYW1kZ3B1X2JvX2xpc3RfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gICAJCW11dGV4X3VubG9jaygmZnByaXYtPmJvX2xp
c3RfbG9jayk7DQo+ICAgDQo+ICAgCQlpZiAoSVNfRVJSKG9sZCkpIHsNCj4gLQkJCWFtZGdwdV9i
b19saXN0X3B1dChsaXN0KTsNCj4gICAJCQlyID0gUFRSX0VSUihvbGQpOw0KPiAtCQkJZ290byBl
cnJvcl9mcmVlOw0KPiArCQkJZ290byBlcnJvcl9wdXRfbGlzdDsNCj4gICAJCX0NCj4gICANCj4g
ICAJCWFtZGdwdV9ib19saXN0X3B1dChvbGQpOw0KPiBAQCAtMzI1LDggKzMyMywxMCBAQCBpbnQg
YW1kZ3B1X2JvX2xpc3RfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwN
Cj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgDQo+ICtlcnJvcl9wdXRfbGlzdDoNCj4gKwlhbWRn
cHVfYm9fbGlzdF9wdXQobGlzdCk7DQo+ICsNCj4gICBlcnJvcl9mcmVlOg0KPiAtCWlmIChpbmZv
KQ0KPiAtCQlrdmZyZWUoaW5mbyk7DQo+ICsJa3ZmcmVlKGluZm8pOw0KPiAgIAlyZXR1cm4gcjsN
Cj4gICB9DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
