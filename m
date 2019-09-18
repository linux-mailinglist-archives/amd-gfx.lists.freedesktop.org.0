Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242AAB59B2
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 04:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68D16EDC0;
	Wed, 18 Sep 2019 02:35:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143526EDC0
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 02:35:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3YBsLIjo3KEsCVq+Xe902rXYvfjQEf6FBNlODbDmgSRtO1pWwy0wfLm2fvOqui75107JMT9UIQDkAXXiOu5Lyav+5CtR0lN9f1fMWp7Oqc7Jo3q2LiX6ByrQ3j3ORlseJCUXNe+98kQ1485qO2AVPMhkBYEJeKhJ1QPKu9aXX/var1dVTk1J7J0eL1B35f4ODqkh1Axnh2dT6qRFMGGKzTgTAcTq2ysA25q2VAEVgxr8+SGVuHG3pjVM8njCQFDcuGd+K4ybeeybJLpemMhrJNmkUtFN2dWI1dLmGour2FDtcL5eu4Ft4ZvqttOUN12v1tWeRulXUXrofGrFTBhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWNv9aYLoddRT9hnMhM3jeRzlWOd/Ybd8TLx8zSQcso=;
 b=MQDWfb/9KeSEdcVZVj5lWtAOxsGqOstBHz00gz+GUDx7WUi7+SAXDztszKeJgCGu0S6GSDJ5gRBXzJnskocprBGHlO1qPm2JoB2PiRBJPwkNHq6pgqQlbeTPqokoBGcBSENf3CsLTa6EG5afYEGr/M+HranmKt9wkrSXbUME9dvec5cYaE3cDzNzrVe+S9PJu2msexbfeEH6RoLA9TiDPFE1U+arwkiI1EsmcY9QpKTjL3YWTUgQWIPt3bKxo+/rTCB7JVCxkBw1RQcOJNhxnPmliLni7W/LPPDR5fEPmBvTHqBg4i+/vcdOWM+QuOlVbJQi5XbUsxHRCJ5/KeAQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3845.namprd12.prod.outlook.com (52.132.245.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 02:35:01 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 02:35:01 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu/psp: flush HDP write fifo after submitting
 cmds to the psp
Thread-Topic: [PATCH 1/2] drm/amdgpu/psp: flush HDP write fifo after
 submitting cmds to the psp
Thread-Index: AQHVbZVrWA/KAn7M/UqwLOSY7T+XCqcwuBug
Date: Wed, 18 Sep 2019 02:35:00 +0000
Message-ID: <CH2PR12MB37677ED61D641497604CD5CDFE8E0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190917202046.26634-1-alexander.deucher@amd.com>
In-Reply-To: <20190917202046.26634-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31f5a893-a8bb-4493-6c52-08d73be0ce03
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB3845; 
x-ms-traffictypediagnostic: CH2PR12MB3845:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB38452E80BA42BEE684B72790FE8E0@CH2PR12MB3845.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(199004)(189003)(13464003)(53546011)(26005)(52536014)(305945005)(76176011)(99286004)(476003)(7736002)(14454004)(14444005)(74316002)(86362001)(256004)(2501003)(11346002)(110136005)(446003)(6116002)(5660300002)(486006)(2906002)(3846002)(71190400001)(6246003)(186003)(4326008)(478600001)(102836004)(7696005)(66066001)(25786009)(316002)(8936002)(229853002)(33656002)(71200400001)(6306002)(55016002)(6436002)(6506007)(966005)(66476007)(76116006)(66946007)(9686003)(81166006)(66556008)(66446008)(64756008)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3845;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sAzLi08ctRqvREIatY0KvnGaWioYbrh6AvXheE6QcwlqvZ1LfJHz2uVjju5tJCKkIwUJj3/P0aFSv8bHZ1d5aznMWCFfpOqcZDkllhHPof7ry5qoEqRMxRyQEzJ58l4uhzlXzVOLLNc2p73ntmmXpLgyDoZEBRt9wFyZPuazg6wcWuK2Qym4fVzluT7WKr9llyHNM7Q9pZrGbqqzxMUiqMvHAChousY1g4hbOVHX6uSpMLiNZPi7mIeLq4kP8YWVRwVK4wx+y6NYRMB12U8EmAblqtJczjGJJEel3ep0gy5v0V5gC0bo6rLpW9o4HbnydcOrgvrEd4tQMQeIXkvShkZI7fZAKFcuG/QAORNh82tNMVTqBAYUHQHxnhVvLlPxiLoa7JenuLciXLq+6UWe4Mz1JvyBadfFODZMkDjty/k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f5a893-a8bb-4493-6c52-08d73be0ce03
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 02:35:00.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qo7bCHEtju9zT9jBKRsqjlB78uiXb+RISkec0RyfNBr1pf5CeBEhBZaApEq+iPOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWNv9aYLoddRT9hnMhM3jeRzlWOd/Ybd8TLx8zSQcso=;
 b=Ki2QPrdcNNxwY7YcKW0KgyqZKAejjX3h3dXaYTFbuj8uRwEPFnK6jAI1fWT8OWXt0Tz38XCPA4Y59nahwyJuRQpA20+pzj6EQwigattsKJy1IyEjPl0ZpgVrrSXNA+J6SSzAycq6ewxLBAEkSMFjShC+kuC/DpzMcIi6SUk+l/s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXggRGV1Y2hlcg0KU2VudDogV2VkbmVz
ZGF5LCBTZXB0ZW1iZXIgMTgsIDIwMTkgNDoyMSBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPg0KU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdS9wc3A6IGZsdXNoIEhEUCB3cml0
ZSBmaWZvIGFmdGVyIHN1Ym1pdHRpbmcgY21kcyB0byB0aGUgcHNwDQoNCldlIG5lZWQgdG8gbWFr
ZSBzdXJlIHRoZSBmaWZvIGlzIGZsdXNoZWQgYmVmb3JlIHdlIGFzayB0aGUgcHNwIHRvIHByb2Nl
c3MgdGhlIGNvbW1hbmRzLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3Bf
djEwXzAuYyB8IDEgKyAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCAx
ICsgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTJfMC5jIHwgMSArICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jICB8IDEgKw0KIDQgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9wc3BfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTBfMC5jDQpp
bmRleCA2ZWUzM2YzNjhlMjEuLmI5NjQ4NGE3MjUzNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3BzcF92MTBfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9wc3BfdjEwXzAuYw0KQEAgLTI2Niw2ICsyNjYsNyBAQCBzdGF0aWMgaW50IHBzcF92MTBf
MF9jbWRfc3VibWl0KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLA0KIAl3cml0ZV9mcmFtZS0+ZmVu
Y2VfYWRkcl9oaSA9IHVwcGVyXzMyX2JpdHMoZmVuY2VfbWNfYWRkcik7DQogCXdyaXRlX2ZyYW1l
LT5mZW5jZV9hZGRyX2xvID0gbG93ZXJfMzJfYml0cyhmZW5jZV9tY19hZGRyKTsNCiAJd3JpdGVf
ZnJhbWUtPmZlbmNlX3ZhbHVlID0gaW5kZXg7DQorCWFtZGdwdV9hc2ljX2ZsdXNoX2hkcChhZGV2
LCBOVUxMKTsNCiANCiAJLyogVXBkYXRlIHRoZSB3cml0ZSBQb2ludGVyIGluIERXT1JEcyAqLw0K
IAlwc3Bfd3JpdGVfcHRyX3JlZyA9IChwc3Bfd3JpdGVfcHRyX3JlZyArIHJiX2ZyYW1lX3NpemVf
ZHcpICUgcmluZ19zaXplX2R3OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYw0K
aW5kZXggNjQ4MDJlODhhOWEyLi4wNDMxOGNmZDUwYTggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvcHNwX3YxMV8wLmMNCkBAIC01NDksNiArNTQ5LDcgQEAgc3RhdGljIGludCBwc3BfdjEx
XzBfY21kX3N1Ym1pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwNCiAJd3JpdGVfZnJhbWUtPmZl
bmNlX2FkZHJfaGkgPSB1cHBlcl8zMl9iaXRzKGZlbmNlX21jX2FkZHIpOw0KIAl3cml0ZV9mcmFt
ZS0+ZmVuY2VfYWRkcl9sbyA9IGxvd2VyXzMyX2JpdHMoZmVuY2VfbWNfYWRkcik7DQogCXdyaXRl
X2ZyYW1lLT5mZW5jZV92YWx1ZSA9IGluZGV4Ow0KKwlhbWRncHVfYXNpY19mbHVzaF9oZHAoYWRl
diwgTlVMTCk7DQogDQogCS8qIFVwZGF0ZSB0aGUgd3JpdGUgUG9pbnRlciBpbiBEV09SRHMgKi8N
CiAJcHNwX3dyaXRlX3B0cl9yZWcgPSAocHNwX3dyaXRlX3B0cl9yZWcgKyByYl9mcmFtZV9zaXpl
X2R3KSAlIHJpbmdfc2l6ZV9kdzsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMl8wLmMN
CmluZGV4IGM3MmU0M2Y4ZTBiZS4uOGY1NTNmNmY5MmQ2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMl8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92MTJfMC5jDQpAQCAtMzc4LDYgKzM3OCw3IEBAIHN0YXRpYyBpbnQgcHNwX3Yx
Ml8wX2NtZF9zdWJtaXQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsDQogCXdyaXRlX2ZyYW1lLT5m
ZW5jZV9hZGRyX2hpID0gdXBwZXJfMzJfYml0cyhmZW5jZV9tY19hZGRyKTsNCiAJd3JpdGVfZnJh
bWUtPmZlbmNlX2FkZHJfbG8gPSBsb3dlcl8zMl9iaXRzKGZlbmNlX21jX2FkZHIpOw0KIAl3cml0
ZV9mcmFtZS0+ZmVuY2VfdmFsdWUgPSBpbmRleDsNCisJYW1kZ3B1X2FzaWNfZmx1c2hfaGRwKGFk
ZXYsIE5VTEwpOw0KIA0KIAkvKiBVcGRhdGUgdGhlIHdyaXRlIFBvaW50ZXIgaW4gRFdPUkRzICov
DQogCXBzcF93cml0ZV9wdHJfcmVnID0gKHBzcF93cml0ZV9wdHJfcmVnICsgcmJfZnJhbWVfc2l6
ZV9kdykgJSByaW5nX3NpemVfZHc7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9wc3BfdjNfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YzXzEuYw0K
aW5kZXggZDJjNzI3ZjZhOGJkLi5mZGMwMDkzODMyN2IgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9wc3BfdjNfMS5jDQpAQCAtNDU0LDYgKzQ1NCw3IEBAIHN0YXRpYyBpbnQgcHNwX3YzXzFf
Y21kX3N1Ym1pdChzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwNCiAJd3JpdGVfZnJhbWUtPmZlbmNl
X2FkZHJfaGkgPSB1cHBlcl8zMl9iaXRzKGZlbmNlX21jX2FkZHIpOw0KIAl3cml0ZV9mcmFtZS0+
ZmVuY2VfYWRkcl9sbyA9IGxvd2VyXzMyX2JpdHMoZmVuY2VfbWNfYWRkcik7DQogCXdyaXRlX2Zy
YW1lLT5mZW5jZV92YWx1ZSA9IGluZGV4Ow0KKwlhbWRncHVfYXNpY19mbHVzaF9oZHAoYWRldiwg
TlVMTCk7DQogDQogCS8qIFVwZGF0ZSB0aGUgd3JpdGUgUG9pbnRlciBpbiBEV09SRHMgKi8NCiAJ
cHNwX3dyaXRlX3B0cl9yZWcgPSAocHNwX3dyaXRlX3B0cl9yZWcgKyByYl9mcmFtZV9zaXplX2R3
KSAlIHJpbmdfc2l6ZV9kdzsNCi0tDQoyLjIwLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
