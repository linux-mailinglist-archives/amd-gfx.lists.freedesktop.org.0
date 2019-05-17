Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471B2138F
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 07:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5292D8982A;
	Fri, 17 May 2019 05:58:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1F98982A
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 05:58:47 +0000 (UTC)
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (20.178.53.221) by
 BYAPR12MB3606.namprd12.prod.outlook.com (20.178.197.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 05:58:44 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29%4]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 05:58:44 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: cancel late_init_work before gpu reset
Thread-Topic: [PATCH] drm/amdgpu: cancel late_init_work before gpu reset
Thread-Index: AQHVDF0Jw8Yl7UBkJ0q6lgb4fC+21KZu0liw
Date: Fri, 17 May 2019 05:58:44 +0000
Message-ID: <BYAPR12MB30485074D0C840B0FCD2C13CFE0B0@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <SN6PR12MB2800E10E66A5834D3A38A0E4870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB2800E10E66A5834D3A38A0E4870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd658447-f28c-488d-6611-08d6da8cb8a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3606; 
x-ms-traffictypediagnostic: BYAPR12MB3606:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB3606E52ECFA0E5F5C24C8DD6FE0B0@BYAPR12MB3606.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(39860400002)(136003)(396003)(13464003)(199004)(189003)(446003)(4326008)(316002)(305945005)(110136005)(72206003)(99286004)(2906002)(54906003)(8676002)(81156014)(76176011)(68736007)(81166006)(186003)(486006)(11346002)(8936002)(478600001)(476003)(6506007)(26005)(53546011)(102836004)(7736002)(25786009)(7696005)(66066001)(6246003)(86362001)(2501003)(76116006)(74316002)(64756008)(52536014)(66556008)(66446008)(5660300002)(256004)(71190400001)(71200400001)(66476007)(6436002)(229853002)(6116002)(53936002)(3846002)(6306002)(966005)(9686003)(55016002)(73956011)(66946007)(14454004)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3606;
 H:BYAPR12MB3048.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xLJplNSY3NB/d5tnWukVgAllEDom/YCQwJFEpHLq7Dkn8fT814mO3+rnESH0o2cIhVSTMEglG5lgQBlQa0XucIh0f2y1VrB07EA3c8jIHdlIH4C0lt2gQmUC/fHfoj/zdpAGeUL4wEizxzhG/11SGBifgpWxoWwwyd/qwHq7jDjfZ5dzsqtf+bYz1earn8/zA8XYMQxyfqAboGamMu1SCngc0njx4B/ufT/3Z3n9HrLtCkJjT3aQaME2AXQ+fEhszLMx4G03yipFPaW7KHely7NpgfLqC3z3lt8qJjVzYMOVRO09lH5sV9u8XZRMig8mktoJi0hPbuftR42oejfaF5OVcLcYW9rPnTWsdmLm+l5XGElKDIvRdC+OffbUH+e55VUvpBLYrfXOPCo1FBM5BOoN0FERnOwaMUjiRrg02XM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd658447-f28c-488d-6611-08d6da8cb8a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 05:58:44.5307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3606
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhoIGX+2EfbvbmRS/V3gxbbJZw8UBxbdDQpDKpG3QUY=;
 b=HV02p93gxH6MUpboR0uul6zrw9VtOba6io98kQEFZ6Ayv9AVhZAjikMslvaLuMspKUTGJMCeryhFIulB6mDdRBAgjz9oywsVChNfyi/c724p9/vIEwh1IFZa47QLyXKTJP+KBlXo1AjTHtrEUumGVu7eLwbzm//5Ko4Uun2ulXg=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgUGFuLCBYaW5odWkNClNlbnQ6IEZyaWRheSwgTWF5
IDE3LCAyMDE5IDExOjA0IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBIdWFuZywg
SmluSHVpRXJpYyA8SmluSHVpRXJpYy5IdWFuZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBk
cm0vYW1kZ3B1OiBjYW5jZWwgbGF0ZV9pbml0X3dvcmsgYmVmb3JlIGdwdSByZXNldA0KDQpbQ0FV
VElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCmdwdSByZXNldCB3aWxsIHJ1biBsYXRlX2luaXQgYW5k
IHNjaGVkdWxlIHRoZSBsYXRlX2luaXRfd29yay4gIGlmIHdlIGtlZXAgdHJpZ2dlcmluZyBncHUg
cmVzZXQgaW4gYSBzaG9ydCB0aW1lLCB0aGVyZSBhcmUgcG90ZW5pYWwgcmFjZXMuDQoNClNpZ25l
ZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1aS5wYW5AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDIgKysNCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMNCmluZGV4IGVjYjk5YWVhYjZjZi4uMjQxY2QyYzc1NDMzIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCkBAIC0zNjM2LDYgKzM2MzYsOCBA
QCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCg0KICAgICAgICBkZXZfaW5mbyhhZGV2LT5kZXYsICJHUFUgcmVzZXQgYmVnaW4hXG4iKTsN
Cg0KKyAgICAgICBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmFkZXYtPmxhdGVfaW5pdF93b3Jr
KTsNCisNCiAgICAgICAgaGl2ZSA9IGFtZGdwdV9nZXRfeGdtaV9oaXZlKGFkZXYsIGZhbHNlKTsN
Cg0KICAgICAgICAvKg0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
