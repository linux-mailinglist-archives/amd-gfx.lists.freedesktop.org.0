Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81AC02FC
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 12:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46F6EEF1;
	Fri, 27 Sep 2019 10:08:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1FF6EEF1
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 10:08:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbORuFSZh8+rrMcJeU9RSe6m5JeT9sN0QevbaXvJ5xWI5rW5Gs/DFxM/QoNDt+1lyn1w/oNP26pN1Q7q+VIBOlRKcHBDKHWx6dix+hwOPJY5aRB3QtMcX+QAci4Kt/lPtZGZkVMV3N5qYZX1HaoGUxc4CHarVqXnsd8IoptTI4fOntDHqXwg/T1kQmXf4Xx16ZN0x6Q/Jg4ykTe+XD9CznSf9eJu2W06XgRb7CA54uJmIphGbdppFPKdEWW0nAB3HMxe5YfZiy8D1DFoX+0xqIUgFk5vsV9HRJSyVDPY4u8+18Wlcx0+jTFwRPGRkPEfcWKWLh9iYeCvQ4bxhBc+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKEK18WmQQlTAwpxeRdBF4Xnb5/x2Vp1MNqBHhhYJ6A=;
 b=dFF3FlyPnMEYG+kl+n7NmXGUUvmZyP8uQSmXSCMcjwfq3qcv0vVHAJCJXcYsxVPAc5f6A1avJQkuil1gIdejAhUSz3jeGuU3QTkCzSZlRUyeStlAVRaLYrbgFUQHlyRP9q7GV8fTot3RxXJwc1A5mIALgVK64unn+jIgwhUrUUSUup+kT4h4PdP0IKO6PsYq/9Fx0iouow1bhsxOpU0BF8qo6u9+5Ub1GimzjnuY+wod3CdwvDug2UoErx+kUVlwS3EsY4BAks8oDi2onVWfNFojyfrfiqWaPdQdUQX+a4NR3jhAGadgAJP8ie38uEnR85ZT4l6rNc1qDdFDALgZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=debian.debian smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:301:4a::30) by DM5PR12MB2501.namprd12.prod.outlook.com
 (2603:10b6:4:b4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21; Fri, 27 Sep
 2019 10:08:34 +0000
Received: from CO1NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by MWHPR1201CA0020.outlook.office365.com
 (2603:10b6:301:4a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Fri, 27 Sep 2019 10:08:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT003.mail.protection.outlook.com (10.152.80.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 27 Sep 2019 10:08:33 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 27 Sep 2019 05:08:32 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: Protect backend resource when unload driver
Date: Fri, 27 Sep 2019 18:07:44 +0800
Message-ID: <1569578864-4558-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(428003)(199004)(189003)(426003)(126002)(305945005)(70586007)(2906002)(486006)(356004)(6666004)(50226002)(478600001)(70206006)(50466002)(336012)(8936002)(5660300002)(81166006)(8676002)(47776003)(476003)(2616005)(186003)(14444005)(51416003)(7696005)(86362001)(2351001)(81156014)(48376002)(6916009)(53416004)(316002)(26005)(4326008)(36756003)(16586007)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2501; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f29e4a-03a1-44fc-fa78-08d74332a7bc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB2501; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2501:
X-Microsoft-Antispam-PRVS: <DM5PR12MB25018FEC26B138C7CC5DDF57EF810@DM5PR12MB2501.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-Forefront-PRVS: 0173C6D4D5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yn4bawKrRijeYPsvkj7L4hfar/nrmChuVULEHyXgjzuNgljcBcXWAWuv5vXNYHPid9lJC1E5NQyFOmC9wKneon+u6LHOFNLl1cpAkFIK/X8+CF21xZ16r+hK5RniadsgbVVd6kpEmwtddcfTAxpnuNjFGdBhtElvoLD44gCkQXOubjWnJHIXaQqRytKRzVZRhbXx4QZdJud8ZUcEb6rDASNLUpTk0Nt2FJinHQffNnBZgPV8DomIIMbds+IVhIEa9tfYym1QfOlkBVW9z8uJJejBN7sMRCDu4BdtyayaRv+jw7DSKppwoOz3j/M50/jy9pn5LU3bX3nU9nOQGpOiUvYKoQzMOGlzXFQB974M2Lrr3Tldy1TlPIkZDdNDc6wdND1i/DqFVUdZGquaDmiwq5Nkhy6TxHrsd1zFbsjJj9Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2019 10:08:33.5358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f29e4a-03a1-44fc-fa78-08d74332a7bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKEK18WmQQlTAwpxeRdBF4Xnb5/x2Vp1MNqBHhhYJ6A=;
 b=wFSdpkrh6HXmiJd11yKf+mlpxBWiotKPe0siSgRJoP3GLw174r5aPsAxPbC/E/Xo+x+O9czs4JMPBGCm3ESxXcDpFg2H4TMOrtOilEY+TCpK/YGIr6Ps1G1A+Wn3R2sGy9wPcobliJLjQsBZdU2OqX8mPCY3pM6Ar9Ms6/UPq5s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; debian.debian; dkim=none (message not signed)
 header.d=none; debian.debian; dmarc=permerror action=none header.from=amd.com; 
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
Cc: root <root@debian.debian>, Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogcm9vdCA8cm9vdEBkZWJpYW4uZGViaWFuPgoKR3Vlc3QgZHJpdmVyIGNhbiBiZSB1bmxv
YWRlZCB3aGlsZSBlbmdpbmVzIHN0aWxsIHVzaW5nIHNvbWUKYmFja2VuZCByZXNvdXJjZXMuIFRo
YXQgd291bGQgbGVhZCB0byB1c2UgYWZ0ZXIgZnJlZSBhbmQgdGhlbgpjYXVzZSBndWVzdCBkcml2
ZXIgZmFpbGVkLgoKTmVlZCB0byBhZGQgbXV0ZXggbG9jayBiZWZvcmUgYmFja2VuZCByZXNvdXJj
ZXMgZnJlZSB0byBtYWtlCnN1cmUgbm9ib2R5IGlzIHVzaW5nIGl0LgoKTmVlZCB0byBjaGVjayBi
YWNrZW5kIGRhdGEgYXZhaWxhYmxpbGl0eSBiZWZvcmUgVkNFL1VWRCBlbnRlcgpwb3dlcmdhdGlu
ZyBtb2RlLCBpZiBiYWNrZW5kIHJlc291cmNlcyBoYXZlIGJlZW4gZnJlZSwgdGhlbgpza2lwIGVu
dGVyaW5nIHBvd2VyZ2F0aW5nLgoKQ2hhbmdlLUlkOiBJZjdmOTMyMjFkZGVjYzU3ODg4NGRjOWU5
OWE1MmYyMmE0M2UxNmIwNwpTaWduZWQtb2ZmLWJ5OiBKZXNzZSBaaGFuZyA8emhleGkuemhhbmdA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBf
aHdtZ3IuYyB8IDE0ICsrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCmluZGV4IGQwODQ5M2IuLmE5MzIwYTUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCkBA
IC04MTAsOCArODEwLDEwIEBAIHN0YXRpYyBpbnQgdmVnYTEwX2h3bWdyX2JhY2tlbmRfZmluaShz
dHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCWtmcmVlKGh3bWdyLT5keW5fc3RhdGUudmRkY19kZXBf
b25fZGFsX3B3cmwpOwogCWh3bWdyLT5keW5fc3RhdGUudmRkY19kZXBfb25fZGFsX3B3cmwgPSBO
VUxMOwogCisJbXV0ZXhfbG9jaygmaHdtZ3ItPnNtdV9sb2NrKTsKIAlrZnJlZShod21nci0+YmFj
a2VuZCk7CiAJaHdtZ3ItPmJhY2tlbmQgPSBOVUxMOworCW11dGV4X3VubG9jaygmaHdtZ3ItPnNt
dV9sb2NrKTsKIAogCXJldHVybiAwOwogfQpAQCAtNDYxOSwxNiArNDYyMSwyMCBAQCBzdGF0aWMg
dm9pZCB2ZWdhMTBfcG93ZXJfZ2F0ZV92Y2Uoc3RydWN0IHBwX2h3bWdyICpod21nciwgYm9vbCBi
Z2F0ZSkKIHsKIAlzdHJ1Y3QgdmVnYTEwX2h3bWdyICpkYXRhID0gaHdtZ3ItPmJhY2tlbmQ7CiAK
LQlkYXRhLT52Y2VfcG93ZXJfZ2F0ZWQgPSBiZ2F0ZTsKLQl2ZWdhMTBfZW5hYmxlX2Rpc2FibGVf
dmNlX2RwbShod21nciwgIWJnYXRlKTsKKwlpZihkYXRhKXsKKwkJZGF0YS0+dmNlX3Bvd2VyX2dh
dGVkID0gYmdhdGU7CisJCXZlZ2ExMF9lbmFibGVfZGlzYWJsZV92Y2VfZHBtKGh3bWdyLCAhYmdh
dGUpOworCX0KIH0KIAogc3RhdGljIHZvaWQgdmVnYTEwX3Bvd2VyX2dhdGVfdXZkKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IsIGJvb2wgYmdhdGUpCiB7CiAJc3RydWN0IHZlZ2ExMF9od21nciAqZGF0
YSA9IGh3bWdyLT5iYWNrZW5kOwogCi0JZGF0YS0+dXZkX3Bvd2VyX2dhdGVkID0gYmdhdGU7Ci0J
dmVnYTEwX2VuYWJsZV9kaXNhYmxlX3V2ZF9kcG0oaHdtZ3IsICFiZ2F0ZSk7CisJaWYoZGF0YSl7
CisJCWRhdGEtPnV2ZF9wb3dlcl9nYXRlZCA9IGJnYXRlOworCQl2ZWdhMTBfZW5hYmxlX2Rpc2Fi
bGVfdXZkX2RwbShod21nciwgIWJnYXRlKTsKKwl9CiB9CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCB2
ZWdhMTBfYXJlX3Bvd2VyX2xldmVsc19lcXVhbCgKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
