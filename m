Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9477E69DA9
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1657C89C1B;
	Mon, 15 Jul 2019 21:21:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680060.outbound.protection.outlook.com [40.107.68.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A60D89C14
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi9QzVHycVmunfq5fWFmrl0XcLnq8t+2rSSq640ASyvveebMEC4m8TgmFqISNommDIER9W5fl+Aop9cEqMeCBXPXYi8aV+3K7BGdVUw4Hpb8DuzhB5/JjccJ7X8+NbXo1X49GepXcMo/3YVXwyqBZ6YyWTkceFw5kSigsgW/tUNte8RAi/NALKWGFGegiXMHps4kiQYaemJw1lKOphcVeehrCQ7Upt/DBm+m7ZevkTDQythP7RrC6ddFgnuI0jnhoiSKfvy9pMFHHRRyohfba08KcCeo/+J7DOOiCbWV4H7QgJ0yCrdyhpU8VF+QXQHaLE8aZNLNFOC06yrSKaZY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn0Xys+NhHiPHw2eWWuuGJ0PuNQ68Ljiy5kHq48N3jE=;
 b=jmywX12ynq02amfAGCmhk//+FrLfrYzEo74fP6qyv4Krye4g0ezPT7rH7Q2QEuCEMVCtGp/fBxsYSa24CrMu3v6/gVSDvzx2bRgooqYS5wF33yLyERKz2+JprLxK88DYaQlm2vWd/8pYkCMwQJ9pV75yNkj5w26Bv+8SKeb6IhjQCQixY3w3fBtdaVvmMCmPyZKz21H1sFempfdO4/YvMGR4UWYItJ/t5F2vldtemJL6kHtKVcOfldgUiGqvw5vUIbi7Zj0oLYAOHlveW1khPN2cs2kGDFlEOGWr+J0Nmi84nMFE0+Ui6QGvp/zBpRqB4k8Y69nlAaYvx33LRc5l8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0014.namprd12.prod.outlook.com (20.179.80.27) by
 BN6PR12MB1921.namprd12.prod.outlook.com (10.175.97.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 21:21:29 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0014.outlook.office365.com
 (2603:10b6:208:a8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.11 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:28 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:17 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/87] drm/amd/display: refactor dump_clk_registers
Date: Mon, 15 Jul 2019 17:19:46 -0400
Message-ID: <20190715212049.4584-25-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(53936002)(70586007)(6916009)(2876002)(76176011)(70206006)(51416003)(316002)(86362001)(486006)(54906003)(5660300002)(305945005)(68736007)(478600001)(1076003)(11346002)(446003)(50466002)(14444005)(47776003)(2870700001)(6666004)(50226002)(356004)(49486002)(81156014)(81166006)(36756003)(186003)(426003)(2906002)(48376002)(8676002)(2616005)(336012)(4326008)(126002)(2351001)(476003)(8936002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6895291-5a42-44b7-de15-08d7096a666b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1921; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1921055B02B4139063B9F00E82CF0@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pIfA0MItAJ950GNg1V/g8x6NO1Dcc97S3AaU2PZgBYKtpc9R70LntENsy/EWuQMhPk76ZGMhSafLjGKb3m+5iTk80IzLd+54NpbKylmTMfxZU7XPmK/EIAtIju1dBSzHUNtH38cG3T0A75MW1K4Cu04YGClrrMw2Z7tqgnPQKt2hfc82PzVJLEvPdr/WX/gZAzMJEa497ncFETwTlC+HWX3c960PI7Ku5MBoBejM2jLxSVYMgQ9rnTuIyMOakvqb8PLtvO2/bdizcjqdjIDZX2GGeGog2Mc7M94GU+dsCkuWb0lMlOlHoTtObu/wOEt9xgoPdnOsA4yBqb19dtvDlU+TpW1NHxn/saXTKx11QBt3mkQahbyQ9iaer6ufV7cSj/PMGKT7T9XyLu9nChTV08mP5St+8oxIhEiPZNRc30I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:28.3861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6895291-5a42-44b7-de15-08d7096a666b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn0Xys+NhHiPHw2eWWuuGJ0PuNQ68Ljiy5kHq48N3jE=;
 b=N56fuF4n5BASYJpCoBbjlovxltR9EJ60vUU1IQuYII6m2tQclPOJLZGCOozHSW14p9kQ/+qrXGJ6DIEG9rY696LfNnYRmg44UCszxSSP5pZEsFi+E9ldP8JR31XbjW929HDUDUWIBZUfvBm/CkeytJzE4HCFPXobMcA60Z0r5tA=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Su Sung Chung <Su.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3UgU3VuZyBDaHVuZyA8U3UuQ2h1bmdAYW1kLmNvbT4KClt3aHldCmZvciAyIHB1cnBv
c2VzOgoKMS4gZ2V0IHJhdyByZWdpc3RlciB2YWx1ZSBkdW1wZWQgb24gdGhlIGxvZywgd2hpY2gg
d2lsbCBtYWtlIGl0IGVhc2llcgp0byB0YWxrIHRvIG90aGVyIHRlYW0gd2hvIG9ubHkga25vd3Mg
YWJvdXQgdGhlIHJlZ2lzdGVyCgoyLiBlbmFibGUgb3RoZXIgSFcgdG8gYmUgYWJsZSB0byB1c2Ug
dGhlIHNhbWUgaW50ZXJmYWNlIGFzIHJhdmVuIHRvIGxvZwpjbG9jayByZWdpc3RlciBkYXRhCgpT
aWduZWQtb2ZmLWJ5OiBTdSBTdW5nIENodW5nIDxTdS5DaHVuZ0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX2h3X3NlcXVlbmNlcl9kZWJ1Zy5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RtX3NlcnZpY2VzLmggICAgICAgICAgICAgICAgICAgIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXJfZGVi
dWcuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1
ZW5jZXJfZGVidWcuYwppbmRleCA2ZTQ3NDQ0MTA5ZDcuLjdmNDc2NmU0NWRmZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNl
cl9kZWJ1Zy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24x
MF9od19zZXF1ZW5jZXJfZGVidWcuYwpAQCAtNDUsNyArNDUsNyBAQAogI2luY2x1ZGUgImRjbjEw
X2NtX2NvbW1vbi5oIgogI2luY2x1ZGUgImNsa19tZ3IuaCIKIAotc3RhdGljIHVuc2lnbmVkIGlu
dCBzbnByaW50Zl9jb3VudChjaGFyICpwQnVmLCB1bnNpZ25lZCBpbnQgYnVmU2l6ZSwgY2hhciAq
Zm10LCAuLi4pCit1bnNpZ25lZCBpbnQgc25wcmludGZfY291bnQoY2hhciAqcEJ1ZiwgdW5zaWdu
ZWQgaW50IGJ1ZlNpemUsIGNoYXIgKmZtdCwgLi4uKQogewogCXVuc2lnbmVkIGludCByZXRfdnNu
cHJpbnRmOwogCXVuc2lnbmVkIGludCBjaGFyc19wcmludGVkOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3NlcnZpY2VzLmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZG1fc2VydmljZXMuaAppbmRleCBiNDI2YmEwMmI3OTMuLjFhMDQyOTc0
NDYzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3NlcnZp
Y2VzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3NlcnZpY2VzLmgK
QEAgLTE1MSw2ICsxNTEsNyBAQCB2b2lkIGdlbmVyaWNfcmVnX3dhaXQoY29uc3Qgc3RydWN0IGRj
X2NvbnRleHQgKmN0eCwKIAl1bnNpZ25lZCBpbnQgZGVsYXlfYmV0d2Vlbl9wb2xsX3VzLCB1bnNp
Z25lZCBpbnQgdGltZV9vdXRfbnVtX3RyaWVzLAogCWNvbnN0IGNoYXIgKmZ1bmNfbmFtZSwgaW50
IGxpbmUpOwogCit1bnNpZ25lZCBpbnQgc25wcmludGZfY291bnQoY2hhciAqcEJ1ZiwgdW5zaWdu
ZWQgaW50IGJ1ZlNpemUsIGNoYXIgKmZtdCwgLi4uKTsKIAogLyogVGhlc2UgbWFjcm9zIG5lZWQg
dG8gYmUgdXNlZCB3aXRoIHNvYzE1IHJlZ2lzdGVycyBpbiBvcmRlciB0byByZXRyaWV2ZQogICog
dGhlIGFjdHVhbCBvZmZzZXQuCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
