Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A757AEC6E
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377986E8EE;
	Tue, 10 Sep 2019 13:55:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50B89468
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6y+heg56iGWPMDM9v9CNuer/ZCafRNaNFqDAqvUF9NCDilgQ5tkpOIgCjnPCC9FM2wrMPvMV2JOFyGK9tTQA7NMUg6GUaKyMsDzY4C/gmlm3ipAcvv3xRAHQu1BVl1QcnWH5ntYlBW7ets7aBzG5/9tVXSr+dFYPPtCxbVtPU+6HYuHpMWsIarZSHHxUkC8AZY0wBl3NQnbdDvfezCpSfls1ugkDIEVlCo5/dck+e0FPgdIE8uyRhnDRoHyMxp9roUNZGUXSMD0q/mcgXiVBqRfaR/ousP4jeKWNR7udW2aRR2NQhCeHhElbQ3H27YIOTAazAQQEnYReBRUaYnLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxtO0qCvVwVWEN2KCSAXcFNwRQTdkWKSX4DioODFeAA=;
 b=mzgLHZXqE2hogpPzkC7opk6MLGMSbDyUOjhm/33SGaEAWZruHNmRZ/7ZWdMnae1Nn6sxeLC+rp4mLVzZ6rRfxid7ujfoG1qIiG2a4woJthjjiNODJSaQ8Ype+keq3Ozsk9DsCNn/89id1DuPLPo4e23CHVaz4whHjvPP8sYlUdSXUHqD0+nRoMHiaIKng1lm6iiRPI/sWknNbICKgRZTF0woKNZmBcwvtInZxPtvM4PxZzMhLwKvuBsv8oq4z8+uom/C1iGoLCaVqpXp/EUlvXx35bjZk8mZ+32EhLeBuCtE8fddBA+u0jk/R7g+g786svrjvy+jrYq6+Ffuk/hpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by MWHPR12MB1871.namprd12.prod.outlook.com (2603:10b6:300:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14; Tue, 10 Sep
 2019 13:55:03 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:03 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:57 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/25] drm/amd/display: fix i2c wtire mot incorrect issue
