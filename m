Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13FC13A9
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Sep 2019 08:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0969B6E2D3;
	Sun, 29 Sep 2019 06:35:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04AE6E2D3
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Sep 2019 06:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8DlqZgj1V7FmFOlYWZsSh+CGptYkAFk8MR+IrwC4Y3ClEe6K2HMFYc6iL+gHGYCdLl5TP6NnSfthfcnp2srD5vrHvFlTmnLysbdlqJsYw4RMWBScuqJWUOSNo14W21WUuPEY6c88OVVL1fTA1iTCr35y3lF4Zrb/WpN2gETWehYwrLD4NhUIrOSqUf4ez1kw4YirpBNKX7VXBe/j4ijZc2MtbD4SQluWv91XcW1SU+J0fQgvVHl2R2RBvOoQ9D5SGalvNR7bcHR3A4yz1F4B3xz4/9mQzbiBedXCfy1CmuYOP89aozH6eYfEpQlkQqI5B2VRU4OBmpKzAFb6xYydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTtOe8eCaIgkyR4LIYa4Z1s2DziagzQ4qBJrUaQ+07g=;
 b=MRFRR37MlBazbd7FbbdhmQ1397kB9ejeGwFaDA8+i1gZ+kkdecUQ3EJALHUJHvAoTo4+8g0m6fUC8sJW7jEmSZGAxk9LYuM2NdJyLF57ks/qMkkNmL7v9yshnbWLFBoskNxGNks3HSvlvQBFDH4caX4iDiXwzy6wWCV/hUb68NKz+7p9+uLI/Ug6zP9Cx3eEidjscKX/zxfkEzghT9tipnOvfEOrlaeymobTrsDaRWBF1Pm17DvDjnpfNCpVZhMrxLZyiOSdN+zFyhlSRxO6QpI8bkRaUbla1YnaqpxNW3qNpv+y2lei+SR0rXCIcNbA4XBWtVGkMtgOMtCVxEcjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3134.namprd12.prod.outlook.com (20.178.241.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Sun, 29 Sep 2019 06:35:05 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Sun, 29 Sep 2019
 06:35:05 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: recreate retired page's bo if vram get lost in
 gpu reset
Thread-Topic: [PATCH] drm/amdgpu: recreate retired page's bo if vram get lost
 in gpu reset
Thread-Index: AQHVdpAH0YHtJ1rQtUyHA9LTmpURqA==
Date: Sun, 29 Sep 2019 06:35:05 +0000
Message-ID: <20190929063438.10827-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:203:2e::31) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78900681-12c8-4d69-1e9e-08d744a729d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3134; 
x-ms-traffictypediagnostic: MN2PR12MB3134:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB313402FFF8A3490D4B2E9984B0830@MN2PR12MB3134.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(256004)(476003)(14444005)(486006)(478600001)(1076003)(2616005)(25786009)(66476007)(66556008)(64756008)(66446008)(66946007)(66066001)(6636002)(71190400001)(71200400001)(5660300002)(7736002)(305945005)(6486002)(186003)(6436002)(102836004)(26005)(6512007)(86362001)(4326008)(36756003)(2906002)(3846002)(6116002)(386003)(6506007)(99286004)(2501003)(52116002)(81166006)(81156014)(50226002)(110136005)(8936002)(14454004)(316002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3134;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v0tBNJyY1ewCp0Ap16HZX92Vixol5J5+CPVFQ8j++wxIdOGo4Ce3CBj4qwoNfdB9W7YeeJOVBtVduLmbLngn4UFxpjp5Ut5FS7whrDjwl5Xb+iCWSRvR/fmVaplaOKBVflFzX3Tz1gZUYRhuTFrgyFK+5zuiBi5xiyEsn8sPyuuNkuFl8tD2zf9+G/4Qmo35tqFn7FahwY6HzPIFTX0wcKFXfgImLL+cFFaiU2Y31A9cqqYMci0qgkCVOB6Y6PRtKwtsmxpKTPQBURJnDFIcKa9pE1p0XoGKpYLrtpQ41ref8BUy1tBtZRRRi7v3fDHSyUPXX/HDpDVuERrrNOR/tjn98sNMdw0hsSVK5Ucwvn0TbD9JZF1Z3SST0OXWd6tZ2WQwDs0KylA6EVekgc5U1fhaHHDkhatSLRHgVchpm5A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78900681-12c8-4d69-1e9e-08d744a729d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 06:35:05.3194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TI+FjPMAZKAgP85ji6fWaOAF1aDT1K8/Ja6eTrjargTTPBTYrMhSl2FH5rXgkqsD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTtOe8eCaIgkyR4LIYa4Z1s2DziagzQ4qBJrUaQ+07g=;
 b=0F8hTZ3fMbnPtNAKHHH7nM7fkHwiZ9eo/3Zfe5bMLsrZJVhHjJ/E2H/DRQTLajeo8OC8ZtLOIAiFt6OMu0mtzHuCc5a8PjOnbuFpKQor+CsbzwTMwrwYh511DGezDgZbhQvgIMrcwW+rJQb5IyIfHIa7+8MiJ+HTada4m0j/fTs=
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIGluZm8gb2YgcmV0aXJlZCBwYWdlJ3MgYm8gbWF5IGJlIGxvc3QgaWYgdnJhbSBsb3N0IGlz
IGVuY291bnRlcmVkCmluIGdwdSByZXNldCAoZ3B1IHBhZ2UgdGFibGUgaW4gdnJhbSBtYXkgYmUg
bG9zdCksIGZvcmNlIHRvIHJlY3JlYXRlCmFsbCBib3MKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91
IDx0YW8uemhvdTFAYW1kLmNvbT4KU3VnZ2VzdGVkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5k
cmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMgICAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmggICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5k
ZXggNjI5NTUxNTY2NTNjLi5hODlmNmQwNTNiM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTM2NzUsNiArMzY3NSw3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2RvX2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUsCiAJCQkJaWYg
KHZyYW1fbG9zdCkgewogCQkJCQlEUk1fSU5GTygiVlJBTSBpcyBsb3N0IGR1ZSB0byBHUFUgcmVz
ZXQhXG4iKTsKIAkJCQkJYW1kZ3B1X2luY192cmFtX2xvc3QodG1wX2FkZXYpOworCQkJCQlhbWRn
cHVfcmFzX3JlY292ZXJ5X3Jlc2V0KHRtcF9hZGV2KTsKIAkJCQl9CiAKIAkJCQlyID0gYW1kZ3B1
X2d0dF9tZ3JfcmVjb3ZlcigKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpp
bmRleCA0ODY1NjhkZWQ2ZDYuLjFiM2I1OTdhYTk3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwpAQCAtMTU3Myw2ICsxNTczLDUwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3Jhc19yZWNvdmVyeV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJcmV0dXJu
IDA7CiB9CisKKy8qCisgKiB0aGUgaW5mbyBvZiByZXRpcmVkIHBhZ2UncyBibyBtYXkgYmUgbG9z
dCBpZiB2cmFtIGxvc3QgaXMgZW5jb3VudGVyZWQKKyAqIGluIGdwdSByZXNldCAoZ3B1IHBhZ2Ug
dGFibGUgaW4gdnJhbSBtYXkgYmUgbG9zdCksIGZvcmNlIHRvIHJlY3JlYXRlCisgKiBhbGwgYm9z
CisgKi8KK3ZvaWQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9yZXNldChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKK3sKKwlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29u
dGV4dChhZGV2KTsKKwlzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgKmRhdGE7CisJdWludDY0
X3QgYnA7CisJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBOVUxMOworCWludCBpOworCisJaWYgKCFj
b24pCisJCXJldHVybjsKKworCWRhdGEgPSBjb24tPmVoX2RhdGE7CisJaWYgKCFkYXRhKQorCQly
ZXR1cm47CisKKwkvKiBmb3JjZSB0byByZXNlcnZlIGFsbCByZXRpcmVkIHBhZ2UgYWdhaW4gKi8K
KwlkYXRhLT5sYXN0X3Jlc2VydmVkID0gMDsKKworCWZvciAoaSA9IGRhdGEtPmxhc3RfcmVzZXJ2
ZWQ7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7CisJCWJwID0gZGF0YS0+YnBzW2ldLnJldGlyZWRf
cGFnZTsKKworCQkvKiBUaGVyZSBhcmUgdGhyZWUgY2FzZXMgb2YgcmVzZXJ2ZSBlcnJvciBzaG91
bGQgYmUgaWdub3JlZDoKKwkJICogMSkgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gYWxsb2NhdGVk
ICh1c2VkIGJ5IHNvbWVvbmUpOworCQkgKiAyKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiByZXNl
cnZlZCAoZHVwbGljYXRlIGVycm9yIGluamVjdGlvbgorCQkgKiAgICBmb3Igb25lIHBhZ2UpOwor
CQkgKiAzKSBibyBpbmZvIGlzbid0IGxvc3QgaW4gZ3B1IHJlc2V0CisJCSAqLworCQlpZiAoYW1k
Z3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgQU1ER1BVX0dQVV9QQUdFX1NISUZU
LAorCQkJCQkgICAgICAgQU1ER1BVX0dQVV9QQUdFX1NJWkUsCisJCQkJCSAgICAgICBBTURHUFVf
R0VNX0RPTUFJTl9WUkFNLAorCQkJCQkgICAgICAgJmJvLCBOVUxMKSkKKwkJCURSTV9OT1RFKCJS
QVMgTk9URTogcmVjcmVhdGUgYm8gZm9yIHJldGlyZWQgcGFnZSAweCVsbHggZmFpbFxuIiwgYnAp
OworCQllbHNlCisJCQlkYXRhLT5icHNfYm9baV0gPSBibzsKKwkJZGF0YS0+bGFzdF9yZXNlcnZl
ZCA9IGkgKyAxOworCQlibyA9IE5VTEw7CisJfQorfQogLyogcmVjb3ZlcnkgZW5kICovCiAKIC8q
IHJldHVybiAwIGlmIHJhcyB3aWxsIHJlc2V0IGdwdSBhbmQgcmVwb3N0LiovCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKaW5kZXggZjgwZmQzNDI4Yzk4Li43YTYwNmQzYmU4
MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKQEAgLTQ3OSw2ICs0
NzksNyBAQCBzdGF0aWMgaW5saW5lIGludCBhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIH0KIAogaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cit2b2lkIGFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVz
ZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV9yYXNfcmVxdWVzdF9y
ZXNldF9vbl9ib290KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQl1bnNpZ25lZCBpbnQg
YmxvY2spOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
