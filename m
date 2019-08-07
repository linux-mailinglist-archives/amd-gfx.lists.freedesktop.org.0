Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1A584294
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50FD89A8C;
	Wed,  7 Aug 2019 02:40:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720067.outbound.protection.outlook.com [40.107.72.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE00E89A8C
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 02:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0ycV/Muuxl8RI/+3aLeyc3FahCyE+nidGypT1WXii+/VUalPNt52QqMZl0V+EQIKKmrFcvB4objjXZhdMCkm+CjkJEEhaRC0FXkXubNXPErHFJhKUuxhkFRszJJIsQ2yVhvb70xNBMOPEl/pdNhXQs1fLJMR2Idp9kF5/KmeaUor3/O0/J1Wq6NZg1J7aU7ldtD05M5wd4qwe5zz/JfEj6uEjewdw/9J/Lb6WfSaKoZ+K09x69Ew+N9CkywC5ZTl2FaQluYNlbYuNcbK1Ngjk+BXRO50AcGP0wbZiJL1zJR3ns0xdU8DRTVgT0LAj3B/TqQBR/+5CE/8DLTsqnXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vnaXrlNeqPGc+YGgTCLhvzHuQZZp1Q32AvbL64Jq5g=;
 b=BjE9Vt/spsLdi45hCYBbQGiDVGf/GnayismjjGdgp0/vMlDgd4V1ZVsMg6FQNG4NcQ0S0a0xVjTSgswHljqfEO2PZKEfSm49qHX3Cd0kiWlswwiZiwGsay+SxwBwiht1CN4RnEKUq5Rkq0YyVTdfq+wG42eDFls2bIxF6dvvBTBQD+cns8DYiOFAyM4BWLfFjPJe5v1PsfbR0SNmKd8zJjbtCZ27KaByOYhsiXNQ4FsjPoyyXqsot3Yk5A/EdwLEzBjjzsadbWaDL/iclQ9YmKFLVjRPbCWrz+rz3NWUdfIiVWlDlkIsUYQfq0ZmHP+ynRBD6nQZZdqpURVVd7ysIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2434.namprd12.prod.outlook.com (52.132.11.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 7 Aug 2019 02:40:38 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 02:40:38 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific
 vm hub
Thread-Topic: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific
 vm hub
Thread-Index: AQHVSUvmAo7H+DIhNU2zNHDc6cD8iqbsUDAAgAKusiA=
Date: Wed, 7 Aug 2019 02:40:37 +0000
Message-ID: <BL0PR12MB2580778BFD71E211AC18CFAF80D40@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
 <855377a1-69ca-891e-1dad-5b93f57671da@gmail.com>
In-Reply-To: <855377a1-69ca-891e-1dad-5b93f57671da@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Hawking.Zhang@amd.com,Alexander.Deucher@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56a57663-e716-40f9-b2bf-08d71ae0a177
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2434; 
x-ms-traffictypediagnostic: BL0PR12MB2434:
x-microsoft-antispam-prvs: <BL0PR12MB2434637E8C853AC0D5953EB780D40@BL0PR12MB2434.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(199004)(189003)(13464003)(68736007)(71200400001)(53936002)(446003)(11346002)(9686003)(6436002)(54906003)(99286004)(66066001)(486006)(476003)(316002)(186003)(110136005)(55016002)(4326008)(25786009)(5660300002)(256004)(52536014)(66574012)(7696005)(6636002)(26005)(102836004)(71190400001)(478600001)(229853002)(66446008)(76176011)(2906002)(74316002)(6116002)(66946007)(66476007)(66556008)(6246003)(86362001)(33656002)(8936002)(76116006)(64756008)(7736002)(53546011)(8676002)(2501003)(81156014)(6506007)(3846002)(14454004)(81166006)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2434;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VhqqJJ5YC851lqHPwiZWRkNnXkSKo/TfysyHqaIsXDswJWbXS2X0u/LL1nH/dL+Vmt4u7KlOPGVqTmOZCwDUDu1gKphsqeq//3mdhOBsaeK9Tz3+AD1+pR8KpszELX459tZsnEtopL6wx4mGGOf+RRiLyMhIDRT3Uu1jOWFu795snGuMfbrZeYRXQkPVsiLuxuS/w/Kn5km/0/chdiZ1vS9uN57ue2txclNcTc3lieAJW83oRxbznzJFwmWuZjoZnvKsHDoTJMfQeMxGiABMt8fDq0bZJ/Yy40e+7xEGGzfh2mmQfJ9QACO7EJOg1Ui9PH8DKDwTScO2HZMUJKEo5NFdI551KSx3s+qwtJl3wpJAqpKnT08xnppa6bGEuzsvwJbwbV3NYPaFoN+u6FFWyvnayncntAaj9X6FHjvC/k4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a57663-e716-40f9-b2bf-08d71ae0a177
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:40:37.9397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vnaXrlNeqPGc+YGgTCLhvzHuQZZp1Q32AvbL64Jq5g=;
 b=Yh7+iCRMxiDdRFl2ItzDiIuRv/G3+mqp2mEmm6qv5Zr1R8GjG7XgpgyRMNFWrXQtXaHDpuwb8GBpgd3XDYEWwYNHmb01dRDAfnjo6Rjl657tY2Prajipfq4tIz+c9WbkUYC9ElWTI1P/i240qIiqc890jzOLdkU4Wsi+c9v052k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T2ssIHdpbGwgZG8gaXQuDQoNCkJUVywgZG9lcyB0aG9zZSBjb2RlcyBiZWxvdyByZWFsbHkgbmVl
ZGVkLCBpbiBmdW5jdGlvbiBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYi4gSSB0aGluayBpZiB3ZSBo
YXZlIHRoZSBidWcsIHRoZW4gYmVmb3JlIGJlbG93IGNvZGVzLCB3aGVuIHdlIGZsdXNoIFRMQiBv
ZiBnZnhodWIgdGhyb3VnaCBtbWlvLCBpdCBoYXMgYWxyZWFkeSB0cmlnZ2VyZWQgdGhlIGJ1Zy4g
QWxzbyBhcyB3ZSBhbHJlYWR5IGludmFsaWRhdGVkIHRsYiBvbiBib3RoIG1tIGFuZCBnZnggaHVi
IChpbiB0aGUgc2FtZSBmdW5jdGlvbiBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYiksIHdoYXQgaXMg
dGhlIHBvaW50IG9mIGJlbG93IGNvZGVzPyBEb2VzIHRoZSBjb2RlZCBiZWxvdyBpbnZhbGlkYXRl
IFRMQiBvbiBib3RoIG1tIGFuZCBnZnggaHViPyBBbHNvIEBaaGFuZywgSGF3a2luZ0BEZXVjaGVy
LCBBbGV4YW5kZXINCg0KCS8qIFRoZSBTRE1BIG9uIE5hdmkgaGFzIGEgYnVnIHdoaWNoIGNhbiB0
aGVvcmV0aWNhbGx5IHJlc3VsdCBpbiBtZW1vcnkNCgkgKiBjb3JydXB0aW9uIGlmIGFuIGludmFs
aWRhdGlvbiBoYXBwZW5zIGF0IHRoZSBzYW1lIHRpbWUgYXMgYW4gVkENCgkgKiB0cmFuc2xhdGlv
bi4gQXZvaWQgdGhpcyBieSBkb2luZyB0aGUgaW52YWxpZGF0aW9uIGZyb20gdGhlIFNETUENCgkg
KiBpdHNlbGYuDQoJICovDQoJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihhZGV2LCAxNiAq
IDQsICZqb2IpOw0KCWlmIChyKQ0KCQlnb3RvIGVycm9yX2FsbG9jOw0KDQoJam9iLT52bV9wZF9h
ZGRyID0gYW1kZ3B1X2dtY19wZF9hZGRyKGFkZXYtPmdhcnQuYm8pOw0KCWpvYi0+dm1fbmVlZHNf
Zmx1c2ggPSB0cnVlOw0KCWFtZGdwdV9yaW5nX3BhZF9pYihyaW5nLCAmam9iLT5pYnNbMF0pOw0K
CXIgPSBhbWRncHVfam9iX3N1Ym1pdChqb2IsICZhZGV2LT5tbWFuLmVudGl0eSwNCgkJCSAgICAg
IEFNREdQVV9GRU5DRV9PV05FUl9VTkRFRklORUQsICZmZW5jZSk7DQoNClJlZ2FyZHMsDQpPYWsN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNr
b2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiANClNlbnQ6IE1vbmRheSwgQXVndXN0IDUs
IDIwMTkgNTozNyBBTQ0KVG86IFplbmcsIE9hayA8T2FrLlplbmdAYW1kLmNvbT47IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBMaXUsIFNoYW95dW4g
PFNoYW95dW4uTGl1QGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHJtL2FtZGdw
dTogRXhwb3J0IGZ1bmN0aW9uIHRvIGZsdXNoIFRMQiBvZiBzcGVjaWZpYyB2bSBodWINCg0KQW0g
MDIuMDguMTkgdW0gMTg6MDQgc2NocmllYiBaZW5nLCBPYWs6DQo+IFRoaXMgaXMgZm9yIGtmZCB0
byByZXVzZSBhbWRncHUgVExCIGludmFsaWRhdGlvbiBmdW5jdGlvbi4gVGhlcmUgaXMgDQo+IGFs
cmVhZHkgYSBnbWMgZnVuY3Rpb24gZmx1c2hfZ3B1X3RsYiB0byBmbHVzaCBUTEIgb24gYWxsIHZt
IGh1Yi4gT24gDQo+IGdmeDEwLCBrZmQgb25seSBuZWVkcyB0byBmbHVzaCBUTEIgb24gZ2Z4IGh1
YiBidXQgbm90IG9uIG1tIGh1Yi4gU28gDQo+IGV4cG9ydCBhIGZ1bmN0aW9uIGZvciBLRkQgZmx1
c2ggVExCIG9ubHkgb24gZ2Z4IGh1Yi4NCg0KSSB3b3VsZCByYXRoZXIgZ28gYWhlYWQgYW5kIGFk
ZCBhbm90aGVyIHBhcmFtZXRlciB0byBmbHVzaF9ncHVfdGxiIHRvIG5vdGUgd2hpY2ggaHViIG5l
ZWRzIGZsdXNoaW5nLg0KDQpXZSBjYW4gcHJvYmFibHkgZWFzaWx5IGV4dGVuZCB0aGUgZmV3IGNh
bGxlcnMgdG8gZmx1c2ggYWxsIGh1YnMgbmVlZGVkLg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gQ2hh
bmdlLUlkOiBJNThmZjAwOTY5Zjg4NDM4Y2ZkM2RjN2U5ZGViN2JmZjBjMWJiNDEzMw0KPiBTaWdu
ZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIHwgNCArKysrDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgIHwgMSArDQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nbWMuaCANCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ21jLmgNCj4gaW5kZXggMDcxMTQ1YS4uMGJkNGE0ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaA0KPiBAQCAtODgsNiArODgsOSBAQCBzdHJ1Y3QgYW1k
Z3B1X3ZtaHViIHsNCj4gICAgKiBHUFUgTUMgc3RydWN0dXJlcywgZnVuY3Rpb25zICYgaGVscGVy
cw0KPiAgICAqLw0KPiAgIHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIHsNCj4gKwkvKiBmbHVzaCB2
bSB0bGIgb2Ygc3BlY2lmaWMgaHViICovDQo+ICsJdm9pZCAoKmZsdXNoX3ZtX2h1Yikoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsDQo+ICsJCQkJICAgdW5zaWduZWQg
aW50IHZtaHViLCB1aW50MzJfdCBmbHVzaF90eXBlKTsNCj4gICAJLyogZmx1c2ggdGhlIHZtIHRs
YiB2aWEgbW1pbyAqLw0KPiAgIAl2b2lkICgqZmx1c2hfZ3B1X3RsYikoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQo+ICAgCQkJICAgICAgdWludDMyX3Qgdm1pZCwgdWludDMyX3QgZmx1c2hf
dHlwZSk7IEBAIC0xODAsNiArMTgzLDcgQEAgDQo+IHN0cnVjdCBhbWRncHVfZ21jIHsNCj4gICAJ
c3RydWN0IHJhc19jb21tb25faWYgICAgKnJhc19pZjsNCj4gICB9Ow0KPiAgIA0KPiArI2RlZmlu
ZSBhbWRncHVfZ21jX2ZsdXNoX3ZtX2h1YihhZGV2LCB2bWlkLCB2bWh1YiwgdHlwZSkgDQo+ICso
KGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5mbHVzaF92bV9odWIoKGFkZXYpLCAodm1pZCksICh2bWh1
YiksIA0KPiArKHR5cGUpKSkNCj4gICAjZGVmaW5lIGFtZGdwdV9nbWNfZmx1c2hfZ3B1X3RsYihh
ZGV2LCB2bWlkLCB0eXBlKSAoYWRldiktPmdtYy5nbWNfZnVuY3MtPmZsdXNoX2dwdV90bGIoKGFk
ZXYpLCAodm1pZCksICh0eXBlKSkNCj4gICAjZGVmaW5lIGFtZGdwdV9nbWNfZW1pdF9mbHVzaF9n
cHVfdGxiKHIsIHZtaWQsIGFkZHIpIChyKS0+YWRldi0+Z21jLmdtY19mdW5jcy0+ZW1pdF9mbHVz
aF9ncHVfdGxiKChyKSwgKHZtaWQpLCAoYWRkcikpDQo+ICAgI2RlZmluZSBhbWRncHVfZ21jX2Vt
aXRfcGFzaWRfbWFwcGluZyhyLCB2bWlkLCBwYXNpZCkgDQo+IChyKS0+YWRldi0+Z21jLmdtY19m
dW5jcy0+ZW1pdF9wYXNpZF9tYXBwaW5nKChyKSwgKHZtaWQpLCAocGFzaWQpKSANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+IGluZGV4IDRlM2FjMTAuLjI0NzUx
NWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+IEBAIC00
MTYsNiArNDE2LDcgQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2dldF92bV9wZGUoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192MTBfMF9nbWNfZnVuY3MgPSB7DQo+ICsJ
LmZsdXNoX3ZtX2h1YiA9IGdtY192MTBfMF9mbHVzaF92bV9odWIsDQo+ICAgCS5mbHVzaF9ncHVf
dGxiID0gZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIsDQo+ICAgCS5lbWl0X2ZsdXNoX2dwdV90bGIg
PSBnbWNfdjEwXzBfZW1pdF9mbHVzaF9ncHVfdGxiLA0KPiAgIAkuZW1pdF9wYXNpZF9tYXBwaW5n
ID0gZ21jX3YxMF8wX2VtaXRfcGFzaWRfbWFwcGluZywNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
