Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599797665
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 11:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064FE6E0B8;
	Wed, 21 Aug 2019 09:48:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680072.outbound.protection.outlook.com [40.107.68.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171A6E0B8
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 09:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOZdU10RK/hry9xGe+iAAJ0olQNSmc4wNeJTCtSekY37MgbZcEwFFJCKvqkqnvT3VYO439yXWRKBWvZrmjCK5+f5O0zo4vu2vW+hKeOu+5bB3YQmwPQhLNpQxUCp0/4UUZzHf3U6xCjE0mEHEYFoYHnEClFnEhJSMPMxo1ooawkiLIAMQ8G3CCSg78x3jikCvNOkCS33lroeP9QO1YEMKU3GXVGRd5ru97my6142Nv/iJtS0BJ/aD8ccdPd8qGgYvvCCIrK/HhzhHMr7wJJvu3B31Ld9fFHW3r+7Y6G4fKnve56Hi+BS6HuY9DNTAEeTNyvsWpQgrYGzBl9q4ddoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5QU0CZAyuuJ0h8DIh3FuYdr8ECGQavsVXVFxS7burQ=;
 b=N7hzEqf2p1G4b9Vx+V00lhAP1FVdZ3DJpEeuD++UMlwPjCRzDPEKrevocdolPQIxixR1IfHv1zYS+DeGy4ie7ro34Cl+/bvkXW397HHG6+YcTKMzP2RJ7akgPGRbQF/TyUnk7VGFdRAf8f0MuXqAW7Z5R4sghLEoUAsZIK8RfLCM+uP0AGtNAlOrVfTHg9nryN7dY0W9ItQMmFOgWqyjg44uHuQLk/jutTStQo2D/BqHvQSKNMsljLIrTnED0ErAM++Aw9CLoEtv0jluFPs2lIZWDC9iwMLNUwlEKdBrO22d9EyGa2gBIUw9Fb3988zwL4NkMmJkguoh3ToNgcowiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0040.namprd12.prod.outlook.com (2603:10b6:405:70::26)
 by CY4PR12MB1269.namprd12.prod.outlook.com (2603:10b6:903:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 09:48:33 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by BN6PR12CA0040.outlook.office365.com
 (2603:10b6:405:70::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 09:48:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 09:48:33 +0000
Received: from gigabyte-debug.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 21 Aug 2019
 04:48:32 -0500
From: Frank.Min <Frank.Min@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: unity mc base address for arcturus
Date: Wed, 21 Aug 2019 17:48:26 +0800
Message-ID: <1566380907-5799-1-git-send-email-Frank.Min@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(5660300002)(53416004)(16586007)(86362001)(6916009)(476003)(26005)(70206006)(126002)(36756003)(486006)(8676002)(2906002)(186003)(336012)(2616005)(70586007)(47776003)(53936002)(81166006)(81156014)(478600001)(305945005)(2351001)(51416003)(316002)(7696005)(50466002)(8936002)(4326008)(356004)(6666004)(426003)(48376002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1269; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b33448c3-bf99-4bd0-6cd8-08d7261cbade
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1269; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1269:
X-Microsoft-Antispam-PRVS: <CY4PR12MB12699836A10107758E92BD66E9AA0@CY4PR12MB1269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: siFc5MvB6EMixZcJ3uUW1GrBakzcn5wVjru76lWJfnGVtrshkUPG4IVa3SHE2DstIC7zpa3Herej8/saJO8ihtS293fZWyBu0OO58S86sZysG8yPAtiPJt+I2tz0IUeSQjyaAT+mdmk/j3LYMBmq/SF5SVKQNw6BpdPoKxJx9P6tCGVYqFL1xoolzxCdgrw9zCMCU3zw7X16zfdRVVlMavQcfNaJxpWrhYN8djhUS1xbW0OUwdXwh9hVsRROywdete+2NrZ+vEI90WyRrMCvUQlyqDjoR8j3ZH8ohgoltCzvLiBmUCg9gCDw+/2t0U6rCDo77O6AiNGkylEpFYi6AeAGMaS1xUiePWyx+qAOmwqz+amZQki8u90jiFUhh6XosKoAZouTbJN6vL/QFiRefu8EPA1vO+SspUE6IiwjhZQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 09:48:33.0361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b33448c3-bf99-4bd0-6cd8-08d7261cbade
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5QU0CZAyuuJ0h8DIh3FuYdr8ECGQavsVXVFxS7burQ=;
 b=dUZC00Pv+oR8JEg7w/tjQkj+/QO8+ffIfQ0W9GF0Z0RDb93YjEXYet+wg8bZy0dSUJoyyNBltIodxQ2+HjWe9Veg1snkJ4ZeAnbK3JzqMgg86uc5XqRW/nmxwnx6F8KHlpE3ZPan+8zOTlZKe8TWHhklFlx5gMlM5/y9Ti3FBBM=
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
