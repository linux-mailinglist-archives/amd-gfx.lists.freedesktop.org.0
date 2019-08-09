Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D84884D7
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD756EEA6;
	Fri,  9 Aug 2019 21:38:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790044.outbound.protection.outlook.com [40.107.79.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1BD6EEA4
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0uSQXj3VcOV1By4ZuFMP4UcAQU4rogbdachXPhLkfQliDeXtmZj9c5FbGMxp+YtwcMmZ94JHQT2TmImRtMXZxhlDDiHW5ve/TATeukJRrX85HK9cnCSuSF7Bh/Df97g+S8KsM8jBfW677P0Dup4XBjlQb0VhGXxbEs7cnu1C+hpwne5dSLQjpV3AC3YxldJ9AZUaY/2gVlvtoe7k5M70HaRvnfpjTrNJFQzfDcdSTpqRR4tkPK9PV0WRVYXwdhR/62RComA8Ailv36BKddYnaRb5WG+M/MP9STcvvi9YrXmDiypiS1Cx1YrS7qIr2W/KJEAgQ1yc8rmYTKKA4BaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQvbj6AbirJ3vw4XeLkvcITjL4MEiP77Kc8ytH0exYA=;
 b=nn+btbWIRHx22hVjEzjNrKClkasQr8FERvR5VX0Qy4uB1EPe3wV5afk2GQN+KBlg3Pxs/OQ6+ub3WRa2eJMneqmFb6JcLeWd9h3RMovO7uZ+xzFivVtSpfGl4X7EL34uTgLgu9d14JeIGIuZx2mxN1aqTlqutnevzJNSUsilWV41EePMXbatHKRAVfox6wrFnk5pjNKKDfhkBU80uydbL6WQV8tKNhN6tIytuTFHhCXYlfD0bwH+ItuM67IxPGOhUKi0xMmckFmXt+07+kaUcnZwv8BO9oJaYgZcY5IGxyopkW8i2EoAb/BYRffBpW8PvrP8OHWajEuCvQjiFbZ3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0047.namprd12.prod.outlook.com (2603:10b6:903:129::33)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:68::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Fri, 9 Aug
 2019 21:38:13 +0000
Received: from BY2NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by CY4PR12CA0047.outlook.office365.com
 (2603:10b6:903:129::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT003.mail.protection.outlook.com (10.152.84.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:12 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:06 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/49] drm/amd/display: Add PIXEL_RATE control regs for more
 instances
Date: Fri, 9 Aug 2019 17:36:54 -0400
Message-ID: <20190809213742.30301-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(6666004)(426003)(356004)(486006)(305945005)(476003)(4326008)(2870700001)(2616005)(70206006)(11346002)(126002)(70586007)(49486002)(50466002)(86362001)(5660300002)(48376002)(47776003)(446003)(1076003)(76176011)(2351001)(336012)(53936002)(81156014)(8676002)(50226002)(6916009)(54906003)(51416003)(478600001)(36756003)(81166006)(8936002)(186003)(2876002)(316002)(26005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf6ed3d6-bcc0-471d-f606-08d71d11e157
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR12MB2711; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2711EC6A42422E02342E054382D60@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4SwA9vyFEVzvV2JjZrcwmK9dCAz9RZh4M2fKFy+Rzp4alVLIXPqi0TCzjwGQwVp4JNVY3GEqq225h12ffC7NKg6Caz2KYAXAHaRpQea2cTN7kTLp5GzYlYSpWHGqw6yWgdfoprUzAlhvke8AkyQrQqBQU5TX4jJUXDdZ34EhFecTkH4OShoyCi4i/6xg0klvtxheqGAPWmGAcfuaCcPWRD/1fK1xffbXbjAwKXqpQgrwLLfJ0+Kg0gnW0vWvHXv8DgkJ+bs1h21XJoTI9K/smjCcmRNu+KRqJ2LCg0uIOCuK6T4JeIVqfHzsswIDbb2gKjJEKIEc60saVu6vy1Y81g8QmmlaojFOl1u70U1eeUUjAEO/P6v/LoXGqUGINlC5PI5O/xF7TqJab9qqUimvS6gUBfWAUbKeSORYCNz9LKU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:12.6961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6ed3d6-bcc0-471d-f606-08d71d11e157
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQvbj6AbirJ3vw4XeLkvcITjL4MEiP77Kc8ytH0exYA=;
 b=zrAOLtAwp/8VWRcfxPXXL8Bo0apfyc7L54laRs+/dpAiSBX4JVkcG6E28xGYy4WP0zcSCIUb7yrwZ6psuaGBgTsGB89LdR0GRTdJ9LaKFV3kv/HtB0KA1u8RptOdNxgBfcp2yLDdWIZqnpu2HX0Hu5fWJCL6tzEGvIWu1totx3o=
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
Cc: Leo Li <sunpeng.li@amd.com>, Sung Lee <sung.lee@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKRm9yIHVzZSBieSBm
dXR1cmUgQVNJQ3MKCihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDA4YTAyNmYxYWU3ODI4ODRi
MThkZmExMDhkZTAxOWE1YTk4NWU5MmEpClNpZ25lZC1vZmYtYnk6IFN1bmcgTGVlIDxzdW5nLmxl
ZUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgU3VuIDx5b25ncWlhbmcuc3VuQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBZb25ncWlhbmcgU3VuIDx5b25ncWlhbmcuc3VuQGFtZC5jb20+
CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmggICAgfCAyNSArKysrKysrKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9od3NlcS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaHdzZXEuaAppbmRleCAyNDVi
ODBiOTI2ODEuLmY2MmViMmU0M2Q3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfaHdzZXEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9od3NlcS5oCkBAIC02Miw2ICs2MiwxMCBAQAogCVNSSUkoQkxORF9DT05U
Uk9MLCBCTE5ELCA0KSwgXAogCVNSSUkoQkxORF9DT05UUk9MLCBCTE5ELCA1KQogCisjZGVmaW5l
IEhTV0VRX0RDTl9QSVhFTF9SQVRFX1JFR19MSVNUKGJsaywgaW5zdCkgXAorCVNSSUkoUElYRUxf
UkFURV9DTlRMLCBibGssIGluc3QpLCBcCisJU1JJSShQSFlQTExfUElYRUxfUkFURV9DTlRMLCBi
bGssIGluc3QpCisKICNkZWZpbmUgSFdTRVFfUElYRUxfUkFURV9SRUdfTElTVChibGspIFwKIAlT
UklJKFBJWEVMX1JBVEVfQ05UTCwgYmxrLCAwKSwgXAogCVNSSUkoUElYRUxfUkFURV9DTlRMLCBi
bGssIDEpLCBcCkBAIC0xNTEsNyArMTU1LDEwIEBACiAJU1IoRENDR19HQVRFX0RJU0FCTEVfQ05U
TDIpLCBcCiAJU1IoRENGQ0xLX0NOVEwpLFwKIAlTUihEQ0ZDTEtfQ05UTCksIFwKLQlTUihEQ19N
RU1fR0xPQkFMX1BXUl9SRVFfQ05UTCksIFwKKwlTUihEQ19NRU1fR0xPQkFMX1BXUl9SRVFfQ05U
TCkKKworCisjZGVmaW5lIE1NSFVCX0RDTl9SRUdfTElTVCgpXAogCS8qIHRvZG86ICBnZXQgdGhl
c2UgZnJvbSBHVk0gaW5zdGVhZCBvZiByZWFkaW5nIHJlZ2lzdGVycyBvdXJzZWx2ZXMgKi9cCiAJ
TU1IVUJfU1IoVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfSEkzMiksXAogCU1NSFVC
X1NSKFZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfQkFTRV9BRERSX0xPMzIpLFwKQEAgLTE2NiwxMCAr
MTczLDE0IEBACiAJTU1IVUJfU1IoTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0xPV19BRERSKSxcCiAJ
TU1IVUJfU1IoTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0hJR0hfQUREUikKIAorCiAjZGVmaW5lIEhX
U0VRX0RDTjFfUkVHX0xJU1QoKVwKIAlIV1NFUV9EQ05fUkVHX0xJU1QoKSwgXAotCUhXU0VRX1BJ
WEVMX1JBVEVfUkVHX0xJU1QoT1RHKSwgXAotCUhXU0VRX1BIWVBMTF9SRUdfTElTVChPVEcpLCBc
CisJTU1IVUJfRENOX1JFR19MSVNUKCksIFwKKwlIU1dFUV9EQ05fUElYRUxfUkFURV9SRUdfTElT
VChPVEcsIDApLCBcCisJSFNXRVFfRENOX1BJWEVMX1JBVEVfUkVHX0xJU1QoT1RHLCAxKSwgXAor
CUhTV0VRX0RDTl9QSVhFTF9SQVRFX1JFR19MSVNUKE9URywgMiksIFwKKwlIU1dFUV9EQ05fUElY
RUxfUkFURV9SRUdfTElTVChPVEcsIDMpLCBcCiAJU1IoRENIVUJCVUJfU0RQSUZfRkJfQkFTRSks
XAogCVNSKERDSFVCQlVCX1NEUElGX0ZCX09GRlNFVCksXAogCVNSKERDSFVCQlVCX1NEUElGX0FH
UF9CQVNFKSxcCkBAIC0yMDIsOCArMjEzLDEyIEBACiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FN
RF9EQ19EQ04yXzApCiAjZGVmaW5lIEhXU0VRX0RDTjJfUkVHX0xJU1QoKVwKIAlIV1NFUV9EQ05f
UkVHX0xJU1QoKSwgXAotCUhXU0VRX1BJWEVMX1JBVEVfUkVHX0xJU1QoT1RHKSwgXAotCUhXU0VR
X1BIWVBMTF9SRUdfTElTVChPVEcpLCBcCisJSFNXRVFfRENOX1BJWEVMX1JBVEVfUkVHX0xJU1Qo
T1RHLCAwKSwgXAorCUhTV0VRX0RDTl9QSVhFTF9SQVRFX1JFR19MSVNUKE9URywgMSksIFwKKwlI
U1dFUV9EQ05fUElYRUxfUkFURV9SRUdfTElTVChPVEcsIDIpLCBcCisJSFNXRVFfRENOX1BJWEVM
X1JBVEVfUkVHX0xJU1QoT1RHLCAzKSwgXAorCUhTV0VRX0RDTl9QSVhFTF9SQVRFX1JFR19MSVNU
KE9URywgNCksIFwKKwlIU1dFUV9EQ05fUElYRUxfUkFURV9SRUdfTElTVChPVEcsIDUpLCBcCiAJ
U1IoTUlDUk9TRUNPTkRfVElNRV9CQVNFX0RJViksIFwKIAlTUihNSUxMSVNFQ09ORF9USU1FX0JB
U0VfRElWKSwgXAogCVNSKERJU1BDTEtfRlJFUV9DSEFOR0VfQ05UTCksIFwKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
