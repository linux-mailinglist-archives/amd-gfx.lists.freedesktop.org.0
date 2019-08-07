Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565EF8427A
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15A96E5DC;
	Wed,  7 Aug 2019 02:31:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730045.outbound.protection.outlook.com [40.107.73.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7916E592
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 02:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=em/P60Vv6ElhBig7IxzWVoCEIhQ4MJazlAE8FOVfeqBdc+Vy1CW+RDzwPD1U/Tmz9IKnnjNfOGoDSEZSSPeYvJKbLcbjH1hy7x4jIq4pMMOOKGJvlpUNZB9JpcY8hBeGyFbz4aYszHXfWDliEP0fAf5ch98d2NLJju5tCAUVwGqDVR+gvy8WbdO13zWfXQAeCpUSqG3RxT00xW5LjwqwuiUbs+00YJ/1fKmooHf5cuUfYaxf5QAgtLX8iDtnw2WKVIfZ8vXLkd7Fc3H6gmXM1EKkfgbQTTnmmvl2T1jYsbgV3behlnBD8/QW7VrdJM5DqlkNtSQnvVKtCrBvByX+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPuf0DbbNceUAjtZhqvAvNkMIqff+SC/QKxnGRB89Js=;
 b=JzFrMv3m0makSHy7ggVI6NZsF+Vx5d4hTxL9bIP+jnql8uDalY5lyJxmi9Vme/LNJ6hSoNh+7IF+MSFJjp4GuV6KaupEZbgzACU7r9qQaFFAwE80m/zLmwo9ggTXilhfGbOqIfxVXXuRlj1iOKpO+XmbNHgmztxAjEp52Ow+z/RYiNtsW+OStUmmSn3qMHtrrDiR6fj/MpBpyfRhXci/EFrN7rk073909coalJrXaRevF3JiK0bT1RUboU1Q+Htj027TfM1CsPMOnpgkBMixqrz49ENQ/b8lkKaT73uKxowpiTOvQoCVFDhGXN/7OZBa5p0zpBtie3Brw4Z7hUXI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2404.namprd12.prod.outlook.com (52.132.10.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 02:31:14 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 02:31:14 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/5] amd/amdgpu: Introduce new page mapping scheme for arcturus
Thread-Topic: [PATCH 5/5] amd/amdgpu: Introduce new page mapping scheme for
 arcturus
Thread-Index: AQHVTMguN+YQ32mTVkCqiFUJU498rg==
Date: Wed, 7 Aug 2019 02:31:14 +0000
Message-ID: <1565145062-16674-5-git-send-email-Oak.Zeng@amd.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47ca54fc-3615-4c44-ed58-08d71adf514b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2404; 
x-ms-traffictypediagnostic: BL0PR12MB2404:
x-microsoft-antispam-prvs: <BL0PR12MB24046B90FB819DCFD95BCF9480D40@BL0PR12MB2404.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(189003)(199004)(54906003)(5640700003)(2616005)(36756003)(2351001)(64756008)(66476007)(66946007)(186003)(99286004)(66446008)(11346002)(6436002)(66556008)(6486002)(3846002)(26005)(486006)(476003)(76176011)(66066001)(6916009)(6512007)(446003)(2501003)(52116002)(305945005)(86362001)(53936002)(2906002)(102836004)(68736007)(7736002)(6116002)(6506007)(316002)(386003)(71200400001)(50226002)(4326008)(14444005)(81156014)(81166006)(478600001)(71190400001)(5660300002)(14454004)(25786009)(8676002)(8936002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2404;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /UqMzPLkdnrxVtol7sOAxsiV2iPT96mVRJs5aWCwHNsn746Silf3twmUm8BuucyxmpTuLVp6yT5XVNScB4UgWXvq21d2j+/qamOzoR8/05e4z59jblxKlArsn3i6VmeXtnXM7ANhMErqXPgxTXfe9kTQK2zXgaRRqdwYdIdBS8qMNBqAMwaxhYMoVGrE+9EpdQca3Uu4phFL6BwFU609Yc/2/9tB9ASEyJ3UI4188+oD+Wrht4YbAQNPYv4bFXzjh52lJeKYf0LqltHpQ0q+ZCLDm9plCAvY6ISnh2ecLSwMPG0ryL7cvDRLh42IOB9BaghB71NinvJiO8A9+WCXjievlkPcZyNgz8XVC57PUnwBZ4rQQmpJ/6hvoT1jUn9TKfiYz8asxfU6GnRV29RtRuq4aryzOiG53GCC6SrYvls=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ca54fc-3615-4c44-ed58-08d71adf514b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 02:31:14.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPuf0DbbNceUAjtZhqvAvNkMIqff+SC/QKxnGRB89Js=;
 b=oAuKHB30qaa0hRyBCcM1KBIHsu12KKOmgQAj/YRSwiyap77q1tzhZtOcVBcUVPnY+V8k7rMb1+fx8PpQlFwww+XBcEuUkjP2GEMt1GPXotZkcV6U6UvhNHi24kN3NPLl3+sAyPnQkwr3WhNmgR5VpVdsoEkSgALQIfiUJb/NeXc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG5ldyBtZW1vcnkgbWFwcGluZyBzY2hlbWUgaXM6CkZpbmUtZ3JhaW4gY29oZXJlbmN5OiBs
b2NhbCBDQyBhbmQgcmVtb3RlIFVDLCB3aXRoIHNub29wLgpDb2Fyc2UtZ3JhaW4gY29oZXJlbmN5
OiBsb2NhbCBSVyBhbmQgcmVtb3RlIFVDLCB3aXRoIHNub29wLgoKQ2hhbmdlLUlkOiBJNmEwNzEy
NDlmOTUzY2JlZDgxM2JmZDk1M2I2YTJlMDgyNmY1NGY4NgpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVu
ZyA8T2FrLlplbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djZfMC5jIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDIz
ICsrKysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwppbmRl
eCAyYjJhZjZhLi41MWRhZTdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjZfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMK
QEAgLTQyMCw2ICs0MjAsNyBAQCBzdGF0aWMgdWludDMyX3QgZ21jX3Y2XzBfZ2V0X3ZtX21hcHBp
bmdfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAlyZXR1cm4gbWFwcGluZ19m
bGFnczsKIH0KKwogc3RhdGljIHZvaWQgZ21jX3Y2XzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQkgICAgICBib29sIHZhbHVlKQogewpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggOGJlZWZhZi4uNzE4YjM4OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC02ODcsNiArNjg3LDI3IEBA
IHN0YXRpYyB1aW50MzJfdCBnbWNfdjlfMF9nZXRfdm1fbWFwcGluZ19mbGFncyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAlyZXR1cm4gbWFwcGluZ19mbGFnczsKIH0KIAorc3RhdGljIHVp
bnQzMl90IGdtY192OV8wX2FyY3R1cnVzX2dldF92bV9tYXBwaW5nX2ZsYWdzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAorCQkJCXVpbnQzMl90IGFsbG9jX2ZsYWdzLCBib29sIHJlbW90ZV9t
YXBwaW5nKQoreworCXVpbnQzMl90IG1hcHBpbmdfZmxhZ3MgPSBBTURHUFVfVk1fUEFHRV9SRUFE
QUJMRTsKKworCWlmIChhbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19XUklUQUJMRSkKKwkJ
bWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9XUklURUFCTEU7CisJaWYgKGFsbG9jX2Zs
YWdzICYgQUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFCTEUpCisJCW1hcHBpbmdfZmxhZ3MgfD0gQU1E
R1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRTsKKwlpZiAoKGFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZM
QUdTX1ZSQU0pICYmICFyZW1vdGVfbWFwcGluZykgeworCQlpZiAoYWxsb2NfZmxhZ3MgJiBBTExP
Q19NRU1fRkxBR1NfQ09IRVJFTlQpCisJCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9NVFlQ
RV9DQzsKKwkJZWxzZQorCQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVfUlc7CisJ
fSBlbHNlIHsKKwkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVfVUM7CisJCW1hcHBp
bmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfU05PT1BFRDsKKwl9CisKKwlyZXR1cm4gbWFwcGlu
Z19mbGFnczsKK30KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192
OV8wX2dtY19mdW5jcyA9IHsKIAkuZmx1c2hfZ3B1X3RsYiA9IGdtY192OV8wX2ZsdXNoX2dwdV90
bGIsCkBAIC03MDMsNyArNzI0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1
bmNzIGdtY192OV8wX2FyY3R1cnVzX2dtY19mdW5jcyA9IHsKIAkuZW1pdF9wYXNpZF9tYXBwaW5n
ID0gZ21jX3Y5XzBfZW1pdF9wYXNpZF9tYXBwaW5nLAogCS5nZXRfdm1fcHRlX2ZsYWdzID0gZ21j
X3Y5XzBfYXJjdHVydXNfZ2V0X3ZtX3B0ZV9mbGFncywKIAkuZ2V0X3ZtX3BkZSA9IGdtY192OV8w
X2dldF92bV9wZGUsCi0JLmdldF92bV9tYXBwaW5nX2ZsYWdzID0gZ21jX3Y5XzBfZ2V0X3ZtX21h
cHBpbmdfZmxhZ3MKKwkuZ2V0X3ZtX21hcHBpbmdfZmxhZ3MgPSBnbWNfdjlfMF9hcmN0dXJ1c19n
ZXRfdm1fbWFwcGluZ19mbGFncwogfTsKIAogc3RhdGljIHZvaWQgZ21jX3Y5XzBfc2V0X2dtY19m
dW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
