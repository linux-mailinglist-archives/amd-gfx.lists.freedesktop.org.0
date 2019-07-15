Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6569DC3
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C244D89C93;
	Mon, 15 Jul 2019 21:21:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730067.outbound.protection.outlook.com [40.107.73.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C094189C61
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVtq1Ca4haQSIMNqNf5+TBDpksXiaSdWrsk1JqWuDJ8Qp1tOl5OLFBqxCk5koNfJzHDQAZI9gsPCrdMhq1I6IjImJEjjtDp7TO4ZFbxuZ92ilsX4ReHwcHpAP7xL979TfOBoOi43sPYier0BKlAZhrfU8265QtK1tlFiCJzfUIWRtOcxu0mSrW4/2zpyoZxHNU86xQNiqBYxAHEft4bVwSN2aOUas7ys3uIDIusyoPHqjnKPww49E98D0DbAGgJJj7E+/Jq5/la4Y5bHwIFoVZr3tA7ZoAUI2M214bVLsW9SaQFafZjeDAogIiltzkHu7muw8IZeKjoGMOlCOamEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Sz/qiohvC9eUn+I2T81CIRG7UXXhOGMrSjrsVQvPb8=;
 b=lM9nLCPNgmHJuJC47UNz2Q92aHNLeqc2EHvYUex0fR5gg3ThvdUA3l6KzrojdbsHS+BZMmGkQAT7PtInzycWwxi7LFwWsfc03jPPHZDHNdbY+Kxw7/KIOpCAumx02vp+8YEhETMhmbKf9B80XQuiuN83T6SAeQzYdmL/kzSHCy3duOyoJRzdwcHjh9rBI0l4hvZ92sn7MHPRvn96ESOMbtRvT0Nf9eNxaUmv3syFpiguCg3HwWxzb58KEPFbmpVdBAarAVUI41RIy/NOjJX2qy3yfkfbMKtwHxR8GfHuPo9jfGE8P+YvxEY8PBbu/vi3+H09gSpenP6XmuqhEemjDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 MWHPR12MB1933.namprd12.prod.outlook.com (2603:10b6:300:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:42 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:42 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:27 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 46/87] drm/amd/display: 3.2.40
Date: Mon, 15 Jul 2019 17:20:08 -0400
Message-ID: <20190715212049.4584-47-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(428003)(189003)(199004)(53936002)(426003)(5660300002)(36756003)(54906003)(4326008)(486006)(336012)(68736007)(186003)(2616005)(476003)(76176011)(49486002)(446003)(316002)(4744005)(26005)(11346002)(50226002)(126002)(70206006)(70586007)(1076003)(2351001)(2906002)(6666004)(48376002)(50466002)(356004)(51416003)(86362001)(2876002)(47776003)(6916009)(478600001)(305945005)(81166006)(8936002)(81156014)(8676002)(2870700001)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1933; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e84e7bee-342c-4c85-4e42-08d7096a6ead
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1933; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1933BA5692C6FD4890A5F8DA82CF0@MWHPR12MB1933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: q9v40iOBcXrKsbxxBk6tL2ZuYE9C5knnJe6kauedxq+m1YAfnwCX4fcJd30AwYFsIbyg4HdrOBDtqvSlj3+3cL/OdFUUbUKqUSbv42x255XshLPFOvpjuxIJYXQDNWugV0C9M5Bp4X1Lt7a7L0M/m5LNmgeKy2/hzvbcs6uOQNTfwHlLM0/32zsokXMaYE2Z4ZqntZDyMpRrMM6zejj3MIyDDvnOU8GOXhq0rOtDLeJPYYeEeVpTFQYVPcMZCMK2wX+QhRZe6L/pdeVn/nu+7cYB/OjKqEi2fzA9+jXya8cthojExGB7ltooYqnjgLGkyHBxkzzsolsnlq3VqjQ1nvnjw0p7I3qb0DcZwSEZdxGM2sHkipMlgG21YujnMH6Q5FQMK7916SoDQpbYxt8Axoo/JCTZDBwNsICmzRqi82c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:42.1116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e84e7bee-342c-4c85-4e42-08d7096a6ead
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Sz/qiohvC9eUn+I2T81CIRG7UXXhOGMrSjrsVQvPb8=;
 b=zana0TxQyuDoxAHE/rhCtee4ZCic7CEL2OUMtnU6YHPjNVHZc1jipr7rR+UvXjIVFy+1w4udnu8usk/dKNJK1Zzxo7P2MlzThzUjHkbfp2E15cDuH7WXSZyESMJHHo612id9sdaVa9rqoBkY7Lz8UW0mDcxPj7eDIGdsqRtXWqQ=
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
c3BsYXkvZGMvZGMuaAppbmRleCAwYWFkMjJiMWVmMzYuLjE0NjY0YmVkOGM4NCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuMzkiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjQwIgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
