Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E556088509
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7862E6EEBE;
	Fri,  9 Aug 2019 21:38:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710072.outbound.protection.outlook.com [40.107.71.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E826EEBE
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0wYeeyFgB5KnbUP0tGYSYKMPYjhcMjyoCRYPReaVEjrhef9oh1u1cLfGIW0kt70RRhM29PlF6sUA8inK/2FBaPUhlcQeBwi1NN9CN4R4imwKPy89fLJejbMtEvkGqz82lvdwD+DpPol5JsofafI3gHe5jav4zQw5CJcr8C2/Tjz/4R3fiXoSKHmYGyUN94208L5WvcM+lMLAU3XvIToxwGPCmjLoSR0bH61qxACpX4L+aFxGQ8nJsojhR4f4X/YVBsRs6QMr+KTwsgrNvzoGmbujdPLHl+nFo6PH6hdwgKTiOGjdVvvSPkD5gfjrPUZIK+DUKF997mMOiTMDUOgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTa597jQ1BPAZidKPHT6Tv67IvUUUIxqe6iP4x8f9Ms=;
 b=FZdY9POG7I2cc5T9u+RxvCLOcSCP7Oh/X8BKsELMsj0iUcHMfporVbvlj6tgaAagjW4zeI/P6qBnL25jKK1l5gD82aMLeVmM/1B2qnTeV4h1uvIIXdPRFPQHvD+8UOsRJFDX7/ruSYyt/tnFl7twm11KZel+Mkw5NZvOYGvzcuMS7onD/gF+VdEKDsHLHyDSmY2Ro+FCEqopVkV8OK8Z0tSLhvu5pNDBV3n3cScHt2eDCXA3tTjN7fO1H/zJ368hBqLjdE7X1/E18dgUftgZQH+NN4UpKi55cgRBd5YBFrMPWWezRpgNU9oJkUUpDp5nzkXJeXCcgoU7z1XH1DTrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:405:4c::30) by MWHPR12MB1278.namprd12.prod.outlook.com
 (2603:10b6:300:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:49 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by BN6PR1201CA0020.outlook.office365.com
 (2603:10b6:405:4c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:48 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:40 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 33/49] drm/amd/display: Fix type of ODMCombineType field
Date: Fri, 9 Aug 2019 17:37:26 -0400
Message-ID: <20190809213742.30301-34-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(51416003)(446003)(2870700001)(48376002)(11346002)(8936002)(4326008)(426003)(486006)(50466002)(86362001)(2906002)(50226002)(36756003)(53936002)(336012)(14444005)(2351001)(305945005)(6916009)(54906003)(186003)(76176011)(316002)(2876002)(356004)(5660300002)(1076003)(81166006)(81156014)(8676002)(126002)(6666004)(478600001)(476003)(26005)(70206006)(70586007)(47776003)(49486002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a3c0099-43d2-4861-0927-08d71d11f6e1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB127804D03AD48844D01EFFDC82D60@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xkdfj58c74H3lPJoL0wSjchD6zWyeMh4J3haU4X3S5b1KRkLBofASn73zAr0JspmkfJmuLEhsbbOHphMi8InGd0mTGOl4yGX1M1UjLXQHSSVK2s/LKl+/E6Qq4tWWTgR1Ps04WOwxJjBu2S3DMzxwxhMfPR3co0GBc/5qG4NkzUMMomotqpr7yqij61lRF145V6ngNXXrBoClXsXpJIsSXAcT83pC5luJ5HIyJz2cvTvBhh4pNUs1FOe75RZgkKJroFLOTeJK2h4nLa/mbZY+NEoRhLARrLTbcOrbt5XZsZKVdxlStbzjcZznSTISsUSTBNZhb90prBCn4yXEqyBiCtOhSNBVbVsFaBxhbiRrrNCoXl/DqGPg9ZLppEP04NBAazFtRgFS/YjY0tLP0WIwGTbOWygO7nc7QXZaAyMaXY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:48.8846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3c0099-43d2-4861-0927-08d71d11f6e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTa597jQ1BPAZidKPHT6Tv67IvUUUIxqe6iP4x8f9Ms=;
 b=hvSDE5R74fLPKq6tW5kqAa1LVaRT2tNWW8GfZji8AQvjwEMmAkO67E4LHlcn50YPA7rMPLmWseTe3KRsIvCXkqOjtzVsJ//2RWEdw+aRTy9Y5nyH6xKQ6HjzZBBHb4hQp1tvZltuih1iQKqy2RzvgRXajQTG2TtVteQGxM/dQHE=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKVGhlIHR5cGUgd2Fz
IGNoYW5nZWQgcHJldmlvdXNseSB0byBiZXR0ZXIgcmVmbGVjdCBwb3NzaWJsZSByZWdpc3Rlcgp2
YWx1ZXMuCgpTaWduZWQtb2ZmLWJ5OiBJbHlhIEJha291bGluIDxJbHlhLkJha291bGluQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBh
bWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmggfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oCmlu
ZGV4IDUyZDI1ODNiMmY3NC4uOTFkZWNhYzUwNTU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuaApAQCAtNDkxLDcgKzQ5
MSw3IEBAIHN0cnVjdCB2YmFfdmFyc19zdCB7CiAJdW5zaWduZWQgaW50IE5vT2ZEUFBbRENfX1ZP
TFRBR0VfU1RBVEVTICsgMV1bMl1bRENfX05VTV9EUFBfX01BWF07CiAJaW50IE5vT2ZEUFBUaGlz
U3RhdGVbRENfX05VTV9EUFBfX01BWF07CiAJYm9vbCBPRE1Db21iaW5lRW5hYmxlUGVyU3RhdGVb
RENfX1ZPTFRBR0VfU1RBVEVTICsgMV1bRENfX05VTV9EUFBfX01BWF07Ci0JYm9vbCBPRE1Db21i
aW5lVHlwZUVuYWJsZVBlclN0YXRlW0RDX19WT0xUQUdFX1NUQVRFUyArIDFdW0RDX19OVU1fRFBQ
X19NQVhdOworCWVudW0gb2RtX2NvbWJpbmVfbW9kZSBPRE1Db21iaW5lVHlwZUVuYWJsZVBlclN0
YXRlW0RDX19WT0xUQUdFX1NUQVRFUyArIDFdW0RDX19OVU1fRFBQX19NQVhdOwogCXVuc2lnbmVk
IGludCBTd2F0aFdpZHRoWVRoaXNTdGF0ZVtEQ19fTlVNX0RQUF9fTUFYXTsKIAl1bnNpZ25lZCBp
bnQgU3dhdGhIZWlnaHRDUGVyU3RhdGVbRENfX1ZPTFRBR0VfU1RBVEVTICsgMV1bMl1bRENfX05V
TV9EUFBfX01BWF07CiAJdW5zaWduZWQgaW50IFN3YXRoSGVpZ2h0WVRoaXNTdGF0ZVtEQ19fTlVN
X0RQUF9fTUFYXTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
