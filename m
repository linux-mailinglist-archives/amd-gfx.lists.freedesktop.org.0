Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77883AEC6A
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3ED89336;
	Tue, 10 Sep 2019 13:55:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730056.outbound.protection.outlook.com [40.107.73.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0381892B4
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz46FwKgU7P1VuhLrI2Jf7C2umD1nVYvubWEkOfflK36ARB7zMTCb9WUmGYmFUNoZC273tQlxmD+3nOr5oMZ5dUpvBQ3wkD8KuWxQ+VdKkV10K3m0xJv3Pomw5Sw7B0ykVWRroWQ9ukhD8HpuCarEHIPK+/Pcz+4que1Wa4QLpGV1z1oEJRtZtJLBpbhgubHHg7poks8LMd2dEjEF0TARK3WwWptbUVSBHU9MTfgTZxGnSKlF/8rA8eonUtEEpCpkNcUV+a2K1xhtX3xAqd4Fec+tLbngdKReQv1WuRjUdfbVJBR4NPm//2kqKtWtAKh36BUnMd4V6LBa9QA/FWxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jD+XV0ttTyJnuAs7TiYmJz26vfN6PkASEsNjqE9r20=;
 b=WNJyACFtPyGLV0IY/5CF1ETDEo7j81K12DY8JMI/KDp8339Of36XInHXB1nsi9+o6YlTNYLR49SHLTQeyznhWhNzpwIN9pnJWlJoZGPVr5PFkqC/ww2zFqIPHRqbzZOnsI4yRWA6BmtA9QHangJc8+mV4JeAuELmBKnvDLBEQ0t7fGngIt8XyBJSnNE7XpOecoIt0lQ4mLpzKM5GT692/6HxAwKv6Us4oMsH6N+NVVe1AC5e3zfI03+Hy6i8OztuxPwwm9LGAFhd9hPGSJld4FMdRaKaaJVIfzy3o2qCZZpyuSVjND0BHeYpoeNVm8Fcy/tblzfQtLoohCT5pkJVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by CY4PR1201MB2501.namprd12.prod.outlook.com (2603:10b6:903:d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Tue, 10 Sep
 2019 13:55:01 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:54:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:54:59 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/25] drm/amd/display: Replace for loop w/ function call
Date: Tue, 10 Sep 2019 09:54:25 -0400
Message-ID: <20190910135445.18300-6-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(2980300002)(428003)(199004)(189003)(2351001)(36756003)(8936002)(11346002)(5660300002)(70586007)(6916009)(8676002)(81156014)(2906002)(426003)(81166006)(50226002)(126002)(478600001)(446003)(486006)(476003)(2616005)(49486002)(305945005)(14444005)(1076003)(51416003)(76176011)(50466002)(48376002)(316002)(336012)(26005)(186003)(53936002)(70206006)(2876002)(4326008)(47776003)(6666004)(356004)(2870700001)(86362001)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2501; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adec04a6-5274-41e2-b860-08d735f67893
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR1201MB2501; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2501:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25012C6C22179423819C55B682B60@CY4PR1201MB2501.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1sEp1INGI1zxY2nnIVEqjh8q/XIJGbQ3smIQFB0qaoXvRYcfAWrK5KnYTpvWVDlaYVUbn8CNxzKBuLG5VuzEdbE5n7MAQUHP7b7NvE0PqQvnjNI+PMnWG7S+T2ItaVzVNwK3mbkQoClqv6TQtQzI32qnOqdTKZazFk6y3Q9Jr0gi/qJmeS18VCGKeab09n7x2IFaTGerswAXIRnMEB8vmRDDzVMjuQzjA1uUx0pkLVHM2KB9NimsnkBgtrar8X9H0sh0EUlm6q+S2XCl1NMo00d9mS0VelV4Q5hzXnHLY2oOcsYOK3ULvlVEVOZ9yz+qlY+n5P7qWGVdsEEHYqkhtlNmlQpT4gAL15pB3TSfK3bmp1SoOuk4Gqm3pLPEfl/AfLqYorL0igXIrhmz+zjx4Yk0MhgCKK2+GydNl5Jzpvg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:54:59.5416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adec04a6-5274-41e2-b860-08d735f67893
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jD+XV0ttTyJnuAs7TiYmJz26vfN6PkASEsNjqE9r20=;
 b=hOzODz/+CA/UG0Gzn9b2jX55CxKzTFvEbBonYPHYipWhlHHwAw1GN8aYSEJz5Emqna5ZUrU3LEkhwCgWCWwsnt7DPBwSqZCeiAeUg8y4sECQErn1Am+6AT8PbAR8BdD2jWoHO1uvHKJXuOTVby1ibllfEXq5KUjrIZwNXwUGbDM=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldCkEg
ZnVuY3Rpb24gdG8gYWRqdXN0IERQUCBjbG9ja3Mgd2l0aCBEVE8gYWxyZWFkeSBleGlzdHM7IGZ1
bmN0aW9uIGNvZGUKaXMgaWRlbnRpY2FsIHRvIHRoZSBjb2RlIHJlcGxhY2VkIGhlcmUKClNpZ25l
ZC1vZmYtYnk6IFdlc2xleSBDaGFsbWVycyA8V2VzbGV5LkNoYWxtZXJzQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvZGMvY2xrX21nci9kY24y
MC9kY24yMF9jbGtfbWdyLmMgIHwgMjUgKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21n
ci5jCmluZGV4IDNlOGFjMzAzYmQ1Mi4uZjFkZjMyNjY0NDE0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xr
X21nci5jCkBAIC0xOTYsNyArMTk2LDYgQEAgdm9pZCBkY24yX3VwZGF0ZV9jbG9ja3Moc3RydWN0
IGNsa19tZ3IgKmNsa19tZ3JfYmFzZSwKIAlib29sIGVudGVyX2Rpc3BsYXlfb2ZmID0gZmFsc2U7
CiAJc3RydWN0IGRtY3UgKmRtY3UgPSBjbGtfbWdyX2Jhc2UtPmN0eC0+ZGMtPnJlc19wb29sLT5k
bWN1OwogCWJvb2wgZm9yY2VfcmVzZXQgPSBmYWxzZTsKLQlpbnQgaTsKIAogCWlmIChkYy0+d29y
a19hcm91bmRzLnNraXBfY2xvY2tfdXBkYXRlKQogCQlyZXR1cm47CkBAIC0yNzgsMzQgKzI3Nywx
NCBAQCB2b2lkIGRjbjJfdXBkYXRlX2Nsb2NrcyhzdHJ1Y3QgY2xrX21nciAqY2xrX21ncl9iYXNl
LAogCQkJCXJlcXVlc3Rfdm9sdGFnZV9hbmRfcHJvZ3JhbV9nbG9iYWxfZHBwX2NsayhjbGtfbWdy
X2Jhc2UsIG5ld19jbG9ja3MtPmRwcGNsa19raHopOwogCiAJCQkvLyBUaGVuIHJhaXNlIGFueSBk
aXZpZGVycyB0aGF0IG5lZWQgcmFpc2luZwotCQkJZm9yIChpID0gMDsgaSA8IGNsa19tZ3ItPmJh
c2UuY3R4LT5kYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkrKykgewotCQkJCWludCBkcHBfaW5z
dCwgZHBwY2xrX2toejsKLQotCQkJCWlmICghY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtpXS5w
bGFuZV9zdGF0ZSkKLQkJCQkJY29udGludWU7Ci0KLQkJCQlkcHBfaW5zdCA9IGNvbnRleHQtPnJl
c19jdHgucGlwZV9jdHhbaV0ucGxhbmVfcmVzLmRwcC0+aW5zdDsKLQkJCQlkcHBjbGtfa2h6ID0g
Y29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtpXS5wbGFuZV9yZXMuYncuZHBwY2xrX2toejsKLQot
CQkJCWNsa19tZ3ItPmRjY2ctPmZ1bmNzLT51cGRhdGVfZHBwX2R0byhjbGtfbWdyLT5kY2NnLCBk
cHBfaW5zdCwgZHBwY2xrX2toeiwgdHJ1ZSk7Ci0JCQl9CisJCQlkY24yMF91cGRhdGVfY2xvY2tz
X3VwZGF0ZV9kcHBfZHRvKGNsa19tZ3IsIGNvbnRleHQpOwogCQl9IGVsc2UgewogCQkJLy8gRm9y
IHBvc3QtcHJvZ3JhbW1pbmcsIHdlIGNhbiBsb3dlciByZWYgY2xrIGlmIG5lZWRlZCwgYW5kIHVu
Y29uZGl0aW9uYWxseSBzZXQgYWxsIHRoZSBEVE9zCiAKIAkJCWlmIChuZXdfY2xvY2tzLT5kcHBj
bGtfa2h6IDwgY2xrX21ncl9iYXNlLT5jbGtzLmRwcGNsa19raHopCiAJCQkJcmVxdWVzdF92b2x0
YWdlX2FuZF9wcm9ncmFtX2dsb2JhbF9kcHBfY2xrKGNsa19tZ3JfYmFzZSwgbmV3X2Nsb2Nrcy0+
ZHBwY2xrX2toeik7CisJCQlkY24yMF91cGRhdGVfY2xvY2tzX3VwZGF0ZV9kcHBfZHRvKGNsa19t
Z3IsIGNvbnRleHQpOwogCi0JCQlmb3IgKGkgPSAwOyBpIDwgY2xrX21nci0+YmFzZS5jdHgtPmRj
LT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaSsrKSB7Ci0JCQkJaW50IGRwcF9pbnN0LCBkcHBjbGtf
a2h6OwotCi0JCQkJaWYgKCFjb250ZXh0LT5yZXNfY3R4LnBpcGVfY3R4W2ldLnBsYW5lX3N0YXRl
KQotCQkJCQljb250aW51ZTsKLQotCQkJCWRwcF9pbnN0ID0gY29udGV4dC0+cmVzX2N0eC5waXBl
X2N0eFtpXS5wbGFuZV9yZXMuZHBwLT5pbnN0OwotCQkJCWRwcGNsa19raHogPSBjb250ZXh0LT5y
ZXNfY3R4LnBpcGVfY3R4W2ldLnBsYW5lX3Jlcy5idy5kcHBjbGtfa2h6OwotCi0JCQkJY2xrX21n
ci0+ZGNjZy0+ZnVuY3MtPnVwZGF0ZV9kcHBfZHRvKGNsa19tZ3ItPmRjY2csIGRwcF9pbnN0LCBk
cHBjbGtfa2h6LCBmYWxzZSk7Ci0JCQl9CiAJCX0KIAl9CiAJaWYgKHVwZGF0ZV9kaXNwY2xrICYm
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
