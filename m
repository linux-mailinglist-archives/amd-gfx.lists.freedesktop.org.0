Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2180DE1D6
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 03:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5858E89911;
	Mon, 21 Oct 2019 01:51:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810047.outbound.protection.outlook.com [40.107.81.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EBF89911
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 01:51:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/Iw152fXXUWgdsgUaUH8o2hPsGTBJT96iF7/ymRayfpFqb57qoL5za1v6qaxbZUwU8o/49VLIMboiJWJzhXse0JlUvziSuMkaJmsPl6zXN164Ttcx/p7s7ZVmwT9s5rKTWwXBt/XoOvQknFXpY/FXPLYT6qEiBbT6Qh1ldHNtU3s92KEJo+fKQozSOlkgRDbzRgsyf7NBU7l/K18H6A99IpxYwL5QoWLz0lOweNsbeXDQaMPwyIPSftxAJ7+Nl85xJOmTpnbX5XzL16w0dRzTuTVhabCq/N/8BEjLP1ZXmfBDUu6OHZzb078NBBZOEX9DZlbFvINeiHHtzTfvvfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3PwcCxldxTWJLxKnmX+LpzBRXE7OV+LLiu0URb35Ag=;
 b=af7VkfiRpQ7SE+neCedyZ7CXvZEUVhKguPxKJ+NueHtzfUo7hoddfj3tHjbeBstsoSqibScakFWJHXRM3AbXqZR7ywD3jtdYW258mJ7Zt8JbyJjF/60e+gxSmIEQ44SPeJWiOPBMCnW3xPHD8ogD716mLxWQkfUJ7YhFF4VPYhub04rkvCBQacbsfZQJLuWE/kyEYubjZejoLgVJ2k21D542+N+EeZ/6E9VJzCmKEMn+8FgSgmip1CJpC8pUxfNS3T5VS9VPO8fYyFr0gAk6L79F+2WSfeSL+zH+E7EelVkDeheEz92J6qEKAf0nWchHDpDDOznjNaWncy+rPF9BnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3445.namprd12.prod.outlook.com (20.178.196.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 01:51:10 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::cd:2613:ee29:5acb%7]) with mapi id 15.20.2367.019; Mon, 21 Oct 2019
 01:51:10 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Topic: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after
 SMU ready.
