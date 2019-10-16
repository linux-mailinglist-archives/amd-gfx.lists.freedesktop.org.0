Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E9D8606
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 04:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4A56E88C;
	Wed, 16 Oct 2019 02:48:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406246E88C
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 02:48:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM+TMUjk/nH/UU5Y+f2EXLoQTWvFKbFnucrSbmCvcMxVUg35OHnFP3tsq6KTMdIVkNCH9euzUoy9fyU6aWZdjukLoYqfpj4y7mGIAfAbYqHqMJ3E8R7eVmDzx2jugyes+Mi0oboZx1HRnoM98W4Sga7KXZxtdgVlpAN80x0RSYcePqCy5190hamuwe9gCobM2W6QZOtvKqZDzEjvDligbO3qT+cyRD2/xcqfj16F4Hr+RPdVhSW3NlFMUPY7k1Au7nwMC7u/EE/Wxb8KAnUlKTzFc9emircnjCdVQjLyC4JMDX9zxFUg/OE3VwxE0N9S2FpahBS7HEJMqDOkzrn2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CywZzeX1Scy1CS8ObjvudTh/CDyHioxnvlwbG5ddv6s=;
 b=baDjwbxW+gB9rrE0AxOYolhbOUHexW5833d85gI7APnA0eHpQ1/ygJc+Pac2BZHvlt+mrEK6ShXJJratnZE5t7QoKnmLa76Ie/wfEHPy3O+5sqXc273Y9ceUDv81DFs+ihlEC/DyLpYEFy77+POKe5DuNtvqddrU0DSmpuFpQSpF5xxcuntyabsRgc4lo8esBrtFcrdeQTorPFXZe8vyIu9/gGJjjL0FKsZ3eKQuKzIHLBwmEScy7BQnQspYSSDK8rMlBoor+170QpocQ1jSqBl7MCImuHHp+qXSPxTwyfalUcoyEbUD+lv/rX4cr0Wd9HDfEvQLNCWgcve11cakFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:405:4c::21) by BN6PR12MB1939.namprd12.prod.outlook.com
 (2603:10b6:404:107::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Wed, 16 Oct
 2019 02:48:42 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by BN6PR1201CA0011.outlook.office365.com
 (2603:10b6:405:4c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 02:48:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Wed, 16 Oct 2019 02:48:41 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 15 Oct
 2019 21:48:41 -0500
Received: from gc-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 15 Oct 2019 21:48:39 -0500
From: chen gong <curry.gong@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/psp: declare PSP TA firmware
Date: Wed, 16 Oct 2019 10:48:33 +0800
Message-ID: <1571194113-22696-1-git-send-email-curry.gong@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(428003)(199004)(189003)(4326008)(86362001)(48376002)(2351001)(50226002)(8936002)(16586007)(2906002)(426003)(36756003)(336012)(316002)(54906003)(4744005)(50466002)(70586007)(305945005)(81156014)(478600001)(2616005)(476003)(5660300002)(47776003)(486006)(6666004)(356004)(126002)(53416004)(81166006)(8676002)(7696005)(186003)(26005)(6916009)(70206006)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1939; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f328b65-d1dd-4d30-b4fb-08d751e35ae5
X-MS-TrafficTypeDiagnostic: BN6PR12MB1939:
X-Microsoft-Antispam-PRVS: <BN6PR12MB193957C37888FF62A111B0B59D920@BN6PR12MB1939.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0192E812EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L6BlC1FtEI15Wmx90V0IvdFUo+1QvmZGTXj9GxR9GmubcMWLZGOCfg69PkIhLUmVifZNHgq7cFWrIaV2BjKpkCDaLK0ZKZWwMgK+l/Usxo45bS5NwuVQlgE5xKR36G64AjOduNUj6Nluh6UGGLnRT3D4wNsB/CTxbGHc0sourmW6vwQcl109irfxqtrMSmz0J1pWLrVn90Dysiwn+W6pbWnpAeR1Ttwc+vVnUoJ0ukk0r94OeQ/qG2FiJlQGU/EqgJTAvJHEplhpW1FXZsgidiVTRPSwUEY2N1N76pOEE6LsRuS2If57hrt6zMIWbE5ZYT1j09nRvrMspJDdQp4pJwYsQhpPG70OdGoEly0IwIrbCIibnWLzOiZIB9bo6M0Zpu6OQg4LCbaNpDiddYh7rF5XbPOFY9IzcRHyoGygEgk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 02:48:41.9022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f328b65-d1dd-4d30-b4fb-08d751e35ae5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1939
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CywZzeX1Scy1CS8ObjvudTh/CDyHioxnvlwbG5ddv6s=;
 b=QaQDlR2kuEX7Itm/nCc+OxwF2BmNdBWOa9EhxWCMFD37F041vc8KiPn/KCtRLCaKb8SdHqG9ebeLTCdaKWUXFxgS4UJ9HtnS49fq2ZyMynMqRo+qUoYy/Ypj0PnKnQ4nRMEuHN2MsqCUSDZGpfWPVrYCz+LFiC/d11OoifBHD5k=
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
Cc: Bhawanpreet.Lakha@amd.com, chen gong <curry.gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIFBTUCBUQSBmaXJtd2FyZSBkZWNsYXJhdGlvbiBmb3IgcmF2ZW4gcmF2ZW4yIHBpY2Fzc28K
ClNpZ25lZC1vZmYtYnk6IGNoZW4gZ29uZyA8Y3VycnkuZ29uZ0BhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTBfMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9wc3BfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTBfMC5jCmlu
ZGV4IGI5NjQ4NGEuLmIzNDVlNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTBf
MC5jCkBAIC00MCw2ICs0MCw5IEBACiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbl9hc2Qu
YmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9waWNhc3NvX2FzZC5iaW4iKTsKIE1PRFVM
RV9GSVJNV0FSRSgiYW1kZ3B1L3JhdmVuMl9hc2QuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFt
ZGdwdS9waWNhc3NvX3RhLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW4yX3Rh
LmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW5fdGEuYmluIik7CiAKIHN0YXRp
YyBpbnQgcHNwX3YxMF8wX2luaXRfbWljcm9jb2RlKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQog
ewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
