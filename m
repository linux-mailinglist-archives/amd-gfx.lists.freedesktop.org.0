Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2543DB736
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA5F6EAA6;
	Thu, 17 Oct 2019 19:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680087.outbound.protection.outlook.com [40.107.68.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00886EAA5
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwsQmdKBLkScbgiNGC/F5oRlVgrRNvJ0Bmjjayb6uNqrpYDEne0HThZC8+ywGZgyKnU9Z7HtKue7Tn72OD42J87OpPBW0qgaWfUYZrOQvi+XZhphepWdeG9o+dHMrPD01U1pHuhVNAy/py7HCKlmeMP+EbaxVB7edVJps3onyQokRHAp/MFMeau+RQz6bvX1Ypd+Qxd0loIC+VL4WEMzR13gt2abdhHDvY8FKrii6/AktXD58FwEhTD3oZPOjhjsZZFQ0ywA7Yt8DaAteCCQFYSlqrcs9KS1dOmAlW87XjcYC5l01vz4+BURAjwKsWZh6pTTwaefdsD5+84gtr28NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRf3yTAHva2sDlLnZ1AxIYlOA2ie0Fbb6pjJhK03rOM=;
 b=YLnTVwRoxLmPIXB+lIlUmS81KU3M03qTckBAz4W0TEzgY0aGNI7NxmtNC2Khzy1cy5u8gp2kZquRHyW2ywFWzzEbrYlj503RWZkqYeEgsvTtcEtZevYSWTx5Xc8Ed1zUYOq7Bs/sgbSJrlyJt/DWIgu8X+zV4lqYJIcTV4XAAc8dcb1LNoDFbP/wrL/B/0pUt3GQmQGASszKi4uoSt1i1fVZ7MYsfXNPbGqtiCncuKt6NNpMwU3ma7DFja9Vsc17mens02ha49FtiXabR65+I6icyqnVave7m/EWnwpdYQ3Btc6zd1U/0ptjR8X+yGnc9hD1cU7Njwaa6k5l1G4BHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0003.namprd12.prod.outlook.com (2603:10b6:408:60::16)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23; Thu, 17 Oct
 2019 19:15:42 +0000
Received: from CO1NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by BN8PR12CA0003.outlook.office365.com
 (2603:10b6:408:60::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT012.mail.protection.outlook.com (10.152.80.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:41 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:40 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/37] drm/amd/display: Allow inverted gamma
Date: Thu, 17 Oct 2019 15:13:10 -0400
Message-ID: <20191017191329.11857-19-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(428003)(199004)(189003)(51416003)(26005)(70586007)(50226002)(4326008)(2351001)(76176011)(8936002)(2870700001)(36756003)(81166006)(70206006)(48376002)(6916009)(6666004)(2906002)(305945005)(2876002)(1076003)(47776003)(356004)(81156014)(54906003)(5660300002)(476003)(316002)(486006)(2616005)(446003)(86362001)(336012)(50466002)(426003)(478600001)(11346002)(8676002)(186003)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2934; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f44730d9-9660-4bc6-7580-08d753366726
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2934B1BE546167334AC14329826D0@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AlmVOOeUsFHQoMBDYoCu52Eyth/JN7m7C7LaQqiu9hwR6rF77+wL2WnpKqm6dgsAa2wTBDIcV7Gr7lhF6bySGvK0DfPw8/3EFiyJe4bQhAd/3DhGEaDc4j0EDZHqHj8eGfDeivcJQeeOV++VxjWJuzG1kdkhwsuiA5llYSGqq/PWw5dkMZCobGM5D/WWJS0HUCn7U+vm9Zx8kuJRMSEN7kTilpY3CxJWVSUzplGFa0DgO9iXTVQ3j2TTDMCRaRAvG3+fFqzwNhRGAY+T1PtgESV46ADg+9GFh4mRFjG7iw5NjSJBYI6kDv4k9Hz6Q8ktB/+aQUD9kiHdMNEp//Rfi1zfCsbUkmc7297sj8dN5OVZ5k60lGbm9JmjGyYyyT50HHOY15b4ot4kyQDrRySpzJzMvQhptVRbIGt4fqaf/lc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:41.8506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f44730d9-9660-4bc6-7580-08d753366726
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRf3yTAHva2sDlLnZ1AxIYlOA2ie0Fbb6pjJhK03rOM=;
 b=KfIsCpkgp6jWCcFxu65bXT142zoCJSG+tNwdWxRn7Yyb8c3/OXhAUauAOJMzbfRf6VIj1Lb+Me8ZGgbJl18Fj8MOUYb1fDWK1isBONa/wXqkIHRpN69TeSO2fAUPCIZY/jbP5ObasEOXQA3S0wg9UAh9WcdgFgoG7MRpZKQeErI=
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

RnJvbTogQWlkYW4gWWFuZyA8QWlkYW4uWWFuZ0BhbWQuY29tPgoKW3doeV0KVGhlcmUncyBhIHVz
ZSBjYXNlIGZvciBpbnZlcnRlZCBnYW1tYQphbmQgaXQncyBiZWVuIGNvbmZpcm1lZCB0aGF0IG5l
Z2F0aXZlIHNsb3BlcyBhcmUgb2suCgpbaG93XQpSZW1vdmUgY29kZSBmb3IgYmxvY2tpbmcgbm9u
LW1vbm90b25pY2FsbHkgaW5jcmVhc2luZyBnYW1tYQoKU2lnbmVkLW9mZi1ieTogQWlkYW4gWWFu
ZyA8QWlkYW4uWWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogS3J1bm9zbGF2IEtvdmFjIDxLcnVu
b3NsYXYuS292YWNAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgpBY2tlZC1ieTogUmV6YSBBbWluaSA8UmV6YS5BbWluaUBhbWQuY29tPgotLS0KIC4uLi9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9jbV9jb21tb24uYyAgICB8IDIyICsrKysrKystLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9j
bV9jb21tb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9j
bV9jb21tb24uYwppbmRleCAwMWM3ZTMwYjljZTEuLmJiZDZlMDFiM2VjYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2NtX2NvbW1vbi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9jbV9jb21tb24u
YwpAQCAtMzkzLDYgKzM5MywxMCBAQCBib29sIGNtX2hlbHBlcl90cmFuc2xhdGVfY3VydmVfdG9f
aHdfZm9ybWF0KAogCXJnYl9yZXN1bHRlZFtod19wb2ludHMgLSAxXS5ncmVlbiA9IG91dHB1dF90
Zi0+dGZfcHRzLmdyZWVuW3N0YXJ0X2luZGV4XTsKIAlyZ2JfcmVzdWx0ZWRbaHdfcG9pbnRzIC0g
MV0uYmx1ZSA9IG91dHB1dF90Zi0+dGZfcHRzLmJsdWVbc3RhcnRfaW5kZXhdOwogCisJcmdiX3Jl
c3VsdGVkW2h3X3BvaW50c10ucmVkID0gcmdiX3Jlc3VsdGVkW2h3X3BvaW50cyAtIDFdLnJlZDsK
KwlyZ2JfcmVzdWx0ZWRbaHdfcG9pbnRzXS5ncmVlbiA9IHJnYl9yZXN1bHRlZFtod19wb2ludHMg
LSAxXS5ncmVlbjsKKwlyZ2JfcmVzdWx0ZWRbaHdfcG9pbnRzXS5ibHVlID0gcmdiX3Jlc3VsdGVk
W2h3X3BvaW50cyAtIDFdLmJsdWU7CisKIAkvLyBBbGwgMyBjb2xvciBjaGFubmVscyBoYXZlIHNh
bWUgeAogCWNvcm5lcl9wb2ludHNbMF0ucmVkLnggPSBkY19maXhwdF9wb3coZGNfZml4cHRfZnJv
bV9pbnQoMiksCiAJCQkJCSAgICAgZGNfZml4cHRfZnJvbV9pbnQocmVnaW9uX3N0YXJ0KSk7CkBA
IC00NjQsMTMgKzQ2OCw2IEBAIGJvb2wgY21faGVscGVyX3RyYW5zbGF0ZV9jdXJ2ZV90b19od19m
b3JtYXQoCiAKIAlpID0gMTsKIAl3aGlsZSAoaSAhPSBod19wb2ludHMgKyAxKSB7Ci0JCWlmIChk
Y19maXhwdF9sdChyZ2JfcGx1c18xLT5yZWQsIHJnYi0+cmVkKSkKLQkJCXJnYl9wbHVzXzEtPnJl
ZCA9IHJnYi0+cmVkOwotCQlpZiAoZGNfZml4cHRfbHQocmdiX3BsdXNfMS0+Z3JlZW4sIHJnYi0+
Z3JlZW4pKQotCQkJcmdiX3BsdXNfMS0+Z3JlZW4gPSByZ2ItPmdyZWVuOwotCQlpZiAoZGNfZml4
cHRfbHQocmdiX3BsdXNfMS0+Ymx1ZSwgcmdiLT5ibHVlKSkKLQkJCXJnYl9wbHVzXzEtPmJsdWUg
PSByZ2ItPmJsdWU7Ci0KIAkJcmdiLT5kZWx0YV9yZWQgICA9IGRjX2ZpeHB0X3N1YihyZ2JfcGx1
c18xLT5yZWQsICAgcmdiLT5yZWQpOwogCQlyZ2ItPmRlbHRhX2dyZWVuID0gZGNfZml4cHRfc3Vi
KHJnYl9wbHVzXzEtPmdyZWVuLCByZ2ItPmdyZWVuKTsKIAkJcmdiLT5kZWx0YV9ibHVlICA9IGRj
X2ZpeHB0X3N1YihyZ2JfcGx1c18xLT5ibHVlLCAgcmdiLT5ibHVlKTsKQEAgLTU2Miw2ICs1NTks
MTAgQEAgYm9vbCBjbV9oZWxwZXJfdHJhbnNsYXRlX2N1cnZlX3RvX2RlZ2FtbWFfaHdfZm9ybWF0
KAogCXJnYl9yZXN1bHRlZFtod19wb2ludHMgLSAxXS5ncmVlbiA9IG91dHB1dF90Zi0+dGZfcHRz
LmdyZWVuW3N0YXJ0X2luZGV4XTsKIAlyZ2JfcmVzdWx0ZWRbaHdfcG9pbnRzIC0gMV0uYmx1ZSA9
IG91dHB1dF90Zi0+dGZfcHRzLmJsdWVbc3RhcnRfaW5kZXhdOwogCisJcmdiX3Jlc3VsdGVkW2h3
X3BvaW50c10ucmVkID0gcmdiX3Jlc3VsdGVkW2h3X3BvaW50cyAtIDFdLnJlZDsKKwlyZ2JfcmVz
dWx0ZWRbaHdfcG9pbnRzXS5ncmVlbiA9IHJnYl9yZXN1bHRlZFtod19wb2ludHMgLSAxXS5ncmVl
bjsKKwlyZ2JfcmVzdWx0ZWRbaHdfcG9pbnRzXS5ibHVlID0gcmdiX3Jlc3VsdGVkW2h3X3BvaW50
cyAtIDFdLmJsdWU7CisKIAljb3JuZXJfcG9pbnRzWzBdLnJlZC54ID0gZGNfZml4cHRfcG93KGRj
X2ZpeHB0X2Zyb21faW50KDIpLAogCQkJCQkgICAgIGRjX2ZpeHB0X2Zyb21faW50KHJlZ2lvbl9z
dGFydCkpOwogCWNvcm5lcl9wb2ludHNbMF0uZ3JlZW4ueCA9IGNvcm5lcl9wb2ludHNbMF0ucmVk
Lng7CkBAIC02MjQsMTMgKzYyNSw2IEBAIGJvb2wgY21faGVscGVyX3RyYW5zbGF0ZV9jdXJ2ZV90
b19kZWdhbW1hX2h3X2Zvcm1hdCgKIAogCWkgPSAxOwogCXdoaWxlIChpICE9IGh3X3BvaW50cyAr
IDEpIHsKLQkJaWYgKGRjX2ZpeHB0X2x0KHJnYl9wbHVzXzEtPnJlZCwgcmdiLT5yZWQpKQotCQkJ
cmdiX3BsdXNfMS0+cmVkID0gcmdiLT5yZWQ7Ci0JCWlmIChkY19maXhwdF9sdChyZ2JfcGx1c18x
LT5ncmVlbiwgcmdiLT5ncmVlbikpCi0JCQlyZ2JfcGx1c18xLT5ncmVlbiA9IHJnYi0+Z3JlZW47
Ci0JCWlmIChkY19maXhwdF9sdChyZ2JfcGx1c18xLT5ibHVlLCByZ2ItPmJsdWUpKQotCQkJcmdi
X3BsdXNfMS0+Ymx1ZSA9IHJnYi0+Ymx1ZTsKLQogCQlyZ2ItPmRlbHRhX3JlZCAgID0gZGNfZml4
cHRfc3ViKHJnYl9wbHVzXzEtPnJlZCwgICByZ2ItPnJlZCk7CiAJCXJnYi0+ZGVsdGFfZ3JlZW4g
PSBkY19maXhwdF9zdWIocmdiX3BsdXNfMS0+Z3JlZW4sIHJnYi0+Z3JlZW4pOwogCQlyZ2ItPmRl
bHRhX2JsdWUgID0gZGNfZml4cHRfc3ViKHJnYl9wbHVzXzEtPmJsdWUsICByZ2ItPmJsdWUpOwot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