Date: Tue, 10 Sep 2019 09:54:31 -0400
Message-ID: <20190910135445.18300-12-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(54906003)(1076003)(4326008)(81156014)(8676002)(476003)(2616005)(336012)(316002)(26005)(2351001)(81166006)(186003)(47776003)(486006)(51416003)(11346002)(2870700001)(76176011)(5660300002)(478600001)(36756003)(70206006)(2876002)(50466002)(70586007)(446003)(6666004)(356004)(126002)(426003)(50226002)(53936002)(2906002)(48376002)(49486002)(6916009)(305945005)(86362001)(8936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1871; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d31ac9b-1e94-422a-ffd3-08d735f67ace
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1871; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1871:
X-Microsoft-Antispam-PRVS: <MWHPR12MB18718BD846D43AEA07F1AC7182B60@MWHPR12MB1871.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: r+/wTVKU97OiAtFSnyrOsvzFmI4Kh8TQoMeZXp6DAXhwu/e3vTL2q+SaedGA6WxVDAKS00/JNILk2bbv75vJEauFtHoI3IpyzU9zikMvxWgk6UBEqfxIvq8M/ietIXyL20CjIaCq4JgIDo7LNOrSALIUXXvkx6aJ/TqcxB5dTLdRm6vERx6KWDNK187CX1MwkSyaHk0BJXciBt9Z7eXUNlbtHVNRS8eBJFP4/IB3kW9CG/eM+ZA0JBUo8x07jtqjQswgBPpEcYXN0TwTyySx7kgw8ntRjRlGSzLkHVI1WN2VIOZLVcGs+zqmMarqJrWUAVuvKSS6xkwmwNPUo1cdTZTFmn8Gugo+HMe0wbNZ3FKY40uiv3W7ayO1ZouNz37qwQiuwDTLbSxmpruH2K/BG8I8kbluOvVrz5E11yjDSD4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:03.2886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d31ac9b-1e94-422a-ffd3-08d735f67ace
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxtO0qCvVwVWEN2KCSAXcFNwRQTdkWKSX4DioODFeAA=;
 b=GJA+HKiKOWyYjHveSGuMft7gL8d0ZqTIyweh0PAUJeDwppj9Y8TLtn+IgnFbq/2wsDnm4WYKXBebkOcq1Wh8AHSrJwkgy2quS0BLDK5UjofN249qFaaTraO1uCtDXMLRESmIaZ3C0VhwbOBAOiSTgXn+C75/Jw5BM9whn1vjeu4=
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
Cc: Leo Li <sunpeng.li@amd.com>, Lewis Huang <Lewis.Huang@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpJMkMgd3JpdGUg
Y29tbWFuZCBhbHdheXMgc2VuZCBtb3QgPSB0cnVlIHdpbGwgY2F1c2Ugc2luayBzdGF0ZSBpbmNv
cnJlY3QuCgpbSG93XQoxLiBSZW1vdmUgZGVmYXVsdCBpMmMgd3JpdGUgbW90ID0gdHJ1ZS4KMi4g
RGVjaWRpbmcgbW90IGZsYWcgYnkgaXNfZW5kX29mX3BheWxvYWQgZmxhZy4KClNpZ25lZC1vZmYt
Ynk6IExld2lzIEh1YW5nIDxMZXdpcy5IdWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxl
bmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5s
aUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xp
bmtfZGRjLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGlua19kZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmtfZGRjLmMKaW5kZXggZjcwMTM3ZDY3YzgyLi41ODhhMDdiNTI1YTAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYwpAQCAtNTIz
LDcgKzUyMyw3IEBAIGJvb2wgZGFsX2RkY19zZXJ2aWNlX3F1ZXJ5X2RkY19kYXRhKAogCiAJCWlm
ICh3cml0ZV9zaXplICE9IDApIHsKIAkJCXBheWxvYWQud3JpdGUgPSB0cnVlOwotCQkJcGF5bG9h
ZC5tb3QgPSB0cnVlOworCQkJcGF5bG9hZC5tb3QgPSBmYWxzZTsKIAkJCXBheWxvYWQubGVuZ3Ro
ID0gd3JpdGVfc2l6ZTsKIAkJCXBheWxvYWQuZGF0YSA9IHdyaXRlX2J1ZjsKIApAQCAtNTkyLDcg
KzU5Miw3IEBAIGJvb2wgZGFsX2RkY19zdWJtaXRfYXV4X2NvbW1hbmQoc3RydWN0IGRkY19zZXJ2
aWNlICpkZGMsCiAJCWN1cnJlbnRfcGF5bG9hZC5pMmNfb3Zlcl9hdXggPSBwYXlsb2FkLT5pMmNf
b3Zlcl9hdXg7CiAJCWN1cnJlbnRfcGF5bG9hZC5sZW5ndGggPSBpc19lbmRfb2ZfcGF5bG9hZCA/
CiAJCQlwYXlsb2FkLT5sZW5ndGggLSByZXRyaWV2ZWQgOiBERUZBVUxUX0FVWF9NQVhfREFUQV9T
SVpFOwotCQljdXJyZW50X3BheWxvYWQubW90ID0gcGF5bG9hZC0+bW90ID8gcGF5bG9hZC0+bW90
IDogIWlzX2VuZF9vZl9wYXlsb2FkOworCQljdXJyZW50X3BheWxvYWQubW90ID0gIWlzX2VuZF9v
Zl9wYXlsb2FkOwogCQljdXJyZW50X3BheWxvYWQucmVwbHkgPSBwYXlsb2FkLT5yZXBseTsKIAkJ
Y3VycmVudF9wYXlsb2FkLndyaXRlID0gcGF5bG9hZC0+d3JpdGU7CiAKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
