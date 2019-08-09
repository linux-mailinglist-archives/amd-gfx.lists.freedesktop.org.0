Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450E487858
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21ED6ED91;
	Fri,  9 Aug 2019 11:27:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104D86ED8A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:27:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWcbU8fA8+1aKSAaKFRQUQrF1z/vUi0QICyXrz3Kel4xeDMsW1GcZAyhV23QBsTIoqbXVQSdhujpuM4X6pdMps4I/p5ctcPOvyTI6r0db+t2cLRHIIgBW9kLQoqF401Ilzd4PFCulsre8ioa/aXBAPE0308UutgnTB23S2iB5U3VkzfPv4Z/MivEf7O1gn8jLgQxPQ/4fGhul7mIVkETPBLA0402cC9wKt5A4vrZdHlnu3/6tXrGoxmH6p339+Doy5sqpSOsXNBX2hDkZjmDzmcdYR2iHPY73Cle7isd64OJRHPjmvaObV2RBhHr7u72TWUWGCv1V4iLG/8fVyLQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggNqG24CX9fP2oewiTUY2fglsdydZEdVLQjDaHHiCUI=;
 b=A/Wlifsmx9GlBPNCBOWIR7nA/0QS/WSrI2WZ9bkMHbCuU20iedqOWB0ebxZbsayEMVNQ6nAWPII16k5KJdOPjxAhlECgitcYLPfdh3Vgw0conhtFqJZZw1yzjp124WFn5lobZy6qDvYTL1Fa7sJlgcPAVRkxA0ocOfKX+gcpYzbGTAnsC3xQk28U0ly8kv5pkAtq1FlArt9k9iJng9kyu6Wfc7dRKkvhGUWn7thCOBLXMieKrlrqOqowU7PH2ucLGsmXCw24AeJpHmUqTl6+NkE854ytT5PZYFDI40npHjWZ+LboRjHRmnNVpGtlN4Jnw93ofGdrSH1P/bKOvjWZ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0035.namprd12.prod.outlook.com (2603:10b6:903:129::21)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:68::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Fri, 9 Aug
 2019 11:27:04 +0000
Received: from DM3NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CY4PR12CA0035.outlook.office365.com
 (2603:10b6:903:129::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.13 via Frontend
 Transport; Fri, 9 Aug 2019 11:27:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT046.mail.protection.outlook.com (10.152.83.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 11:27:03 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 9 Aug 2019
 06:27:02 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: increase CGCG gfx idle threshold for Arcturus
Date: Fri, 9 Aug 2019 19:26:54 +0800
Message-ID: <1565350016-7071-2-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565350016-7071-1-git-send-email-le.ma@amd.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39850400004)(136003)(396003)(2980300002)(428003)(189003)(199004)(356004)(6666004)(426003)(2616005)(476003)(305945005)(486006)(4326008)(70206006)(44832011)(126002)(11346002)(446003)(70586007)(14444005)(86362001)(49486002)(50466002)(5660300002)(48376002)(47776003)(76176011)(53936002)(2351001)(336012)(81156014)(8676002)(50226002)(16586007)(6916009)(478600001)(51416003)(8936002)(81166006)(36756003)(186003)(316002)(26005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4232f6ba-ab5f-4859-3568-08d71cbc80dc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR12MB2711; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2711258D43DC318C47736E6BF6D60@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: V7p0k/c+c3hTytSGMtTsubIqFL+bWx4syvAKAcHQWjQinVlgOJcuMC4gvUFAhaV94ezFisVQ5V0YnegFnad4+BYWfXUi+/4wR38ODDP1xxq2LBG3EDfrau/8ZfmWw2TwhwCiSbr7VaTJoM5RWgpNQ+Ya4K+zFQ7tt+/8h2xwpmS2hcofGWxUg/9Ru73X5phj7itX6vErn3SCk6vHvo6to1e0zhwoYrR5ZRYfCHy16NI0IJAFv6/wqereVISUZM26QiBO0D8tLtV1/389JYligMsMD11lO9Qt7E57AjlrywN6szvf25ZqkxJE+gXwlpC/CkLM4p2LqsCzpFLn1W0mtMBNgSF56NcAuHSIHfha7WzAGV+M2EShOiXToj5+l4NcFd0xJYyfwiUSbO85rBaW3CKm3rQm2iljMb6sBfI4Ou8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 11:27:03.6488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4232f6ba-ab5f-4859-3568-08d71cbc80dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggNqG24CX9fP2oewiTUY2fglsdydZEdVLQjDaHHiCUI=;
 b=LGFPrJZwGPfPbmg7uNmuVtSvdshs3Dk1Mr19cMyEqEHDM1NvQqBlVkjoRFtSbyETfmocILN+KLOAP3baMkq2j8JvFu9b4YbkZ/ENXEIGlVX1roLax5buO6wrcJEPQX7Ub2IvRyGW0uWFTh/2J8Sca32iCN1hLaeozhl8tCAiqQU=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9sbG93IHRoZSBodyBzcGVjLCBhbmQgbm8gbmVlZCB0byBjb25zaWRlciBnZnhvZmYgb24gQXJj
dHVydXMKCkNoYW5nZS1JZDogSWI5Y2FkNzliMWI5YzA5NjAxNDQ0N2ZjMGE3ZDI5Y2RiNTk0ZTE1
ZTMKU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMKaW5kZXggNzgxNTBmZi4uOWI4NWE3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jCkBAIC00Njc3LDggKzQ2NzcsMTIgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBf
dXBkYXRlX2NvYXJzZV9ncmFpbl9jbG9ja19nYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYKIAkJLyogZW5hYmxlIGNnY2cgRlNNKDB4MDAwMDM2M0YpICovCiAJCWRlZiA9IFJSRUczMl9T
T0MxNShHQywgMCwgbW1STENfQ0dDR19DR0xTX0NUUkwpOwogCi0JCWRhdGEgPSAoMHgzNiA8PCBS
TENfQ0dDR19DR0xTX0NUUkxfX0NHQ0dfR0ZYX0lETEVfVEhSRVNIT0xEX19TSElGVCkgfAotCQkJ
UkxDX0NHQ0dfQ0dMU19DVFJMX19DR0NHX0VOX01BU0s7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUg
PT0gQ0hJUF9BUkNUVVJVUykKKwkJCWRhdGEgPSAoMHgyMDAwIDw8IFJMQ19DR0NHX0NHTFNfQ1RS
TF9fQ0dDR19HRlhfSURMRV9USFJFU0hPTERfX1NISUZUKSB8CisJCQkJUkxDX0NHQ0dfQ0dMU19D
VFJMX19DR0NHX0VOX01BU0s7CisJCWVsc2UKKwkJCWRhdGEgPSAoMHgzNiA8PCBSTENfQ0dDR19D
R0xTX0NUUkxfX0NHQ0dfR0ZYX0lETEVfVEhSRVNIT0xEX19TSElGVCkgfAorCQkJCVJMQ19DR0NH
X0NHTFNfQ1RSTF9fQ0dDR19FTl9NQVNLOwogCQlpZiAoYWRldi0+Y2dfZmxhZ3MgJiBBTURfQ0df
U1VQUE9SVF9HRlhfQ0dMUykKIAkJCWRhdGEgfD0gKDB4MDAwRiA8PCBSTENfQ0dDR19DR0xTX0NU
UkxfX0NHTFNfUkVQX0NPTVBBTlNBVF9ERUxBWV9fU0hJRlQpIHwKIAkJCQlSTENfQ0dDR19DR0xT
X0NUUkxfX0NHTFNfRU5fTUFTSzsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
