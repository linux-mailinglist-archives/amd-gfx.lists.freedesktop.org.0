Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5E8A0521
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 16:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9F889CB5;
	Wed, 28 Aug 2019 14:38:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690046.outbound.protection.outlook.com [40.107.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4C189CB5
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 14:38:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhKTdobfcxLez2QdBPkr/RekpRW8R4onhA+pbc+RdIujiGVOy19Et2tSyCFcJq9JO5tcMzXFWWl61XojSW5SbyucdXhxNa6yDotJyfsUCriyJ+S14eamj5s8gBrYbz8ziSyDIHOGtKDtcGjT03HDQf58xbnSv+RGSQuYuX6nKYZyFCLl8bXgFbnF4RNfRjYv0lO6aBdtLV53xOFnDhOLr7yrKYAvmpF+64oq27e+qr24g9E8X11ngp32emJHoICnQQz6khQ3BUZT1aD4hOmu4vA3YHk8cjn7hATCDa6hJ1C7t2o5SoywSHsqGAFkNIqEzfFomriF0xGnrvIQLutBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o+G0oWZ4pjfz8S5XkGFYosS9KxeLXxsGXB3ypGCK5s=;
 b=V1fQUbfezjNILS5D7fA/JwJV8BEMk3DKO+2bWZBAifP+iAQVM4pvgo9IS4Hd5lio/6xCTvyRPQQFKHjh7PRzyo+LcPxV2yceqMsU1cAE27HhztffrPFHYIrvzNGzYw2DQhWMNcMZCiMkcNPTsehHVfNetb1W+4dN7sFaQ8Pr6cz+tasYEiIxtmO1HTF6iZWG0+Mf10ATy6QHT6L1+NodnQLLBidw82svnoZvA/WkHaJEbIBx7Qhjzc1r/jbv1tC+DwTBuqsaio98x7HAA4XIFAgZNUV/TLjjfm2iixwHm4AQAjEap6qqyV5IVZtwEeWK91oPblxDUwuZ6uAKAcDrLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1326.namprd12.prod.outlook.com (10.169.205.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Wed, 28 Aug 2019 14:38:56 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4047:39c1:ac17:3813%6]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 14:38:56 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Handle job is NULL use case in
 amdgpu_device_gpu_recover
Thread-Topic: [PATCH] drm/amdgpu: Handle job is NULL use case in
 amdgpu_device_gpu_recover
Thread-Index: AQHVXQOrn9fm8u+Ua0mBA0QLJpx17acQopmA
Date: Wed, 28 Aug 2019 14:38:56 +0000
Message-ID: <28c158b4-6220-45e8-8a90-879f4f60e486@amd.com>
References: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::47) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 841c68d4-5b1f-47bb-8210-08d72bc57481
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1326; 
x-ms-traffictypediagnostic: MWHPR12MB1326:
x-microsoft-antispam-prvs: <MWHPR12MB132662D74A7543D6871ECFB1EAA30@MWHPR12MB1326.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(189003)(199004)(66556008)(7736002)(305945005)(14454004)(86362001)(66946007)(66446008)(64756008)(66066001)(478600001)(26005)(8936002)(2906002)(66476007)(25786009)(6486002)(76176011)(476003)(6916009)(71190400001)(486006)(71200400001)(186003)(5660300002)(6246003)(2616005)(102836004)(316002)(8676002)(31696002)(2501003)(31686004)(81156014)(256004)(3846002)(6116002)(5640700003)(6512007)(446003)(52116002)(99286004)(2351001)(36756003)(6436002)(53936002)(386003)(81166006)(6506007)(229853002)(14444005)(53546011)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1326;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kgHWc+QPHlxse1ed8kSVhlFN4M16ilYy1WMjEQ6Ep8YZhkwPYZU+h1tiXZ5fYtD3BM7q7ofA+O7CEG/ZEhaE2TuQfM0mj5n3kBlxJgeaOU14dEvQwpPmZwURpEnkKVtB9GkOkxoEVmK+YTC+ug94+jE3WD+uTHfkXvcVixV8xiDwiL2pejPVSWDIqJl5EbfUmzoIsvs3Affrqc2QtQHyRes2nhzDX6TOjXM6sdef3MzZBmQ9j9VtibAxRvs/gH/vDaIodvmiEKeyjHRRV7sosf+jmerVJbWuW+sRbAw1IyXet72PJo7KSMCybX58uBf4Nwdw+K2JXvkAf9VbgB7humEhrzXfFXBhWYXzxLRbu/jsscDeRarsCXwUZ1gMWYkfTfP2J7AWsDASIQo9rerlPbD53S3PN4bhpX12aYzObZo=
x-ms-exchange-transport-forked: True
Content-ID: <8FFA207E575F7B449A7A2566EB5B36AB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841c68d4-5b1f-47bb-8210-08d72bc57481
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 14:38:56.2159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2so+rv8vYOLHrTbRGul/DUkdRX6OOP5PEA7efKtReTIkyGHs82WMQAo0j5TtalbYMgt2kMLUrfT/dcGCHEE5UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1326
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o+G0oWZ4pjfz8S5XkGFYosS9KxeLXxsGXB3ypGCK5s=;
 b=KfkAMP0VtmU+ykYpgR06U/A3HrT0FeX90c1UbbhMrEuBlX0f79PQQ2yQaYrlo0FVMTs32M9F4upXPvCG9tY3Pdm3dzuk7El3/TbyRpgYXqBPyQAyaDTRefCeStqOjWs+BftQ6lyeUPIkuegXxm7CjE6kUX7OMcVlL5TFgbRRlGM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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

