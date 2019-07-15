Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1001869DE5
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3457189D7D;
	Mon, 15 Jul 2019 21:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710057.outbound.protection.outlook.com [40.107.71.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA73B89D64
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPiq4WRGvFaJReeuA/HmV/sdW8BUHafAtrW5cH1BpmzqAt2FZXV9wB0r5EDvhI26tfbUz9KuJGexgohYaKZTmtBzZEDweIkIwomYTkqoCVDMDNXXdjvO/7XHDdccUghkGmOPHKoYPNZ+D3speKjfKR2SbPSItRq1DuY1ojdDW3LgnB+trZBQtZobFzr1Fh4jYdB3IUqnyIBh9VeaAewawElHUTO2QE3TdpGa4Ki/Yjqlma2ivxp8X3/d9+BYBo/lJvp7RHKnM4crmFm+UxGLL323IxNOYkk9RQsqW7Hu70fsep4Kgq+wZ3hwtSOzja87rdEC3mEBdr9X0l9pJlENyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o43bGlGuaB46ec9uuTstk4e0/uy1MSv7rFDsGxu174=;
 b=YNDLqhYdp1NU5X90UZsnry6i6CSzW18TD5zyiz3p8V4gBLbfOj/wOtEYMxBqQcGs3EYx/uc61ESe0GiC91VDSf2My+63UEunDCeBBWBE6tfoAT+e5LGNnZDG8ZJiQlAq42cubLPuao+cZFkqQdYvPQ6z0YwYcM6vFgx9zKDttvkDnDPD3pQoCs8WIr+jqviJF/hPfLWbGfUcBzox2QFHrZOPET9wEbUvP3F6VUwnTzPAMKeJ9gjSFZ4H4v0smF4TNwyqnbMXTJkSaFiro9jT/m2dXmsDbQ1dUOP3niXzLFTsgH3lNsS1UUIyPDED/6GBUZqigEGHoPcM3S3gOjFh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by BN6PR12MB1923.namprd12.prod.outlook.com (2603:10b6:404:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:06 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:05 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:43 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 85/87] drm/amd/display: Copy GSL groups when committing a new
 context
Date: Mon, 15 Jul 2019 17:20:47 -0400
Message-ID: <20190715212049.4584-86-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(47776003)(2351001)(51416003)(6916009)(476003)(486006)(126002)(2616005)(11346002)(76176011)(86362001)(426003)(186003)(68736007)(336012)(50226002)(446003)(26005)(53936002)(14444005)(2876002)(2870700001)(36756003)(2906002)(81156014)(70586007)(81166006)(8676002)(316002)(5660300002)(54906003)(305945005)(478600001)(50466002)(49486002)(4326008)(48376002)(1076003)(356004)(8936002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1923; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f7da8d8-a22d-4072-d9d7-08d7096a7cba
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1923; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1923:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1923393BDD0CFC8958DD2D2A82CF0@BN6PR12MB1923.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 3La6kRSPZZWOeAe7t6e1VQsPmpp+5sI9bcuwE2ZCMeBOSkwgD6hVHr9zQdnEefWwPpLj1kCixUSBeQZCttqR36Xny0OfAJjhqteCwCiy9T4evJkLwJHfKPpqOsI7HJZrQeEbrskZ/0j/6PM+Uk8tDdyptVNXj2Umd3k1DCxU/tktOM53m5tsfJ1R5f9e+SgYvbpkh0TC3Yjz2IWVy/3KcAO1jjN1agUvu0m/7axtmPOFACf2emNjUUcEaXOojNxJfhLwGKeYBPGLTXiCkof0DC6U5wzeKtAFK4ULycDIDQ7QGBxRTyz6lTkdipkfNtrc+1zV057b9FoI+2glni9S8cw3aBwrRwIFotUU3JpqkytQ/c/yp9HPLzw/B839c2TKPjYveoWc3SPz4aaxaNIORIdVHYVYOY3sNxlg57N7so4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:05.7986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7da8d8-a22d-4072-d9d7-08d7096a7cba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o43bGlGuaB46ec9uuTstk4e0/uy1MSv7rFDsGxu174=;
 b=lIFI5NVTsjawKKLGzO20xommUlQzxWFmzcA4VucGmUHmPgctk1gesyj5udlGYWDkNfxRN0eV/+QwpY/b7p2stBh+ZZFfC7q0EExNv6CxDzNkdCNP1BASZOe5byATtkV1uTJu7qdsUhL3odi82X+mmOoRWr2NbBlZECvbm8HSSWg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, Hersen Wu <hersen.wu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KREMgY29uZmlndXJlcyB0aGUgR1NMIGdyb3VwIGZvciB0aGUgcGlwZSB3aGVuIHBpcGVf
c3BsaXQgaXMgZW5hYmxlZAphbmQgd2UncmUgc3dpdGNoaW5nIGZsaXAgdHlwZXMgKGJ1ZmZlcmVk
IDwtPiBpbW1lZGlhdGUgZmxpcCkgb24gRENOMi4KCkluIG9yZGVyIHRvIHJlY29yZCB3aGF0IEdT
TCBncm91cCB0aGUgcGlwZSBpcyB1c2luZyBEQyBzdG9yZXMgaXQgaW4KdGhlIHBpcGUncyBzdHJl
YW1fcmVzLiBETSBpcyBub3QgYXdhcmUgb2YgdGhpcyBpbnRlcm5hbCBncm91cGluZywgbm9yCmlz
IERDIHJlc291cmNlLgoKU28gd2hlbiBETSBjcmVhdGVzIGEgZGNfc3RhdGUgY29udGV4dCBhbmQg
cGFzc2VzIGl0IHRvIERDIHRoZSBjdXJyZW50CkdTTCBncm91cCBpcyBsb3N0IC0gRE0gbmV2ZXIg
a25ldyBhYm91dCBpdCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpBZnRlciAzIGltbWVkaWF0ZSBmbGlw
cyB3ZSBydW4gb3V0IG9mIEdTTCBncm91cHMgYW5kIHdlJ3JlIG5vIGxvbmdlcgphYmxlIHRvIGNv
cnJlY3RseSBwZXJmb3JtICphbnkqIGZsaXAgZm9yIG11bHRpLXBpcGUgc2NlbmFyaW9zLgoKW0hv
d10KVGhlIGdzbF9ncm91cCBuZWVkcyB0byBiZSBjb3BpZWQgdG8gdGhlIG5ldyBjb250ZXh0LgoK
RE0gaGFzIG5vIGluc2lnaHQgaW50byBHU0wgZ3JvdXBpbmcgYW5kIGNvdWxkIGV2ZW4gcG90ZW50
aWFsbHkgY3JlYXRlCmEgYnJhbmQgbmV3IGNvbnRleHQgd2l0aG91dCByZWZlcmVuY2luZyBjdXJy
ZW50IGhhcmR3YXJlIHN0YXRlLiBTbyB0aGlzCm1ha2VzIHRoZSBtb3N0IHNlbnNlIHRvIGhhdmUg
aGFwcGVuIGluIERDLgoKVGhlcmUgYXJlIHR3byBwbGFjZXMgd2hlcmUgREMgY2FuIGFwcGx5IGEg
bmV3IGNvbnRleHQ6Ci0gZGNfY29tbWl0X3N0YXRlCi0gZGNfY29tbWl0X3VwZGF0ZXNfZm9yX3N0
cmVhbQoKQnV0IHdoYXQncyBzaGFyZWQgYmV0d2VlbiBib3RoIG9mIHRoZXNlIGlzIGFwcGx5X2N0
eF9mb3Jfc3VyZmFjZS4KClRoaXMgbG9naWMgb25seSBtYXR0ZXJzIGZvciBEQ04yLCBzbyBpdCBj
YW4gYmUgcGxhY2VkIGluCmRjbjIwX2FwcGx5X2N0eF9mb3Jfc3VyZmFjZS4gQmVmb3JlIGRvaW5n
IGFueSBsb2NraW5nICh3aGVyZSB0aGUgR1NMCmdyb3VwIGlzIHNldHVwKSB3ZSBjYW4gY29weSBv
dmVyIHRoZSBHU0wgZ3JvdXBzIGJlZm9yZSBjb21taXR0aW5nIHRoZQpuZXcgY29udGV4dC4KCkNo
YW5nZS1JZDogSWQ3MzY0N2Y1MDA1OGRiZTEzMGUxNWZlZTIzZmE5MWVjMzdjNjc2ODIKU2lnbmVk
LW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogSGVyc2VuIFd1IDxoZXJzZW4ud3VAYW1kLmNvbT4KQWNrZWQtYnk6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9od3NlcS5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggNjc2NGFkODQ1Y2Q0Li42OWU0ZDBkOTZjN2Yg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jCkBAIC0xMzY0LDYgKzEzNjQsMTggQEAgc3RhdGljIHZvaWQgZGNuMjBfYXBwbHlfY3R4
X2Zvcl9zdXJmYWNlKAogCWlmICghdG9wX3BpcGVfdG9fcHJvZ3JhbSkKIAkJcmV0dXJuOwogCisJ
LyogQ2Fycnkgb3ZlciBHU0wgZ3JvdXBzIGluIGNhc2UgdGhlIGNvbnRleHQgaXMgY2hhbmdpbmcu
ICovCisJZm9yIChpID0gMDsgaSA8IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaSsrKSB7CisJ
CXN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHggPSAmY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtp
XTsKKwkJc3RydWN0IHBpcGVfY3R4ICpvbGRfcGlwZV9jdHggPQorCQkJJmRjLT5jdXJyZW50X3N0
YXRlLT5yZXNfY3R4LnBpcGVfY3R4W2ldOworCisJCWlmIChwaXBlX2N0eC0+c3RyZWFtID09IHN0
cmVhbSAmJgorCQkgICAgcGlwZV9jdHgtPnN0cmVhbSA9PSBvbGRfcGlwZV9jdHgtPnN0cmVhbSkK
KwkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLmdzbF9ncm91cCA9CisJCQkJb2xkX3BpcGVfY3R4LT5z
dHJlYW1fcmVzLmdzbF9ncm91cDsKKwl9CisKIAl0ZyA9IHRvcF9waXBlX3RvX3Byb2dyYW0tPnN0
cmVhbV9yZXMudGc7CiAKIAlpbnRlcmRlcGVuZGVudF91cGRhdGUgPSB0b3BfcGlwZV90b19wcm9n
cmFtLT5wbGFuZV9zdGF0ZSAmJgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
