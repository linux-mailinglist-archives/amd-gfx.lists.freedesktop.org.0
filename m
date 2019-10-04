Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA0CBBEC
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 15:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81D06EB81;
	Fri,  4 Oct 2019 13:40:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792456EB85
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 13:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrtkIzixE9eFbjeirm+XnjfOckyaN3Vu6RYs6PJk83FtnHni/9uFluawVjBRV2HoWM6lKHxYTNUJWClOwAoxPAYl18gg1ZuCG0eVVELHoR8mNOuz1TVb/vhdTTs5dL89f18L0/l8hjt3L7TNr+YU6hBig/6WGcL9IBdYXHUr3F6+uklb8FGFpc1PZN3wmPQLdxcZI1roANJiLZxhQQg4rrASrQGJBTsAK8boPkZ3OjvJEHpOihzSIhJ2z1McGhboe4QBC81fKbojKqrxzVk/SiGcNCG716fOOdlF6ZeF4a0UHYPfUI+vYPSUuIonZWq3sOt2lToiqHEvdsVieJnhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxhXWQjokK1fdtYeHM8Z4ToS9CTljYskYjWR6ooMRWo=;
 b=U3g3X0sI1URHALhtL/uTN/9sD0CC5kjxCJptxDBNqTTBFTR8t/a9WX9Kc39jEVRP2c7pwbDPYYN/c+3xtfRyC5hF7E53GHGeylTpkdrDXFJVGxf3LAZvZVyvYwObQPXvMzrABMaH+yKownyaxW5MLzxGijIFaSGnF4pJzT+L86VJq6GzQgPCJxJBABXk7nyBkixtkpTF1j9XlZ6ij/+X3b6r9/VMXpOjkTiFFJPdnRPXoJRXrWcY0G/SQQ6espt5pUUy1FITNRHKx0VCdcDKXqenTqZt/DGaB8FPuep08rreP+QE60mSAUIxQAYL8vQeBn7RCefQO2/opZqsq9MPHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1694.namprd12.prod.outlook.com (10.172.56.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 13:40:11 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 13:40:11 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "thejoe@gmail.com" <thejoe@gmail.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVeiL9DA79jEoNj0W1Xmdl96gb6adKfjMA
Date: Fri, 4 Oct 2019 13:40:11 +0000
Message-ID: <e86d92cd-7bae-6704-00db-1a79ccbb1011@amd.com>
References: <20191003194423.14468-1-Philip.Yang@amd.com>
In-Reply-To: <20191003194423.14468-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::14) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f632d7be-8b64-4889-a172-08d748d0605f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1694:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB16944DDC8652F9A29FDBF9DAE69E0@MWHPR12MB1694.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(199004)(189003)(66946007)(81156014)(81166006)(8936002)(5660300002)(229853002)(8676002)(31686004)(14454004)(14444005)(256004)(99286004)(52116002)(76176011)(6246003)(386003)(53546011)(6506007)(102836004)(26005)(6512007)(186003)(6436002)(66446008)(478600001)(66066001)(66556008)(66476007)(11346002)(6486002)(6116002)(3846002)(446003)(64756008)(2906002)(966005)(25786009)(316002)(6306002)(110136005)(2501003)(36756003)(476003)(71190400001)(6636002)(2616005)(86362001)(486006)(71200400001)(305945005)(31696002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1694;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LGbrgvJLcUVaPquYKcL8B3mZhc6Re++1p7Ua2os6joXsBKG9MzT+OzR6fRBC1Mq+MGQspv56WZFj3FCLj2UzrDoOXEbntCAKi8i+/7wlo/EPemhgJoGVo8ziFfy6rJsB5y55KXjLKhqDqpDSU9A6FzexJfukOY1jYpC52014qs3eP2Skky3GJpwzjscpwa7kwu9drrCAv8OjoPz0/El2O4wmYL3Jwjh5ojSqP0rucZSVN57ovdmCJbQuczFzZteaCTcG+zoMdiKjmL+Ej/9sjSe5q8IBcNZ5bMIzftUhCMXuUbALTm6npqyhMJZllaU9jMatdc+Ab0dhIsas+V5Ha1rkZ/BWOKOs38T1HGnYHWpQ8QCI2iYDcf53tqan9HapPLT4avYEzaH0Sb8t/w1VOkBE2tNwJe0ALTj6HZFcIsZyA9VSYlx5Zeu9g78pDWVZCd9VYFlUKsHeBiR2q5v+xw==
Content-ID: <28B57967A9676346A0D5D2BB516D8831@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f632d7be-8b64-4889-a172-08d748d0605f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 13:40:11.1318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Db44GklGHFcW/Qd0uJYEhLoQ54kyix7ZCoDa5m1ZKU04eMqnqHx+nDgSi9M4aO74
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxhXWQjokK1fdtYeHM8Z4ToS9CTljYskYjWR6ooMRWo=;
 b=IGtd+q1AkA1p4M+p+WNMexYdZSZqEQhML6UtaJhxWnS4XZ/80ECX9gg2Vc4u8z0Y2xNqoD6fMzMi2qx01dkhTH6mA8m8kIZzqoCJBztHgFPgTMU3jqKXhDbprwjeo9v+YNvje5JIE1zTZHprHWFdAHe50t0nnue8izQ8k7QgVgs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEpvZSBmb3IgdGhlIHRlc3QsIEkgd2lsbCBhZGQgeW91ciBUZXN0ZWQtYnkuDQoNCkhp
IENocmlzdGlhbiwNCg0KTWF5IHlvdSBoZWxwIHJldmlldz8gVGhlIGNoYW5nZSByZW1vdmVzIHRo
ZSBnZXQgdXNlciBwYWdlcyBmcm9tIA0KZ2VtX3VzZXJwdHJfaW9jdGwsIHRoaXMgd2FzIGRvbmUg
aWYgZmxhZ3MgQU1ER1BVX0dFTV9VU0VSUFRSX1ZBTElEQVRFIGlzIA0Kc2V0LCBhbmQgZGVsYXkg
dGhlIGdldCB1c2VyIHBhZ2VzIHRvIGFtZGdwdV9jc19wYXJzZXJfYm9zLCBhbmQgY2hlY2sgaWYg
DQp1c2VyIHBhZ2VzIGFyZSBpbnZhbGlkYXRlZCB3aGVuIGFtZGdwdV9jc19zdWJtaXQuIEkgZG9u
J3QgZmluZCBpc3N1ZSBmb3IgDQpvdmVybmlnaHQgdGVzdCwgYnV0IG5vdCBzdXJlIGlmIHRoZXJl
IGlzIHBvdGVudGlhbCBzaWRlIGVmZmVjdC4NCg0KVGhhbmtzLA0KUGhpbGlwDQoNCk9uIDIwMTkt
MTAtMDMgMzo0NCBwLm0uLCBZYW5nLCBQaGlsaXAgd3JvdGU6DQo+IHVzZXJfcGFnZXMgYXJyYXkg
c2hvdWxkIGFsd2F5cyBiZSBmcmVlZCBhZnRlciB2YWxpZGF0aW9uIHJlZ2FyZGxlc3MgaWYNCj4g
dXNlciBwYWdlcyBhcmUgY2hhbmdlZCBhZnRlciBibyBpcyBjcmVhdGVkIGJlY2F1c2Ugd2l0aCBI
TU0gY2hhbmdlIHBhcnNlDQo+IGJvIGFsd2F5cyBhbGxvY2F0ZSB1c2VyIHBhZ2VzIGFycmF5IHRv
IGdldCB1c2VyIHBhZ2VzIGZvciB1c2VycHRyIGJvLg0KPiANCj4gRG9uJ3QgbmVlZCB0byBnZXQg
dXNlciBwYWdlcyB3aGlsZSBjcmVhdGluZyB1ZXJwdHIgYm8gYmVjYXVzZSB1c2VyIHBhZ2VzDQo+
IHdpbGwgb25seSBiZSB1c2VkIHdoaWxlIHZhbGlkYXRpbmcgYWZ0ZXIgcGFyc2luZyB1c2VycHRy
IGJvLg0KPiANCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3VidW50dS8r
c291cmNlL2xpbnV4LytidWcvMTg0NDk2Mg0KPiANCj4gdjI6IHJlbW92ZSB1bnVzZWQgbG9jYWwg
dmFyaWFibGUgYW5kIGFtZW5kIGNvbW1pdA0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlh
bmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jcy5jICB8ICA0ICstLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2VtLmMgfCAyMyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQo+IGluZGV4IDQ5Yjc2N2I3MjM4Zi4uOTYx
MTg2ZTcxMTNlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0K
PiBAQCAtNDc0LDcgKzQ3NCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUo
c3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsDQo+ICAgDQo+ICAgCWxpc3RfZm9yX2VhY2hfZW50
cnkobG9iaiwgdmFsaWRhdGVkLCB0di5oZWFkKSB7DQo+ICAgCQlzdHJ1Y3QgYW1kZ3B1X2JvICpi
byA9IHR0bV90b19hbWRncHVfYm8obG9iai0+dHYuYm8pOw0KPiAtCQlib29sIGJpbmRpbmdfdXNl
cnB0ciA9IGZhbHNlOw0KPiAgIAkJc3RydWN0IG1tX3N0cnVjdCAqdXNlcm1tOw0KPiAgIA0KPiAg
IAkJdXNlcm1tID0gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcm1tKGJvLT50Ym8udHRtKTsNCj4gQEAg
LTQ5MSwxNCArNDkwLDEzIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX2xpc3RfdmFsaWRhdGUoc3Ry
dWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsDQo+ICAgDQo+ICAgCQkJYW1kZ3B1X3R0bV90dF9zZXRf
dXNlcl9wYWdlcyhiby0+dGJvLnR0bSwNCj4gICAJCQkJCQkgICAgIGxvYmotPnVzZXJfcGFnZXMp
Ow0KPiAtCQkJYmluZGluZ191c2VycHRyID0gdHJ1ZTsNCj4gICAJCX0NCj4gICANCj4gICAJCXIg
PSBhbWRncHVfY3NfdmFsaWRhdGUocCwgYm8pOw0KPiAgIAkJaWYgKHIpDQo+ICAgCQkJcmV0dXJu
IHI7DQo+ICAgDQo+IC0JCWlmIChiaW5kaW5nX3VzZXJwdHIpIHsNCj4gKwkJaWYgKGxvYmotPnVz
ZXJfcGFnZXMpIHsNCj4gICAJCQlrdmZyZWUobG9iai0+dXNlcl9wYWdlcyk7DQo+ICAgCQkJbG9i
ai0+dXNlcl9wYWdlcyA9IE5VTEw7DQo+ICAgCQl9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2VtLmMNCj4gaW5kZXggYTgyOGUzZDBiZmJkLi4zY2NkNjFkNjk5NjQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4gQEAgLTI4Myw3ICsy
ODMsNiBAQCBpbnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwNCj4gICBpbnQgYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgCQkJICAgICBzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbHApDQo+ICAgew0KPiAtCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IHRydWUs
IGZhbHNlIH07DQo+ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGV2LT5kZXZfcHJp
dmF0ZTsNCj4gICAJc3RydWN0IGRybV9hbWRncHVfZ2VtX3VzZXJwdHIgKmFyZ3MgPSBkYXRhOw0K
PiAgIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmo7DQo+IEBAIC0zMjYsMzIgKzMyNSwxMiBA
QCBpbnQgYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgKmRhdGEsDQo+ICAgCQkJZ290byByZWxlYXNlX29iamVjdDsNCj4gICAJfQ0KPiAgIA0KPiAt
CWlmIChhcmdzLT5mbGFncyAmIEFNREdQVV9HRU1fVVNFUlBUUl9WQUxJREFURSkgew0KPiAtCQly
ID0gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhibywgYm8tPnRiby50dG0tPnBhZ2VzKTsN
Cj4gLQkJaWYgKHIpDQo+IC0JCQlnb3RvIHJlbGVhc2Vfb2JqZWN0Ow0KPiAtDQo+IC0JCXIgPSBh
bWRncHVfYm9fcmVzZXJ2ZShibywgdHJ1ZSk7DQo+IC0JCWlmIChyKQ0KPiAtCQkJZ290byB1c2Vy
X3BhZ2VzX2RvbmU7DQo+IC0NCj4gLQkJYW1kZ3B1X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihi
bywgQU1ER1BVX0dFTV9ET01BSU5fR1RUKTsNCj4gLQkJciA9IHR0bV9ib192YWxpZGF0ZSgmYm8t
PnRibywgJmJvLT5wbGFjZW1lbnQsICZjdHgpOw0KPiAtCQlhbWRncHVfYm9fdW5yZXNlcnZlKGJv
KTsNCj4gLQkJaWYgKHIpDQo+IC0JCQlnb3RvIHVzZXJfcGFnZXNfZG9uZTsNCj4gLQl9DQo+IC0N
Cj4gICAJciA9IGRybV9nZW1faGFuZGxlX2NyZWF0ZShmaWxwLCBnb2JqLCAmaGFuZGxlKTsNCj4g
ICAJaWYgKHIpDQo+IC0JCWdvdG8gdXNlcl9wYWdlc19kb25lOw0KPiArCQlnb3RvIHJlbGVhc2Vf
b2JqZWN0Ow0KPiAgIA0KPiAgIAlhcmdzLT5oYW5kbGUgPSBoYW5kbGU7DQo+ICAgDQo+IC11c2Vy
X3BhZ2VzX2RvbmU6DQo+IC0JaWYgKGFyZ3MtPmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX1ZB
TElEQVRFKQ0KPiAtCQlhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoYm8tPnRiby50
dG0pOw0KPiAtDQo+ICAgcmVsZWFzZV9vYmplY3Q6DQo+ICAgCWRybV9nZW1fb2JqZWN0X3B1dF91
bmxvY2tlZChnb2JqKTsNCj4gICANCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