UGluZw0KDQpBbmRyZXkNCg0KT24gOC8yNy8xOSAyOjE3IFBNLCBBbmRyZXkgR3JvZHpvdnNreSB3
cm90ZToNCj4gVGhpcyBzaG91bGQgYmUgY2hlY2tlZCBhdCBhbGwgcGxhY2VzIGpvYiBpcyBhY2Nl
c3NlZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9k
em92c2t5QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDggKysrKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jDQo+IGluZGV4IDAyYjNlN2QuLjE5MGQ5YTMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gQEAgLTM3OTAsMTQgKzM3
OTAsMTQgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQo+ICAgDQo+ICAgCWlmIChoaXZlICYmICFtdXRleF90cnlsb2NrKCZoaXZlLT5y
ZXNldF9sb2NrKSkgew0KPiAgIAkJRFJNX0lORk8oIkJhaWxpbmcgb24gVERSIGZvciBzX2pvYjol
bGx4LCBoaXZlOiAlbGx4IGFzIGFub3RoZXIgYWxyZWFkeSBpbiBwcm9ncmVzcyIsDQo+IC0JCQkg
am9iLT5iYXNlLmlkLCBoaXZlLT5oaXZlX2lkKTsNCj4gKwkJCSAgam9iID8gam9iLT5iYXNlLmlk
IDogLTEsIGhpdmUtPmhpdmVfaWQpOw0KPiAgIAkJcmV0dXJuIDA7DQo+ICAgCX0NCj4gICANCj4g
ICAJLyogU3RhcnQgd2l0aCBhZGV2IHByZSBhc2ljIHJlc2V0IGZpcnN0IGZvciBzb2Z0IHJlc2V0
IGNoZWNrLiovDQo+ICAgCWlmICghYW1kZ3B1X2RldmljZV9sb2NrX2FkZXYoYWRldiwgIWhpdmUp
KSB7DQo+ICAgCQlEUk1fSU5GTygiQmFpbGluZyBvbiBURFIgZm9yIHNfam9iOiVsbHgsIGFzIGFu
b3RoZXIgYWxyZWFkeSBpbiBwcm9ncmVzcyIsDQo+IC0JCQkJCSBqb2ItPmJhc2UuaWQpOw0KPiAr
CQkJICBqb2IgPyBqb2ItPmJhc2UuaWQgOiAtMSk7DQo+ICAgCQlyZXR1cm4gMDsNCj4gICAJfQ0K
PiAgIA0KPiBAQCAtMzgzOCw3ICszODM4LDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292
ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCQkJaWYgKCFyaW5nIHx8ICFyaW5n
LT5zY2hlZC50aHJlYWQpDQo+ICAgCQkJCWNvbnRpbnVlOw0KPiAgIA0KPiAtCQkJZHJtX3NjaGVk
X3N0b3AoJnJpbmctPnNjaGVkLCAmam9iLT5iYXNlKTsNCj4gKwkJCWRybV9zY2hlZF9zdG9wKCZy
aW5nLT5zY2hlZCwgam9iID8gJmpvYi0+YmFzZSA6IE5VTEwpOw0KPiAgIAkJfQ0KPiAgIAl9DQo+
ICAgDQo+IEBAIC0zODY0LDcgKzM4NjQsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3Zl
cihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICANCj4gICAJLyogR3VpbHR5IGpvYiB3
aWxsIGJlIGZyZWVkIGFmdGVyIHRoaXMqLw0KPiAgIAlyID0gYW1kZ3B1X2RldmljZV9wcmVfYXNp
Y19yZXNldChhZGV2LA0KPiAtCQkJCQkgam9iLA0KPiArCQkJCQkgam9iID8gam9iIDogTlVMTCwN
Cj4gICAJCQkJCSAmbmVlZF9mdWxsX3Jlc2V0KTsNCj4gICAJaWYgKHIpIHsNCj4gICAJCS8qVE9E
TyBTaG91bGQgd2Ugc3RvcCA/Ki8NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
