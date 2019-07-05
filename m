Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3B600AC
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 07:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7BF6E40C;
	Fri,  5 Jul 2019 05:36:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690065.outbound.protection.outlook.com [40.107.69.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7DB6E40C
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 05:35:59 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB4096.namprd12.prod.outlook.com (52.135.50.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 05:35:57 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b475:24f4:8515:731%4]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 05:35:57 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v4] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVL75DJwZOErPEzU6MjZqJYrnFlaa5zAywgAG7cNA=
Date: Fri, 5 Jul 2019 05:35:57 +0000
Message-ID: <MN2PR12MB33128ED5E073B14FD8B13B04FAF50@MN2PR12MB3312.namprd12.prod.outlook.com>
References: <1561952220-5526-1-git-send-email-flora.cui@amd.com>
 <MN2PR12MB331205B8AD6A1389A7519A04FAFA0@MN2PR12MB3312.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB331205B8AD6A1389A7519A04FAFA0@MN2PR12MB3312.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 290d8ff3-2d18-4c40-80e0-08d7010aa814
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4096; 
x-ms-traffictypediagnostic: MN2PR12MB4096:
x-microsoft-antispam-prvs: <MN2PR12MB4096367637E6EB39E74B98D7FAF50@MN2PR12MB4096.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(13464003)(199004)(189003)(7736002)(26005)(7696005)(76176011)(102836004)(2906002)(64756008)(52536014)(6506007)(66446008)(53546011)(446003)(74316002)(6246003)(99286004)(6916009)(55016002)(66556008)(476003)(305945005)(25786009)(76116006)(2351001)(73956011)(66946007)(86362001)(66476007)(72206003)(53936002)(316002)(71200400001)(478600001)(66066001)(6116002)(486006)(71190400001)(2501003)(3846002)(186003)(81166006)(33656002)(8676002)(68736007)(229853002)(8936002)(5640700003)(11346002)(6436002)(5660300002)(14454004)(256004)(9686003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4096;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q+pEQth1NvulOtAurU+1/nIungLtp83mXFrGJq8ix4yAG7eNhijWnn2kowLM1qzT4MY+boRTZXKhCtogxoy10+YVed8EZ/oVOz6dhECrdlRPpfyiung+Ubl3fqMFKfjhuix19FaBmzH/HPpgiXDsbPHz3IDkTTypxp+/yEmRtp/0aYi7ZqKpMYNZ26WikLV8pHxQBo7rZXJgCpogDlZOyOp9LCqJvD9mHIpevKjw/DW8jqxWH8T6Ev2A4chT1UTfbZHqRcht6fevfMThFOJk/9aTC3DS+0mxImeyKTmKJoGnmNIPuNuJX/pYKOqzRMt3qHU0R7JbUO2o87//yGWXEyEXXsfO6bmIt878sHjZRLdDmaD0WhriZIUTwc3j40E2S7W3IUhZm5IEZjMq1A+tZeHfJFEqribfVNBXRxUxyOE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290d8ff3-2d18-4c40-80e0-08d7010aa814
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 05:35:57.5492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jDFzI143Ux4fpfreNk5G+M4D/wihxcc+DTzLo1FKBc=;
 b=IYB6xPQ+ljNKKQttoMOkGevmqAZ2QmU09rHi5ILatEADRyv3HWHdvGZwueFEdH/lRBda96RdB9NFnzwpVLUx/Uepiys5W6/ioLRH1350X+fsTMnK1NmEvFllntOQwX26oteBam5kyqEDrY7LghjIYDBarMQNPNV+Fm0Hp+hGhcM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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

UGluZy4uLg0KQ291bGQgYW55b25lIGdpdmUgbWUgYSByYj8NCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEN1aSwgRmxvcmEgDQpTZW50OiBUaHVyc2RheSwgSnVseSA0LCAyMDE5
IDExOjA5IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJF
OiBbUEFUQ0ggdjRdIGRybS9hbWRncHU6IGZpeCBzY2hlZHVsZXIgdGltZW91dCBjYWxjDQoNClBp
bmcuLi4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEN1aSwgRmxvcmEgPEZs
b3JhLkN1aUBhbWQuY29tPiANClNlbnQ6IE1vbmRheSwgSnVseSAxLCAyMDE5IDExOjM3IEFNDQpU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDdWksIEZsb3JhIDxGbG9yYS5D
dWlAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCB2NF0gZHJtL2FtZGdwdTogZml4IHNjaGVkdWxl
ciB0aW1lb3V0IGNhbGMNCg0Kc2NoZWR1bGVyIHRpbWVvdXQgaXMgaW4gamlmZmllcw0KdjI6IG1v
dmUgdGltZW91dCBjaGVjayB0byBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5n
cyBhZnRlciBwYXJzaW5nIHRoZSB2YWx1ZQ0KdjM6IGFkZCBsb2NrdXBfdGltZW91dCBwYXJhbSBj
aGVjay4gMDoga2VlcCBkZWZhdWx0IHZhbHVlLiBuZWdhdGl2ZToNCmluZmluaXR5IHRpbWVvdXQu
DQp2NDogcmVmYWN0b3IgY29kZXMuDQoNCkNoYW5nZS1JZDogSTI2NzA4YzE2M2RiOTQzZmY4ZDkz
MGRkODFiY2FiNGI0YjlkODRlYjINClNpZ25lZC1vZmYtYnk6IEZsb3JhIEN1aSA8ZmxvcmEuY3Vp
QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
fCAxMyArKysrKysrKystLS0tDQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KaW5k
ZXggZTc0YTE3NS4uZTQ0OGY4ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jDQpAQCAtMjQ1LDcgKzI0NSw4IEBAIG1vZHVsZV9wYXJhbV9uYW1lZChtc2ksIGFtZGdw
dV9tc2ksIGludCwgMDQ0NCk7DQogICogQnkgZGVmYXVsdCh3aXRoIG5vIGxvY2t1cF90aW1lb3V0
IHNldHRpbmdzKSwgdGhlIHRpbWVvdXQgZm9yIGFsbCBub24tY29tcHV0ZShHRlgsIFNETUEgYW5k
IFZpZGVvKQ0KICAqIGpvYnMgaXMgMTAwMDAuIEFuZCB0aGVyZSBpcyBubyB0aW1lb3V0IGVuZm9y
Y2VkIG9uIGNvbXB1dGUgam9icy4NCiAgKi8NCi1NT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90aW1l
b3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0IGluIG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9uLWNv
bXB1dGUgam9icyBhbmQgbm8gdGltZW91dCBmb3IgY29tcHV0ZSBqb2JzKSwgIg0KK01PRFVMRV9Q
QVJNX0RFU0MobG9ja3VwX3RpbWVvdXQsICJHUFUgbG9ja3VwIHRpbWVvdXQgaW4gbXMgKGRlZmF1
bHQ6IDEwMDAwIGZvciBub24tY29tcHV0ZSBqb2JzIGFuZCBpbmZpbml0eSB0aW1lb3V0IGZvciBj
b21wdXRlIGpvYnMuIg0KKwkJIiAwOiBrZWVwIGRlZmF1bHQgdmFsdWUuIG5lZ2F0aXZlOiBpbmZp
bml0eSB0aW1lb3V0KSwgIg0KIAkJImZvcm1hdCBpcyBbTm9uLUNvbXB1dGVdIG9yIFtHRlgsQ29t
cHV0ZSxTRE1BLFZpZGVvXSIpOyAgbW9kdWxlX3BhcmFtX3N0cmluZyhsb2NrdXBfdGltZW91dCwg
YW1kZ3B1X2xvY2t1cF90aW1lb3V0LCBzaXplb2YoYW1kZ3B1X2xvY2t1cF90aW1lb3V0KSwgMDQ0
NCk7DQogDQpAQCAtMTMwMCw3ICsxMzAxLDggQEAgaW50IGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90
aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAkgKiBCeSBkZWZh
dWx0IHRpbWVvdXQgZm9yIG5vbiBjb21wdXRlIGpvYnMgaXMgMTAwMDAuDQogCSAqIEFuZCB0aGVy
ZSBpcyBubyB0aW1lb3V0IGVuZm9yY2VkIG9uIGNvbXB1dGUgam9icy4NCiAJICovDQotCWFkZXYt
PmdmeF90aW1lb3V0ID0gYWRldi0+c2RtYV90aW1lb3V0ID0gYWRldi0+dmlkZW9fdGltZW91dCA9
IDEwMDAwOw0KKwlhZGV2LT5nZnhfdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMoMTAwMDApOw0K
KwlhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1lb3V0ID0gYWRldi0+Z2Z4X3Rp
bWVvdXQ7DQogCWFkZXYtPmNvbXB1dGVfdGltZW91dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOw0K
IA0KIAlpZiAoc3RybmxlbihpbnB1dCwgQU1ER1BVX01BWF9USU1FT1VUX1BBUkFNX0xFTlRIKSkg
eyBAQCAtMTMxMCwxMCArMTMxMiwxMyBAQCBpbnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVv
dXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCQkJaWYgKHJldCkNCiAJ
CQkJcmV0dXJuIHJldDsNCiANCi0JCQkvKiBJbnZhbGlkYXRlIDAgYW5kIG5lZ2F0aXZlIHZhbHVl
cyAqLw0KLQkJCWlmICh0aW1lb3V0IDw9IDApIHsNCisJCQlpZiAodGltZW91dCA9PSAwKSB7DQog
CQkJCWluZGV4Kys7DQogCQkJCWNvbnRpbnVlOw0KKwkJCX0gZWxzZSBpZiAodGltZW91dCA8IDAp
IHsNCisJCQkJdGltZW91dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOw0KKwkJCX0gZWxzZSB7DQor
CQkJCXRpbWVvdXQgPSBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpOw0KIAkJCX0NCiANCiAJCQlz
d2l0Y2ggKGluZGV4KyspIHsNCi0tDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
