Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B215B4786
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CD46E106;
	Tue, 17 Sep 2019 06:32:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF6B6E106
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvFOjemiZr0QdAGKhZD+TyTqJK0Udi3pPsopwWLjCpQoFRcqHUIhJtcqOVeFF7/Gxwtgyf1HlWNjX1wNA2/zQ9SN7dTnO5/Rhdi798n1WdGn3fof3F7bQqOPgG0Na68/agZ2hu5WRwQcFXWCyN2i8s5StMuuGUezahYjw294asJ87PwXcgj02mtUf0l/C3Z4P5EJONyOb2CWj0QmoZnQ9VHlpUC33VIJyg+zfEwdx0c/+10iEm+1p7rUCQkaUatmalOt0w5Td5HZNXi0aipJysRz3y8RsQhZMPNHIgzhHlihc5CDGFkUViwFLEt85NjFslZeoHCkeZyCV3HJAXCpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWrX3JBDxvrMMQjPDmpIHGhjUFY8VElu9I58bdmBoQQ=;
 b=jzqVrcqngMfX0ZE26T0DMaHb7o8FwmjkD2vlvrGIjntkvNsrzzbJUF7y5Zo/ueBq1yVevnDkGgGbORr7XMRStkGos8DL62kgtw+qpX+LaIRq05eXxKtkyZaxGvNj4WO18q1AMPRI3fJk5UEl5xuQnippbirYynzf+23csnpTnj17EvBqBnCek3Lo29sNevMOXlLb2R98efXzW08ONie1Sgrpx57iHWRqfHxftLGiQS9ueCUjs9gFqRhBA3gPAzSwewazr5PfD5lwPh6Av8UoyBJ/mrK3oG+zJc0QZowZiFsuEfbiwMJVZ7SM2Y8TZwbQxgYrG9VhzSZScZGcnj4/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0134.namprd12.prod.outlook.com (2603:10b6:0:51::30) by
 DM6PR12MB2860.namprd12.prod.outlook.com (2603:10b6:5:15c::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 06:32:08 +0000
Received: from BY2NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0134.outlook.office365.com
 (2603:10b6:0:51::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Tue, 17 Sep 2019 06:32:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT005.mail.protection.outlook.com (10.152.84.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Tue, 17 Sep 2019 06:32:07 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 17 Sep 2019 01:31:59 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] SWDEV-191392 [Vega10]Vega10 BKM0.83 AVFS parameters patch
 for Linux Driver
Date: Tue, 17 Sep 2019 14:31:46 +0800
Message-ID: <1568701906-31759-2-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568701906-31759-1-git-send-email-zhexi.zhang@amd.com>
References: <1568701906-31759-1-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(428003)(189003)(199004)(316002)(19627235002)(8936002)(26005)(50466002)(86362001)(476003)(126002)(2351001)(48376002)(305945005)(2616005)(446003)(11346002)(426003)(336012)(486006)(2906002)(53416004)(5660300002)(6666004)(356004)(36756003)(50226002)(6916009)(16586007)(7696005)(51416003)(186003)(76176011)(47776003)(478600001)(70586007)(8676002)(4326008)(70206006)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2860; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2560dbb9-e184-4915-5b93-08d73b38c346
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB2860; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2860:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2860014D955FB84F6B9DD96DEF8F0@DM6PR12MB2860.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 01630974C0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: d6uwgwVyakJEvtLyYmSLif6LtD7d69nb/a1MQJ2Fd2zY84LWw256p51ux4aukUFkw2aezfhTQt7ywHlrF5Q07L180w1OYeXFKSADbS/EDuKb8ftRdZ5gcDUlFEbQK9zNAT/oy+u1OKDLRHUwJV1IUDz1jgXL1bWyBBIoxzihM+uV4ekufR5hv6aqdUgwrlBvAYOJ1dtxfzEJ0flSnO51rAyHSCDOGpV9+tjojQHjYZ6uQ8J3R3H13CJJEC/JNVxvLAxse+nOm4hh8z5DO5iEVTlfQYY311L+vpAmECESV5+vF5oHZeDrlDxVR1JZ85e1hNM0Pm03YZKcj9EjOHkEEh5I75BrkjGPZbkCMGjIhAtQzq+wF4l97Ex4ZJKbPBPRNTIYmKhB5fiyCAu7JgSYPbmpBvUlIidtZDwqrgkOjV8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2019 06:32:07.5008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2560dbb9-e184-4915-5b93-08d73b38c346
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2860
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWrX3JBDxvrMMQjPDmpIHGhjUFY8VElu9I58bdmBoQQ=;
 b=eGQv+gcwLICFXXpxBQ77Tcg0m7otOevTzn6gLkkHgGwz+D4gevlmve2EVADja2ZnLTTrBfbnWNTGBCYBeOTBu/00/j+VuiY2idhpsysMzMxC6q+Cf7oIu4NJwbj+1bo+PbuksiiTe/Km/nBY2bOEVXj6xFzyXbVGTWj3FXoy7dg=
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
Cc: zhexzhan <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogemhleHpoYW4gPHpoZXhpLnpoYW5nQGFtZC5jb20+CgpJc3N1ZTogRFJPT1AgY29lZiBy
ZWFkIGJ5IEhEVCBhcHBlYXIgdG8gYmUgbWlzbWF0Y2ggd2l0aCByZXF1aXJlbWVudCBvZiBCS00w
LjgzCgpSb290IGNhdXNlOiBUaGVzZSB2YWx1ZXMgYXJlIHN1cHBvc2VkIHRvIGJlIG92ZXJ3cml0
dGVuIGJ5IFBQTElCLgpIb3dldmVyLCBkcml2ZXIgbWlzc2VkIGNvZGUgb2YgdGhpcyBwYXJ0LgoK
U29sdXRpb246IEFkZCBvdmVyd3JpdGluZyBwcm9jZXNzIHdoZW4gcmVhZGluZyBwcHRhYmxlIGZy
b20gdkJJT1MKSGFyZGNvZGUgc3BlY2lmaWMgY29lZiB3aXRoIGNvcnJlY3QgdmFsdWVzOgpHYlZk
cm9vcFRhYmxlQ2tzb2ZmQTAgPSAweEZGRkNEMkU3CkdiVmRyb29wVGFibGVDa3NvZmZBMSA9IDB4
MjQ5MDIKR2JWZHJvb3BUYWJsZUNrc29mZkEyID0gMHgyNDlCQQoKU2lnbmVkLW9mZi1ieTogemhl
eHpoYW4gPHpoZXhpLnpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvcHBhdG9tZndjdHJsLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9od21nci9wcGF0b21md2N0cmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3
bWdyL3BwYXRvbWZ3Y3RybC5jCmluZGV4IDYxNWNmMmMwLi5iODI3YzJjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9wcGF0b21md2N0cmwuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9wcGF0b21md2N0cmwuYwpAQCAtMjkz
LDYgKzI5MywxMyBAQCBpbnQgcHBfYXRvbWZ3Y3RybF9nZXRfYXZmc19pbmZvcm1hdGlvbihzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCWZvcm1hdF9yZXZpc2lvbiA9ICgoc3RydWN0IGF0b21fY29t
bW9uX3RhYmxlX2hlYWRlciAqKXByb2ZpbGUpLT5mb3JtYXRfcmV2aXNpb247CiAJY29udGVudF9y
ZXZpc2lvbiA9ICgoc3RydWN0IGF0b21fY29tbW9uX3RhYmxlX2hlYWRlciAqKXByb2ZpbGUpLT5j
b250ZW50X3JldmlzaW9uOwogCisJaWYgKGZvcm1hdF9yZXZpc2lvbiA9PSA0KQorCXsKKwkJcHJv
ZmlsZS0+Z2JfdmRyb29wX3RhYmxlX2Nrc29mZl9hMCA9IDB4ZmZmY2QyZTc7CisJCXByb2ZpbGUt
PmdiX3Zkcm9vcF90YWJsZV9ja3NvZmZfYTEgPSAweDI0OTAyOworCQlwcm9maWxlLT5nYl92ZHJv
b3BfdGFibGVfY2tzb2ZmX2EyID0gMHgyNDliYTsKKwl9CisKIAlpZiAoZm9ybWF0X3JldmlzaW9u
ID09IDQgJiYgY29udGVudF9yZXZpc2lvbiA9PSAxKSB7CiAJCXBhcmFtLT51bE1heFZkZGMgPSBs
ZTMyX3RvX2NwdShwcm9maWxlLT5tYXh2ZGRjKTsKIAkJcGFyYW0tPnVsTWluVmRkYyA9IGxlMzJf
dG9fY3B1KHByb2ZpbGUtPm1pbnZkZGMpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
