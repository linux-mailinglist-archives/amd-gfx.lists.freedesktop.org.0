Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943CE9C811
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA906E16B;
	Mon, 26 Aug 2019 03:55:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280BF6E16B
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrR0Wd6nk78SAjuPcZlGDsLMNwioTqcrkrMubr/QaKkaYrtgsGhBq9ezqq9yyUl3Uc1yvsIxlAUi1OTa/PZ3ObEpKoVoN033W9JhCgVSGCmSalIog7QVvZxpRmhfn7ZpsoT7wRQrADNT3jlezEj4oma8LMMAYZvgQQ/PejoVzadqRvkdKM5i/csiFaK2XfzjbLvNLlBntU0G1st0i6CEts7ihK5ukNKWGx1rrRI1LsK7NJNrp1dyF2t9h3hm0lHcyQBalB5vGm81l4t6wmTYUrAX1WzJ7/z2s/LBTK2A3oMDNDnmNrtS5XF71btJwMbOOL3JyK0fGTZzzZi0hmqcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvJEuFoXfo8BCWD7vvb7Fo+aYtfXS1dsIxQbcSFES4c=;
 b=LvW+e0oCTJktzr/T4YCVMetIR6WQVBMQLs4cwep+9/00ebSB6X8W0OTmP2T39QdelgZooEGKx2BxM7J0B5wxXOpTwkzLx7/5IctB/gwwHT8XHKCaarU/SiPmLeHxZI5qHngkff67Qj1E8vO8PYPxdqVzeqZPiDPmpbFhAJcBtSyAfNcSTjxCdrumkM2j2z1Q0qgtuIWjTnh2awBOAjf8B6tvzLjraHQf4Zht6lxoWdG3BonK7RXxGFCacWlUNLoU61yUA3BP+D7wRummtSEFHg2ml0DonDe8o9wrKquXMFZsBjMmuKskByeKMGuwiBUpAzWbquPoAfn6MjFxH7L4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:301:4a::21) by DM5PR12MB1531.namprd12.prod.outlook.com
 (2603:10b6:4:f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Mon, 26 Aug
 2019 03:55:24 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MWHPR1201CA0011.outlook.office365.com
 (2603:10b6:301:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:24 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:23 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 3/8] drm/amdgpu/nbio: add functions to query ras specific
 interrupt status
Date: Mon, 26 Aug 2019 11:54:55 +0800
Message-ID: <1566791700-1912-4-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(81156014)(8936002)(50226002)(16586007)(8676002)(36756003)(81166006)(478600001)(53936002)(2906002)(316002)(47776003)(426003)(305945005)(50466002)(110136005)(476003)(2616005)(51416003)(7696005)(446003)(336012)(486006)(126002)(186003)(26005)(76176011)(14444005)(86362001)(6636002)(4326008)(48376002)(356004)(11346002)(53416004)(70586007)(70206006)(5660300002)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1531; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bf821be-6fed-49de-410e-08d729d93975
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1531; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1531:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1531C91ED835DA7CA06E4DFFFCA10@DM5PR12MB1531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: goKY+rifeIKsIwTCEzCRmxmb6XZilzhx74IUSqnGV+sWnD6NIzDZQh4aQhbN/OhPiX1JYqmdB8zU1PYP+Jr3SipKmVi0ot3jQJEVU9T4ZWVPYhuXBPp1RUE1SHodtAYIOwN4Rhh1shzKjhSCQxIprO8oGcBfvA9gPORMrqFNI0hP9i2s7oCeoyndOfW+ctsRdzv1rpj7mRYmO7B8nVnAIoskTRi9jd0AnAoekxuHVhV+vHgn6iFp2NVMqp2wr0uTGdwHV9yOV1OPalRaq3nF9A51YuU4ncMopX8Ypf5UiC6KB05tDz4Lhz3vFKocsat73m9kjMj3UEwS9szq1KVrr5kx1VLKYAbX3YhJTF6MHOYpoAtmVpMOnykJ9DNBhk0VkTm2XECqHkjhlilMTXGYEFOzPZ5SVIV9piSgcLa0X6I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:24.3790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf821be-6fed-49de-410e-08d729d93975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1531
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvJEuFoXfo8BCWD7vvb7Fo+aYtfXS1dsIxQbcSFES4c=;
 b=wpLLdKZdklWG4V/JLmXlXwEp7jslAvt++LzQmL8auZal5LVYhpqlbhs63veRdbtd33YbuhnqWaEe3W2pjt6/l+IUh2TnhDD4+ys6Md/I6gqR3VST/9/Ru1mZQfT6E+/yRwkGzamU2dK9gLJQeacmodQctKUkkgqzkhyVOYPr1KM=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0IGFuZCBlcnJfZXZlbnRfaW50ZXJydXB0IGFyZSByYXMg
c3BlY2lmaWMgaW50ZXJydXB0cy4KYWRkIGZ1bmN0aW9ucyB0byBjaGVjayB0aGVpciBzdGF0dXMg
YW5kIGFjayB0aGVtIGlmIHRoZXkgYXJlIGdlbmVyYXRlZC4gYm90aApmdW5jaXRvbnMgc2hvdWxk
IG9ubHkgYmUgaW52b2tlZCBpbiBJU1Igd2hlbiBCSUYgcmluZyBpcyBkaXNhYmxlZCBvciBldmVu
IG5vdAppbml0aWFsaXplZC4KClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcu
WmhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5o
IHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jICAgfCAzMiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X25iaW8uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgKaW5kZXgg
MDU2MzQ3Ni4uMjg0MTdlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X25iaW8uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJp
by5oCkBAIC03Nyw2ICs3Nyw4IEBAIHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyB7CiAJdm9pZCAo
KmluaXRfcmVnaXN0ZXJzKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAJdm9pZCAoKmRl
dGVjdF9od192aXJ0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAJdm9pZCAoKnJlbWFw
X2hkcF9yZWdpc3RlcnMpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwl2b2lkICgqaGFu
ZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9fYmlmcmluZykoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpOworCXZvaWQgKCpoYW5kbGVfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRyX25vX2JpZnJp
bmcpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIH07CiAKIHN0cnVjdCBhbWRncHVfbmJp
byB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jCmluZGV4IGM0MTZhYjguLjZl
Y2RkNWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfNC5jCkBAIC0zMTUsNiAr
MzE1LDM2IEBAIHN0YXRpYyB2b2lkIG5iaW9fdjdfNF9pbml0X3JlZ2lzdGVycyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAkJV1JFRzMyX1BDSUUoc21uUENJRV9DSV9DTlRMLCBkYXRhKTsK
IH0KIAorc3RhdGljIHZvaWQgbmJpb192N180X2hhbmRsZV9yYXNfY29udHJvbGxlcl9pbnRyX25v
X2JpZnJpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJdWludDMyX3QgYmlmX2Rv
b3JiZWxsX2ludHJfY250bDsKKworCWJpZl9kb29yYmVsbF9pbnRyX2NudGwgPSBSUkVHMzJfU09D
MTUoTkJJTywgMCwgbW1CSUZfRE9PUkJFTExfSU5UX0NOVEwpOworCWlmIChSRUdfR0VUX0ZJRUxE
KGJpZl9kb29yYmVsbF9pbnRyX2NudGwsCisJCUJJRl9ET09SQkVMTF9JTlRfQ05UTCwgUkFTX0NO
VExSX0lOVEVSUlVQVF9TVEFUVVMpKSB7CisJCS8qIGRyaXZlciBoYXMgdG8gY2xlYXIgdGhlIGlu
dGVycnVwdCBzdGF0dXMgd2hlbiBiaWYgcmluZyBpcyBkaXNhYmxlZCAqLworCQliaWZfZG9vcmJl
bGxfaW50cl9jbnRsID0gUkVHX1NFVF9GSUVMRChiaWZfZG9vcmJlbGxfaW50cl9jbnRsLAorCQkJ
CQkJQklGX0RPT1JCRUxMX0lOVF9DTlRMLAorCQkJCQkJUkFTX0NOVExSX0lOVEVSUlVQVF9DTEVB
UiwgMSk7CisJCVdSRUczMl9TT0MxNShOQklPLCAwLCBtbUJJRl9ET09SQkVMTF9JTlRfQ05UTCwg
YmlmX2Rvb3JiZWxsX2ludHJfY250bCk7CisJfQorfQorCitzdGF0aWMgdm9pZCBuYmlvX3Y3XzRf
aGFuZGxlX3Jhc19lcnJfZXZlbnRfYXRodWJfaW50cl9ub19iaWZyaW5nKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQoreworCXVpbnQzMl90IGJpZl9kb29yYmVsbF9pbnRyX2NudGw7CisKKwli
aWZfZG9vcmJlbGxfaW50cl9jbnRsID0gUlJFRzMyX1NPQzE1KE5CSU8sIDAsIG1tQklGX0RPT1JC
RUxMX0lOVF9DTlRMKTsKKwlpZiAoUkVHX0dFVF9GSUVMRChiaWZfZG9vcmJlbGxfaW50cl9jbnRs
LAorCQlCSUZfRE9PUkJFTExfSU5UX0NOVEwsIFJBU19BVEhVQl9FUlJfRVZFTlRfSU5URVJSVVBU
X1NUQVRVUykpIHsKKwkJLyogZHJpdmVyIGhhcyB0byBjbGVhciB0aGUgaW50ZXJydXB0IHN0YXR1
cyB3aGVuIGJpZiByaW5nIGlzIGRpc2FibGVkICovCisJCWJpZl9kb29yYmVsbF9pbnRyX2NudGwg
PSBSRUdfU0VUX0ZJRUxEKGJpZl9kb29yYmVsbF9pbnRyX2NudGwsCisJCQkJCQlCSUZfRE9PUkJF
TExfSU5UX0NOVEwsCisJCQkJCQlSQVNfQVRIVUJfRVJSX0VWRU5UX0lOVEVSUlVQVF9DTEVBUiwg
MSk7CisJCVdSRUczMl9TT0MxNShOQklPLCAwLCBtbUJJRl9ET09SQkVMTF9JTlRfQ05UTCwgYmlm
X2Rvb3JiZWxsX2ludHJfY250bCk7CisJfQorfQorCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X25iaW9f
ZnVuY3MgbmJpb192N180X2Z1bmNzID0gewogCS5nZXRfaGRwX2ZsdXNoX3JlcV9vZmZzZXQgPSBu
YmlvX3Y3XzRfZ2V0X2hkcF9mbHVzaF9yZXFfb2Zmc2V0LAogCS5nZXRfaGRwX2ZsdXNoX2RvbmVf
b2Zmc2V0ID0gbmJpb192N180X2dldF9oZHBfZmx1c2hfZG9uZV9vZmZzZXQsCkBAIC0zMzYsNCAr
MzY2LDYgQEAgY29uc3Qgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNzIG5iaW9fdjdfNF9mdW5jcyA9
IHsKIAkuaW5pdF9yZWdpc3RlcnMgPSBuYmlvX3Y3XzRfaW5pdF9yZWdpc3RlcnMsCiAJLmRldGVj
dF9od192aXJ0ID0gbmJpb192N180X2RldGVjdF9od192aXJ0LAogCS5yZW1hcF9oZHBfcmVnaXN0
ZXJzID0gbmJpb192N180X3JlbWFwX2hkcF9yZWdpc3RlcnMsCisJLmhhbmRsZV9yYXNfY29udHJv
bGxlcl9pbnRyX25vX2JpZnJpbmcgPSBuYmlvX3Y3XzRfaGFuZGxlX3Jhc19jb250cm9sbGVyX2lu
dHJfbm9fYmlmcmluZywKKwkuaGFuZGxlX3Jhc19lcnJfZXZlbnRfYXRodWJfaW50cl9ub19iaWZy
aW5nID0gbmJpb192N180X2hhbmRsZV9yYXNfZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmlu
ZywKIH07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
