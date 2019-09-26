Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75135BFB4E
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 00:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D508D6EE15;
	Thu, 26 Sep 2019 22:26:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800073.outbound.protection.outlook.com [40.107.80.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB1A6EE15
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 22:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieSs/Ax/uUQRN0bSHDl6T7EY2MQpaL7T2soPk9tlLRl7X1iZw6sA5RErCkNNr5JKNNCgL4dpPqSYcap+YnkUk6pPznofd1UV5STvu9QPHOMqd3IkM2GUoa1sdpjNhN5xerHE6nBME5QmKypdYDO3sTejgbsO+ZLn1FfRK0co7f9aZ4eZVI+58dI0KvdcvVpZ/7pUxHjqyMMxufge1+REftLwOv1BNeIEV5CUhRvSwcBGMPCLUyVYk31T6WCSH7RKta/6Mv9vMl0S1iuDeddTc3GEsc+Tn8VgLqzoy9zt+7VI2mSRJf/PXfyW00YHxNy2TW6mvsaZq+reHjjFsWdJ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFYqvFRy0O24yrvZQTi7PbqBg6BWAaHOequ71GSHGS0=;
 b=e0j+vQYi9MY+Kdbol+6JiULN3ts6JQe0HI0laNxxvc8Ih7Q1tLwKCpcwZWA3IxkJsL2PjtaFol5jfRz4FzyBHDWfhIrLvsu2vdy49ufqF8l1qEs57GdGlInIJKdNWtvExkCTp4jIWohGQBr6UfXW3mMgEWo231Q0zq2dDT/q0BKUjjXivpv2rcc6NS+VlldnvwdpFpkHRfPjIGY4n410Z5vFK//JBaYe2A9d+f2hKrUPrAx/UwsWpjce7/pRITQwbR9Isv9/rocS2putvqu4TeNgzV9rHYQRBsnRrgtDStgWbjLxrzNgIo4HUlzA/PJ5P4Q1NEMRmKfM3p1eonD50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2697.namprd12.prod.outlook.com (20.176.116.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Thu, 26 Sep 2019 22:26:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 22:26:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic for
 gfxhub 2.0
Thread-Topic: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic for
 gfxhub 2.0
Thread-Index: AQHVc8093kQ+hgY+9kmNX+wTQoEqTKc+i1kA
Date: Thu, 26 Sep 2019 22:26:45 +0000
Message-ID: <5d25ca56-6604-c7dc-a669-f0feabd5dc5f@amd.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>
In-Reply-To: <20190925181527.17091-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::26) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e357cc6c-7ff3-4bb5-3397-08d742d09d1b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2697; 
x-ms-traffictypediagnostic: DM6PR12MB2697:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB26972FFEB92012A829A21E1F92860@DM6PR12MB2697.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:129;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(66476007)(81166006)(76176011)(26005)(6506007)(386003)(99286004)(53546011)(7736002)(305945005)(5660300002)(102836004)(65956001)(66066001)(6512007)(14454004)(36756003)(478600001)(65806001)(3846002)(2501003)(2906002)(6436002)(64756008)(66446008)(66556008)(6116002)(186003)(6486002)(66946007)(71200400001)(71190400001)(25786009)(110136005)(58126008)(229853002)(256004)(11346002)(446003)(6246003)(8936002)(86362001)(31696002)(81156014)(8676002)(31686004)(316002)(2616005)(476003)(52116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2697;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a9hZNIdJRb1VxZZKKa91zYSB7hUzedVf8A7+FonnYBNewXJ3amUJYdki98apjoBBFHY9wEORgSaP7SkNI55+T0d0hAPNs8HqDqbb2H5PmVVpSHv84mDLRLDaedu77UW71m9daW18DrewjsH//UYA45+p8eyGqpPN01o0yTD5/TgMHXnPMVWdCAMTVL62+A6+rn5DqYiv9zIqJeZ58j368zSf8Qp/KGxzV+DFS8CmXxXByzMMU8i4+9mUHlOAZtunXw70TWQ6vIvHpLwA7A28a6pjjbsdB/e1Pxdi5FzZlN/bX831EXpHHkuOe/kqKnxrzvEjKGBMSPxa3mpo+EDecCOL5aYctTlXRSMnWTph7O4WXzNI176iIa9pEQkEQfIMmnxwOTafwrGQd5hhMzJoLWGPGOjqjhEhYhSTRoWCZf4=
Content-ID: <4A228AF30E192343A611D52143D8D00B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e357cc6c-7ff3-4bb5-3397-08d742d09d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 22:26:45.4509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TmsDOwxYcSTxx/a2d/tAfw8DyR2yycYiM822r2cmMRuzfekI0rw49ciziw3Tw8zJ538IzwabM3xCpYyTGuWWag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2697
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFYqvFRy0O24yrvZQTi7PbqBg6BWAaHOequ71GSHGS0=;
 b=FiKV33rWnp/qBIHC50puUm864/O4b7K0o00JNzI9gz2cRIe/C/YuoEqmEE2z4RrRpZVWNsZqREhiScXYxxtZRAhwzuki9rbbkzWOotjFakg5fuLGipszlcNPFqK5yiuyFptmtI8IXe+LLnYduKQOg86Ke8mOJn2XSoZS4hkI2hc=
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

Rm9yIEdGWHY5IHlvdSBtYWRlIGFuIGVxdWl2YWxlbnQgY2hhbmdlIGZvciBib3RoIEdGWEh1YiBh
bmQgTU1IdWIgDQooImRybS9hbWRncHU6IEV4cG9zZSAqX3NldHVwX3ZtX3B0X3JlZ3MgZm9yIGtm
ZCB0byB1c2UiKS4gWW91ciBHRlh2OSANCmNvbW1pdCB3YXMgYWxzbyByZXZpZXdlZCBieSBBbGV4
IGFuZCBDaHJpc3RpYW4uIFlvdSBzaG91bGQgZ2V0IGF0IGxlYXN0IA0Kb25lIG9mIHRoZW0gdG8g
QWNrIG9yIFJldmlldyB0aGlzIGNoYW5nZS4NCg0KRm9yIEdGWHYxMCB5b3UncmUgb25seSBjaGFu
Z2luZyB0aGUgR0ZYSHViLiBJIHN1c3BlY3QgdGhhdCdzIGJlY2F1c2UgS0ZEIA0KZG9lc24ndCBj
YXJlIGFib3V0IE1NSHViIG9uIEdGWHYxMC4gVGhhdCdzIGZpbmUgd2l0aCBtZS4NCg0KWW91IGNh
biBhZGQNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4NCg0KVGhhbmtzLA0KIMKgIEZlbGl4DQoNCk9uIDIwMTktMDktMjUgMjoxNSBwLm0uLCBaaGFv
LCBZb25nIHdyb3RlOg0KPiBUaGUgS0ZEIGNvZGUgd2lsbCBjYWxsIHRoaXMgZnVuY3Rpb24gbGF0
ZXIuDQo+DQo+IENoYW5nZS1JZDogSTg4YTUzMzY4Y2RlZTcxOWIyYzc1MzkzZTVjZGJkODI5MDU4
NDU0OGUNCj4gU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYyB8IDIwICsr
KysrKysrKysrKy0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHVi
X3YyXzAuaCB8ICAyICsrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4aHViX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8w
LmMNCj4gaW5kZXggYTkyMzg3MzVkMzYxLi5iNjAxYzY3NDBlZjUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYw0KPiBAQCAtNDYsMjEgKzQ2LDI1IEBAIHU2
NCBnZnhodWJfdjJfMF9nZXRfbWNfZmJfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQ0KPiAgIAlyZXR1cm4gKHU2NClSUkVHMzJfU09DMTUoR0MsIDAsIG1tR0NNQ19WTV9GQl9PRkZT
RVQpIDw8IDI0Ow0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB2b2lkIGdmeGh1Yl92Ml8wX2luaXRf
Z2FydF9wdF9yZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiArdm9pZCBnZnhodWJf
djJfMF9zZXR1cF92bV9wdF9yZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJf
dCB2bWlkLA0KPiArCQkJCXVpbnQ2NF90IHBhZ2VfdGFibGVfYmFzZSkNCj4gICB7DQo+IC0JdWlu
dDY0X3QgdmFsdWUgPSBhbWRncHVfZ21jX3BkX2FkZHIoYWRldi0+Z2FydC5ibyk7DQo+ICsJLyog
dHdvIHJlZ2lzdGVycyBkaXN0YW5jZSBiZXR3ZWVuIG1tR0NWTV9DT05URVhUMF8qIHRvIG1tR0NW
TV9DT05URVhUMV8qICovDQo+ICsJaW50IG9mZnNldCA9IG1tR0NWTV9DT05URVhUMV9QQUdFX1RB
QkxFX0JBU0VfQUREUl9MTzMyDQo+ICsJCQktIG1tR0NWTV9DT05URVhUMF9QQUdFX1RBQkxFX0JB
U0VfQUREUl9MTzMyOw0KPiAgIA0KPiArCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tR0NW
TV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQUREUl9MTzMyLA0KPiArCQkJCW9mZnNldCAqIHZt
aWQsIGxvd2VyXzMyX2JpdHMocGFnZV90YWJsZV9iYXNlKSk7DQo+ICAgDQo+IC0JV1JFRzMyX1NP
QzE1KEdDLCAwLCBtbUdDVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfTE8zMiwNCj4g
LQkJICAgICBsb3dlcl8zMl9iaXRzKHZhbHVlKSk7DQo+IC0NCj4gLQlXUkVHMzJfU09DMTUoR0Ms
IDAsIG1tR0NWTV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQUREUl9ISTMyLA0KPiAtCQkgICAg
IHVwcGVyXzMyX2JpdHModmFsdWUpKTsNCj4gKwlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBt
bUdDVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfSEkzMiwNCj4gKwkJCQlvZmZzZXQg
KiB2bWlkLCB1cHBlcl8zMl9iaXRzKHBhZ2VfdGFibGVfYmFzZSkpOw0KPiAgIH0NCj4gICANCj4g
ICBzdGF0aWMgdm9pZCBnZnhodWJfdjJfMF9pbml0X2dhcnRfYXBlcnR1cmVfcmVncyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCj4gICB7DQo+IC0JZ2Z4aHViX3YyXzBfaW5pdF9nYXJ0X3B0
X3JlZ3MoYWRldik7DQo+ICsJdWludDY0X3QgcHRfYmFzZSA9IGFtZGdwdV9nbWNfcGRfYWRkcihh
ZGV2LT5nYXJ0LmJvKTsNCj4gKw0KPiArCWdmeGh1Yl92Ml8wX3NldHVwX3ZtX3B0X3JlZ3MoYWRl
diwgMCwgcHRfYmFzZSk7DQo+ICAgDQo+ICAgCVdSRUczMl9TT0MxNShHQywgMCwgbW1HQ1ZNX0NP
TlRFWFQwX1BBR0VfVEFCTEVfU1RBUlRfQUREUl9MTzMyLA0KPiAgIAkJICAgICAodTMyKShhZGV2
LT5nbWMuZ2FydF9zdGFydCA+PiAxMikpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eGh1Yl92Ml8wLmgNCj4gaW5kZXggMDY4MDc5NDA3NDhiLi4zOTJiOGNkOTRmYzAgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuaA0KPiBAQCAtMzEsNSArMzEs
NyBAQCB2b2lkIGdmeGh1Yl92Ml8wX3NldF9mYXVsdF9lbmFibGVfZGVmYXVsdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4gICAJCQkJCSAgYm9vbCB2YWx1ZSk7DQo+ICAgdm9pZCBnZnho
dWJfdjJfMF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gICB1NjQgZ2Z4aHVi
X3YyXzBfZ2V0X21jX2ZiX29mZnNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICt2
b2lkIGdmeGh1Yl92Ml8wX3NldHVwX3ZtX3B0X3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQzMl90IHZtaWQsDQo+ICsJCQkJdWludDY0X3QgcGFnZV90YWJsZV9iYXNlKTsNCj4g
ICANCj4gICAjZW5kaWYNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
