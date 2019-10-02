Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F7FC909A
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411316E193;
	Wed,  2 Oct 2019 18:16:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850746E974
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HouVZ46du7Jd4342IMiLgZ/mG/pnz+Od3BnBcs1rT89FUENWnC/82UyQLccKGZN8Us0sraRNP7hpPlfXnLEHkIdx8AAHvANa56ICGVcHEvvJzuq+LzHGSWyUKn9/BIM5+HNlWpNfuK+EMKfBXV7QZtTJE5noYMAv+08T1KNfYlS7eaNhUh3P18PBWIdlnb0ILLJt0k2Q0g5yQeESBpB4zBWTZaTgLO4Sq6s1i+Ww7MCJpA7hZZODFg2XDTxfvXfog4vlLUFTHV9XbarW49J8SCchpf2dg3OJx9Xnb4f2ovQgouNonRhcpFCYrPq22KgnkRstLu5QX8cTFW3qaWU+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIZ/YprLGMeyuZz6Mz4hM99mbgWWbZNUFr7muoa1b1c=;
 b=np6KYfZexJhVwP3WvUmSYLkL6LX7NqvImwOq9Zdfl2XrpRMCECcId/0gQsgRP+tJSgOh9ow4RuKcYAxoE/tYOWYtKdRbbmL43s3BRqmGMSwL4wy2k5RpSt06PDaHvHftOHCr+EfUhRjqCHVJyZum7vZDg44rCnQmXk5X3Uvm6f19HAxROaAab1Bw/2ACIwes7UY59aaHm1q+quCfPiQC+72ysfI3aR7qFvXxPFoOq5NW3458I2yUnk3qvbZj/ddmP2nYESXpH4FxhmpDT7YuefpwEfKxMuo3WSPpHergYV/CXxQA3aj59Tcp/uwjhc8diWQYfFHaK409zK4sAUxbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0027.namprd12.prod.outlook.com (2603:10b6:208:a8::40)
 by BN6PR12MB1313.namprd12.prod.outlook.com (2603:10b6:404:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:51 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MN2PR12CA0027.outlook.office365.com
 (2603:10b6:208:a8::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:51 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 33/38] drm/amd/display: Add capability check for static ramp
 calc
Date: Wed, 2 Oct 2019 14:16:28 -0400
Message-ID: <20191002181633.22805-34-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(428003)(189003)(199004)(426003)(126002)(486006)(2616005)(47776003)(446003)(476003)(186003)(51416003)(70206006)(336012)(26005)(76176011)(70586007)(7696005)(11346002)(5660300002)(2906002)(1076003)(2351001)(316002)(6666004)(356004)(478600001)(86362001)(53416004)(81166006)(81156014)(8676002)(14444005)(4326008)(48376002)(16586007)(36756003)(50466002)(305945005)(8936002)(50226002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1313; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73e1db73-16eb-4be7-4ca4-08d74764b270
X-MS-TrafficTypeDiagnostic: BN6PR12MB1313:
X-Microsoft-Antispam-PRVS: <BN6PR12MB13132B0FB3330822186CFACFF99C0@BN6PR12MB1313.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7IUOd2o/h1Wh8/DjJfY02hwqv8a+rXa46IOasvBNg4bvylgdfV1a6VN0pNHp4VNgU+D9TrvmBX91gT7qJUPKPzaRvKS2a3SNzaD9F924P9FTsehep2v1joZaaC39+iHK8NYH2kkRLntDqXm4czN/fMC9LBpZML09fiRXDAFw3KSNag5VmcbbcA5ro9omuJbfVJ7DuFb0bnywAFVlGT4mX74Yf6fw1v0AXvg6J3yk3NQpO5ZqfVWUeGs/yuF7URNSg7O7kkULVuRAwhegf/ntw1ihJnCHXgb8amDsnjrK79NpSVpouYiBceOgwlLMDSeYEdhb9nKAJtbn6Z4x3NuiLHNd5UGgN0XWh7qygKF9tv9fCEJwo5wyNH+FGkO3CTmmHB65pGeH2gI1YcGUiHx09EdntbTo7k/HCghEQTLU/M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:51.1229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e1db73-16eb-4be7-4ca4-08d74764b270
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1313
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIZ/YprLGMeyuZz6Mz4hM99mbgWWbZNUFr7muoa1b1c=;
 b=3/beXL7q1A0IZUTlzqjwjk6l9Qo67m2n40fTRlyH3fY64Nc7gzhQcNPxH2520UPcJzaEG2iQY4XhqPYDDss1IVc20I+WPBPwpKmj7WSuzUh+m5PIAL4G2HAHTx2HmcEW065i8FeHEgA45e7vSATLfTxOaT/2vY4R/hixuOofpGs=
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
Cc: Jaehyun Chung <jaehyun.chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFlaHl1biBDaHVuZyA8amFlaHl1bi5jaHVuZ0BhbWQuY29tPgoKW1doeV0KU3RhdGlj
IHJhbXAgdG8gbWF4IHJlZnJlc2ggcmF0ZSBkb2VzIG5vdCBoYXZlIGNhcGFiaWxpdHkgY2hlY2sg
b24KY2FsY3VsYXRlZCB2X3RvdGFsLiBQcm9ncmFtbWluZyBhIGxvd2VyIHZfdG90YWxfbWluIGFu
ZCBtYXggdGhhbiB0aGUKdG90YWwgY2F1c2VzIGNvbnRpbnVvdXMgc3B1cmlvdXMgSFBEcy4KCltI
b3ddCkFkZCBhIGNhcGFiaWxpdHkgY2hlY2sgYWZ0ZXIgdl90b3RhbCBjYWxjdWxhdGlvbiBzaW1p
bGFyIHRvIGNhbGN1bGF0ZQp2X3RvdGFsIGhlbHBlciBmdW5jdGlvbnMuCgpDaGFuZ2UtSWQ6IEkz
MjRhMWFiMmZlODIxMjU3N2I5MzRlMWU0NDI0OThkYjgzZTc5MDM0ClNpZ25lZC1vZmYtYnk6IEph
ZWh5dW4gQ2h1bmcgPGphZWh5dW4uY2h1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkg
S29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJo
YXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9t
b2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
bW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jCmluZGV4IDhmZDNkNGVjMzM5Yy4uMzRkZjdmZjYx
YzkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVl
c3luYy9mcmVlc3luYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVz
L2ZyZWVzeW5jL2ZyZWVzeW5jLmMKQEAgLTIzNCw2ICsyMzQsMTAgQEAgc3RhdGljIHZvaWQgdXBk
YXRlX3ZfdG90YWxfZm9yX3N0YXRpY19yYW1wKAogCQkJY3VycmVudF9kdXJhdGlvbl9pbl91cykg
KiAoc3RyZWFtLT50aW1pbmcucGl4X2Nsa18xMDBoeiAvIDEwKSksCiAJCQkJc3RyZWFtLT50aW1p
bmcuaF90b3RhbCksIDEwMDApOwogCisJLyogdl90b3RhbCBjYW5ub3QgYmUgbGVzcyB0aGFuIG5v
bWluYWwgKi8KKwlpZiAodl90b3RhbCA8IHN0cmVhbS0+dGltaW5nLnZfdG90YWwpCisJCXZfdG90
YWwgPSBzdHJlYW0tPnRpbWluZy52X3RvdGFsOworCiAJaW5fb3V0X3Zyci0+YWRqdXN0LnZfdG90
YWxfbWluID0gdl90b3RhbDsKIAlpbl9vdXRfdnJyLT5hZGp1c3Qudl90b3RhbF9tYXggPSB2X3Rv
dGFsOwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
