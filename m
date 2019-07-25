Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF707565C
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 19:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734D76E7F3;
	Thu, 25 Jul 2019 17:57:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850F6E7F3
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 17:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiYub3YZlAdqAfGigEBppB6j7jxe2ebwcNqy+EFuSQduaUzpvtfZZxJXHL2Gv5DNIsZ2rSzxiOAwIkZCGIxTMKDG+Kcl/3T3FgxSJJcIWWKk/6YHJVnGxe+n34v7ENI5GXrKtuyaq0m7v8fiJ2d1DP6x8Jwb2fecorR8NFSwJBnO4yNq/Ei+7r98VjJ0Bo/F74/p7xlnvVuEvdhckI7ZgB5jkA7BIk2sX884r+4EewfU9pqbXi0r8jXdwe14WHmyKGkocjMcYDId098TaU4ZjMPJbOTkI8U5FsSTIO0jNC+GyoSSRssFTpCKP08adLlKRss0y4qNfedwK/nV/XcWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMcJ5K0IoXWayTJ78EFH0FL5x1Hk0urHxUA9f12dzYo=;
 b=fGY3RwIjW7KBoiWFwGy6AYIGe2G+TZfjI9p1diJmJh8J041GdMYui4HdxlBoHyzZYCYhyqE942M31XfWzrTEmbvh1UEVgu8yVHAedl8iOtg6+UfAONWeqm+k8zBFUcbidJ7ZC7kF3y+8+CVdpkAkZEKRzLNpjCdoEJFMeTfi295+st+tQxnyezJxIC+BObxsodiDNr8nByTNihQIeYXp0SMI34AnUwvKVhJBWMZqSVkH2F0XFMywPvOfELjvcCCTp5W5NQGZi1eaWVhsqIw+8EO1vqcQOTlU+r0pSuph6T2ib1EEPA04wLx+A3wFnNZX/RUoYP3fzE+gi6AYrm0DPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:301:4a::33) by CY4PR1201MB2484.namprd12.prod.outlook.com
 (2603:10b6:903:d7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Thu, 25 Jul
 2019 17:57:56 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by MWHPR1201CA0023.outlook.office365.com
 (2603:10b6:301:4a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Thu, 25 Jul 2019 17:57:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 17:57:55 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 25 Jul 2019 12:57:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Nicholas.Kazlauskas@amd.com>,
 <Harry.Wentland@amd.com>
Subject: [PATCH v2] drm/amd/display: Use switch table for dc_to_smu_clock_type
Date: Thu, 25 Jul 2019 13:57:45 -0400
Message-ID: <20190725175745.27466-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725174029.27009-1-sunpeng.li@amd.com>
References: <20190725174029.27009-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(189003)(199004)(36756003)(426003)(11346002)(2870700001)(446003)(53936002)(486006)(476003)(50226002)(6636002)(81166006)(2616005)(8936002)(48376002)(1076003)(70586007)(26005)(305945005)(6666004)(126002)(186003)(336012)(50466002)(81156014)(2906002)(356004)(51416003)(110136005)(316002)(478600001)(8676002)(2201001)(5660300002)(47776003)(86362001)(2876002)(70206006)(49486002)(68736007)(54906003)(4326008)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2484; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82caf2e4-9f40-404b-3cce-08d711299ef7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB2484; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2484:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB24844DFF6C52F32810026B2682C10@CY4PR1201MB2484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8ZD3R+sDEmZ0N9lhojCry+e3xR1agD0qVEsF0tZELfUIElND9JOHB9mzm9EcoDDVI0/Gdjjj62S3qqh3N8gzU473SUGw8GIsXVs3EBn//dV232UqqSaKaA+02frIH/iEPXaL4a+54dZITfJk3KyaHCnGLhz3Gw34gMbYhXkwmK9pG4MnVQRXKFZqCk+q6cgWE/MhT2xdh1sDDMVzzAPOqb63F77BtKV1wzbZ3Of5apuyV7xlZgos9XNUGqpUDoI6EebPOI/gTOK3Wz6NkMA26GJL3YIS4zwiLhvg31TH/CbprIdLBr7f5x+8cjqBmGPH+9d/1U0d+upF6i3287mpRBpXorDCepwatcuHiQru8hNkLUMGvebhd6ZSJrRG1ph1mja1UB0oy/EDM5NnBWJG8/6AQkx70KjctXsZAbzNmPQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 17:57:55.2937 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82caf2e4-9f40-404b-3cce-08d711299ef7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMcJ5K0IoXWayTJ78EFH0FL5x1Hk0urHxUA9f12dzYo=;
 b=HwpUtQ8NEZGQwW2RZMJlWcFdJAcJm6etuDwlfvsZLF6lOlEapT046701c/MeCLfyWx7n8v38g+pYXwI95mZ5TH7O+C/FfKq036yzy7KhZ987IF17Hi7PMvXBL67j+kkL8q2gmQHOoBUoqGmavUOqNZ5KhIGKN4NcfT5Dt9NTKW4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, natechancellor@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpVc2luZyBhIHN0YXRpYyBpbnQgYXJy
YXkgd2lsbCBjYXVzZSBlcnJvcnMgaWYgdGhlIGdpdmVuIGRtX3BwX2Nsa190eXBlCmlzIG91dC1v
Zi1ib3VuZHMuIEZvciByb2J1c3RuZXNzLCB1c2UgYSBzd2l0Y2ggdGFibGUsIHdpdGggYSBkZWZh
dWx0CmNhc2UgdG8gaGFuZGxlIGFsbCBpbnZhbGlkIHZhbHVlcy4KCnYyOiAwIGlzIGEgdmFsaWQg
Y2xvY2sgdHlwZSBmb3Igc211X2Nsa190eXBlLiBSZXR1cm4gU01VX0NMS19DT1VOVAogICAgaW5z
dGVhZCBvbiBpbnZhbGlkIG1hcHBpbmcuCgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9z
bXUuYyAgfCAzNyArKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYwppbmRleCAyMGU4MmM5ZjZk
NjcuLmU1MmRkZTIxNjEwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMKQEAgLTE1MiwxOCArMTUyLDMxIEBA
IHN0YXRpYyB2b2lkIGdldF9kZWZhdWx0X2Nsb2NrX2xldmVscygKIHN0YXRpYyBlbnVtIHNtdV9j
bGtfdHlwZSBkY190b19zbXVfY2xvY2tfdHlwZSgKIAkJZW51bSBkbV9wcF9jbG9ja190eXBlIGRt
X3BwX2Nsa190eXBlKQogewotI2RlZmluZSBEQ0NMS19NQVBfU01VQ0xLKGRjY2xrLCBzbXVjbGsp
IFwKLQlbZGNjbGtdID0gc211Y2xrCi0KLQlzdGF0aWMgaW50IGRjX2Nsa190eXBlX21hcFtdID0g
ewotCQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZUEVfRElTUExBWV9DTEssCVNNVV9E
SVNQQ0xLKSwKLQkJRENDTEtfTUFQX1NNVUNMSyhETV9QUF9DTE9DS19UWVBFX0VOR0lORV9DTEss
CVNNVV9HRlhDTEspLAotCQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZUEVfTUVNT1JZ
X0NMSywJU01VX01DTEspLAotCQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZUEVfRENF
RkNMSywJU01VX0RDRUZDTEspLAotCQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZUEVf
U09DQ0xLLAlTTVVfU09DQ0xLKSwKLQl9OwotCi0JcmV0dXJuIGRjX2Nsa190eXBlX21hcFtkbV9w
cF9jbGtfdHlwZV07CisJZW51bSBzbXVfY2xrX3R5cGUgc211X2Nsa190eXBlID0gU01VX0NMS19D
T1VOVDsKKworCXN3aXRjaCAoZG1fcHBfY2xrX3R5cGUpIHsKKwljYXNlIERNX1BQX0NMT0NLX1RZ
UEVfRElTUExBWV9DTEs6CisJCXNtdV9jbGtfdHlwZSA9IFNNVV9ESVNQQ0xLOworCQlicmVhazsK
KwljYXNlIERNX1BQX0NMT0NLX1RZUEVfRU5HSU5FX0NMSzoKKwkJc211X2Nsa190eXBlID0gU01V
X0dGWENMSzsKKwkJYnJlYWs7CisJY2FzZSBETV9QUF9DTE9DS19UWVBFX01FTU9SWV9DTEs6CisJ
CXNtdV9jbGtfdHlwZSA9IFNNVV9NQ0xLOworCQlicmVhazsKKwljYXNlIERNX1BQX0NMT0NLX1RZ
UEVfRENFRkNMSzoKKwkJc211X2Nsa190eXBlID0gU01VX0RDRUZDTEs7CisJCWJyZWFrOworCWNh
c2UgRE1fUFBfQ0xPQ0tfVFlQRV9TT0NDTEs6CisJCXNtdV9jbGtfdHlwZSA9IFNNVV9TT0NDTEs7
CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCURSTV9FUlJPUigiRE1fUFBMSUI6IGludmFsaWQgY2xv
Y2sgdHlwZTogJWQhXG4iLAorCQkJICBkbV9wcF9jbGtfdHlwZSk7CisJCWJyZWFrOworCX0KKwor
CXJldHVybiBzbXVfY2xrX3R5cGU7CiB9CiAKIHN0YXRpYyBlbnVtIGFtZF9wcF9jbG9ja190eXBl
IGRjX3RvX3BwX2Nsb2NrX3R5cGUoCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
