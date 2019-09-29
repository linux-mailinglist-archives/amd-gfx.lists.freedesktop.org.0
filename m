Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F39C13B9
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Sep 2019 09:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FF26E2E3;
	Sun, 29 Sep 2019 07:06:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690077.outbound.protection.outlook.com [40.107.69.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39B86E2DA
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Sep 2019 07:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ds2jBPPGnmzUfUTeJBOhfzCCRKl+Q66kNfCgtyZCTySSpjP03CZznFjoO6I8LksGlZvO/bVmhsi8y17vGtvCXC8965cHd5GYTCmUpn45yY5bEeO6um+mmRLTTaSCyBnbptKJqP5uW/YW9+BimvGaBNuMpLNjqh9W17f6bKhnCWnMOKCUoafWORdqaT8fhVdIf8abRcMbfGIVgj5kPFsKIhmfSGAY+tkZ01MDgj5R5CqsPoWXRJbv41HyygtRGDobmeeX+H9KuhC5M0erEb2j8SjRxrUw4QQBHQ8uPFJxxBAt0rCpa8KdScPvs0/FXu0Ddj0ehh+UjvSiTXK3aUMNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SA9Lz8iRoT1XaoXPuKp9nx6FMMy77Fgn7VvkGK1O9g=;
 b=cPmFiW6x39CLaecj298lIMpQOAWbFnDjRBV2HVRu4FmNIZh8zzOHII41ix+xtxvGIct5/5J9qI3OkzFfJvtHBS+biXBea+qvMpP+xp57DedFOqLm6INSO+C8G5WIJxJl4nZB2YImYZ7zHK9vxrWPm1CdkW63h9BXW1fu8kN1nPBiEY19l7cHAw891l2i3TII4mVw9oHeNGBgqs82TGQeVql6LeuKXnfUnx+RpgDrsLGmBTQcKgkBvwQZvdC6hh/MVqJYFPo+qsBtSWuCFMdPltx2X8+9OJzmzQimO7P7J5qxcsM3xGLkrWXidq5xM19Iyulf27LtTtxJzhWReS5/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3016.namprd12.prod.outlook.com (20.178.53.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Sun, 29 Sep 2019 07:06:24 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::e048:cb25:215:2ffa%6]) with mapi id 15.20.2305.017; Sun, 29 Sep 2019
 07:06:24 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: recreate retired page's bo if vram get lost
 in gpu reset
Thread-Topic: [PATCH] drm/amdgpu: recreate retired page's bo if vram get lost
 in gpu reset
