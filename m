Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC497691
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 12:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664B76E143;
	Wed, 21 Aug 2019 10:00:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965736E143
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 10:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TX7QKNy+T3PrOdtnYKLpz2IZn8HFmOu2B/S4sZAoCt8ALN8KvH+mF8OLAlhFT5H6UUegOqlG3GA/01tD9vtnqdK7RmE/xSZ3ks9ohVWYe2NcGS8pI6xsrIVhSEJjVMeLiiu9vML8ybIoEqDhSHT/uZXJKXQp8/IMP9OAzcqh8DTvhF07up48kub/9KZB6woaWfF9l5REaIncgqpv53l95uyKt2YgxI/VbQ4ot14Vy2+8h/e7xQz6Cn/eZnDFD6i/TjEFpWgrC7Q3OEVwhMBB2G4kWNyR44hn8Iiu9gSRTXDdvKHp2nNKbl386p5rVkryVzZ/kGnfJMqLm++Nh15+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5QU0CZAyuuJ0h8DIh3FuYdr8ECGQavsVXVFxS7burQ=;
 b=ZpmJ8NAPZguxcGxXYHtx5xAgmhJyDKbkIIqeAGGrjsT3gJ7YqxOHY4Q61auO16FxolBBhUYg6g6EdqDqbzBBBVbWoh0OmoYhqplHJ8LR8TYOtPIzP+nKXHzZEWCOyjk1qUoBRjKuoo3Nq16PgjWpHcmxF7NI154LTBCjtd020iGG06MCkQug4mu7E9JQNiXEul/ggrKngLi/U7krMdsg/yMTHkpTQQ48MWOzP0ffSBVFX8qElwb+DgU4Yep4LMmpKbz5t0qCjuSLAhNSU8qLNTGxV4uYOPNrk8xUW47CGtQrEHw0r9ymR22BDEIFid+jxRW5CzgYKR1thRl0UE4+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0035.namprd12.prod.outlook.com (2603:10b6:5:1c0::48)
 by CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 10:00:43 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by DM6PR12CA0035.outlook.office365.com
 (2603:10b6:5:1c0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.23 via Frontend
 Transport; Wed, 21 Aug 2019 10:00:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 10:00:43 +0000
Received: from gigabyte-debug.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 21 Aug 2019
 05:00:39 -0500
From: Frank.Min <Frank.Min@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: unity mc base address for arcturus
Date: Wed, 21 Aug 2019 18:00:34 +0800
Message-ID: <1566381635-6484-1-git-send-email-Frank.Min@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(199004)(189003)(6666004)(316002)(476003)(48376002)(50466002)(86362001)(478600001)(5660300002)(47776003)(126002)(53936002)(2616005)(50226002)(356004)(7696005)(8676002)(8936002)(81156014)(81166006)(51416003)(305945005)(486006)(6916009)(2906002)(186003)(26005)(53416004)(70206006)(16586007)(2351001)(36756003)(336012)(426003)(70586007)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 925525ae-d848-40e5-f54a-08d7261e6e10
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127040214FC40DF4B3F86735E9AA0@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: k/9Vbf/W9mgKmIarCTzgY+wjxjfdUka09PStLL7CDqVUjH1wXiD5svI+P3ewlLk50Bhw9qZjHW+rqyd/rl0g1DyP2BClSHdAssRfU4tDriZrVf8WoN7z4+MJSb95ip06mazO6b8qmqDD//y9KA6L2O7rgLu61zNaF6KGQTDapXL4WZfYHgkbb0O5fkLmUS21MoBYmAMfAMeWG670R/rNxM1s/Dmzijc4GeGwNxJICac/ewTJb+k6eWJ9TDr0BXhMRnLINxD1SrqmkYHL057PS9x6YZkqJ0zJkrlkkkDMb9L1Ox+Pj5S6jRv31X3OzcsF5XRPE+Nvi5uI/8u2zp1FoLK+XRLyazhgnz+sv+ah4xem9ZqkW4UMTV40P+n0IwxmTwjNf9VGhkUOmLPhqZEJRrfnANVWi/4iGMe6bygCZxU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 10:00:43.2192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 925525ae-d848-40e5-f54a-08d7261e6e10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5QU0CZAyuuJ0h8DIh3FuYdr8ECGQavsVXVFxS7burQ=;
 b=PFzT5/F+dksNfx8GSSx4l5i4tiZlQdPPRtqnIGfAJpWbsWIqdvBIO27AcImJURmKBffLbyp91eRtWd5FqXeII1ILDAC6EtXXZ3wta1gxjvY6nyNoyLFz8cDlIcioaJRXFqEpXXzJGgIq7Id54HdjboMa4BkcUOMbijE6JkKt08g=
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
Cc: "Frank.Min" <Frank.Min@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YXJjdHVydXMgZm9yIHNyaW92IHdvdWxkIHVzZSB0aGUgdW5pZmllZCBtYyBiYXNlIGFkZHJlc3MK
CkNoYW5nZS1JZDogSTNmMTBmODg4NzdhYTM4MTQ1YTI1OWI4OGMxMWE2YWEyMzI5ZjNmZTIKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgMTIgKysrKysrLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IDZkZTE3MjYuLjY4M2Y0N2QgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpAQCAtOTIwLDEyICs5MjAsMTIgQEAgc3Rh
dGljIHZvaWQgZ21jX3Y5XzBfdnJhbV9ndHRfbG9jYXRpb24oc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJCQkJCXN0cnVjdCBhbWRncHVfZ21jICptYykKIHsKIAl1NjQgYmFzZSA9IDA7Ci0J
aWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKLQkJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX0FSQ1RVUlVTKQotCQkJYmFzZSA9IG1taHViX3Y5XzRfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYp
OwotCQllbHNlCi0JCQliYXNlID0gbW1odWJfdjFfMF9nZXRfZmJfbG9jYXRpb24oYWRldik7Ci0J
fQorCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKQorCQliYXNlID0gbW1o
dWJfdjlfNF9nZXRfZmJfbG9jYXRpb24oYWRldik7CisJZWxzZSBpZiAoIWFtZGdwdV9zcmlvdl92
ZihhZGV2KSkKKwkJYmFzZSA9IG1taHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOworCiAJ
LyogYWRkIHRoZSB4Z21pIG9mZnNldCBvZiB0aGUgcGh5c2ljYWwgbm9kZSAqLwogCWJhc2UgKz0g
YWRldi0+Z21jLnhnbWkucGh5c2ljYWxfbm9kZV9pZCAqIGFkZXYtPmdtYy54Z21pLm5vZGVfc2Vn
bWVudF9zaXplOwogCWFtZGdwdV9nbWNfdnJhbV9sb2NhdGlvbihhZGV2LCBtYywgYmFzZSk7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
