Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1C69DB3
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA87A89C52;
	Mon, 15 Jul 2019 21:21:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720069.outbound.protection.outlook.com [40.107.72.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5B289C07
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVFiP7ZZ1NK1s3iT+B9PW5/zBax4CzJzOU+SJ3wG7hdLcHpwJsY29pv8J6UuA2M+vLVf/4S+2zd7CwIxmdSzdU2rJfDICpWbr0FEUcIV0D0YYK+ojaWI/igTUgObeG0tWLROaY/70ecVREhNG/C8aoawtoaMiKO7Pr8SLUK4zUKt02shiIOogaanRkc2GFS0ZwDzcPhPne31qCL0OPIIw9XesjeICDn7stwa0RV+K6EeA9l3LDYLfCvZYmfvFarPhaFU7sfp+JG28c5SzvN4HI4gHl/rcvKtvWBD6w/3lzVi7H+pa8WaXoOO1MkJyMmDXv7QXcs0O3kRR5IA9WXUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCi+xJTPXdFX2nJT1JLNfgtYOe98eKMqgDvGX6BY/5w=;
 b=H9EWAQGqTZUP+Ghv2SoBdDQ5Bu30ndpDcXAAwNmcq86c7n83slgg43Q6ZxmDzUctiwdf8u4oRcLGKXk9jw+dSuvi4oahDRWlBazuX2JXQfZwFJCUY0JUkbsBiRviY7JC1xkLvp+CxIgdngj81tJjq1zhrTMqKsaukAO4udRHXGzJ6DugQcrAARE/Plf7yInmdfDF+w69QmqvcfvX2sRCROXvPMcY0YBmkxUpPafjhAPLr5wZGcaDy/7I/y7GjOk8nN725WeKQWTMKxhrYNyiN/aYhv/JbKjo/1kECchU7ipKxvSemC1TmY9aaAO1bBuRMvQ9iOi5LF4uQt4LmLndsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:208:a8::27)
 by BN8PR12MB3089.namprd12.prod.outlook.com (2603:10b6:408:67::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:30 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0014.outlook.office365.com
 (2603:10b6:208:a8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.11 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:29 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:18 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/87] drm/amd/display: add monitor patch to add T7 delay
Date: Mon, 15 Jul 2019 17:19:48 -0400
Message-ID: <20190715212049.4584-27-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(428003)(43544003)(199004)(189003)(8676002)(2616005)(50466002)(2906002)(476003)(2876002)(36756003)(11346002)(48376002)(26005)(305945005)(8936002)(49486002)(47776003)(426003)(316002)(86362001)(446003)(1076003)(2870700001)(50226002)(70586007)(70206006)(81156014)(81166006)(478600001)(2351001)(486006)(4326008)(54906003)(6916009)(51416003)(76176011)(356004)(6666004)(186003)(336012)(5660300002)(68736007)(53936002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3089; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02935d32-20a1-42ef-a95a-08d7096a6719
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3089; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3089:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3089CFEAEFFDF6BD7290D8E582CF0@BN8PR12MB3089.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HPxsIMBcXoSAet05lGMyKFsCg01xjhlPVv3rDriPxZMu9J0uLCiX8f9wa7VBQb/UiSzUjoQH6LHgtmAPIAfVgZmS+4N6qT4wVXi7gauMfaeWrTtjECTbFPqK+ChX1H9nvGRcIuuHtHmAZ0ddz+tY6YOn6E/8OGxWc13ss/xToEelT+QAipywLpsKDbAUDJuKBCSD57fBrvoFKmonSP8rZxMgyS/RK4eVh4j/diei17P0SySYf/7weuc3LcIOi0qdgbfsePNPEW4HNIXuBbtrKzLCIqC5zqpllme6cwy8IqMrjtHh63HCkpfBEMtH6jPgksIYcLjSnxbpe/IBeWvvRQezPBWQ7sLvISV3DMXAZETn3TH3WR911vulPxYv54wThebLOhRr7U37skF1eSP5Vl0mZ7BnUK/aY/sZaa+Ekh8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:29.5051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02935d32-20a1-42ef-a95a-08d7096a6719
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCi+xJTPXdFX2nJT1JLNfgtYOe98eKMqgDvGX6BY/5w=;
 b=CCm7I3rAl0K/kECOvDFy2H8kgHUZfFFz6UjgfFM+EHzuqXnmDwCWaP6f6UKv3l4rslZw+7eYGreWRzrwLAlux8vVvlfFGaX6JTlrFrDmMClcqsmemOShgSL9gy9i0yu/z4fkqOUCjz41+rKvLZGBlwej48xKzccb6myYRG5+Cb4=
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
 Anthony Koo <anthony.koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPGFudGhvbnkua29vQGFtZC5jb20+CgpbV2h5XQpTcGVjaWZpY2Fs
bHkgdG8gb25lIHBhbmVsLApUQ09OIGlzIGFibGUgdG8gYWNjZXB0IGFjdGl2ZSB2aWRlbyBzaWdu
YWwgcXVpY2tseSwgYnV0CnRoZSBTb3VyY2UgRHJpdmVyIHJlcXVpcmVzIDItMyBmcmFtZXMgb2Yg
ZXh0cmEgdGltZS4KCkl0IGlzIGEgUGFuZWwgaXNzdWUgc2luY2UgVENPTiBuZWVkcyB0byB0YWtl
IGNhcmUgb2YKYWxsIFNpbmsgcmVxdWlyZW1lbnRzIGluY2x1ZGluZyBTb3VyY2UgRHJpdmVyLiBC
dXQgaW4KdGhpcyBjYXNlIGl0IGRvZXMgbm90LgoKQ3VzdG9tZXIgaXMgYXNraW5nIHRvIGFkZCBm
aXhlZCBUNyBkZWxheSBhcyBwYW5lbAp3b3JrYXJvdW5kLgoKW0hvd10KQWRkIG1vbml0b3Igc3Bl
Y2lmaWMgcGF0Y2ggdG8gYWRkIFQ3IGRlbGF5CgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IEtvbyA8
YW50aG9ueS5rb29AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUu
TGl1QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyB8IDQgKysr
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmggICAgICAgICAgfCAx
ICsKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYwppbmRleCA0NjI1N2YwZmNi
ZTcuLjg3OGY0N2I1OWQ1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGlua19od3NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGlua19od3NzLmMKQEAgLTE2Miw2ICsxNjIsMTAgQEAgYm9vbCBlZHBfcmVj
ZWl2ZXJfcmVhZHlfVDcoc3RydWN0IGRjX2xpbmsgKmxpbmspCiAJCQlicmVhazsKIAkJdWRlbGF5
KDI1KTsgLy9NQXggVDcgaXMgNTBtcwogCX0gd2hpbGUgKCsrdHJpZXMgPCAzMDApOworCisJaWYg
KGxpbmstPmxvY2FsX3NpbmstPmVkaWRfY2Fwcy5wYW5lbF9wYXRjaC5leHRyYV90N19tcyA+IDAp
CisJCXVkZWxheShsaW5rLT5sb2NhbF9zaW5rLT5lZGlkX2NhcHMucGFuZWxfcGF0Y2guZXh0cmFf
dDdfbXMgKiAxMDAwKTsKKwogCXJldHVybiByZXN1bHQ7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmgKaW5kZXggNmVhYmI2NDkxYTNkLi5jZTZkNzNkMjFjY2Eg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY190eXBlcy5oCkBAIC0yMDIsNiAr
MjAyLDcgQEAgc3RydWN0IGRjX3BhbmVsX3BhdGNoIHsKIAl1bnNpZ25lZCBpbnQgZHBwb3dlcnVw
X2RlbGF5OwogCXVuc2lnbmVkIGludCBleHRyYV90MTJfbXM7CiAJdW5zaWduZWQgaW50IGV4dHJh
X2RlbGF5X2JhY2tsaWdodF9vZmY7CisJdW5zaWduZWQgaW50IGV4dHJhX3Q3X21zOwogfTsKIAog
c3RydWN0IGRjX2VkaWRfY2FwcyB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
