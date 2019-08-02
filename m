Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1387FE0C
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 18:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA666EEC2;
	Fri,  2 Aug 2019 16:04:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C06B6EEC4
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 16:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+dPnqTwbm6P950V0gm6jOPjvQapMMHVNO4p+su4XdsoXW8uzHTLBRJZVybkBkz7dkVRsvWhy3BWaNsecA8cA4qXhhIVK+JcBC6E/Yf9GmNezRwyIccvLsKuKRhEiIuogFSKoVzYai9Dolt6fLFFvzuRAlmfqcfqkmIzeGqTMF+zIVjZoy/0D/EsfxGXU3qxA0km51BrFniV7fF3/2gkn87xBcfw2NYlnjp9OtXoKfurK63FU41fAIcMoYFlabY/lQh4wXPRGhTMmEoBZy1gvCxW8V185GeqvtWJSmh9mf5EhJ0qLCl/c5fMYkLu8ZfTE/DLqjQDC/K2UwlEIp7Yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZFrDdUqgbigKf49Lo6T2++f+WBLLm8YqSKzFU6CjyE=;
 b=dzuQWxvDmVLAD8rpw24Z2no9FUkC02oO7AU9NVEvJLj+p+cpvLbQKIjlIYqFjK5TxrAfWGavDzMdaflr3UimkMcK/cw70B+te7mmioHN0eBDnvbpD+TuCBYxIRLxRwX60/GJ3KNIo1j9ZKpqCnaXW/fmBiwKOZfrOEemum5oroimDFEcDrh3QLXlyMBc9eTBirX+13cyriHl5gTD6jlCwxTLe/YcsFh2mp6iKVGgtT6xXRPoAkdUZe9c88P5nfftmYvPAnzDbvmOG1bOlkliUifM6u83twCzcMTVptPhwme5M0Fd3wjTThx/0ARASBAjLcDg9fJW8VFeCfO+ddt74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2371.namprd12.prod.outlook.com (52.132.27.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Fri, 2 Aug 2019 16:04:05 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 16:04:05 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd/gfx10: Calling amdgpu functions to invalidate
 TLB
Thread-Topic: [PATCH 2/2] drm/amdkfd/gfx10: Calling amdgpu functions to
 invalidate TLB
Thread-Index: AQHVSUvoP9JlpeNHSE6b/b0ma5VVWg==
Date: Fri, 2 Aug 2019 16:04:05 +0000
Message-ID: <1564761834-19210-2-git-send-email-Oak.Zeng@amd.com>
References: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acbc9a4d-c021-41b6-3657-08d717630b49
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2371; 
x-ms-traffictypediagnostic: BL0PR12MB2371:
x-microsoft-antispam-prvs: <BL0PR12MB23715EF48518B605216B7FE780D90@BL0PR12MB2371.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(199004)(189003)(52116002)(68736007)(76176011)(11346002)(3846002)(6116002)(446003)(2351001)(8936002)(8676002)(6486002)(5660300002)(66066001)(81166006)(186003)(50226002)(476003)(2616005)(486006)(81156014)(316002)(26005)(2906002)(256004)(14444005)(36756003)(386003)(6506007)(66446008)(7736002)(6436002)(66556008)(66476007)(305945005)(6916009)(14454004)(478600001)(71190400001)(71200400001)(66946007)(25786009)(5640700003)(4326008)(2501003)(53936002)(64756008)(6512007)(86362001)(102836004)(54906003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2371;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ElPre5OgH0RTZmoUqXqHgQ647ytbOFfyfeNJmChAwHl03PKvEKoSqePNPHz95Ik/sjZc1V3MsaQ+IEFdZD4nBirMGc+HSQjjSn9IY5CFK2wy60ii4MMlynFVrF3YAuc0Ye4rOF+2/4z1KRDItL4R0yeSUQz8GyGxwzg2Uxq19hzSfuUpSWEYUcc8CLH2eN8A7BAmNh932e9BxPMEYrj9ZWCVvffA1ybFQDyBB1KTojgLqXM4bUGLVZTnC8sKIfq29mFCTc2ruuX7mv1oxDKuAeESfAS9DU5mM/qP6jDPkBjenp0D6IhA/Ge84l7cxul6NZ7c0iuCkkI4m1QWpnhvgHcoxhpfzFV/R8YMpRoLkAWYvb5jI3bGLvNUGVuNIeHWvUq4LjerQi01kFVPQoIeQyIlTYX6PTXnHmnD8Xds5rw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbc9a4d-c021-41b6-3657-08d717630b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 16:04:05.6721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2371
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZFrDdUqgbigKf49Lo6T2++f+WBLLm8YqSKzFU6CjyE=;
 b=uVJmoVjmxtbz9cC/4eC6JnjzSFZgd06p5WmUBDb6vYFQGRHK4aZijeF08E5AbfUZhdB+/TYTtbXR0ulqqFpsSzmfzBf0kfKVmdqir0F0okbcxrUyBDZGLgaR+FGsg3UWxb3HedVJSx+rprm06KsQvOWQASDPPtEoQg+mRuSK1Bs=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2FsbGluZyBhbWRncHUgZnVuY3Rpb24gdG8gaW52YWxpZGF0ZSBUTEIsIGluc3RlYWQgb2YgdXNp
bmcgYQprZmQgaW1wbGVtZW50YXRpb24uIERlbGV0ZSB0aGUga2ZkIGxvY2FsIFRMQiBpbnZhbGlk
YXRpb24KaW1wbGVtZW50YXRpb24uCgpDaGFuZ2UtSWQ6IElhMTZmY2Y5MDkxYTkzYjhjMGFjZGFm
OTk4MWY4YTVhMWY5YTVjYTFkClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Yx
MC5jIHwgNDEgKystLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYwppbmRleCAzOWZmYjA3Li5lN2FlMTk4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAu
YwpAQCAtODAyLDQyICs4MDIsNiBAQCBzdGF0aWMgdWludDE2X3QgZ2V0X2F0Y192bWlkX3Bhc2lk
X21hcHBpbmdfcGFzaWQoc3RydWN0IGtnZF9kZXYgKmtnZCwKIAlyZXR1cm4gcmVnICYgQVRDX1ZN
SUQwX1BBU0lEX01BUFBJTkdfX1BBU0lEX01BU0s7CiB9CiAKLXN0YXRpYyB2b2lkIHdyaXRlX3Zt
aWRfaW52YWxpZGF0ZV9yZXF1ZXN0KHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQ4X3Qgdm1pZCkK
LXsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
KSBrZ2Q7Ci0JdWludDMyX3QgcmVxID0gKDEgPDwgdm1pZCkgfAotCQkoMCA8PCBHQ1ZNX0lOVkFM
SURBVEVfRU5HMF9SRVFfX0ZMVVNIX1RZUEVfX1NISUZUKSB8LyogbGVnYWN5ICovCi0JCUdDVk1f
SU5WQUxJREFURV9FTkcwX1JFUV9fSU5WQUxJREFURV9MMl9QVEVTX01BU0sgfAotCQlHQ1ZNX0lO
VkFMSURBVEVfRU5HMF9SRVFfX0lOVkFMSURBVEVfTDJfUERFMF9NQVNLIHwKLQkJR0NWTV9JTlZB
TElEQVRFX0VORzBfUkVRX19JTlZBTElEQVRFX0wyX1BERTFfTUFTSyB8Ci0JCUdDVk1fSU5WQUxJ
REFURV9FTkcwX1JFUV9fSU5WQUxJREFURV9MMl9QREUyX01BU0sgfAotCQlHQ1ZNX0lOVkFMSURB
VEVfRU5HMF9SRVFfX0lOVkFMSURBVEVfTDFfUFRFU19NQVNLOwotCi0JbXV0ZXhfbG9jaygmYWRl
di0+c3JibV9tdXRleCk7Ci0KLQkvKiBVc2UgbGlnaHQgd2VpZ2h0IGludmFsaWRhdGlvbi4KLQkg
KgotCSAqIFRPRE8gMTogYWdyZWUgb24gdGhlIHJpZ2h0IHNldCBvZiBpbnZhbGlkYXRpb24gcmVn
aXN0ZXJzIGZvcgotCSAqIEtGRCB1c2UuIFVzZSB0aGUgbGFzdCBvbmUgZm9yIG5vdy4gSW52YWxp
ZGF0ZSBvbmx5IEdDSFVCIGFzCi0JICogU0RNQSBpcyBub3cgbW92ZWQgdG8gR0NIVUIKLQkgKgot
CSAqIFRPRE8gMjogc3VwcG9ydCByYW5nZS1iYXNlZCBpbnZhbGlkYXRpb24sIHJlcXVpcmVzIGtm
ZzJrZ2QKLQkgKiBpbnRlcmZhY2UgY2hhbmdlCi0JICovCi0JV1JFRzMyKFNPQzE1X1JFR19PRkZT
RVQoR0MsIDAsIG1tR0NWTV9JTlZBTElEQVRFX0VORzBfQUREUl9SQU5HRV9MTzMyKSwKLQkJCQkw
eGZmZmZmZmZmKTsKLQlXUkVHMzIoU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HQ1ZNX0lOVkFM
SURBVEVfRU5HMF9BRERSX1JBTkdFX0hJMzIpLAotCQkJCTB4MDAwMDAwMWYpOwotCi0JV1JFRzMy
KFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0NWTV9JTlZBTElEQVRFX0VORzBfUkVRKSwgcmVx
KTsKLQotCXdoaWxlICghKFJSRUczMihTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdDVk1fSU5W
QUxJREFURV9FTkcwX0FDSykpICYKLQkJCQkJKDEgPDwgdm1pZCkpKQotCQljcHVfcmVsYXgoKTsK
LQotCW11dGV4X3VubG9jaygmYWRldi0+c3JibV9tdXRleCk7Ci19Ci0KIHN0YXRpYyBpbnQgaW52
YWxpZGF0ZV90bGJzX3dpdGhfa2lxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MTZf
dCBwYXNpZCkKIHsKIAlzaWduZWQgbG9uZyByOwpAQCAtODc4LDcgKzg0Miw4IEBAIHN0YXRpYyBp
bnQgaW52YWxpZGF0ZV90bGJzKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQxNl90IHBhc2lkKQog
CQlpZiAoZ2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfdmFsaWQoa2dkLCB2bWlkKSkgewogCQkJ
aWYgKGdldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5nX3Bhc2lkKGtnZCwgdm1pZCkKIAkJCQk9PSBw
YXNpZCkgewotCQkJCXdyaXRlX3ZtaWRfaW52YWxpZGF0ZV9yZXF1ZXN0KGtnZCwgdm1pZCk7CisJ
CQkJYW1kZ3B1X2dtY19mbHVzaF92bV9odWIoYWRldiwgdm1pZCwKKwkJCQkJCUFNREdQVV9HRlhI
VUJfMCwgMCk7CiAJCQkJYnJlYWs7CiAJCQl9CiAJCX0KQEAgLTg5Niw3ICs4NjEsNyBAQCBzdGF0
aWMgaW50IGludmFsaWRhdGVfdGxic192bWlkKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQxNl90
IHZtaWQpCiAJCXJldHVybiAwOwogCX0KIAotCXdyaXRlX3ZtaWRfaW52YWxpZGF0ZV9yZXF1ZXN0
KGtnZCwgdm1pZCk7CisJYW1kZ3B1X2dtY19mbHVzaF92bV9odWIoYWRldiwgdm1pZCwgQU1ER1BV
X0dGWEhVQl8wLCAwKTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
