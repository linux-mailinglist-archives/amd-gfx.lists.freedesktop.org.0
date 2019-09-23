Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3765FBB2FA
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 13:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0016E891;
	Mon, 23 Sep 2019 11:46:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C6A6E891
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 11:46:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk0QSx33fC3ssAcwomWXnKK7/6DMAcADIKIboCcIk1rPuEHU32rpqQ4jyjUaFmNvoQq82k4S0qtAb0wWVg9EtO4zSDpDe6WowacjMIcygMZlMi4wcENHvRkyTLPg3suC5syGD7pluxbrpdRpk8HIl50AeIXqvdWFSEX4py/aCgaeobzeFq/YIe5dPQ+QCxi5lJxEVbrtZ5Aq4/DHlSU/RQ2fOPROBuFH9829kiUcMPo2svfGF5JIFjB7QOuF/3wS880fIQ9VAxRwLBBuXaGf1TSlMnlX449GxprCzH6pmPuVAIGqQd5LitekcbLeKoL2A7z7nToU7XXX+DILoSpEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmvGdebAQcllEOsQ/WF5eKsvYsp3L1JoBfL0jibH0rc=;
 b=ZL0cy7iJl+/4hRRoiu8gUofrzrRKBBNEA7nKJhNrZwh8DpqYdGEHKv7UzQIcWX1K2ml85CyFG/0bkbzr4TLVjqUWjbX0NeXH/fZPrcZZ2mpM3lFJDbDXFQMlx6ydewRd5NMnPstuuIxP9hc/NQQaOJD3npu08C4NHdu1LMXWEEjcKu0kJeiHFWTQQmMwNFX/A+x0maRmynWceB/5uoKdxc+6rCdndMB/ko26s4hoMGF26nKeqrERNZkpbOe7py19SFIJB000b/R2m1HuwYEGN2fpsvBxeDn35mUznQ4fH5QEb5iDM8Xh2ocjFGsF7HRU2dC+7AwHIRWFC39OtCPR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4254.namprd12.prod.outlook.com (10.255.224.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 11:46:13 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 11:46:13 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: [PATCH 22/22] drm/amdgpu: add comments in ras interrupt callback
Thread-Topic: [PATCH 22/22] drm/amdgpu: add comments in ras interrupt callback
Thread-Index: AQHVcgSAPyT5tpm+rUm8w0cYYZlIBw==
Date: Mon, 23 Sep 2019 11:46:13 +0000
Message-ID: <20190923114557.29292-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0037.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::25) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fd3187c-48fd-4692-871d-08d7401ba2c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4254; 
x-ms-traffictypediagnostic: MN2PR12MB4254:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42546E30E45EE43CCDEECBEDB0850@MN2PR12MB4254.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(2906002)(99286004)(186003)(64756008)(66446008)(6506007)(1076003)(14454004)(66476007)(66556008)(26005)(66946007)(2501003)(86362001)(4326008)(52116002)(386003)(102836004)(478600001)(36756003)(50226002)(6436002)(6636002)(6116002)(3846002)(25786009)(8676002)(81156014)(81166006)(8936002)(6512007)(305945005)(14444005)(7736002)(66066001)(256004)(6486002)(71200400001)(110136005)(486006)(5660300002)(71190400001)(476003)(2616005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4254;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZQlcKnZLJshbp/EYAPBtAm100XK+oir00A0UgKWkSnBdJWYv/RUGFHac2mWfrxbzAcnlke86XBTaCrincn20F1r2EDyWB7a9whhyCPZsYxyyG6/hkf12ag6nQwSpmpGjYWoee77SUJYCp+CSJD/GtyP2fFxQTEpP1VG1yKpEoxnMZ00LNu5mnf0B24OmS6nhg7niSeXbDoTwU1SuaXdGSo27INaMtB4x2a+i15x2hpu0F7MiPRhPQ74Cpo0U+crPXmAcU2SiFdREKeEfqX4xGjIX+yvAizf7rRyeQHn6EnW1hbmeZ04wY38fktgTVyDRPjS9ofZDAm3LlAb+7eIibonzhal17K9a9RH/jUmgAbH4UpNGFGa2xdWlmdWswB5hnQepTAw8wEQtgjQbGV8foJBfdWgGcC4JBal49lxkg5s=
Content-ID: <4C028E6B6D4E694ABC2332FD9E8F7495@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd3187c-48fd-4692-871d-08d7401ba2c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 11:46:13.7767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFAuAKYuo6z3BXU5rslJOC4RUan9yJPLRXnW76KFHcJ0Ft6rr960AxlpaFNnGg8h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmvGdebAQcllEOsQ/WF5eKsvYsp3L1JoBfL0jibH0rc=;
 b=cN7d+YqX9DzgljUMQhm4tZpe9NBz0VIBCHAU88a4bkDCZWJF6KhC1KdxiriimLNrEiRfaMdTC69hNfHAflQIpe2ek+PmiJyu2Td/qOt+HtY+g8747G9On5m2k8EyAtX+pZ7K20e8Rlgj9/NGbEYiiYNqbKFeZjsLA/4LYs5wQ10=
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

YWRkIGNvbW1lbnRzIHRvIGNsYXJpZnkgd2h5IGNoZWNraW5nIEdGWCBJUCBCTE9DSyBmb3IgZWFj
aCByYXMgaW50ZXJydXB0IGNhbGxiYWNrDQoNClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8u
emhvdTFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZnguYyB8IDcgKysrKysrLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMu
YyB8IDQgKysrKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jICB8IDQg
KysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQppbmRleCAxYjdhMDIyOTk2
ZjYuLjY4NDk1ZjBlNDM1NCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9nZnguYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dm
eC5jDQpAQCAtNjM2LDcgKzYzNiwxMiBAQCBpbnQgYW1kZ3B1X2dmeF9wcm9jZXNzX3Jhc19kYXRh
X2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAkJdm9pZCAqZXJyX2RhdGEsDQogCQlz
dHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkNCiB7DQotCS8qIFRPRE8gdWUgd2lsbCB0cmln
Z2VyIGFuIGludGVycnVwdC4gKi8NCisJLyogVE9ETyB1ZSB3aWxsIHRyaWdnZXIgYW4gaW50ZXJy
dXB0Lg0KKwkgKg0KKwkgKiBXaGVuIOKAnEZ1bGwgUkFT4oCdIGlzIGVuYWJsZWQsIHRoZSBwZXIt
SVAgaW50ZXJydXB0IHNvdXJjZXMgc2hvdWxkDQorCSAqIGJlIGRpc2FibGVkIGFuZCB0aGUgZHJp
dmVyIHNob3VsZCBvbmx5IGxvb2sgZm9yIHRoZSBhZ2dyZWdhdGVkDQorCSAqIGludGVycnVwdCB2
aWEgc3luYyBmbG9vZA0KKwkgKi8NCiAJaWYgKCFhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2
LCBBTURHUFVfUkFTX0JMT0NLX19HRlgpKSB7DQogCQlrZ2Qya2ZkX3NldF9zcmFtX2VjY19mbGFn
KGFkZXYtPmtmZC5kZXYpOw0KIAkJaWYgKGFkZXYtPmdmeC5mdW5jcy0+cXVlcnlfcmFzX2Vycm9y
X2NvdW50KQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91
bWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYw0KaW5kZXggNzc0
NGRlMTQ5OTQ5Li5kNGZiOWNmMjdlMjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdW1jLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV91bWMuYw0KQEAgLTk1LDYgKzk1LDEwIEBAIGludCBhbWRncHVfdW1jX3Byb2Nlc3NfcmFz
X2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogew0KIAlzdHJ1Y3QgcmFzX2Vy
cl9kYXRhICplcnJfZGF0YSA9IChzdHJ1Y3QgcmFzX2Vycl9kYXRhICopcmFzX2Vycm9yX3N0YXR1
czsNCiANCisJLyogV2hlbiDigJxGdWxsIFJBU+KAnSBpcyBlbmFibGVkLCB0aGUgcGVyLUlQIGlu
dGVycnVwdCBzb3VyY2VzIHNob3VsZA0KKwkgKiBiZSBkaXNhYmxlZCBhbmQgdGhlIGRyaXZlciBz
aG91bGQgb25seSBsb29rIGZvciB0aGUgYWdncmVnYXRlZA0KKwkgKiBpbnRlcnJ1cHQgdmlhIHN5
bmMgZmxvb2QNCisJICovDQogCWlmIChhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBBTURH
UFVfUkFTX0JMT0NLX19HRlgpKQ0KIAkJcmV0dXJuIEFNREdQVV9SQVNfU1VDQ0VTUzsNCiANCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jDQppbmRleCA5OGZkMWU1NDg0ZDAuLjk2
NTgxYjViMGE4YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djRfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KQEAg
LTE5MzAsNiArMTkzMCwxMCBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX3Jhc19kYXRh
X2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIHsNCiAJaW50IGluc3RhbmNlOw0KIA0K
KwkvKiBXaGVuIOKAnEZ1bGwgUkFT4oCdIGlzIGVuYWJsZWQsIHRoZSBwZXItSVAgaW50ZXJydXB0
IHNvdXJjZXMgc2hvdWxkDQorCSAqIGJlIGRpc2FibGVkIGFuZCB0aGUgZHJpdmVyIHNob3VsZCBv
bmx5IGxvb2sgZm9yIHRoZSBhZ2dyZWdhdGVkDQorCSAqIGludGVycnVwdCB2aWEgc3luYyBmbG9v
ZA0KKwkgKi8NCiAJaWYgKGFtZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIEFNREdQVV9SQVNf
QkxPQ0tfX0dGWCkpDQogCQlnb3RvIG91dDsNCiANCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
