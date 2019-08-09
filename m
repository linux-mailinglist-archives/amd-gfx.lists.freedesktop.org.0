Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C68773F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 12:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BD66ED6F;
	Fri,  9 Aug 2019 10:28:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730069.outbound.protection.outlook.com [40.107.73.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D586ED6F
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 10:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgmRuG+oBw3jW8OptnRbunedsiLpu78nXRdGzAHRGGCFJaxw69TusZjroDqjAlDz0GsZCYSYRrFfUGmTQtUlYfGZKxBmpiUfrLzsAY4gPKw2o/br6UPL4WYB4j0kBAByxiw88MFmMKdG+Jq/j+mXua88qKaOtEJBGZXKXSsWyWWVWjZ1B45w/bVoKcvP7SrkGmeTM9EdJeHcknUMLHgQafYxTEzQEVd46KR+oej0uEzWYIbVAKCzoUv6pNnG6qsz4JtrWRBgm0YuTYectTBT94KFPxeLv88OowomMC68Fsf5lt2uwsK4VE2sW3wF2uAWNMkhxVC0aVciv7ik5BqIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z9fPUW1Sv7jrF66+ueIKbpnxF7AhilY3f6uidlZCbc=;
 b=TLV1+CFQj0wrUMGlzA3XEqtTI0ookrqgRwFi5PDOn5X2ypK6BCN6Aof4x6HSALdUVhPhg9AwY++fs/nrsADhAZYMQSc7fz/NMLG0zbXDRG+34Ih+FDA4eYNE+rIPr3OB+Q/t51M7FYtnm+CRWgshNZcvpd/zwKEbd/Xgz/F+K6rfb4H2Tk0C0l4J/BZsvCCifDsQ0sAtkCygY1D0wyQVB8m/w5aOyaqZUbGR0nTR+Uo0yjboVi2hLNLD1jptgftcSfYuImUAF3Ek2xLvE93KVcqAANyo5ul3EQ571SNHeqdi1XPB3+Yh1m8hdg/Tl1S+3Gl1Or1GZbCDWmmGZDXMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1424.namprd12.prod.outlook.com (10.169.206.135) by
 MWHPR12MB1773.namprd12.prod.outlook.com (10.175.52.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 10:28:34 +0000
Received: from MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::4061:e090:8f35:22d1]) by MWHPR12MB1424.namprd12.prod.outlook.com
 ([fe80::4061:e090:8f35:22d1%3]) with mapi id 15.20.2157.020; Fri, 9 Aug 2019
 10:28:34 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Russell, Kent" <Kent.Russell@amd.com>
Subject: RE: [PATCH] drm/amdgpu: remove ras block's feature status info in
 sysfs
Thread-Topic: [PATCH] drm/amdgpu: remove ras block's feature status info in
 sysfs
Thread-Index: AQHVTpf1Lko2JXumkU+StXQLuSF+MabynMLQ
Date: Fri, 9 Aug 2019 10:28:34 +0000
Message-ID: <MWHPR12MB1424FCE0F9D5E8C7835EEE8AFCD60@MWHPR12MB1424.namprd12.prod.outlook.com>
References: <20190809095047.12372-1-tao.zhou1@amd.com>
In-Reply-To: <20190809095047.12372-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c0b325a-5806-4e19-3d8d-08d71cb45550
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1773; 
x-ms-traffictypediagnostic: MWHPR12MB1773:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB1773C2B3CCFE9D962853A29BFCD60@MWHPR12MB1773.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:158;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(199004)(189003)(13464003)(86362001)(446003)(2501003)(11346002)(476003)(305945005)(33656002)(316002)(110136005)(4326008)(7736002)(71190400001)(7696005)(486006)(186003)(71200400001)(76116006)(53546011)(6506007)(102836004)(6636002)(76176011)(66446008)(99286004)(66476007)(6436002)(256004)(66066001)(6246003)(26005)(64756008)(6116002)(3846002)(2906002)(66556008)(229853002)(74316002)(8936002)(66946007)(25786009)(55016002)(53936002)(8676002)(6306002)(81166006)(81156014)(52536014)(478600001)(14454004)(5660300002)(9686003)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1773;
 H:MWHPR12MB1424.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WBlzzQ+o1flwEcCesUWSW9/O8HTQMM7BEoR7vF9fSY7vRZE13O8rs317fQB/lFa+zz6rQjhL9qk31uIbzGCHESlFB25FlulBV6puPTPmZG4hGN0aeHpGJ9alEYhoDdDCIP/hbtYhHS6IGLExByc7vEnkNL2MZzxUT8kmxwkgavyzy/09ZdVvmpDTgyaV1fvBuDnAeWrChNWaKRpVTGYrjb+AANCcc7pFsswmb7kO3EobPPwm0gzMIFg0Xlj5TZhl2YVLCiPWgkqfoYFzTapLagHAP9J+vUJQXLvIVN5YU5jr0lS1LeRJN4LsCQScFckah0Su248F/5bcewWBXzYeXuMDBNf2tO53i90uxa5v2UzNa7K7LUNPML7puZ4NQnI7lT6PTCEdm21JT1t+By8zjcK7h5WDMeWzC+vAlBucXG8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0b325a-5806-4e19-3d8d-08d71cb45550
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 10:28:34.3899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whqqvQJPnR1Cyx6AMCO5J5BHBFo3SZE6ty2gLVK4goHkW8T6MiQDz/8j1Q/zZxCPLNGjcm0Aro8pMI/OLud1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1773
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z9fPUW1Sv7jrF66+ueIKbpnxF7AhilY3f6uidlZCbc=;
 b=p1bOhgfOdNuagG0/wkQ5U0qHu6GQsKkKzw+mBIeBLlwyT5z+JfrGGvVuKeMP7gO4dAeDveT67Fuz36CIphBIwHjzzZZCPvKHfiL5b1EG/5WtMVUzCQn/Y9Du+f9aET6J2cQQ1yI+QuyelmqF3PFDrikIVfdH0BX8JqjrrZXfBMI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1n
ZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBU
YW8gWmhvdQ0KU2VudDogMjAxOeW5tDjmnIg55pelIDE3OjUxDQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgRnJlZWhpbGwsIENo
cmlzIDxDaHJpcy5GcmVlaGlsbEBhbWQuY29tPjsgUnVzc2VsbCwgS2VudCA8S2VudC5SdXNzZWxs
QGFtZC5jb20+DQpDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQpTdWJqZWN0OiBb
UEFUQ0hdIGRybS9hbWRncHU6IHJlbW92ZSByYXMgYmxvY2sncyBmZWF0dXJlIHN0YXR1cyBpbmZv
IGluIHN5c2ZzDQoNCmZlYXR1cmUgbWFzayBpbmZvIGlzIGVub3VnaCBmb3Igcm9jbSB0b29sLCAi
Y2F0IC9zeXMvY2xhc3MvZHJtL2NhcmQwL2RldmljZS9yYXMvZmVhdHVyZXMiIHdpbGwgZ2V0IHRo
ZSBpbmZvIGxpa2UgdGhpczoNCg0KZmVhdHVyZSBtYXNrOiAweDNmZmINCg0KU2lnbmVkLW9mZi1i
eTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTkgKy0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCmluZGV4IGJlNTkxMDI1MjZhMS4uNTBjMTNiMDJkMjM0
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCkBAIC03OTEsMjUg
Kzc5MSw4IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9yYXNfc3lzZnNfZmVhdHVyZXNfcmVhZChz
dHJ1Y3QgZGV2aWNlICpkZXYsICB7DQogCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPQ0KIAkJY29u
dGFpbmVyX29mKGF0dHIsIHN0cnVjdCBhbWRncHVfcmFzLCBmZWF0dXJlc19hdHRyKTsNCi0Jc3Ry
dWN0IGRybV9kZXZpY2UgKmRkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCi0Jc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsNCi0Jc3RydWN0IHJhc19jb21t
b25faWYgaGVhZDsNCi0JaW50IHJhc19ibG9ja19jb3VudCA9IEFNREdQVV9SQVNfQkxPQ0tfQ09V
TlQ7DQotCWludCBpLCBlbmFibGVkOw0KLQlzc2l6ZV90IHM7DQotDQotCXMgPSBzY25wcmludGYo
YnVmLCBQQUdFX1NJWkUsICJmZWF0dXJlIG1hc2s6IDB4JXhcbiIsIGNvbi0+ZmVhdHVyZXMpOw0K
LQ0KLQlmb3IgKGkgPSAwOyBpIDwgcmFzX2Jsb2NrX2NvdW50OyBpKyspIHsNCi0JCWhlYWQuYmxv
Y2sgPSBpOw0KLQkJZW5hYmxlZCA9IGFtZGdwdV9yYXNfaXNfZmVhdHVyZV9lbmFibGVkKGFkZXYs
ICZoZWFkKTsNCi0NCi0JCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBBR0VfU0laRSAtIHMsDQot
CQkJCSIlcyByYXMgZmVhdHVyZSBtYXNrOiAlc1xuIiwNCi0JCQkJcmFzX2Jsb2NrX3N0cihpKSwg
ZW5hYmxlZD8ib24iOiJvZmYiKTsNCi0JfQ0KIA0KLQlyZXR1cm4gczsNCisJcmV0dXJuIHNjbnBy
aW50ZihidWYsIFBBR0VfU0laRSwgImZlYXR1cmUgbWFzazogMHgleFxuIiwgDQorY29uLT5mZWF0
dXJlcyk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19zeXNmc19jcmVhdGVfZmVhdHVy
ZV9ub2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KLS0NCjIuMTcuMQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5n
IGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
