Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B35DB729
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EF96EA32;
	Thu, 17 Oct 2019 19:15:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820071.outbound.protection.outlook.com [40.107.82.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E256D6EA32
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTUmef63KjPxozi9n3+H/0pWx06V7dhyTUaWo7Ui0RGAD6vr1kxy3a6o9Oi2MPi5lkICtyr1SWFQrQIK054wnPvlDTWWLJhJOXjbRW4RLvNOJP4efGrTymrRvcitjwgP7NnhIFzF7SM705Budf4VOQrT7njSoC8p429nEtBvBWZN/TPNDQ6OEne6LyS+T4pTJD/1TwUMm2QiNBUlxQIf5JfTPSlVfLGWUwWcEZOwtGwxwhH4RdF79fzj5eLwQTKsVUD7G1se6NLw/iq30p3cBer+V9RqhbS5wf9EZtFH1DOOmal2ZD13bNiytANLqVyz4gaa/RYyJcDx6qYJplMWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If4mkj0XVpY52yVeaTAMlya+pmyWcil2H8udt9w+TG8=;
 b=Y6gYhmemBbhwyw/3I0hyN1cVvwB74ThgK/z49cTnMKe0CG6lHh2oT8ZQRtm0IBqtzHpAsxWSAIncqMQIZ/0CVFcorPnPiMsuMFI0o5ODTdf4lDmYXi3mtkagmhOtH3tvVOXe2z2spxJJw/20sT5ENh+DPtmUT1BOGgPcmz7Y2OUkPZvsHlW+rud0zLgdSMzIu9lBoi6A660JUNDSxualtuCbLNVX1s/NxMaqC33BNpWNUW0ZgzUpoRzrut4ixH0vEk0DqCLGxJgg/pdcpXHXz9SsQ9kS1L1hN/DZ38yLWjQ3YbQIgigR6LfjNhrU6wAI2FV4mOTy2HpMQWWFjWBTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0070.namprd12.prod.outlook.com (2603:10b6:3:103::32)
 by BN7PR12MB2641.namprd12.prod.outlook.com (2603:10b6:408:30::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:32 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM5PR12CA0070.outlook.office365.com
 (2603:10b6:3:103::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:32 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:31 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:30 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/37] drm/amd/display: Don't use optimized gamma22 with eetf
Date: Thu, 17 Oct 2019 15:12:56 -0400
Message-ID: <20191017191329.11857-5-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(428003)(189003)(199004)(6666004)(51416003)(76176011)(50466002)(356004)(486006)(54906003)(476003)(316002)(2616005)(86362001)(11346002)(446003)(126002)(26005)(336012)(426003)(50226002)(36756003)(186003)(8676002)(81166006)(81156014)(47776003)(6916009)(8936002)(305945005)(70586007)(70206006)(2870700001)(5660300002)(1076003)(2876002)(48376002)(478600001)(2351001)(2906002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2641; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 901fbebe-5cf0-4fff-2628-08d753366149
X-MS-TrafficTypeDiagnostic: BN7PR12MB2641:
X-Microsoft-Antispam-PRVS: <BN7PR12MB264198D37D658AAAA0D5EB42826D0@BN7PR12MB2641.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+Q/yo8mXC3UoTfAYJsiGzaCgCkFPrhX9IWtSY3TK8c5FnoqhawE//gcHkOm1EAi8ATWNcpv2lumJqFXbtjzsXNhA3f9OQ3r0N6XgTLPNA5XFm68y3k/cXSoEbT5qj0hoZhyu9D0DcAcfLiinsNbq/PIl4S+j1nGYGdALGCtoFetaJd62mzK1zX/Om3K6U/5nZ0ynX/DxUfL/D+7ff99pSDPymdim0MJhRS33Wdxq00Dg2hCP3mJVMp8HwoNUscWQt4TPBfjpW6Ynaxa0yE9GkEflWaWaOkoK0++DaLwY03nw8aTC+QQ/wcROaw4nRrW6hYwrl9UBWh56ofJBP3MLaak8YFlF7aahjHlGXm88Tk/xKm+Vd3LlLJSAjD/OZZ3pAXUzi5FUUF/uXgDbM/Twp3DYUVuFX4fV92PcA5UHYc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:32.0087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 901fbebe-5cf0-4fff-2628-08d753366149
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2641
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If4mkj0XVpY52yVeaTAMlya+pmyWcil2H8udt9w+TG8=;
 b=lhEhxcPE08nfMv8U5PstyWewfCiK5J5uWBxunyLOx3alhFp2ozY0+rc5pDq3y2WHI8JWtxwJyOe8CJlwvmtDDdL2aAaxiYXVuwGsAgVasgyipOCeYHm7kWlEC9ZL2CekoBJzkQKnSfR3MQf19hASF8bJ+e3AGLXGO8UfVEpYoYo=
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
Cc: Leo Li <sunpeng.li@amd.com>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Reza Amini <Reza.Amini@amd.com>, Aidan Yang <Aidan.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWlkYW4gWWFuZyA8QWlkYW4uWWFuZ0BhbWQuY29tPgoKW3doeV0KT3B0aW1pemVkIGdh
bW1hMjIgYXNzdW1lcyBmaXhlZCBwb2ludCBkaXN0cmlidXRpb24gd2hpY2ggaXMgbm90IHRydWUK
Zm9yIGVldGYgdHJ1ZS4KCltob3ddClVzZSBsb25nIGNhbGN1bGF0aW9uIGZvciBlZXRmLgoKU2ln
bmVkLW9mZi1ieTogQWlkYW4gWWFuZyA8QWlkYW4uWWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTog
S3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpBY2tlZC1ieTogUmV6YSBBbWluaSA8UmV6YS5BbWluaUBh
bWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMg
ICB8IDQ1ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCmluZGV4IDJkOGYxNGI2OTExNy4uODVk
YWQzNTZjOWQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxl
cy9jb2xvci9jb2xvcl9nYW1tYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9t
b2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKQEAgLTM3Myw3ICszNzMsNDIgQEAgc3RhdGljIHN0
cnVjdCBmaXhlZDMxXzMyIHRyYW5zbGF0ZV9mcm9tX2xpbmVhcl9zcGFjZSgKIAkJcmV0dXJuIGRj
X2ZpeHB0X211bChhcmdzLT5hcmcsIGFyZ3MtPmExKTsKIH0KIAotc3RhdGljIHN0cnVjdCBmaXhl
ZDMxXzMyIGNhbGN1bGF0ZV9nYW1tYTIyKHN0cnVjdCBmaXhlZDMxXzMyIGFyZykKKworc3RhdGlj
IHN0cnVjdCBmaXhlZDMxXzMyIHRyYW5zbGF0ZV9mcm9tX2xpbmVhcl9zcGFjZV9sb25nKAorCQlz
dHJ1Y3QgdHJhbnNsYXRlX2Zyb21fbGluZWFyX3NwYWNlX2FyZ3MgKmFyZ3MpCit7CisJY29uc3Qg
c3RydWN0IGZpeGVkMzFfMzIgb25lID0gZGNfZml4cHRfZnJvbV9pbnQoMSk7CisKKwlpZiAoZGNf
Zml4cHRfbHQob25lLCBhcmdzLT5hcmcpKQorCQlyZXR1cm4gb25lOworCisJaWYgKGRjX2ZpeHB0
X2xlKGFyZ3MtPmFyZywgZGNfZml4cHRfbmVnKGFyZ3MtPmEwKSkpCisJCXJldHVybiBkY19maXhw
dF9zdWIoCisJCQlhcmdzLT5hMiwKKwkJCWRjX2ZpeHB0X211bCgKKwkJCQlkY19maXhwdF9hZGQo
CisJCQkJCW9uZSwKKwkJCQkJYXJncy0+YTMpLAorCQkJCWRjX2ZpeHB0X3BvdygKKwkJCQkJZGNf
Zml4cHRfbmVnKGFyZ3MtPmFyZyksCisJCQkJCWRjX2ZpeHB0X3JlY2lwKGFyZ3MtPmdhbW1hKSkp
KTsKKwllbHNlIGlmIChkY19maXhwdF9sZShhcmdzLT5hMCwgYXJncy0+YXJnKSkKKwkJcmV0dXJu
IGRjX2ZpeHB0X3N1YigKKwkJCWRjX2ZpeHB0X211bCgKKwkJCQlkY19maXhwdF9hZGQoCisJCQkJ
CW9uZSwKKwkJCQkJYXJncy0+YTMpLAorCQkJCWRjX2ZpeHB0X3BvdygKKwkJCQkJCWFyZ3MtPmFy
ZywKKwkJCQkJZGNfZml4cHRfcmVjaXAoYXJncy0+Z2FtbWEpKSksCisJCQkJCWFyZ3MtPmEyKTsK
KwllbHNlCisJCXJldHVybiBkY19maXhwdF9tdWwoCisJCQlhcmdzLT5hcmcsCisJCQlhcmdzLT5h
MSk7Cit9CisKK3N0YXRpYyBzdHJ1Y3QgZml4ZWQzMV8zMiBjYWxjdWxhdGVfZ2FtbWEyMihzdHJ1
Y3QgZml4ZWQzMV8zMiBhcmcsIGJvb2wgdXNlX2VldGYpCiB7CiAJc3RydWN0IGZpeGVkMzFfMzIg
Z2FtbWEgPSBkY19maXhwdF9mcm9tX2ZyYWN0aW9uKDIyLCAxMCk7CiAKQEAgLTM4NCw5ICs0MTks
MTMgQEAgc3RhdGljIHN0cnVjdCBmaXhlZDMxXzMyIGNhbGN1bGF0ZV9nYW1tYTIyKHN0cnVjdCBm
aXhlZDMxXzMyIGFyZykKIAlzY3JhdGNoX2dhbW1hX2FyZ3MuYTMgPSBkY19maXhwdF96ZXJvOwog
CXNjcmF0Y2hfZ2FtbWFfYXJncy5nYW1tYSA9IGdhbW1hOwogCisJaWYgKHVzZV9lZXRmKQorCQly
ZXR1cm4gdHJhbnNsYXRlX2Zyb21fbGluZWFyX3NwYWNlX2xvbmcoJnNjcmF0Y2hfZ2FtbWFfYXJn
cyk7CisKIAlyZXR1cm4gdHJhbnNsYXRlX2Zyb21fbGluZWFyX3NwYWNlKCZzY3JhdGNoX2dhbW1h
X2FyZ3MpOwogfQogCisKIHN0YXRpYyBzdHJ1Y3QgZml4ZWQzMV8zMiB0cmFuc2xhdGVfdG9fbGlu
ZWFyX3NwYWNlKAogCXN0cnVjdCBmaXhlZDMxXzMyIGFyZywKIAlzdHJ1Y3QgZml4ZWQzMV8zMiBh
MCwKQEAgLTk1MCw3ICs5ODksNyBAQCBzdGF0aWMgYm9vbCBidWlsZF9mcmVlc3luY19oZHIoc3Ry
dWN0IHB3bF9mbG9hdF9kYXRhX2V4ICpyZ2JfcmVnYW1tYSwKIAkJCQlpZiAoZGNfZml4cHRfbHQo
c2NhbGVkWCwgZGNfZml4cHRfemVybykpCiAJCQkJCW91dHB1dCA9IGRjX2ZpeHB0X3plcm87CiAJ
CQkJZWxzZQotCQkJCQlvdXRwdXQgPSBjYWxjdWxhdGVfZ2FtbWEyMihzY2FsZWRYKTsKKwkJCQkJ
b3V0cHV0ID0gY2FsY3VsYXRlX2dhbW1hMjIoc2NhbGVkWCwgdXNlX2VldGYpOwogCiAJCQkJcmdi
LT5yID0gb3V0cHV0OwogCQkJCXJnYi0+ZyA9IG91dHB1dDsKQEAgLTIxNzMsNSArMjIxMiwzIEBA
IGJvb2wgIG1vZF9jb2xvcl9jYWxjdWxhdGVfZGVnYW1tYV9jdXJ2ZShlbnVtIGRjX3RyYW5zZmVy
X2Z1bmNfcHJlZGVmaW5lZCB0cmFucywKIHJnYl9kZWdhbW1hX2FsbG9jX2ZhaWw6CiAJcmV0dXJu
IHJldDsKIH0KLQotCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
