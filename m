Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3A88517
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D816EED2;
	Fri,  9 Aug 2019 21:39:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680051.outbound.protection.outlook.com [40.107.68.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEED6EECD
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGSJdoIL5w02xDxJyJllC4xscCjJOhS9jiV9qpkn2gkQbwgFYkmlfY8JLbgV32QN2/EiFW1QmLZCy2Pc0IWrfhtgFDwuMAmm7yP5Eh2yFv54KXFLdGl6w9yEFQHkaYypeSo6gOh91PhvrR73IBdtwMxCT4XSNYfsNKd57X//kuV0LSH62ny4QDZo4o8ksypgqXXTngpEovWc71SRWyXc7PfZFqpAIrRXqXkNxr8nukg1uZnl/pqaLOGFySMMyleVPciMDC4iY4pEtxiSOs6ePx8R6OogMqnw5T7zrMyNNKLjnjxXI2TtTJxj5e64AfTXM61VofWwTdJWijmaTyXppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHgmplRjFOuZ0rHO394qTqT/7EUHNRH3KgPdFEqk4E8=;
 b=ebjNyBxZbHcOekC1gVcmuWcy9LOrBRQ6yHst1DvwtG3UQcIKQKwrtrQ1pwSLylXlmezF+WXoVxQLUEf7mAh89Wr3isbnclik62eKSz3ik2gU19BkPGJKCvCLG2z4P1679Pl4zYfvA207HyA5BMpgTPWxfit0HKUJ/SLXSqBWE3JpoUgrYMIQuFyolp12ZDiTXSYIycN9ZyVnoVuuiMmvKZfbYyjnXMmfN7tKDZNtk4wBT1+Iiua2QRjd+rcVhNyP52eTNzHxAWRkGVvfYX/8e6RV1MWrEZI0DRlcT0pru7wCHPefjkWDSK+t+CTkH5jFgnXM9zlTkEGkpw/I7LVVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0039.namprd12.prod.outlook.com (2603:10b6:405:70::25)
 by MWHPR12MB1533.namprd12.prod.outlook.com (2603:10b6:301:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Fri, 9 Aug
 2019 21:38:57 +0000
Received: from DM3NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN6PR12CA0039.outlook.office365.com
 (2603:10b6:405:70::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT062.mail.protection.outlook.com (10.152.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:56 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:45 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 45/49] drm/amd/display: enable dcn_mem_pwr as golden setting
 updates
Date: Fri, 9 Aug 2019 17:37:38 -0400
Message-ID: <20190809213742.30301-46-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(2906002)(305945005)(8676002)(54906003)(53936002)(316002)(51416003)(76176011)(26005)(476003)(2616005)(126002)(5660300002)(70586007)(6916009)(446003)(11346002)(486006)(186003)(426003)(81166006)(336012)(4744005)(81156014)(2351001)(70206006)(36756003)(14444005)(48376002)(1076003)(15650500001)(86362001)(356004)(6666004)(47776003)(4326008)(50466002)(49486002)(2876002)(8936002)(478600001)(50226002)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1533; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a42994d7-1a30-4df2-5269-08d71d11fb37
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1533; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1533:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1533D3714F7EA4B3AEF6888482D60@MWHPR12MB1533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:234;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DmIhAM1W+gXklL1VwhLhmLDse4+8Iyc6Gz4HqFv8T4/RXJUNxVRRzk6sCwPe2DaBDtKXGix65rRJ35L6JV/f87NKACwj5AszpTKymqsBMmf3yPmPph6Uy2zEzz+JDcpBiT+c1Tre6/RW7mDSDouCdOwD7/mR8n3bA3Bha/M7jsoyC5zAEJ/6SFj6A3iHFJTYplPtis89LJwQpXb4uq8Cj4VMfUIbG98Cctdu7WxxXtItk9qndUcr1V0YVJ4DjSkb3Ck9ibUAyM9o1KxX+J0F7w7ykD7usJbhSLXW5KaINUs1BPu0chz3QsPPSQEwkliYw3yr6QTdWDZa/jwinx8l1c6NVxZGw7IyF0NcAEU4A76AerLc5AqbJDPT+LyWzujiEDRk5SLhwOuoHn9viWfumf0QTDHalg7UQxXxVwdxncU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:56.1309 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42994d7-1a30-4df2-5269-08d71d11fb37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHgmplRjFOuZ0rHO394qTqT/7EUHNRH3KgPdFEqk4E8=;
 b=HlOpmd8gSQvXlp6Wz790TE7wumaZ8vfR8PFZ2EDEAWXbwRk1kCIpQxpOt089OpNp4ghl6GlbtrgJP/4Egda+LUucFvifsup54PJbPpklUCc5UuNQM9OEYe+/5FCRPJuMK/cjO7vfImp6UjLB+CPfwls5LlaPPCeQR9KxCSbJ1ak=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCkVuYWJsZSBkY25fbWVt
X3B3ciBhcyBnb2xkZW4gc2V0dGluZyB1cGRhdGVzCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBM
aXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2lu
IDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5s
aUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9od3NlcS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9od3NlcS5jCmluZGV4IDRlOWFjMDUxZDNkOC4uZmE4YTczZjZjOGUzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAt
MTQyLDggKzE0Miw3IEBAIHZvaWQgZGNuMjBfZGlzcGxheV9pbml0KHN0cnVjdCBkYyAqZGMpCiAJ
LyogRENDRyAqLwogCWRjbjIwX2RjY2dfaW5pdChod3MpOwogCi0JLyogRGlzYWJsZSBhbGwgbWVt
b3J5IGxvdyBwb3dlciBtb2RlLiBBbGwgbWVtb3JpZXMgYXJlIGVuYWJsZWQuICovCi0JUkVHX1VQ
REFURShEQ19NRU1fR0xPQkFMX1BXUl9SRVFfQ05UTCwgRENfTUVNX0dMT0JBTF9QV1JfUkVRX0RJ
UywgMSk7CisJUkVHX1VQREFURShEQ19NRU1fR0xPQkFMX1BXUl9SRVFfQ05UTCwgRENfTUVNX0dM
T0JBTF9QV1JfUkVRX0RJUywgMCk7CiAKIAkvKiBEQ0hVQi9NTUhVQkJVQgogCSAqIHNldCBnbG9i
YWwgdGltZXIgcmVmY2xrIGRpdmlkZXIKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
