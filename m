Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2213B47B2
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DDB6E154;
	Tue, 17 Sep 2019 06:52:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690052.outbound.protection.outlook.com [40.107.69.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29246E154
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6S8Tg6e0rPwBTtmGBXim8c4U8TxhWoPx+9rIP4o1pRU9wrgFTfdT22yBlvC5F5sl7/JPG6UECE0VzbTaGJM5wJjGONNC93XWOkXPbwBnhM4J4MyMtDBNuO/r9e9/eb4TY8JmsSKxoPm8ex/3bZXdkOE36a93iSpNxRSRiGheOs2o1x2258zSBsDc1RtTl4zcp0lUizMzcRRlcnOddzMzP3gSrmUwlDzxRDLMIHg/PQq3eNh0VcyHTZxlYaLqvVC2nvNIxLt1saswUUNgjDRo1ccnr6lT0K8XwuavvNZRVYr4YZECMhdgS84YHbKesnfn8GnaYACSvJCH6aSx8TTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ9RGZDiLgPYO3aEaYkcMgHhqfCG/0j/k+oQfEBd0sI=;
 b=WBNToi2uepQz5lY2LcsGZg3M4U9RjpujidFts7xiPOioizG7SRYVCe+k3yYvZ5W+25fEWAQhMGapzrxx13V7mnwqB/nReprKdDiUFm6IOPDBBU63DhMCM8YpqToIhLato7KDbC83JHf723DNB/QcM/RdBe66usVdYxfW5dgN1t/yPnc2Wt0Z+SvXLQ38X2PnriEpV571yIzD70v6BkpUDOnREGK8ekpsw8drYf8Gcrs4Nb7RFmV59qIAkCpppdDN+i3EXavS21zt7Sfq0vzMKSyumd/+hMdJhVrFF2Y7vbYzOnlDDk7FJ9CW520bT/vAYKlBouDEpVyLOoWoPugwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3527.namprd12.prod.outlook.com (20.179.94.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 06:52:04 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 06:52:04 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Topic: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Index: AQHVbSCpRnXut+ezvEiOIBHKn2ZPqqcvbkKg
Date: Tue, 17 Sep 2019 06:52:04 +0000
Message-ID: <BYAPR12MB28060C4BE2088D071875ABB1F18F0@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20190917062458.29589-1-tao.zhou1@amd.com>
In-Reply-To: <20190917062458.29589-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d324a47-2cde-450f-a66a-08d73b3b8c81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3527; 
x-ms-traffictypediagnostic: BYAPR12MB3527:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3527685BBADCE36D4F25BB31F18F0@BYAPR12MB3527.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(13464003)(199004)(189003)(6636002)(7736002)(74316002)(2501003)(71190400001)(71200400001)(256004)(229853002)(81166006)(486006)(6436002)(33656002)(25786009)(14454004)(478600001)(8936002)(316002)(86362001)(110136005)(305945005)(9686003)(8676002)(14444005)(81156014)(66066001)(446003)(99286004)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(52536014)(6116002)(3846002)(76176011)(7696005)(186003)(6246003)(102836004)(53546011)(11346002)(476003)(6506007)(5660300002)(26005)(55016002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3527;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Uw0dO4srieyYDhm78763/+C/ChPmkJvfu50eyTvL+woUpjuMKnxe2GDSNlgTlk6OShVQjTHVuFoyQByvUaJbW9wth2V9p2q141+GCr9lB0xc2x9pGj6+0J/LI81wwOp98vQBuLxJ58YmvCKBzVoVl6S/sbyy4ILBVkxmI/zXlZQaweYEH+C5fx8AUlgQIrb9yZtnNiV0GTl1JnSgEESWeU+mkubvga3WtWn0fLJpXjcFkvlMvf5OiX2KEfXrfAzp+rENUd67d6aEPekyLshepPRqsJdOq4wLhz6K8XB/DUME7+gsSoVBpicxCXpn4pI1LHNM+C61b41NkzXEEZBYnWcwUN0G7gk0/PjB+cCDT5g6i+6kI02Yt0oh310cb64fHi/PtUq+QiJ4kbxStca9dk4oMabSB611XYRuMLJY2u8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d324a47-2cde-450f-a66a-08d73b3b8c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 06:52:04.0531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAbJrNZ2tXkSI/XnmJsi8JlYT9VSPkMC/pbTJnqzP6qLp3GHWjGWvo0u1CTa1XZfWyCUSooqu2DIZLC5+Xtwcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3527
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ9RGZDiLgPYO3aEaYkcMgHhqfCG/0j/k+oQfEBd0sI=;
 b=PF3ZEErRaE0KmQ6uynwpstfah68LJqKmH2RAZm+z7bHK9ki6DtTSrI3ysBVc48nIczj/BO4WOMCu7Ui7ItA1yEgyu9tfjJdGInT4uZ0rn3+mGCMRx2AQp6T50aJVlnEYjH62NLX5JdgaKjkrd642o6Z5uP0fh3pfxkyPU03wxzk=
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

CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFA
YW1kLmNvbT4gClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxNywgMjAxOSAyOjI1IFBNClRvOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBh
bWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQ2M6IFpob3Ux
LCBUYW8gPFRhby5aaG91MUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHJl
cGxhY2UgRFJNX0VSUk9SIHdpdGggRFJNX1dBUk4gaW4gcmFzX3Jlc2VydmVfYmFkX3BhZ2VzCgpU
aGVyZSBhcmUgdHdvIGNhc2VzIG9mIHJlc2VydmUgZXJyb3Igc2hvdWxkIGJlIGlnbm9yZWQ6CjEp
IGEgcmFzIGJhZCBwYWdlIGhhcyBiZWVuIGFsbG9jYXRlZCAodXNlZCBieSBzb21lb25lKTsKMikg
YSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gcmVzZXJ2ZWQgKGR1cGxpY2F0ZSBlcnJvciBpbmplY3Rp
b24gZm9yIG9uZSBwYWdlKTsKCkRSTV9FUlJPUiBpcyB1bm5lY2Vzc2FyeSBmb3IgdGhlIGZhaWx1
cmUgb2YgYmFkIHBhZ2UgcmVzZXJ2ZQoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91
MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8
IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA3OWU1ZTViZThi
MzQuLjVmNjIzZGFmNTA3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YwpAQCAtMTQwOSwxMCArMTQwOSwxNSBAQCBpbnQgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdl
cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2Vy
dmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewogCQlicCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVk
X3BhZ2U7CiAKKwkJLyogVGhlcmUgYXJlIHR3byBjYXNlcyBvZiByZXNlcnZlIGVycm9yIHNob3Vs
ZCBiZSBpZ25vcmVkOgorCQkgKiAxKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiBhbGxvY2F0ZWQg
KHVzZWQgYnkgc29tZW9uZSk7CisJCSAqIDIpIGEgcmFzIGJhZCBwYWdlIGhhcyBiZWVuIHJlc2Vy
dmVkIChkdXBsaWNhdGUgZXJyb3IgaW5qZWN0aW9uCisJCSAqICAgIGZvciBvbmUgcGFnZSk7CisJ
CSAqLwogCQlpZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgUEFHRV9T
SElGVCwgUEFHRV9TSVpFLAogCQkJCQkgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKIAkJ
CQkJICAgICAgICZibywgTlVMTCkpCltHdWNodW5dRG8gd2UgbmVlZCB0byBjaGFuZ2UgUEFHRV9T
SElGVCB0byBBTURHUFVfR1BVX1BBR0VfU0hJRlQgaGVyZT8KCi0JCQlEUk1fRVJST1IoIlJBUyBF
UlJPUjogcmVzZXJ2ZSB2cmFtICVsbHggZmFpbFxuIiwgYnApOworCQkJRFJNX1dBUk4oIlJBUyBX
QVJOOiByZXNlcnZlIHZyYW0gZm9yIHJldGlyZWQgcGFnZSAlbGx4IGZhaWxcbiIsIGJwKTsKIAog
CQlkYXRhLT5icHNfYm9baV0gPSBibzsKIAkJZGF0YS0+bGFzdF9yZXNlcnZlZCA9IGkgKyAxOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