Thread-Index: AQHVdpAH0YHtJ1rQtUyHA9LTmpURqKdCOkoQ
Date: Sun, 29 Sep 2019 07:06:23 +0000
Message-ID: <BYAPR12MB28066811DC887C3146D3AA2DF1830@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190929063438.10827-1-tao.zhou1@amd.com>
In-Reply-To: <20190929063438.10827-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b544036f-bc50-4fd3-3347-08d744ab8a00
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3016:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB30169DD8AC936D95F49F0E87F1830@BYAPR12MB3016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(13464003)(199004)(189003)(478600001)(476003)(33656002)(71190400001)(186003)(52536014)(55016002)(81156014)(81166006)(71200400001)(26005)(7696005)(486006)(86362001)(66066001)(76176011)(446003)(25786009)(6246003)(5660300002)(53546011)(6506007)(11346002)(99286004)(8936002)(66946007)(66446008)(66476007)(7736002)(2906002)(6436002)(2501003)(76116006)(102836004)(66556008)(74316002)(14454004)(305945005)(6116002)(8676002)(3846002)(9686003)(6636002)(64756008)(316002)(14444005)(229853002)(256004)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3016;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hmtv2MGo0gnHYMe8WR6n3lieVa+/2mNrhJgfqE/aqp2HDlp1cefyA3zt4LysqLCPbp3Fb6b3ZPY6UkgCi7CeAWP/HVfhnAFQM9baCsCk4JEFu7QnqRl+P/Qsavqyc0uEcw2LX3j0hQSSSJWu4PregSrU+VIuxNnKB9urPE+Au3NZjMvxhYg2sWVOINsvxgKg/YKSyP0YDCPThzKJYw1f2p4VZZJrr3VmCHMDdGPKzQVClO1MDllSGit8JsKsxahQig0hDvw0JcmfueFB0AjMohFraUunFdzTm0rfhPir4eUWc5c5WpC/XWfqEymal1YbU9KYpI0BUJW88QzhN7MCk9V6X1PX3fYpOAV9uyiQkMXwJxT4R8s/tWruA10W8FZHDIK8oGIBiMeH7B0wP7XQz/4vtpy7nUUYiA0ENo/ljWc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b544036f-bc50-4fd3-3347-08d744ab8a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 07:06:23.9391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qzJC2RNmbmEgcxQlow4c0BNxMQx6uoYx12kl9Yq0EK7oewj03U9JRYUsrUxXGVvofSWX2XQQcClPOKhLQLVQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SA9Lz8iRoT1XaoXPuKp9nx6FMMy77Fgn7VvkGK1O9g=;
 b=K6Je/R5OZ8XuVVRsNRFoonR9bNTaQZ1pyNqxxv/iQOVloD9vSZ66/FQJGMwKAxDrlzD7UjmP/rWwRy3hDAsM+Iga+PSQDbTUbhI3VC/+UmDUJsvRh4gTEB43+3RJXJVXEAfeShwMfPczlc/kzfuAmkTzgdBpWgjTmECht0ODDQo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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

Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCkZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBh
bWQuY29tPiAKU2VudDogU3VuZGF5LCBTZXB0ZW1iZXIgMjksIDIwMTkgMjozNSBQTQpUbzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdy
b2R6b3Zza3lAYW1kLmNvbT47IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpo
YW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+CkNjOiBaaG91MSwgVGFvIDxUYW8u
WmhvdTFAYW1kLmNvbT4KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiByZWNyZWF0ZSByZXRp
cmVkIHBhZ2UncyBibyBpZiB2cmFtIGdldCBsb3N0IGluIGdwdSByZXNldAoKdGhlIGluZm8gb2Yg
cmV0aXJlZCBwYWdlJ3MgYm8gbWF5IGJlIGxvc3QgaWYgdnJhbSBsb3N0IGlzIGVuY291bnRlcmVk
IGluIGdwdSByZXNldCAoZ3B1IHBhZ2UgdGFibGUgaW4gdnJhbSBtYXkgYmUgbG9zdCksIGZvcmNl
IHRvIHJlY3JlYXRlIGFsbCBib3MKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFA
YW1kLmNvbT4KU3VnZ2VzdGVkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgICAgfCA0
NCArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmggICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNjI5NTUxNTY2
NTNjLi5hODlmNmQwNTNiM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKQEAgLTM2NzUsNiArMzY3NSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RvX2FzaWNf
cmVzZXQoc3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUsCiAJCQkJaWYgKHZyYW1fbG9zdCkg
ewogCQkJCQlEUk1fSU5GTygiVlJBTSBpcyBsb3N0IGR1ZSB0byBHUFUgcmVzZXQhXG4iKTsKIAkJ
CQkJYW1kZ3B1X2luY192cmFtX2xvc3QodG1wX2FkZXYpOworCQkJCQlhbWRncHVfcmFzX3JlY292
ZXJ5X3Jlc2V0KHRtcF9hZGV2KTsKIAkJCQl9CiAKIAkJCQlyID0gYW1kZ3B1X2d0dF9tZ3JfcmVj
b3ZlcigKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA0ODY1Njhk
ZWQ2ZDYuLjFiM2I1OTdhYTk3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYwpAQCAtMTU3Myw2ICsxNTczLDUwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVy
eV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJcmV0dXJuIDA7CiB9CisKKy8q
CisgKiB0aGUgaW5mbyBvZiByZXRpcmVkIHBhZ2UncyBibyBtYXkgYmUgbG9zdCBpZiB2cmFtIGxv
c3QgaXMgCitlbmNvdW50ZXJlZAorICogaW4gZ3B1IHJlc2V0IChncHUgcGFnZSB0YWJsZSBpbiB2
cmFtIG1heSBiZSBsb3N0KSwgZm9yY2UgdG8gcmVjcmVhdGUKKyAqIGFsbCBib3MKKyAqLwordm9p
ZCBhbWRncHVfcmFzX3JlY292ZXJ5X3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSB7
CisJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7
CisJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICpkYXRhOworCXVpbnQ2NF90IGJwOworCXN0
cnVjdCBhbWRncHVfYm8gKmJvID0gTlVMTDsKKwlpbnQgaTsKKworCWlmICghY29uKQorCQlyZXR1
cm47CisKKwlkYXRhID0gY29uLT5laF9kYXRhOworCWlmICghZGF0YSkKKwkJcmV0dXJuOworCisJ
LyogZm9yY2UgdG8gcmVzZXJ2ZSBhbGwgcmV0aXJlZCBwYWdlIGFnYWluICovCisJZGF0YS0+bGFz
dF9yZXNlcnZlZCA9IDA7CisKKwlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0
YS0+Y291bnQ7IGkrKykgeworCQlicCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2U7CisKKwkJ
LyogVGhlcmUgYXJlIHRocmVlIGNhc2VzIG9mIHJlc2VydmUgZXJyb3Igc2hvdWxkIGJlIGlnbm9y
ZWQ6CisJCSAqIDEpIGEgcmFzIGJhZCBwYWdlIGhhcyBiZWVuIGFsbG9jYXRlZCAodXNlZCBieSBz
b21lb25lKTsKKwkJICogMikgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gcmVzZXJ2ZWQgKGR1cGxp
Y2F0ZSBlcnJvciBpbmplY3Rpb24KKwkJICogICAgZm9yIG9uZSBwYWdlKTsKKwkJICogMykgYm8g
aW5mbyBpc24ndCBsb3N0IGluIGdwdSByZXNldAorCQkgKi8KKwkJaWYgKGFtZGdwdV9ib19jcmVh
dGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IEFNREdQVV9HUFVfUEFHRV9TSElGVCwKKwkJCQkJICAg
ICAgIEFNREdQVV9HUFVfUEFHRV9TSVpFLAorCQkJCQkgICAgICAgQU1ER1BVX0dFTV9ET01BSU5f
VlJBTSwKKwkJCQkJICAgICAgICZibywgTlVMTCkpCisJCQlEUk1fTk9URSgiUkFTIE5PVEU6IHJl
Y3JlYXRlIGJvIGZvciByZXRpcmVkIHBhZ2UgMHglbGx4IGZhaWxcbiIsIGJwKTsKKwkJZWxzZQor
CQkJZGF0YS0+YnBzX2JvW2ldID0gYm87CisJCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpICsgMTsK
KwkJYm8gPSBOVUxMOworCX0KW0d1Y2h1bl0gSW4gYW1kZ3B1X3Jhcy5jLCB3ZSBoYXZlIGFub3Ro
ZXIgZnVuY3Rpb24gYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcywgd2hpY2ggaGFzIHRoZSBz
YW1lIGJvIGNyZWF0aW9uIGNvZGUgYXMgYWJvdmUuClNvIGNhbiB3ZSBwdXQgdGhlc2UgY29tbW9u
IGNvZGVzIGludG8gYW5vdGhlciBpbnRlcm5hbCBmdW5jIGRlZGljYXRlZCBmb3IgYm8gY3JlYXRp
bmcgam9icyB0byByZWR1Y2UgY29kZSBsaW5lcyBhbmQgZ2V0IHRoaXMgaW50ZXJuYWwgZnVuYyBi
ZWluZyBjYWxsZWQgYnkgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyBhbmQgYW1kZ3B1X3Jh
c19yZWNvdmVyeV9yZXNldCByZXNwZWN0aXZlbHk/Cit9CiAvKiByZWNvdmVyeSBlbmQgKi8KIAog
LyogcmV0dXJuIDAgaWYgcmFzIHdpbGwgcmVzZXQgZ3B1IGFuZCByZXBvc3QuKi8gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCBmODBmZDM0MjhjOTguLjdhNjA2ZDNi
ZTgwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaApAQCAtNDc5LDYg
KzQ3OSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCAgfQogCiBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKK3ZvaWQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9y
ZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBpbnQgYW1kZ3B1X3Jhc19yZXF1ZXN0
X3Jlc2V0X29uX2Jvb3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXVuc2lnbmVkIGlu
dCBibG9jayk7CiAKLS0KMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
