Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF99D9C1
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 01:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31758897E0;
	Mon, 26 Aug 2019 23:07:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BD2897DC
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 23:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HydRfKuHgIVtnRS77fjF5AlwXOMgJVI64D7gnK1GcyrT0mhBoKda9s2LTY4jDzlJYueSndXR4E5Ft8iN/ZHx/jLdbhrRea1tBJtEY1TxJ0xPfPM+Oc1TcCavw8DwCZmbUfmkmTMNfdbdjhOiyFNGKsZPvspQVG2xQEOFd1R4NJgt7NYChleRGbtOpmGBfvHm94wct/l+9j5puqH0+GTnrq27pidBeYhbscBlkX6X7khonawzZ94UKCWyrmf7w3yb/yfJJ0V9EFDeqeCOvdMziVXYvGnf8Jvn3TIkSVqaUvLHndMIwu2zTbOREogr/q8wK7cGADWkNZLUPIQm9YXUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ3Rz3nw5Eer4UxBjNW9YzRV67paYn/pv8U+ox1o1pM=;
 b=VRTmiXWegT0KbXmwlhwl0LO888Tt13DK9qiB3pxPuIh2vr5wKc/BRcOk1xmZ7EfSqyEgc53+HnWi8N1TpNfRmcvuaqWRga+cW/XneND7Hm7uf6UgAp4oEMnX5BPKi0O2BlcznLbuRWSeT7LZU8Oas4Im+HSP3ztf4KzVsRvTqsqQ3r2a4sKFH7hc6oUVYZLcQjFwL6uPiOwd8a6zeAaghpoa3/XUt/JyuIfugSbsERfetlWGPGyqe6ZqHXKWBECDFHTkW/zabmLsf1CDeKIs0P5ELWHpsUEnYISTfeMC2puXNFSniMh12CK/14pYY3esxtxgdiFNwzr/I48aZGUqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3419.namprd12.prod.outlook.com (20.178.198.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 23:07:11 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 23:07:11 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amdgpu: Extends amdgpu vm definitions (v2)
Thread-Topic: [PATCH 1/4] drm/amdgpu: Extends amdgpu vm definitions (v2)
Thread-Index: AQHVXGL9O07buUE9QE2RgfHgFt0WqA==
Date: Mon, 26 Aug 2019 23:07:11 +0000
Message-ID: <20190826230355.25007-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70f13d89-5337-42bb-4830-08d72a7a202f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3419; 
x-ms-traffictypediagnostic: DM6PR12MB3419:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3419C52041B94BC96D44D88792A10@DM6PR12MB3419.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(7736002)(305945005)(4744005)(8676002)(6512007)(8936002)(81166006)(99286004)(6506007)(386003)(1076003)(50226002)(316002)(102836004)(66476007)(6486002)(81156014)(6436002)(478600001)(2906002)(5660300002)(14454004)(5640700003)(4326008)(36756003)(71200400001)(256004)(71190400001)(54906003)(25786009)(3846002)(6116002)(66446008)(64756008)(53936002)(2501003)(66066001)(66946007)(486006)(86362001)(66556008)(186003)(2351001)(6916009)(26005)(52116002)(476003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3419;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Q2ljjWh6nm6WXDLOCPKrfUHugqZYIKoVT8SdyNkHqyxbGdOPgGIqquKC3mP0kU2+ymGTmnPe0xWcPyAXK3CQz9D0Qg08/ujzXjS8pE89BY8ynB2JvrhUi/EF9u4bhsR8Xr7R5uGMjM7WBAsyxPjle7XgnoahDaIpyC0OqG/AaRwXHIXslbtRz90yCBk5PvxS77nmBKhA7I+IB5WDNO5MD/5uU0hgefgFxVnx/EzajKY2JdiQhMpxA/i3KGzMOuU3/228CWU3isxHvoWNxk/dHyECKjiAo6e6UqnpLeL7Vg3ro8PlPNiXtv3ra/PEhJZcCFViK4NHpZ+XAWIvN8tx/4JuwXRTIsl0bPkBhdDaH3F5fxeOgITuZkpwHwtt3uVPEeq3Y8i4tdGyU0wmLIDe1ZWW6tiHgvnO13hkL7pSnA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f13d89-5337-42bb-4830-08d72a7a202f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 23:07:11.4188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MC5cdRrJXSoC1MaGARhK9NMEqxM6SHhZZC4RAUcieiPWrBNITQWoDYKMtWuamddLCBmKSFMCV5TZRQceRfim8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ3Rz3nw5Eer4UxBjNW9YzRV67paYn/pv8U+ox1o1pM=;
 b=xQwSvrs+qv+MPvrPyRiSubAvi9WUxFgbZGJzjvXJ4VKjE6SVixvvvMV4iSYVAtEEfnIOZlcjZHSl7mtrOxOWMaSEK1Y304sXRghnX9Zf64FvYBCI1fWAakFwneDYxyJ3nkhi/gu95Yc1ZWAhrcmZyJkOnchjV7ADgp8zHz0NQj0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpBZGQgUlcgbXR5cGUgaW50cm9kdWNl
ZCBmb3IgYXJjdHVydXMuCgp2MjoKKiBEb24ndCBhZGQgcHJvYmUtaW52YWxpZGF0aW9uIGJpdCBm
cm9tIFVBUEkKKiBEb24ndCBhZGQgdW51c2VkIEFNREdQVV9NVFlQRV8gZGVmaW5pdGlvbnMKClNp
Z25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL3VhcGkv
ZHJtL2FtZGdwdV9kcm0uaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFw
aS9kcm0vYW1kZ3B1X2RybS5oCmluZGV4IGNhOTdiNjgwMjI3NS4uZjNhZDQyOTE3M2UzIDEwMDY0
NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL2FtZGdwdV9kcm0uaApAQCAtNTAzLDYgKzUwMyw4IEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2dl
bV9vcCB7CiAjZGVmaW5lIEFNREdQVV9WTV9NVFlQRV9DQwkJKDMgPDwgNSkKIC8qIFVzZSBVQyBN
VFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZUEUgKi8KICNkZWZpbmUgQU1ER1BVX1ZNX01UWVBF
X1VDCQkoNCA8PCA1KQorLyogVXNlIFJXIE1UWVBFIGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAq
LworI2RlZmluZSBBTURHUFVfVk1fTVRZUEVfUlcJCSg1IDw8IDUpCiAKIHN0cnVjdCBkcm1fYW1k
Z3B1X2dlbV92YSB7CiAJLyoqIEdFTSBvYmplY3QgaGFuZGxlICovCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