Thread-Index: AQHVhfWbSLeAiGCd9EKnIRhe+GTWP6dkVmBw
Date: Mon, 21 Oct 2019 01:51:09 +0000
Message-ID: <BYAPR12MB2806716EFABC7A26DD9DABD5F1690@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
 <1571431711-30149-5-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1571431711-30149-5-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65cddc48-1fb5-42eb-889f-08d755c92573
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR12MB3445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3445DE6A2CEC67D82A9DC5F5F1690@BYAPR12MB3445.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(13464003)(6116002)(6436002)(25786009)(6246003)(55016002)(186003)(8676002)(81166006)(561944003)(81156014)(2906002)(9686003)(229853002)(33656002)(26005)(5660300002)(71200400001)(71190400001)(316002)(66946007)(66476007)(66556008)(64756008)(66446008)(66066001)(486006)(74316002)(86362001)(14454004)(110136005)(76116006)(54906003)(99286004)(478600001)(4326008)(76176011)(7736002)(2501003)(102836004)(3846002)(52536014)(6506007)(11346002)(53546011)(446003)(14444005)(305945005)(7696005)(476003)(256004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3445;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GGDUaB0JPFpts2j52Ck05lxxsHJkuz8//Fnx78KhoI6dWwn/AApQVXRZeoVQkGhKW3/ph5Tvrx1EObwtYaMTEwo4aUS/XwR2npHhEiLxzrQos71dbQjJum48nhIfQumwrZX7D3ISTs66luTx5zSAuoWxPHgd4YuFDuFm+mf5t7Xe+cQu6shiKU0MutQcLZcKEFzSbWIayR2/74ZsJv2MV/jpKDUR2J6ezGlA8Dl19um7fm7bwavmZ2P/Bh2j+ZsLtEkRWuR/aUXciSPrgOQibHyVr4+S68h1+oZl6fYNP4qhNY/EGezqjovx+wGL+ieGGIBz4nVohqJln7/GzIfZ30z3zDMyu47e0d5jC1+UG5MeZeIA7sRm6VD/EsQa9MYBPaFOnm0jUp+xTZsw//fIuPVJ7lLJLQ+QpDIvA6aZXTAIBHGXsy73eyz7JtuphrGA
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cddc48-1fb5-42eb-889f-08d755c92573
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 01:51:09.9411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRLA5oGSvDHWnpXLNOVuRZFNCiWQKTlfKMLoWoKSNub83SLqEpbwZb3mlfbriaErCA5lMcXDhNVXog9sT2KCCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3445
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3PwcCxldxTWJLxKnmX+LpzBRXE7OV+LLiu0URb35Ag=;
 b=HijOsxMhue+ocrZiJz682FFNufJ8AEWUERllUv7LqRiYpNGgQJmePSbIUINRAuGHDlsauSZKfVDiRYZOS/Rc1zfBBHn+PeyfDcy4IR7mOxNv8BsRQmzNwZp0wmjDkRxkZ8MzukOBI8XgQ9eHx5p4/qrP8r0vE74vnewJqwi9A2k=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>,
 "noreply-confluence@amd.com" <noreply-confluence@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBkb24ndCB0aGluayBwb3N0cG9uZSBSQVMgcmVjb3ZlcnkgaW5pdCBpcyBub3Qgb25lIHJlYXNv
bmFibGUgcHJvcG9zYWwuIFdoYXQgd2UgZG8gaW4gcmVjb3ZlcnkgaW5pdCBpcyB0byByZWFkIHRo
ZSByZXRpcmVkIHBhZ2UgaWYgdGhlcmUgaXMsIGFuZCByZXRpcmUgY29ycmVzcG9uZGluZyBtZW1v
cnksIHRoaXMgd2lsbCBtYWtlIHN1cmUgdGhlc2UgcGFnZXMgYXJlIHJlc2VydmVkIHdlbGwgYmVm
b3JlIHNldHRpbmcgdXAgbWVtb3J5IG1hbmFnZXIgYW5kIHJlc2VydmluZyBvdGhlciBtZW1vcnkg
YmxvY2tzLCBpdCB3aWxsIGJlIHNhZmUuCgpSZWdhcmRzLApHdWNodW4KCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCkZyb206IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBh
bWQuY29tPiAKU2VudDogU2F0dXJkYXksIE9jdG9iZXIgMTksIDIwMTkgNDo0OSBBTQpUbzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5A
YW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFu
ZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgbm9yZXBseS1jb25mbHVlbmNlQGFtZC5j
b207IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgR3JvZHpvdnNreSwgQW5kcmV5IDxB
bmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0ggNC80XSBkcm0vYW1kZ3B1
OiBNb3ZlIGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdCB0byBhZnRlciBTTVUgcmVhZHkuCgpGb3Ig
QXJjdHVydXMgdGhlIEkyQyB0cmFmZmljIGlzIGRvbmUgdGhyb3VnaCBTTVUgdGFibGVzIGFuZCBz
byB3ZSBtdXN0IHBvc3Rwb25lIFJBUyByZWNvdmVyeSBpbml0IHRvIGFmdGVyIHRoZXkgYXJlIHJl
YWR5IHdoaWNoIGlzIGluIGFtZGdwdV9kZXZpY2VfaXBfaHdfaW5pdF9waGFzZTIuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxMyArKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgfCAxMSAt
LS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXgg
MTdjZmRhZi4uYzQwZTlhNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwpAQCAtMTg1MCw2ICsxODUwLDE5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9p
cF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmIChyKQogCQlnb3RvIGluaXRf
ZmFpbGVkOwogCisJLyoKKwkgKiByZXRpcmVkIHBhZ2VzIHdpbGwgYmUgbG9hZGVkIGZyb20gZWVw
cm9tIGFuZCByZXNlcnZlZCBoZXJlLAorCSAqIGl0IHNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgYW1k
Z3B1X2RldmljZV9pcF9od19pbml0X3BoYXNlMiAgc2luY2UKKwkgKiBmb3Igc29tZSBBU0lDcyB0
aGUgUkFTIEVFUFJPTSBjb2RlIHJlbGllcyBvbiBTTVUgZnVsbHkgZnVuY3Rpb25pbmcKKwkgKiBm
b3IgSTJDIGNvbW11bmljYXRpb24gd2hpY2ggb25seSB0cnVlIGF0IHRoaXMgcG9pbnQuCisJICog
cmVjb3ZlcnlfaW5pdCBtYXkgZmFpbCwgYnV0IGl0IGNhbiBmcmVlIGFsbCByZXNvdXJjZXMgYWxs
b2NhdGVkIGJ5CisJICogaXRzZWxmIGFuZCBpdHMgZmFpbHVyZSBzaG91bGQgbm90IHN0b3AgYW1k
Z3B1IGluaXQgcHJvY2Vzcy4KKwkgKgorCSAqIE5vdGU6IHRoZW9yZXRpY2FsbHksIHRoaXMgc2hv
dWxkIGJlIGNhbGxlZCBiZWZvcmUgYWxsIHZyYW0gYWxsb2NhdGlvbnMKKwkgKiB0byBwcm90ZWN0
IHJldGlyZWQgcGFnZSBmcm9tIGFidXNpbmcKKwkgKi8KKwlhbWRncHVfcmFzX3JlY292ZXJ5X2lu
aXQoYWRldik7CisKIAlpZiAoYWRldi0+Z21jLnhnbWkubnVtX3BoeXNpY2FsX25vZGVzID4gMSkK
IAkJYW1kZ3B1X3hnbWlfYWRkX2RldmljZShhZGV2KTsKIAlhbWRncHVfYW1ka2ZkX2RldmljZV9p
bml0KGFkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmluZGV4IDJl
ODVhNTEuLjEwNDVjM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMK
QEAgLTE3MjEsMTcgKzE3MjEsNiBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KSAgI2VuZGlmCiAKIAkvKgotCSAqIHJldGlyZWQgcGFnZXMgd2lsbCBiZSBs
b2FkZWQgZnJvbSBlZXByb20gYW5kIHJlc2VydmVkIGhlcmUsCi0JICogaXQgc2hvdWxkIGJlIGNh
bGxlZCBhZnRlciB0dG0gaW5pdCBzaW5jZSBuZXcgYm8gbWF5IGJlIGNyZWF0ZWQsCi0JICogcmVj
b3ZlcnlfaW5pdCBtYXkgZmFpbCwgYnV0IGl0IGNhbiBmcmVlIGFsbCByZXNvdXJjZXMgYWxsb2Nh
dGVkIGJ5Ci0JICogaXRzZWxmIGFuZCBpdHMgZmFpbHVyZSBzaG91bGQgbm90IHN0b3AgYW1kZ3B1
IGluaXQgcHJvY2Vzcy4KLQkgKgotCSAqIE5vdGU6IHRoZW9yZXRpY2FsbHksIHRoaXMgc2hvdWxk
IGJlIGNhbGxlZCBiZWZvcmUgYWxsIHZyYW0gYWxsb2NhdGlvbnMKLQkgKiB0byBwcm90ZWN0IHJl
dGlyZWQgcGFnZSBmcm9tIGFidXNpbmcKLQkgKi8KLQlhbWRncHVfcmFzX3JlY292ZXJ5X2luaXQo
YWRldik7Ci0KLQkvKgogCSAqVGhlIHJlc2VydmVkIHZyYW0gZm9yIGZpcm13YXJlIG11c3QgYmUg
cGlubmVkIHRvIHRoZSBzcGVjaWZpZWQKIAkgKnBsYWNlIG9uIHRoZSBWUkFNLCBzbyByZXNlcnZl
IGl0IGVhcmx5LgogCSAqLwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
