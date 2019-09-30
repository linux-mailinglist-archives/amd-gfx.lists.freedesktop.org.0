Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64143C1C07
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 09:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FDA6E398;
	Mon, 30 Sep 2019 07:24:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1376E398
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 07:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZzv0FbqGhWszz1uWN4RpdIG8YNkXr/cIg0FNjAvH0PDrGsmcy/rvMwva6fsXqdbVStoK5aDC4lJW7nSCPwCHSxivfh78fw0xrnizIFUOTJWAdQ91BK/x0v4pnNhHO8ZBzHefte/KFR3IN1+nuj3SwayCRLza9EIUXkKHhv8CTM2Nl0f4EfZnKceueCx/3GomJ/ieb+fQ9dqX1TOMX2HY3Uemlwgjg7mxoLX7StvL7wBnga7nFr7H7R1sdipQRh9pEkC0NC0jCD9AOWTpP2++ne3qpIPxGjdgQJWQpfu7vQbBVMBnJ7odRDzQT5r5wHikMocl2o5brmeO3AUv3klhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZySiLfHPfxMSCunYAWhzpMllYHE2X7WJJvhCooefmk=;
 b=OssaWT3hhhAWU6uDbaH1aHXmXCd4q5D3JFsgmHFIkhYy99sObhhTX1FLN34kEUvIjr7yKUzoDQS52QygecpU3yFv7+Y0L1JRFXyG5g0A6m2kQqjzAw6SfcPBbCxYQwSifW/16+2a0FHsjqH9JFBfTv1T4lymNhaa5s6XW4+DqxU3Fv+KRAXrgk8y+TCOvYnJY/aqLofMM9UC/2cU3FUgbqSTg/+Cqczv6M8EroTuF12Ans26XEfP+E98r4ibZdO7TTJKEDhSem1qwkbtlIJXgdnIGQgwT/Vp7ktCXNIRw3LzxNb7ZV9DHA21FyJE0iHNEsmCl0q685z2n8htiN6eRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4192.namprd12.prod.outlook.com (52.135.49.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 07:24:52 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 07:24:52 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: avoid ras error injection for retired page
Thread-Topic: [PATCH] drm/amdgpu: avoid ras error injection for retired page
Thread-Index: AQHVd1x03AHNLWAbRUS7wbpwyyAdWqdDzTgwgAAEF4A=
Date: Mon, 30 Sep 2019 07:24:52 +0000
Message-ID: <MN2PR12MB30545389A0AF576778A258BAB0820@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190930065810.15372-1-tao.zhou1@amd.com>
 <BYAPR12MB2806F46A2E8DB7DAE48F15F0F1820@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2806F46A2E8DB7DAE48F15F0F1820@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a8dac42-fd78-4dac-de19-08d745774921
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4192:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB41920F1CAEEF85A90859427EB0820@MN2PR12MB4192.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(13464003)(189003)(199004)(486006)(86362001)(52536014)(5660300002)(2501003)(305945005)(256004)(81166006)(81156014)(14444005)(8936002)(74316002)(476003)(6636002)(8676002)(7736002)(11346002)(71190400001)(446003)(71200400001)(66476007)(102836004)(66446008)(64756008)(66556008)(66066001)(478600001)(99286004)(9686003)(2906002)(76176011)(229853002)(26005)(66946007)(6116002)(53546011)(7696005)(6506007)(3846002)(76116006)(55016002)(33656002)(186003)(6436002)(316002)(25786009)(14454004)(6246003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4192;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PJn2CPLW4oiPd0lsEw9MYacYzPXCkl/MDykyoa+u13PY5UB4QkKO77LAOxpXmBpuos1tIIL6ExFP2edHpwv6KPzytTLHfd2/pxyC2plzPd+nPCf0mcSXjqqZxcMaj1fSIeZsJpB6FaR2fE77EGib6tsESDKuTXY73Di6SyMz2tDuyaCVbvuEM+qJxcXOIHhUvPBs2StTCsKIL5IDi7QHfGEj5CB8GqIKDKHM7b/4yUVNDOzuWV14osyhvkg50Zp8TjNt0QZVGnEBOlA0meQ85w+XFZusMGJK1aMfPq712v0FtzWP3V+f4QDevHxcm3hzoEEkHasTsfOIEDsFsT75H7XYY8qqbxCH6c94NAGi81tHZTqnWDBZ/2nmtWhdllVK68pLJJrd74soo6maaef5nnQpuR7/VYPmPjqwDGPPfVI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8dac42-fd78-4dac-de19-08d745774921
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 07:24:52.5676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMLjt2IUDwrh1654nY+G01+36uj/GYBMeu89CUILgNaiBdDIEa6lW/v1ibbGxuiU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZySiLfHPfxMSCunYAWhzpMllYHE2X7WJJvhCooefmk=;
 b=wK0OoqQEjfk7/jotxrjUTC2iQO1Cy7CBMk4M1FYIOUb8F+vyMlPISvctRNdMlDJhdiq3LZQeUsx+NLgxHZdrvdvaQlmqShejOgB+b92griRXRRK4lpr+VB9ZtlaPP91IRTPMM84FSVWjKze5kAJWDpUXRTltakgIlOnZgea+Axw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDMw5pelIDE1OjE0DQo+IFRv
OiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOw0KPiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiBhdm9pZCByYXMgZXJyb3IgaW5qZWN0aW9uIGZv
ciByZXRpcmVkIHBhZ2UNCj4gDQo+IA0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IEd1Y2h1bg0KPiAN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhvdTEsIFRhbyA8VGFvLlpo
b3UxQGFtZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDE5IDI6NTggUE0N
Cj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDaGVuLCBHdWNodW4NCj4gPEd1
Y2h1bi5DaGVuQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
Pg0KPiBDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZGdwdTogYXZvaWQgcmFzIGVycm9yIGluamVjdGlvbiBmb3IgcmV0aXJlZCBwYWdl
DQo+IA0KPiBjaGVjayB3aGV0aGVyIGEgcGFnZSBpcyBiYWQgcGFnZSBiZWZvcmUgZXJyb3IgaW5q
ZWN0aW9uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMzgN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMN
Cj4gaW5kZXggZmUzYTU3ZTU2N2M4Li5kNTBlNTY1YjBiMjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gQEAgLTcxLDYgKzcxLDkgQEAgY29uc3QgY2hh
ciAqcmFzX2Jsb2NrX3N0cmluZ1tdID0gew0KPiANCj4gIGF0b21pY190IGFtZGdwdV9yYXNfaW5f
aW50ciA9IEFUT01JQ19JTklUKDApOw0KPiANCj4gK3N0YXRpYyBib29sIGFtZGdwdV9yYXNfY2hl
Y2tfYmFkX3BhZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsJCQkJdWludDY0X3Qg
YWRkcik7DQo+ICsNCj4gIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfZGVidWdmc19yZWFkKHN0
cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLA0KPiAgCQkJCQlzaXplX3Qgc2l6ZSwgbG9m
Zl90ICpwb3MpDQo+ICB7DQo+IEBAIC0yOTAsNiArMjkzLDEzIEBAIHN0YXRpYyBzc2l6ZV90IGFt
ZGdwdV9yYXNfZGVidWdmc19jdHJsX3dyaXRlKHN0cnVjdA0KPiBmaWxlICpmLCBjb25zdCBjaGFy
IF9fdXNlciAqDQo+ICAJCQlicmVhazsNCj4gIAkJfQ0KPiANCj4gKwkJLyogY2UvdWUgZXJyb3Ig
aW5qZWN0aW9uIGZvciBhIGJhZCBwYWdlIGlzIG5vdCBhbGxvd2VkICovDQo+ICsJCWlmIChhbWRn
cHVfcmFzX2NoZWNrX2JhZF9wYWdlKGFkZXYsIGRhdGEuaW5qZWN0LmFkZHJlc3MpKQ0KPiB7DQo+
ICsJCQlEUk1fV0FSTigiRFJNIFdBUk46IDB4JWxseCBoYXMgYmVlbiBtYXJrZWQNCj4gYXMgYmFk
IGJlZm9yZSBlcnJvciBpbmplY3Rpb24hXG4iLA0KPiArCQkJCQlkYXRhLmluamVjdC5hZGRyZXNz
KTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsNCj4gIAkJLyogZGF0YS5pbmplY3QuYWRkcmVz
cyBpcyBvZmZzZXQgaW5zdGVhZCBvZiBhYnNvbHV0ZSBncHUNCj4gYWRkcmVzcyAqLw0KPiAgCQly
ZXQgPSBhbWRncHVfcmFzX2Vycm9yX2luamVjdChhZGV2LCAmZGF0YS5pbmplY3QpOw0KPiAgCQli
cmVhazsNCj4gQEAgLTE0MzAsNiArMTQ0MCwzNCBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfbG9h
ZF9iYWRfcGFnZXMoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJcmV0dXJuIHJl
dDsNCj4gIH0NCj4gDQo+ICsvKiBjaGVjayBpZiBhbiBhZGRyZXNzIGJlbG9uZ3MgdG8gYmFkIHBh
Z2UgKi8gc3RhdGljIGJvb2wNCj4gK2FtZGdwdV9yYXNfY2hlY2tfYmFkX3BhZ2Uoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsJCQkJdWludDY0X3QgYWRkcikNCj4gK3sNCj4gKwlzdHJ1
Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsNCj4gKwlz
dHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7DQo+ICsJaW50IGksIHJldCA9IGZhbHNl
Ow0KPiBbR3VjaHVuXUl0J3MgYmV0dGVyIHRvIHVzZSBib29sIHR5cGUgZm9yIHRoZSByZXQgdmFy
aWFibGUsIHRvIGtlZXAgY29uc2lzdGVudA0KPiB3aXRoIGZ1bmN0aW9uIHJldHVybiB0eXBlPw0K
PiBBcGFydCBmcm9tIHRoYXQsIHRoaXMgcGF0Y2ggaXM6IFJldmlld2VkLWJ5OiBHdWNodW4gQ2hl
bg0KPiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCg0KW1Rhb10gVGhhbmtzLCBJJ2xsIGNvcnJlY3Qg
aXQgYmVmb3JlIHN1Ym1pdC4NCg0KPiANCj4gKw0KPiArCWlmICghY29uIHx8ICFjb24tPmVoX2Rh
dGEpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5
X2xvY2spOw0KPiArCWRhdGEgPSBjb24tPmVoX2RhdGE7DQo+ICsJaWYgKCFkYXRhKQ0KPiArCQln
b3RvIG91dDsNCj4gKw0KPiArCWFkZHIgPj49IEFNREdQVV9HUFVfUEFHRV9TSElGVDsNCj4gKwlm
b3IgKGkgPSAwOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykNCj4gKwkJaWYgKGFkZHIgPT0gZGF0YS0+
YnBzW2ldLnJldGlyZWRfcGFnZSkgew0KPiArCQkJcmV0ID0gdHJ1ZTsNCj4gKwkJCWdvdG8gb3V0
Ow0KPiArCQl9DQo+ICsNCj4gK291dDoNCj4gKwltdXRleF91bmxvY2soJmNvbi0+cmVjb3Zlcnlf
bG9jayk7DQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQgYW1kZ3B1
X3Jhc19jcmVhdGVfYmFkX3BhZ2VzX2JvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiB7
DQo+ICAJLyogTm90ZTogdGhlIGNhbGxlciBzaG91bGQgZ3VhcmFudGVlIGNvbiBhbmQgZGF0YSBh
cmUgbm90IE5VTEwgKi8NCj4gLS0NCj4gMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
