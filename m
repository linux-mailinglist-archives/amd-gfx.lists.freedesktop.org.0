Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8EDB749
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B606EAD7;
	Thu, 17 Oct 2019 19:16:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867A46EAC4
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvlOgKt3WpIbK5wsboENmsJ+klCjMPZJnD6100r6Nh2CyCxzqKFfOHdzva+dFDasCbXrrWQq8Ep4ukdrdnSvW5z4uls9S3uAz0N24IFZdCXzbxT79S8iimzhqk4SGOpKQdPR8ObF4AxtGmfLGjiBMB2jZASnGz8z8lEbui6eZjuDCjx6hwbQHnBwluQ3+Ecfo54Z5B549Ftl4uPBOvhIdSnjKm2v4yo6vTaRQCJ2Xc9qOJd3DkOHN3aY0zODitdXsPJVUmHQyXROqrGHVE0i8HQqTkbgbgDfDXrLCcytm0g3g9W9ZJA0fLAa9FIqDbljSUiWZjMcII/ynuUEx39N4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwC2Q7TTXdRN1li3+w3N2iV4AW9us8gTYmCzPiBeBBg=;
 b=ML3sNKNqM84Gh6rjh2FOKITByJbiJaS+qSRmmmCIIsOJpZEph5ujrzF4ej9RaZ3rZ8f+8qebHsUj6N+fMJ0tY2HGw3v7lofPjOAKWTqn6n+O5UVHKfwZJ0Y8XZRn5Smme24grJcqzNb1N4m95DvmPrWsy6LKUC3A3KSOBXfFkz5Oj9ZBlE3osVEq5uhiS3ngs4PEMtGYn2ymBKAlNZIk92UvlIRx21dNzQHTSODFZO2Csj0Ca/6t9hQmI03/RwNT7t1/kNIF93yf9+V/6YliXhyslvBMEcEhLsaCJLdcjWZTWra5IByo2D/VNYlXrDFVOit5EJpWu5FMI3+LvfRY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:53 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:53 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:51 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:50 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 31/37] drm/amd/display: 3.2.56
Date: Thu, 17 Oct 2019 15:13:23 -0400
Message-ID: <20191017191329.11857-32-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(428003)(189003)(199004)(6916009)(2351001)(2876002)(50226002)(5660300002)(1076003)(48376002)(4326008)(478600001)(4744005)(126002)(51416003)(486006)(8676002)(476003)(2616005)(50466002)(14444005)(36756003)(81156014)(186003)(70206006)(76176011)(336012)(26005)(81166006)(70586007)(305945005)(11346002)(86362001)(47776003)(426003)(54906003)(8936002)(356004)(446003)(316002)(2906002)(6666004)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3589; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c85a9c-dc49-4094-af03-08d753366dd7
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3589699044B8720344094074826D0@BYAPR12MB3589.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4yHxnP9pyGDCbSa0cMFhwfEzxo5pfYvBN8BDxxcQ5qv7Rw42HWOruxHTko1U0X45b31F+uEdqWy1V09wTN4hkeo3ZLtXNbelPaS8A/4aT+Q5V4OaxMFWijWJhgPpjxpl5GJQFrnBv16HcRzqBExixkWJTSSOj8kZticIKgesUQ+e4RZkc7w3UTJ53je+otPXTWRguXfTvmLmOmJ5fUKmBybMqYK8inVItsxVsUzTgihSHN/NKwdffpGxskJxpt9HhxxCs0UAXHg3BOPfwm5YuG6T9EvMN9H7TvetvZzhTFHe7qOHwxETPM+ZQRfel/vQDhABSD6FyanYyTW/m/HSE6KFW193RIQDmJDMjvJKAb4qYNB/NMXbc/AgvpwDXYqQzJYf/3BRCoq4oXOJcfDW2SdqHFtLMxyTa77tLS+98DM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:53.1104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c85a9c-dc49-4094-af03-08d753366dd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3589
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwC2Q7TTXdRN1li3+w3N2iV4AW9us8gTYmCzPiBeBBg=;
 b=uZAnxIxunCKzKC2owcPoFwcsTQjN2o9HHVw2RsTr7YUZ0H7vtJoak7mb1hTSIjhPyCZXMb2JaoMmhtbCNL4gE7VoGZa4xHkQIVeT+xkcyyVIlEfICvVNfnSZo5ChsXfLoE/d77AIKoXug5pjmpi4bFRmf4qUOlGdUw526Hxy9yI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaAppbmRleCBiNTc4YjIxNDhlNDUuLjA0MTZhMTdiMDg5NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuNTUiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjU2IgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
