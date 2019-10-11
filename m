Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C630AD42F5
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 16:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0AF6EC4F;
	Fri, 11 Oct 2019 14:33:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCD26EC4F
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 14:33:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGWFrXBHMbMkJeLQ79n3li/F9bQUCdfcVWZMhds4uOtwtZuIxFUlvpXuwTj/6m2UgfKB9yVeB67F+wq74//6Zqa/jvVReAenGLfmMzziRi7+xmxjD+agQGwKCV5mmTNawvPHWMCwMIdUMDm+AE6PHvNmb8iQIPKV4qZAelz5bYOWmTdkaOLgA8JftEiAFT+QgumcuQ5XqfpZwSxYtOGMOzrCxyKo8mK93qyRyXwE9QdtkX6vZ4wN6eGCmQf7D+2jrVpB6rDTrysp/qqYbyhtlDPHsTxCvdE8AQ0MdRli12QDiLhb5DTjg/42czUiE8JkW4K7x3o9ToJ7u4ioHuM+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwAf6sG5jURbFfZNxZrH59wA0vTqSrOXw0FIGQWBBsI=;
 b=WG6NIB8PzxbqTF41brCXv+xIBFfaTCJmge+mzROdkVtjPYy2Ia1yGTvXjTyt6bMtlrsovfmtVmKr/lpWq1F/7c8MjYeuadPU+/nG+6QK7stzMFBDmtmOdF51xASR5R5lki4ai6YObTSgDPnvJ2f+m5KzIgEWvQt+rXm/GUNp+0YvopjBOPZXNCJgulo0EbCxyIw4aiNPOWSwFNztboJeHlrAYz441LCG62Dp6/WUu+Jgtns1hP6DuvLnNb/bLSpjyWHzK7USV/SowiuxmNOn/hGiJVQgsfLiwpnRmSqaDcbTzrcbhhcHKru8DWwJPqmMhtHPyf4X7jGmwFB2y/l6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1374.namprd12.prod.outlook.com (10.169.206.9) by
 MWHPR12MB1709.namprd12.prod.outlook.com (10.175.54.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 14:33:52 +0000
Received: from MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192]) by MWHPR12MB1374.namprd12.prod.outlook.com
 ([fe80::b99b:3d36:80fa:1192%7]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 14:33:52 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "thej^C@gmail.com" <thej^C@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVeiL9DA79jEoNj0W1Xmdl96gb6adVKsmAgABiu4A=
Date: Fri, 11 Oct 2019 14:33:52 +0000
Message-ID: <f73a5170-03a3-58d6-8c7d-7660658d848b@amd.com>
References: <20191003194423.14468-1-Philip.Yang@amd.com>
 <af664c43-a81b-bae4-8f6f-c70bc4ab9de5@gmail.com>
In-Reply-To: <af664c43-a81b-bae4-8f6f-c70bc4ab9de5@gmail.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ac3c455-a587-45fd-d9cb-08d74e58097e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1709:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB170953491CC734AA8AB10A28E6970@MWHPR12MB1709.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(2616005)(25786009)(31696002)(76176011)(2501003)(229853002)(6486002)(31686004)(99286004)(8936002)(6512007)(6306002)(8676002)(66574012)(81166006)(4001150100001)(52116002)(6436002)(6116002)(3846002)(81156014)(11346002)(446003)(476003)(486006)(102836004)(53546011)(71200400001)(26005)(186003)(7736002)(386003)(6506007)(2906002)(6246003)(66066001)(110136005)(71190400001)(966005)(316002)(256004)(14454004)(5660300002)(14444005)(66476007)(66946007)(66556008)(36756003)(66446008)(86362001)(478600001)(305945005)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1709;
 H:MWHPR12MB1374.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: outklXOFclU+indZYpC4CXW2/Lv9lm967Dbbw4Eln98T/8Vb/OWnjpdX9g77x0PUbcp5GxYbKoaOgGvaxRuVYph6NP6NzRvxUtrjMv0xOVzLBdexXmL/v/AYYRajRvCOez3zpv/v5Vf5QlwRfNkGZaIIbxbiZtAY9uB1RQ9QPexUb2BLAvvZlvG4tkFHchyf0PDw2UkD6+596SjuqFu6hfsx/T478AIOLckWJLbXUdJxTRZ7e19Kc+BGT/fbLXJXhVlJzdSiu4XVYVODfjJzAHUr4ghestEaAhDaxy13uYwIT5VNZMm2r2GT0ksnXxeoSG2IvuP4nKv/n/ZhPotjk3YgS1VsrJ62BS0ACx95Q0X3LX/WcNCzuS+v2AEltT/fN3iIvcw7vLkHYJGGeJFtjjCW/DE8Mih3hyVp7y/CKPOVXpgUGm0U76yLqQY1LAIHg9PqY59OE7AnO/CPpqLAoQ==
Content-ID: <71CE6B09DB46154C8E8D4E1DB1192EFA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac3c455-a587-45fd-d9cb-08d74e58097e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 14:33:52.2739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +db5ZdIBgEOwrRLpvUi2Wgh2zyKy342aVGs2iKISVUqlSLP3WNby6fxM/RK29ajk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwAf6sG5jURbFfZNxZrH59wA0vTqSrOXw0FIGQWBBsI=;
 b=eYcPKM/LMlRfC6vN+smvAduGJVu6QhW+Xy+dIReLbqbnt1JDkwIj5lySNtsr7MzJaCz2lF1Iq0OIWZPOAJdoFyGyiEwwccdXj3pxzR6sEv539q8houBqyPg5IjDqcb3c+w70A+Rr7KZPStnkbx6WnXFDcUIRT7VbrYPmBrp4pr8=
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

DQoNCk9uIDIwMTktMTAtMTEgNDo0MCBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBB
bSAwMy4xMC4xOSB1bSAyMTo0NCBzY2hyaWViIFlhbmcsIFBoaWxpcDoNCj4+IHVzZXJfcGFnZXMg
YXJyYXkgc2hvdWxkIGFsd2F5cyBiZSBmcmVlZCBhZnRlciB2YWxpZGF0aW9uIHJlZ2FyZGxlc3Mg
aWYNCj4+IHVzZXIgcGFnZXMgYXJlIGNoYW5nZWQgYWZ0ZXIgYm8gaXMgY3JlYXRlZCBiZWNhdXNl
IHdpdGggSE1NIGNoYW5nZSBwYXJzZQ0KPj4gYm8gYWx3YXlzIGFsbG9jYXRlIHVzZXIgcGFnZXMg
YXJyYXkgdG8gZ2V0IHVzZXIgcGFnZXMgZm9yIHVzZXJwdHIgYm8uDQo+Pg0KPj4gRG9uJ3QgbmVl
ZCB0byBnZXQgdXNlciBwYWdlcyB3aGlsZSBjcmVhdGluZyB1ZXJwdHIgYm8gYmVjYXVzZSB1c2Vy
IHBhZ2VzDQo+PiB3aWxsIG9ubHkgYmUgdXNlZCB3aGlsZSB2YWxpZGF0aW5nIGFmdGVyIHBhcnNp
bmcgdXNlcnB0ciBiby4NCj4+DQo+PiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5u
ZXQvdWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xODQ0OTYyDQo+Pg0KPj4gdjI6IHJlbW92ZSB1
bnVzZWQgbG9jYWwgdmFyaWFibGUgYW5kIGFtZW5kIGNvbW1pdA0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuY8KgIHzCoCA0ICstLS0NCj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDIzICstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjUgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jcy5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3Mu
Yw0KPj4gaW5kZXggNDliNzY3YjcyMzhmLi45NjExODZlNzExM2UgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4+IEBAIC00NzQsNyArNDc0LDYgQEAgc3Rh
dGljIGludCBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZShzdHJ1Y3QgDQo+PiBhbWRncHVfY3NfcGFy
c2VyICpwLA0KPj4gwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGxvYmosIHZhbGlkYXRl
ZCwgdHYuaGVhZCkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKmJv
ID0gdHRtX3RvX2FtZGdwdV9ibyhsb2JqLT50di5ibyk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgYm9v
bCBiaW5kaW5nX3VzZXJwdHIgPSBmYWxzZTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
bW1fc3RydWN0ICp1c2VybW07DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdXNlcm1tID0gYW1kZ3B1
X3R0bV90dF9nZXRfdXNlcm1tKGJvLT50Ym8udHRtKTsNCj4+IEBAIC00OTEsMTQgKzQ5MCwxMyBA
QCBzdGF0aWMgaW50IGFtZGdwdV9jc19saXN0X3ZhbGlkYXRlKHN0cnVjdCANCj4+IGFtZGdwdV9j
c19wYXJzZXIgKnAsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfdHRtX3R0
X3NldF91c2VyX3BhZ2VzKGJvLT50Ym8udHRtLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvYmotPnVzZXJfcGFnZXMpOw0K
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmluZGluZ191c2VycHRyID0gdHJ1ZTsNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IGFtZGdwdV9jc192
YWxpZGF0ZShwLCBibyk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHIpDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsNCj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoYmlu
ZGluZ191c2VycHRyKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGxvYmotPnVzZXJfcGFnZXMp
IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGt2ZnJlZShsb2JqLT51c2VyX3BhZ2Vz
KTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvYmotPnVzZXJfcGFnZXMgPSBOVUxM
Ow0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nZW0uYw0KPj4gaW5kZXggYTgyOGUzZDBiZmJkLi4zY2NkNjFkNjk5NjQgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPj4gQEAgLTI4
Myw3ICsyODMsNiBAQCBpbnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgDQo+PiAqZGV2LCB2b2lkICpkYXRhLA0KPj4gwqAgaW50IGFtZGdwdV9nZW1fdXNlcnB0cl9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZmlsZSAqZmlscCkNCj4+IMKgIHsN
Cj4+IC3CoMKgwqAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsgdHJ1ZSwgZmFsc2Ug
fTsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZXYtPmRldl9w
cml2YXRlOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fdXNlcnB0ciAqYXJn
cyA9IGRhdGE7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iajsNCj4+
IEBAIC0zMjYsMzIgKzMyNSwxMiBAQCBpbnQgYW1kZ3B1X2dlbV91c2VycHRyX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlIA0KPj4gKmRldiwgdm9pZCAqZGF0YSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gcmVsZWFzZV9vYmplY3Q7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IC3CoMKg
wqAgaWYgKGFyZ3MtPmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX1ZBTElEQVRFKSB7DQo+IA0K
PiBXZSBjYW4ndCBkcm9wIHRoYXQgaGFuZGxpbmcgaGVyZSwgaXQgaXMgbWFuZGF0b3J5IHRvIGRl
dGVjdCBhbiANCj4gYXBwbGljYXRpb24gYnVnIHdoZXJlIGFuIGFwcGxpY2F0aW9uIHRyaWVzIHRv
IHVzZXIgYW4gdXNlcnB0ciB3aXRoIGEgVk1BIA0KPiB3aGljaCBpcyBub3QgYW5vbnltb3VzIG1l
bW9yeS4NCj4gDQo+IFRoaXMgbXVzdCBiZSBkZXRlY3RlZCBhbmQgcmVqZWN0ZWQgYXMgaW52YWxp
ZCBoZXJlLg0KPiANCj4gSSBzdWdnZXN0IHRoYXQgd2UgYWxsb2NhdGUgYSBsb2NhbCBwYWdlcyBh
cnJheSBzaW1pbGFyIHRvIGhvdyB3ZSBkbyBpdCANCj4gZHVyaW5nIENTIGFuZCByZWxlYXNlIHRo
YXQgYWZ0ZXIgdGhlIGZ1bmN0aW9uIGlzIGRvbmUuDQo+IA0KVGhhbmtzIGZvciB0aGlzLCB3ZSBj
YW4gdXNlIGJvLT50Ym8udHRtLT5wYWdlcyBhcnJheSBoZXJlIHRvIGF2b2lkIGV4dHJhIA0KYWxs
b2MvZnJlZSBvZiBwYWdlcyBhcnJheSBiZWNhdXNlIENTIHVzZXMgbG9jYWwgcGFnZXMgYXJyYXkg
YW5kIHVwZGF0ZSANCnRvIGJvLT50Ym8udHRtLT5wYWdlcyBpZiB1c2VyIHBhZ2VzIGFyZSBtb3Zl
ZC4gSSB3aWxsIHN1Ym1pdCBwYXRjaCB2MyANCmZvciByZXZpZXcuDQoNCj4gUmVnYXJkcywNCj4g
Q2hyaXN0aWFuLg0KPiANCj4+IC3CoMKgwqDCoMKgwqDCoCByID0gYW1kZ3B1X3R0bV90dF9nZXRf
dXNlcl9wYWdlcyhibywgYm8tPnRiby50dG0tPnBhZ2VzKTsNCj4+IC3CoMKgwqDCoMKgwqDCoCBp
ZiAocikNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVsZWFzZV9vYmplY3Q7DQo+
PiAtDQo+PiAtwqDCoMKgwqDCoMKgwqAgciA9IGFtZGdwdV9ib19yZXNlcnZlKGJvLCB0cnVlKTsN
Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocikNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gdXNlcl9wYWdlc19kb25lOw0KPj4gLQ0KPj4gLcKgwqDCoMKgwqDCoMKgIGFtZGdwdV9ib19w
bGFjZW1lbnRfZnJvbV9kb21haW4oYm8sIEFNREdQVV9HRU1fRE9NQUlOX0dUVCk7DQo+PiAtwqDC
oMKgwqDCoMKgwqAgciA9IHR0bV9ib192YWxpZGF0ZSgmYm8tPnRibywgJmJvLT5wbGFjZW1lbnQs
ICZjdHgpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGFtZGdwdV9ib191bnJlc2VydmUoYm8pOw0KPj4g
LcKgwqDCoMKgwqDCoMKgIGlmIChyKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB1
c2VyX3BhZ2VzX2RvbmU7DQo+PiAtwqDCoMKgIH0NCj4+IC0NCj4+IMKgwqDCoMKgwqAgciA9IGRy
bV9nZW1faGFuZGxlX2NyZWF0ZShmaWxwLCBnb2JqLCAmaGFuZGxlKTsNCj4+IMKgwqDCoMKgwqAg
aWYgKHIpDQo+PiAtwqDCoMKgwqDCoMKgwqAgZ290byB1c2VyX3BhZ2VzX2RvbmU7DQo+PiArwqDC
oMKgwqDCoMKgwqAgZ290byByZWxlYXNlX29iamVjdDsNCj4+IMKgwqDCoMKgwqAgYXJncy0+aGFu
ZGxlID0gaGFuZGxlOw0KPj4gLXVzZXJfcGFnZXNfZG9uZToNCj4+IC3CoMKgwqAgaWYgKGFyZ3Mt
PmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX1ZBTElEQVRFKQ0KPj4gLcKgwqDCoMKgwqDCoMKg
IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZShiby0+dGJvLnR0bSk7DQo+PiAtDQo+
PiDCoCByZWxlYXNlX29iamVjdDoNCj4+IMKgwqDCoMKgwqAgZHJtX2dlbV9vYmplY3RfcHV0X3Vu
bG9ja2VkKGdvYmopOw0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
