Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37B10020E
	for <lists+amd-gfx@lfdr.de>; Mon, 18 Nov 2019 11:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26C28969E;
	Mon, 18 Nov 2019 10:07:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800082.outbound.protection.outlook.com [40.107.80.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC9A8969E
 for <amd-gfx@lists.freedesktop.org>; Mon, 18 Nov 2019 10:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF5bd2s1PHGfqaaGQLsL9AIdkhLd8hrdDQuFWmOcSEIgDCOogGRQG5sEGzF8ty8ZLe9FKfsAJvz7+doY7ULzLYpx/LN2iOWWepdX/NuTy5pxleeG6CXsx6rbe0ulS7sbzvfdZYFeHdWBDOFf09/2zD0aFxl2zMIT67xGytqUoNGyr4h+FXZDMugN+HzDNYNIcZ7yLQBxFHpvZx+iNVKVjnJkLPnGSbMLlp8Jq3kvtRZacIJB7CYjEqcgU+QhyB7KzTBwuAXo2aOI6CxkfX6t55wFBgqmdOoVrqw89IJaKON/41Z+ZQqD1XMEtqTH97VI900NwWI8L7zeOr7ezQlCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx9idqWgKcL0Ilwt5DSdZeQzN/dxcm/M7QA48s3Hgeg=;
 b=YBYpCvZBh2i8wcz1dYZ66ajWXZn2+H+/oRJGn8c6XkuUQWokjqW+vXAyh5sPanaP07516HAHWjckcmiDZHdVwbymxfkT3QGZPkxfBIyLw1lIO3Cmz4w6MNVo1dfuK4zrq5uQW9CQklK46xGrtvVrpdhYIJTTfGE5eK8N/kc6wdzO/EsKpfCjW9pDQzQPEH7AhyNSeqlZbKskOc2d7kC16cYIOZ0atKksRVrQhz+U6xJys19xjmzNwvMr33XXL8OXhlGyBKA61Qine+VE/ekZvJ+4VgU4lWCKITCn32PVD4340bDMPXMnBKqsk88B2P53IYdOv54JKIfvIhINLV7ZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25)
 by MN2PR12MB3134.namprd12.prod.outlook.com (2603:10b6:208:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Mon, 18 Nov
 2019 10:07:30 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::204) by BN8PR12CA0012.outlook.office365.com
 (2603:10b6:408:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.22 via Frontend
 Transport; Mon, 18 Nov 2019 10:07:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 18 Nov 2019 10:07:29 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Nov
 2019 04:07:27 -0600
Received: from hawzhang-System-Product-Master.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 18 Nov 2019 04:07:25 -0600
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, John Clements <John.Clements@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: add psp funcs for ring write pointer
 read/write
Date: Mon, 18 Nov 2019 18:07:21 +0800
Message-ID: <20191118100723.19824-1-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(428003)(189003)(199004)(6636002)(81166006)(316002)(16586007)(5660300002)(110136005)(2906002)(478600001)(305945005)(426003)(1076003)(47776003)(14444005)(486006)(50466002)(126002)(48376002)(476003)(2616005)(53416004)(356004)(51416003)(7696005)(6666004)(4326008)(8676002)(26005)(336012)(186003)(70586007)(70206006)(86362001)(50226002)(36756003)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3134; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6566778-6869-4ea6-75b1-08d76c0f1f0f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3134:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3134BC32B306956A4F837239FC4D0@MN2PR12MB3134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0225B0D5BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/ot0UAZO9DDf9Ya9D3vdwj4vQ+l/qJdSvF/Z5/EhufoHRNE8ek1t5pt51bxLQOuPtRsZrZZnH2s1FCQ47hptB8ZXt60Ju2MsJvXJAh3hBmEXhnaJ/07PtdzfwOUmi/Y5DAuiyigdaMuiDWQNPMdhBWZ5191k9SialhWezrOItp6+2oe6s2PQU2M9d3kdI10erRcK8wgSzwJ10jW+Gsz8AIDCL6RAGGZDTdUDFzDb/T68o/jYGujWf4x1Xc0R2ZUeQv7IuZySB3kpG2A0MP0DeptKuIEIIIwHF3QQOO8CR5DGFK5IKnYL6v4iBcA+e78kSYiKYaMYqFmnqqIwbKj4JV9bE90NCBjbC55WTio1tzTIVAl1jxkk5jN59CambTLivcoVeazNA70F3avrhRVYuffD2zHZc2gzJSjQnSwnjY/PuIUoRO2sBVK/Sq575qS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 10:07:29.5994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6566778-6869-4ea6-75b1-08d76c0f1f0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx9idqWgKcL0Ilwt5DSdZeQzN/dxcm/M7QA48s3Hgeg=;
 b=QdISMNnRhs5G7FqL0i6LUBbCaY73Q8jSckU30A5tdUkmuZtTOFo7e4eRjjU4t9x9c82t5dlDBgVvFegWtwkgZZvPe+g1yj5mwMza4GeYBt8dJLpDpHbmjEdK4Jryv7AiC/v5+G4jr3o01RaAqBaCed9GSbN2Lwx+6w9I0k1yR5s=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHJpbmcgd3JpdGUgcG9pbnRlciByZWdzaXRlciB1cGRhdGUgaXMgdGhlIG9ubHkgcGFydCB0
aGF0CmlzIElQIHNwZWNpZmljIG9uZXMgaW4gcHNwX2NtZF9zdWJtaXQgZnVuY3Rpb24uCgpBZGQg
dHdvIGNhbGxiYWNrcyBmb3Igd3B0ciByZWFkL3dyaXRlIHNvIHRoYXQgd2UgdW5pZnkgdGhlCnBz
cF9jbWRfc3VibWl0IGZ1bmN0aW9uIGZvciBhbGwgdGhlIEFTSUNzLgoKQ2hhbmdlLUlkOiBJZGQw
YjcwYmQ4NjgyZjhiZDJmOWI5MjA5OGQ2Y2U1NWZhNGNlZTMxMApTaWduZWQtb2ZmLWJ5OiBIYXdr
aW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5oIHwgIDUgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTBfMC5jICB8IDE2ICsrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvcHNwX3YxMV8wLmMgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEyXzAuYyAgfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18xLmMgICB8IDI3ICsr
KysrKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKaW5kZXggMDljNTQ3NGVi
Y2MzLi5kNTYyMGM0NmYzZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNw
LmgKQEAgLTExNiw2ICsxMTYsOCBAQCBzdHJ1Y3QgcHNwX2Z1bmNzCiAJaW50ICgqbWVtX3RyYWlu
aW5nX2luaXQpKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKTsKIAl2b2lkICgqbWVtX3RyYWluaW5n
X2ZpbmkpKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKTsKIAlpbnQgKCptZW1fdHJhaW5pbmcpKHN0
cnVjdCBwc3BfY29udGV4dCAqcHNwLCB1aW50MzJfdCBvcHMpOworCXVpbnQzMl90ICgqcmluZ19n
ZXRfd3B0cikoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApOworCXZvaWQgKCpyaW5nX3NldF93cHRy
KShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwgdWludDMyX3QgdmFsdWUpOwogfTsKIAogI2RlZmlu
ZSBBTURHUFVfWEdNSV9NQVhfQ09OTkVDVEVEX05PREVTCQk2NApAQCAtMzQ2LDYgKzM0OCw5IEBA
IHN0cnVjdCBhbWRncHVfcHNwX2Z1bmNzIHsKIAkoKHBzcCktPmZ1bmNzLT5yYXNfY3VyZV9wb3Np
b24gPyBcCiAJKHBzcCktPmZ1bmNzLT5yYXNfY3VyZV9wb3Npb24ocHNwLCAoYWRkcikpIDogLUVJ
TlZBTCkKIAorI2RlZmluZSBwc3BfcmluZ19nZXRfd3B0cihwc3ApIChwc3ApLT5mdW5jcy0+cmlu
Z19nZXRfd3B0cigocHNwKSkKKyNkZWZpbmUgcHNwX3Jpbmdfc2V0X3dwdHIocHNwLCB2YWx1ZSkg
KHBzcCktPmZ1bmNzLT5yaW5nX3NldF93cHRyKChwc3ApLCAodmFsdWUpKQorCiBleHRlcm4gY29u
c3Qgc3RydWN0IGFtZF9pcF9mdW5jcyBwc3BfaXBfZnVuY3M7CiAKIGV4dGVybiBjb25zdCBzdHJ1
Y3QgYW1kZ3B1X2lwX2Jsb2NrX3ZlcnNpb24gcHNwX3YzXzFfaXBfYmxvY2s7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3BzcF92MTBfMC5jCmluZGV4IGVkOGJlZmYwMmU2Mi4uYjhhNDYxZDQ2Y2I1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEwXzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEwXzAuYwpAQCAtNDA0LDYgKzQwNCwy
MCBAQCBzdGF0aWMgaW50IHBzcF92MTBfMF9tb2RlMV9yZXNldChzdHJ1Y3QgcHNwX2NvbnRleHQg
KnBzcCkKIAlyZXR1cm4gLUVJTlZBTDsKIH0KIAorc3RhdGljIHVpbnQzMl90IHBzcF92MTBfMF9y
aW5nX2dldF93cHRyKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQoreworCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2OworCisJcmV0dXJuIFJSRUczMl9TT0MxNShNUDAsIDAs
IG1tTVAwX1NNTl9DMlBNU0dfNjcpOworfQorCitzdGF0aWMgdm9pZCBwc3BfdjEwXzBfcmluZ19z
ZXRfd3B0cihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwgdWludDMyX3QgdmFsdWUpCit7CisJc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3AtPmFkZXY7CisKKwlXUkVHMzJfU09DMTUoTVAw
LCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY3LCB2YWx1ZSk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcHNwX2Z1bmNzIHBzcF92MTBfMF9mdW5jcyA9IHsKIAkuaW5pdF9taWNyb2NvZGUgPSBwc3Bf
djEwXzBfaW5pdF9taWNyb2NvZGUsCiAJLnJpbmdfaW5pdCA9IHBzcF92MTBfMF9yaW5nX2luaXQs
CkBAIC00MTMsNiArNDI3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwc3BfZnVuY3MgcHNwX3Yx
MF8wX2Z1bmNzID0gewogCS5jbWRfc3VibWl0ID0gcHNwX3YxMF8wX2NtZF9zdWJtaXQsCiAJLmNv
bXBhcmVfc3JhbV9kYXRhID0gcHNwX3YxMF8wX2NvbXBhcmVfc3JhbV9kYXRhLAogCS5tb2RlMV9y
ZXNldCA9IHBzcF92MTBfMF9tb2RlMV9yZXNldCwKKwkucmluZ19nZXRfd3B0ciA9IHBzcF92MTBf
MF9yaW5nX2dldF93cHRyLAorCS5yaW5nX3NldF93cHRyID0gcHNwX3YxMF8wX3Jpbmdfc2V0X3dw
dHIsCiB9OwogCiB2b2lkIHBzcF92MTBfMF9zZXRfcHNwX2Z1bmNzKHN0cnVjdCBwc3BfY29udGV4
dCAqcHNwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwppbmRleCBlYmQ5NmMz
YzU4YjkuLjc5ZmEyYzY1NTg1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8w
LmMKQEAgLTEwNjYsNiArMTA2NiwzMCBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9tZW1vcnlfdHJh
aW5pbmcoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsIHVpbnQzMl90IG9wcykKIAlyZXR1cm4gMDsK
IH0KIAorc3RhdGljIHVpbnQzMl90IHBzcF92MTFfMF9yaW5nX2dldF93cHRyKHN0cnVjdCBwc3Bf
Y29udGV4dCAqcHNwKQoreworCXVpbnQzMl90IGRhdGE7CisJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBwc3AtPmFkZXY7CisKKwlpZiAocHNwX3YxMV8wX3N1cHBvcnRfdm1yX3JpbmcocHNw
KSkKKwkJZGF0YSA9IFJSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfMTAyKTsK
KwllbHNlCisJCWRhdGEgPSBSUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzY3
KTsKKworCXJldHVybiBkYXRhOworfQorCitzdGF0aWMgdm9pZCBwc3BfdjExXzBfcmluZ19zZXRf
d3B0cihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwgdWludDMyX3QgdmFsdWUpCit7CisJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBwc3AtPmFkZXY7CisKKwlpZiAocHNwX3YxMV8wX3N1cHBv
cnRfdm1yX3JpbmcocHNwKSkgeworCQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQ
TVNHXzEwMiwgdmFsdWUpOworCQlXUkVHMzJfU09DMTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNH
XzEwMSwgR0ZYX0NUUkxfQ01EX0lEX0NPTlNVTUVfQ01EKTsKKwl9IGVsc2UKKwkJV1JFRzMyX1NP
QzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR182NywgdmFsdWUpOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHBzcF9mdW5jcyBwc3BfdjExXzBfZnVuY3MgPSB7CiAJLmluaXRfbWljcm9jb2Rl
ID0gcHNwX3YxMV8wX2luaXRfbWljcm9jb2RlLAogCS5ib290bG9hZGVyX2xvYWRfa2RiID0gcHNw
X3YxMV8wX2Jvb3Rsb2FkZXJfbG9hZF9rZGIsCkBAIC0xMDg5LDYgKzExMTMsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBzcF9mdW5jcyBwc3BfdjExXzBfZnVuY3MgPSB7CiAJLm1lbV90cmFpbmlu
Z19pbml0ID0gcHNwX3YxMV8wX21lbW9yeV90cmFpbmluZ19pbml0LAogCS5tZW1fdHJhaW5pbmdf
ZmluaSA9IHBzcF92MTFfMF9tZW1vcnlfdHJhaW5pbmdfZmluaSwKIAkubWVtX3RyYWluaW5nID0g
cHNwX3YxMV8wX21lbW9yeV90cmFpbmluZywKKwkucmluZ19nZXRfd3B0ciA9IHBzcF92MTFfMF9y
aW5nX2dldF93cHRyLAorCS5yaW5nX3NldF93cHRyID0gcHNwX3YxMV8wX3Jpbmdfc2V0X3dwdHIs
CiB9OwogCiB2b2lkIHBzcF92MTFfMF9zZXRfcHNwX2Z1bmNzKHN0cnVjdCBwc3BfY29udGV4dCAq
cHNwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMl8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEyXzAuYwppbmRleCA4ZjU1M2Y2Zjky
ZDYuLjc1YjNmOWQxNWExOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
cHNwX3YxMl8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMl8wLmMK
QEAgLTU0Nyw2ICs1NDcsMzAgQEAgc3RhdGljIGludCBwc3BfdjEyXzBfbW9kZTFfcmVzZXQoc3Ry
dWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB1aW50MzJfdCBw
c3BfdjEyXzBfcmluZ19nZXRfd3B0cihzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKK3sKKwl1aW50
MzJfdCBkYXRhOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2OworCisJ
aWYgKHBzcF92MTJfMF9zdXBwb3J0X3Ztcl9yaW5nKHBzcCkpCisJCWRhdGEgPSBSUkVHMzJfU09D
MTUoTVAwLCAwLCBtbU1QMF9TTU5fQzJQTVNHXzEwMik7CisJZWxzZQorCQlkYXRhID0gUlJFRzMy
X1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR182Nyk7CisKKwlyZXR1cm4gZGF0YTsKK30K
Kworc3RhdGljIHZvaWQgcHNwX3YxMl8wX3Jpbmdfc2V0X3dwdHIoc3RydWN0IHBzcF9jb250ZXh0
ICpwc3AsIHVpbnQzMl90IHZhbHVlKQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
cHNwLT5hZGV2OworCisJaWYgKHBzcF92MTJfMF9zdXBwb3J0X3Ztcl9yaW5nKHBzcCkpIHsKKwkJ
V1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18xMDIsIHZhbHVlKTsKKwkJV1JF
RzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18xMDEsIEdGWF9DVFJMX0NNRF9JRF9D
T05TVU1FX0NNRCk7CisJfSBlbHNlCisJCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9D
MlBNU0dfNjcsIHZhbHVlKTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwc3BfZnVuY3MgcHNw
X3YxMl8wX2Z1bmNzID0gewogCS5pbml0X21pY3JvY29kZSA9IHBzcF92MTJfMF9pbml0X21pY3Jv
Y29kZSwKIAkuYm9vdGxvYWRlcl9sb2FkX3N5c2RydiA9IHBzcF92MTJfMF9ib290bG9hZGVyX2xv
YWRfc3lzZHJ2LApAQCAtNTU4LDYgKzU4Miw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHNwX2Z1
bmNzIHBzcF92MTJfMF9mdW5jcyA9IHsKIAkuY21kX3N1Ym1pdCA9IHBzcF92MTJfMF9jbWRfc3Vi
bWl0LAogCS5jb21wYXJlX3NyYW1fZGF0YSA9IHBzcF92MTJfMF9jb21wYXJlX3NyYW1fZGF0YSwK
IAkubW9kZTFfcmVzZXQgPSBwc3BfdjEyXzBfbW9kZTFfcmVzZXQsCisJLnJpbmdfZ2V0X3dwdHIg
PSBwc3BfdjEyXzBfcmluZ19nZXRfd3B0ciwKKwkucmluZ19zZXRfd3B0ciA9IHBzcF92MTJfMF9y
aW5nX3NldF93cHRyLAogfTsKIAogdm9pZCBwc3BfdjEyXzBfc2V0X3BzcF9mdW5jcyhzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3BzcF92M18xLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjNfMS5jCmluZGV4
IGY2NTIyNDFhYTcxYS4uMWRlODZlNTUwYTkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9wc3BfdjNfMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Bz
cF92M18xLmMKQEAgLTY0MCw2ICs2NDAsMzEgQEAgc3RhdGljIGJvb2wgcHNwX3YzXzFfc3VwcG9y
dF92bXJfcmluZyhzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAlyZXR1cm4gZmFsc2U7CiB9CiAK
K3N0YXRpYyB1aW50MzJfdCBwc3BfdjNfMV9yaW5nX2dldF93cHRyKHN0cnVjdCBwc3BfY29udGV4
dCAqcHNwKQoreworCXVpbnQzMl90IGRhdGE7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSBwc3AtPmFkZXY7CisKKwlpZiAocHNwX3YzXzFfc3VwcG9ydF92bXJfcmluZyhwc3ApKQorCQlk
YXRhID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18xMDIpOworCWVsc2UK
KwkJZGF0YSA9IFJSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfNjcpOworCXJl
dHVybiBkYXRhOworfQorCitzdGF0aWMgdm9pZCBwc3BfdjNfMV9yaW5nX3NldF93cHRyKHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwLCB1aW50MzJfdCB2YWx1ZSkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IHBzcC0+YWRldjsKKworCWlmIChwc3BfdjNfMV9zdXBwb3J0X3Ztcl9yaW5n
KHBzcCkpIHsKKwkJV1JFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR18xMDIsIHZh
bHVlKTsKKwkJLyogc2VuZCBpbnRlcnJ1cHQgdG8gUFNQIGZvciBTUklPViByaW5nIHdyaXRlIHBv
aW50ZXIgdXBkYXRlICovCisJCVdSRUczMl9TT0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0df
MTAxLAorCQkJR0ZYX0NUUkxfQ01EX0lEX0NPTlNVTUVfQ01EKTsKKwl9IGVsc2UKKwkJV1JFRzMy
X1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR182NywgdmFsdWUpOworfQorCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBzcF9mdW5jcyBwc3BfdjNfMV9mdW5jcyA9IHsKIAkuaW5pdF9taWNyb2Nv
ZGUgPSBwc3BfdjNfMV9pbml0X21pY3JvY29kZSwKIAkuYm9vdGxvYWRlcl9sb2FkX3N5c2RydiA9
IHBzcF92M18xX2Jvb3Rsb2FkZXJfbG9hZF9zeXNkcnYsCkBAIC02NTMsNiArNjc4LDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwc3BfZnVuY3MgcHNwX3YzXzFfZnVuY3MgPSB7CiAJLnNtdV9yZWxv
YWRfcXVpcmsgPSBwc3BfdjNfMV9zbXVfcmVsb2FkX3F1aXJrLAogCS5tb2RlMV9yZXNldCA9IHBz
cF92M18xX21vZGUxX3Jlc2V0LAogCS5zdXBwb3J0X3Ztcl9yaW5nID0gcHNwX3YzXzFfc3VwcG9y
dF92bXJfcmluZywKKwkucmluZ19nZXRfd3B0ciA9IHBzcF92M18xX3JpbmdfZ2V0X3dwdHIsCisJ
LnJpbmdfc2V0X3dwdHIgPSBwc3BfdjNfMV9yaW5nX3NldF93cHRyLAogfTsKIAogdm9pZCBwc3Bf
djNfMV9zZXRfcHNwX2Z1bmNzKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
