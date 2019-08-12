Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67278A6D4
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 21:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EAF6E5B5;
	Mon, 12 Aug 2019 19:05:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720046.outbound.protection.outlook.com [40.107.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB086E5B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 19:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moDy0yj5N3NlyPvcl3RvFwQwld7JxYTF0D60N9dQxTjlNjNzoeddrL5wRjr5Mg+0HKoSD4w867Pfbe9MSwlzNGlRKu5MEJAOy//c67JxLds8NY3zjk/CQpJaTvpvS/jE62EHfIj6Y65T7A4KcYDT816xBSjxXXGBaDryW+Hu2GBDocsuBgXR669xSMYciReAQWC5I1Gi4r3n3FSMF3/C30F5OBiWTGNh4MiL5srG2+Uzk6o1U+gqPpDKEcSmHCIWxzPQith6rYVooX6hfEh4TQUlqk8tB2TEh07BowTtD3cuKKzC24zccNDQBUauDp/olYUTUEOv/LFn3dsbjSpRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePtxG0b0rsT2TsZlJwlzb5K1H9y/MZbW59e0mW01+jE=;
 b=kbrFW115LOL0fCXTsFGhTfJcBQcYyF1AY7nxIBTnk4XYWGWW7ssp1AUprOxLtMnHhNaEegL+S7T51IuEtz03FxxjmdiQo1sz+3RTRehJ6xIbHYFtuSPB1Rc65l/iHcKryfLHNaloSJibZ0Lu1ovE6jsYp6FLO+vuXWln5ZA2cjghdtGV66kkg8OcO1V/i6kFSkQqfbxCYprmXahidbHBsVr2tJZA7fcRVE6U7wp5PULbolMAAGNzIiWuY5XdkkdRsmCgo9Ta/Ngx2lnGNqyzuz/mA/5bq1nCoT4ejcbXaJgmgeOOdT1Eqasz6JStksn3fiWVvsYdzxM4Ik/MXPwnLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3017.namprd12.prod.outlook.com (20.178.30.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.22; Mon, 12 Aug 2019 19:05:49 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 19:05:49 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Add more page fault info printing for GFX10
Thread-Topic: [PATCH] drm/amdgpu: Add more page fault info printing for GFX10
Thread-Index: AQHVUUD0Aw8CgFboLk+X0obRH0/dMw==
Date: Mon, 12 Aug 2019 19:05:49 +0000
Message-ID: <20190812190536.22744-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69f4692e-9f5b-41a7-8c51-08d71f58169a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3017; 
x-ms-traffictypediagnostic: DM6PR12MB3017:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3017B3C4D409253359A5ED4FF0D30@DM6PR12MB3017.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:125;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(6512007)(8676002)(14454004)(81166006)(478600001)(99286004)(486006)(7736002)(476003)(25786009)(81156014)(2616005)(2906002)(8936002)(36756003)(86362001)(5640700003)(2351001)(6916009)(6436002)(66066001)(50226002)(6486002)(102836004)(52116002)(2501003)(26005)(316002)(1076003)(71200400001)(71190400001)(66946007)(66446008)(64756008)(66556008)(66476007)(6506007)(386003)(186003)(256004)(5660300002)(6116002)(53936002)(3846002)(4326008)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3017;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jGIo4ZQnJQgm2MHzP8G1jRunuwKZqlD47B0afUQTLIaJGvmqp4nYa3MtvxVJScJ4x/oDWMU70ES35UrH3GWzD+hKycAVTqNZirATlMXRwtThBVKijsiCSEp7WYic6Ikn9Hnk5NMon080DXDIw3yx/D84Jj+Lcj/aZRtHjdugh3cfGu/BnBZ/nMEXPVaEdIY2g14pvjFLNM1OSm8Xn7XYd7uVFXEae5QtrVOXqPLu2g8o3U0zJ0voAtqo1yY2hH9Wuh6EdZpa0FNE23dtAhM6k8jtEzVayCDHTRrifpuAYmDiLiMeryN2XThLCg8ZcORGukaMIOswEz8ZU9WxkIgzHN7t424bGG48rOwThAP1ScXIAmdyd70vaoFzc0Z9+v6hNMlu7a+Sqng62WkTMuygLFdZpYR9yxccQHfESDzeW1w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f4692e-9f5b-41a7-8c51-08d71f58169a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 19:05:49.4913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCbz2IVstxtjk0gw1JoepxdDe+bZVbCE+Tsq6Vz5USViU1ebxAs01hfBA6S24Sge
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3017
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePtxG0b0rsT2TsZlJwlzb5K1H9y/MZbW59e0mW01+jE=;
 b=XgC+gOh03jSDGnMc00udifjVCBpCWmSsn2eTZAhdu6GhTFWA9wEBIgVP4nut9lEGCwMXr52r3eGyNMZcugJCwKjnYRpRZlG/tVJVJYYUKJ8bf1kj2iSIlBT1b12HBuqQ7Og49s9DT9DNRi2VDJxCYA8LVOd+KZB4bvtr8q2u81w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHByaW50aW5nIHdlIGRpZCBmb3IgR0ZYOSB3YXMgbm90IHByb3BvZ2F0ZWQgdG8gR0ZYMTAg
c29tZWhvdywgc28gZml4Cml0IG5vdy4KCkNoYW5nZS1JZDogSWMwYjgzODExMzQzNDBiODNjZDY5
YzNmZTE4NmFjN2E4YTk3YjFiY2EKU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9A
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyB8IDMz
ICsrKysrKysrKysrKysrKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jICB8ICA1ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCmluZGV4
IDRlM2FjMTA4NGE5NC4uZjIzYmU5OGU5ODk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjEwXzAuYwpAQCAtMTQwLDE3ICsxNDAsNDAgQEAgc3RhdGljIGludCBnbWNfdjEwXzBfcHJv
Y2Vzc19pbnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJfQogCiAJaWYgKHBy
aW50a19yYXRlbGltaXQoKSkgeworCQlzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5mbyB0YXNrX2luZm87
CisKKwkJbWVtc2V0KCZ0YXNrX2luZm8sIDAsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Rhc2tfaW5m
bykpOworCQlhbWRncHVfdm1fZ2V0X3Rhc2tfaW5mbyhhZGV2LCBlbnRyeS0+cGFzaWQsICZ0YXNr
X2luZm8pOworCiAJCWRldl9lcnIoYWRldi0+ZGV2LAotCQkJIlslc10gVk1DIHBhZ2UgZmF1bHQg
KHNyY19pZDoldSByaW5nOiV1IHZtaWQ6JXUgcGFzaWQ6JXUpXG4iLAorCQkJIlslc10gcGFnZSBm
YXVsdCAoc3JjX2lkOiV1IHJpbmc6JXUgdm1pZDoldSBwYXNpZDoldSwgIgorCQkJImZvciBwcm9j
ZXNzOiVzIHBpZDolZCB0aHJlYWQ6JXMgcGlkOiVkKVxuIiwKIAkJCWVudHJ5LT52bWlkX3NyYyA/
ICJtbWh1YiIgOiAiZ2Z4aHViIiwKIAkJCWVudHJ5LT5zcmNfaWQsIGVudHJ5LT5yaW5nX2lkLCBl
bnRyeS0+dm1pZCwKLQkJCWVudHJ5LT5wYXNpZCk7Ci0JCWRldl9lcnIoYWRldi0+ZGV2LCAiICBh
dCBwYWdlIDB4JTAxNmxseCBmcm9tICVkXG4iLAorCQkJZW50cnktPnBhc2lkLCB0YXNrX2luZm8u
cHJvY2Vzc19uYW1lLCB0YXNrX2luZm8udGdpZCwKKwkJCXRhc2tfaW5mby50YXNrX25hbWUsIHRh
c2tfaW5mby5waWQpOworCQlkZXZfZXJyKGFkZXYtPmRldiwgIiAgaW4gcGFnZSBzdGFydGluZyBh
dCBhZGRyZXNzIDB4JTAxNmxseCBmcm9tIGNsaWVudCAlZFxuIiwKIAkJCWFkZHIsIGVudHJ5LT5j
bGllbnRfaWQpOwotCQlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkKKwkJaWYgKCFhbWRncHVf
c3Jpb3ZfdmYoYWRldikpIHsKIAkJCWRldl9lcnIoYWRldi0+ZGV2LAotCQkJCSJWTV9MMl9QUk9U
RUNUSU9OX0ZBVUxUX1NUQVRVUzoweCUwOFhcbiIsCisJCQkJIkdDVk1fTDJfUFJPVEVDVElPTl9G
QVVMVF9TVEFUVVM6MHglMDhYXG4iLAogCQkJCXN0YXR1cyk7CisJCQlkZXZfZXJyKGFkZXYtPmRl
diwgIlx0IE1PUkVfRkFVTFRTOiAweCVseFxuIiwKKwkJCQlSRUdfR0VUX0ZJRUxEKHN0YXR1cywK
KwkJCQlHQ1ZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBNT1JFX0ZBVUxUUykpOworCQkJ
ZGV2X2VycihhZGV2LT5kZXYsICJcdCBXQUxLRVJfRVJST1I6IDB4JWx4XG4iLAorCQkJCVJFR19H
RVRfRklFTEQoc3RhdHVzLAorCQkJCUdDVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIFdB
TEtFUl9FUlJPUikpOworCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBQRVJNSVNTSU9OX0ZBVUxU
UzogMHglbHhcbiIsCisJCQkJUkVHX0dFVF9GSUVMRChzdGF0dXMsCisJCQkJR0NWTV9MMl9QUk9U
RUNUSU9OX0ZBVUxUX1NUQVRVUywgUEVSTUlTU0lPTl9GQVVMVFMpKTsKKwkJCWRldl9lcnIoYWRl
di0+ZGV2LCAiXHQgTUFQUElOR19FUlJPUjogMHglbHhcbiIsCisJCQkJUkVHX0dFVF9GSUVMRChz
dGF0dXMsCisJCQkJR0NWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUywgTUFQUElOR19FUlJP
UikpOworCQkJZGV2X2VycihhZGV2LT5kZXYsICJcdCBSVzogMHglbHhcbiIsCisJCQkJUkVHX0dF
VF9GSUVMRChzdGF0dXMsCisJCQkJR0NWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUywgUlcp
KTsKKwkJfQogCX0KIAogCXJldHVybiAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMKaW5kZXggMjk2ZTJkOTgyNTc4Li4zNGM0YzJkMDg1NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwpAQCAtMzY0LDcgKzM2NCw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBf
cHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAkJZGV2X2Vy
cihhZGV2LT5kZXYsCiAJCQkiWyVzXSAlcyBwYWdlIGZhdWx0IChzcmNfaWQ6JXUgcmluZzoldSB2
bWlkOiV1ICIKLQkJCSJwYXNpZDoldSwgZm9yIHByb2Nlc3MgJXMgcGlkICVkIHRocmVhZCAlcyBw
aWQgJWQpXG4iLAorCQkJInBhc2lkOiV1LCBmb3IgcHJvY2VzczolcyBwaWQ6JWQgdGhyZWFkOiVz
IHBpZDolZClcbiIsCiAJCQlodWJfbmFtZSwgcmV0cnlfZmF1bHQgPyAicmV0cnkiIDogIm5vLXJl
dHJ5IiwKIAkJCWVudHJ5LT5zcmNfaWQsIGVudHJ5LT5yaW5nX2lkLCBlbnRyeS0+dm1pZCwKIAkJ
CWVudHJ5LT5wYXNpZCwgdGFza19pbmZvLnByb2Nlc3NfbmFtZSwgdGFza19pbmZvLnRnaWQsCkBA
IC0zODcsNiArMzg3LDkgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX2ludGVycnVwdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCWRldl9lcnIoYWRldi0+ZGV2LCAiXHQgTUFQ
UElOR19FUlJPUjogMHglbHhcbiIsCiAJCQkJUkVHX0dFVF9GSUVMRChzdGF0dXMsCiAJCQkJVk1f
TDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVMsIE1BUFBJTkdfRVJST1IpKTsKKwkJCWRldl9lcnIo
YWRldi0+ZGV2LCAiXHQgUlc6IDB4JWx4XG4iLAorCQkJCVJFR19HRVRfRklFTEQoc3RhdHVzLAor
CQkJCVZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTLCBSVykpOwogCiAJCX0KIAl9Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
