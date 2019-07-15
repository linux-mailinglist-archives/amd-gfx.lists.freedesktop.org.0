Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2055569DB2
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B5289C37;
	Mon, 15 Jul 2019 21:21:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730072.outbound.protection.outlook.com [40.107.73.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D914C89C19
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyVi0MgzszGQgO6RlKv3BwXkGYiMPBMN2OfjCnpnAmCrOv3nxs+OkB66tv/aqe1XZ1wgCawxmZxjx/w04sHZE3MAZK7eyjqArJZ9Pd/6yEwfUmLuQwC87/AE2S1g7y/fYGYXuc607HtFJ36UEcqKyQ3OcxEOJKujHmqila08jBJN8pF6eI19HjejzmmWzIMEog7pfSA99Rn9cXDmAKUFFu4+SkYl0X1cSdLqqkqNt5OhnLOdlKPYel/c5XrkdQQ8osBrXBzDFDinPFhJEInFUBsaf6OPPFwraDRGt6Yfgms7FIB1PcwDKvlDErUZo/ghYMoqPH8EdWBkVdf8Vb89TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkudD93W8q/mW5uo9LT2k333qx4rv8BJ0pXHsk061Xo=;
 b=QGLNhUbP/aAHYhOypmD8b/LZRsTxx2nAiiIj9EiBfkTSa+s8s7cClhYoqxEeY87CDKXQbB8MgE4KytuxKoEcf+M0XDS2ERkq9K8DCbzRcqTvUttVs43zdHwEN/Q1NWy3ojy60IjSHJ/Avw/jwzn6qXTDCluAiyfG7Q6Vt5JmQgS5E6/j1MGJUGubG6K3vo3q5UKB7rtQSY+x1eq1xpAj8I4TGXHYuffiG6ePMld1nfxWqfdT1eE8IKhb/oKqvmtU3QCZIQvQzRP2CeSQ/rFiaG0E1ek1U/wTYpmLFqFYpInsqgZ7sYcQhtfZ2G/Z+8ntAyMRJXp4+X6xlRzcFnAyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 MWHPR12MB1933.namprd12.prod.outlook.com (2603:10b6:300:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:35 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:32 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:20 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 31/87] drm/amd/display: 3.2.39
Date: Mon, 15 Jul 2019 17:19:53 -0400
Message-ID: <20190715212049.4584-32-sunpeng.li@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 74dda019-aa8e-46aa-d02a-08d7096a68f0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1933; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:
X-Microsoft-Antispam-PRVS: <MWHPR12MB193398361B17A2F12212F5E382CF0@MWHPR12MB1933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: eqoGLtPbkM1cPWCv0yZdqK5ZKa6UaCThhSNfSCvfWUR7u9MnWl2+PXU10XPiW3iWoBG40iLLevJ3d/5UUb3/5FoMH7kLN7ioi9CVaJSSmvBXuQeQZ1S5lHZhyKj+Qc2eJzVuXwHKz0mFNeiaanNq9PoQ8HqUmuZkGSwh7cZSeotgLtlysSVW4HcF1ZAm0xz21mPSISzxXN+w8oMwTqjCBaz5zKL2E5XAC9wQ+V1GwkYaDvEBEuZ6F15RNTsDRAzpQ4LylfJMnSU4JtyBhomF5PFDwp15zMQKIK3lxrXj4DjBAOd04xL6Q8dtiaW1BTNHa5DiRdcS90E4NdkponhnCPQzkbDu+UQ7veNls+T9rqPVB80veIB7c1U5re+TnEh6V9wLiPc2tV4HyYpsyoWzC0KOG/QR1OAvVHv+Jq+a3pY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:32.4757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dda019-aa8e-46aa-d02a-08d7096a68f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkudD93W8q/mW5uo9LT2k333qx4rv8BJ0pXHsk061Xo=;
 b=aWbKmqBiWuc87cD61WA6tu+yj3gdZVZ0de/I7QsWeglZrzf0A9KhvdmdWy8P/HY/+0UkL0fmNukCsJDOXcrgBsCPk4+fy88mbKjTSaCHWLDF4XDRS/1kAjRYZk4Ac6lNZrDmU2+jtAJitS9BoXde1xkh3uHJUhmGjcHJzzCyX0M=
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
c3BsYXkvZGMvZGMuaAppbmRleCBhMzA3YTNhMWNkZTQuLjBhYWQyMmIxZWYzNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTM5LDcgKzM5LDcgQEAKICNpbmNsdWRlICJpbmMv
aHcvZG1jdS5oIgogI2luY2x1ZGUgImRtbC9kaXNwbGF5X21vZGVfbGliLmgiCiAKLSNkZWZpbmUg
RENfVkVSICIzLjIuMzgiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjM5IgogCiAjZGVmaW5lIE1BWF9T
VVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
