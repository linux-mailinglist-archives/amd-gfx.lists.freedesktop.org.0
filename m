Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9EDA3423
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 11:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670526E29B;
	Fri, 30 Aug 2019 09:37:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AA96E29B
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 09:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAiJq4GeQCcmTm+JgnXpJWz7Qf73FJ0dM8f8kj2ayX0+QUC88nYiq2kMBJpwdHZB4AopMeuEsrEda04f/A1oFK6lrtg+5mCznZBtrbbkqQ8B4wO6mp7uZvgrcLQLoGQszJXmMBeUBf671iOwt9UsnI9i1wO/YpN0PNNPtHusR/M2oLnmv2Tc/bvMNNa4qfeXRY9cdeY1jXtr9rap1FsEb3gyP8XHJ1pE0QbxBrNHhPWBdwVzY6QRP8bT2mo+HKXrSqBbTvZbWqRVzwI4XJcPOZhm5f1+MuJu4zvxGaqlelu5uOudrwl9zt2QiAYxGJ9JpBPCd1Ilfv5re/gjOkm/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JIJMXZLS/Pc5bAY2Y8d3bjfzkPraDlpS82Ykzs8EaI=;
 b=RCv8aO6KFcj1HU5dv00MzbTn5y++g4z4OlVfyBtcl3x/Z6vVsmvPOfRoBuiiqUDVUjKpiJk3wiu5xHQxGUGxBV/w7ruoRnJtmhPGkTvf5DwSyFqIJrFS0jcND5p1Bj8dq6nDqbhNsFjot3d67K95tvVqPQDBOzMuNXJqnaNvUnIIfCJ6pjM/ycKwa+j6zN3maQI8oDwaD0uY/HtZiDH++xuIGlZE8AMZCa99i31MuA9DYbfaThUVAppX0SDUzlfuA5PDxOKGE/gprbmWL1yqdBDcYhTaSv+IAlYHKmgkISIFoT26ZYrcy0C+68wpJyw6vIrBa1DJvGf0pT5cWVufTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0070.namprd12.prod.outlook.com (2603:10b6:300:103::32)
 by DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Fri, 30 Aug
 2019 09:37:43 +0000
Received: from BY2NAM03FT018.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MWHPR12CA0070.outlook.office365.com
 (2603:10b6:300:103::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 09:37:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT018.mail.protection.outlook.com (10.152.84.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 09:37:42 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 04:37:39 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: guard manual mode prerequisite for clock
 level force
Date: Fri, 30 Aug 2019 17:37:25 +0800
Message-ID: <20190830093725.32273-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(426003)(81166006)(6916009)(316002)(2351001)(51416003)(7696005)(81156014)(305945005)(2906002)(1076003)(70586007)(53416004)(14444005)(4326008)(70206006)(50226002)(476003)(5660300002)(36756003)(2870700001)(50466002)(6666004)(48376002)(356004)(186003)(26005)(8936002)(44832011)(86362001)(47776003)(336012)(478600001)(53936002)(54906003)(2616005)(126002)(8676002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7eeb0d1-2f9b-48e5-7c64-08d72d2db4cf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0058F9951E3AE4885397B08EE4BD0@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: N/0uTeeDFXEUYOWXr8uJO0ND/IPUbatrdPug5vJ+2Ee0F/mryl0YWIpNKbc+DQjLZdcR0hCPrddfOQ94EgkRmrd4ZDG2Ikr6HhruEvM4Z8IMDzV5znfSBPLuSShEc0W15uKcGwNfwHrSvx+D22gv7ezoLOVDzwUPuclKg4CrqD9r7/eKOjETTz5ymOgpkO9OE857+UDIx4bfNKJMjQeGMHtybjq/FDxF+3m4RmH5rJ6HOJOFXOI88sO+1zmHSaAO9HF0zTcSsb3J+leLGXzqFlgjZpZ6UvNpMkpsBBbHm/Lry+H583pJK7wYuzCS4tWyfybuObRPixf2L9g9BDjXoTCO4KVfH4HdTgGUj2y4S4IXYnTiA0TlDL4gnY0iZqy5mxiKqSIZTLMIsvSOH4DYdZb7ST3FeSXoAxaDlZDqM4Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 09:37:42.4848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7eeb0d1-2f9b-48e5-7c64-08d72d2db4cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JIJMXZLS/Pc5bAY2Y8d3bjfzkPraDlpS82Ykzs8EaI=;
 b=3iENYq/Zwpjd+yesXIaA1l5r4A2Zeh3mqxyAqll2zM6eHG+OsB6tq9llOfEoOUe3+NwL9RNNE+7tShVd/ZE+Xo0ot3tWOqo7m4S/FKfy7i3CuWRveQ4znlCNA4HldhTDFRrxv2P3GqRAUKfWVjFmcEwkfZkhTyPcaMURQNbgQ9Y=
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
Cc: candice.li@amd.com, jack.gui@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yY2UgY2xvY2sgbGV2ZWwgaXMgZm9yIGRwbSBtYW51YWwgbW9kZSBvbmx5LgoKQ2hhbmdlLUlk
OiBJM2I0Y2FmM2ZhZmM3MjE5N2Q2NWUyYjkyNTVjNjhlNDBlNjczZTI1ZQpSZXBvcnRlZC1ieTog
Q2FuZGljZSBMaSA8Y2FuZGljZS5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4g
PGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYyAgICAgfCAxOCArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggfCAgNSArKystLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jICAgICB8ICA2IC0tLS0tLQogMyBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCAzMTdkNDEzMzFmNGIuLmRkNmMxNTQ3ZTUy
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMTc1
OCw2ICsxNzU4LDI0IEBAIGludCBzbXVfc2V0X2Rpc3BsYXlfY291bnQoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsIHVpbnQzMl90IGNvdW50KQogCXJldHVybiByZXQ7CiB9CiAKK2ludCBzbXVfZm9y
Y2VfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCSBlbnVtIHNtdV9jbGtf
dHlwZSBjbGtfdHlwZSwKKwkJCSB1aW50MzJfdCBtYXNrKQoreworCXN0cnVjdCBzbXVfZHBtX2Nv
bnRleHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOworCWludCByZXQgPSAwOworCisJ
aWYgKHNtdV9kcG1fY3R4LT5kcG1fbGV2ZWwgIT0gQU1EX0RQTV9GT1JDRURfTEVWRUxfTUFOVUFM
KSB7CisJCXByX2RlYnVnKCJmb3JjZSBjbG9jayBsZXZlbCBpcyBmb3IgZHBtIG1hbnVhbCBtb2Rl
IG9ubHkuXG4iKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJaWYgKHNtdS0+cHB0X2Z1bmNz
ICYmIHNtdS0+cHB0X2Z1bmNzLT5mb3JjZV9jbGtfbGV2ZWxzKQorCQlyZXQgPSBzbXUtPnBwdF9m
dW5jcy0+Zm9yY2VfY2xrX2xldmVscyhzbXUsIGNsa190eXBlLCBtYXNrKTsKKworCXJldHVybiBy
ZXQ7Cit9CisKIGNvbnN0IHN0cnVjdCBhbWRfaXBfZnVuY3Mgc211X2lwX2Z1bmNzID0gewogCS5u
YW1lID0gInNtdSIsCiAJLmVhcmx5X2luaXQgPSBzbXVfZWFybHlfaW5pdCwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IGUxMTY1ZDMyM2Vh
OS4uYjE5MjI0Y2I2ZDZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2lu
Yy9hbWRncHVfc211LmgKQEAgLTYzNSw4ICs2MzUsNiBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJKChz
bXUpLT5mdW5jcy0+Z2V0X2N1cnJlbnRfY2xrX2ZyZXE/IChzbXUpLT5mdW5jcy0+Z2V0X2N1cnJl
bnRfY2xrX2ZyZXEoKHNtdSksIChjbGtfaWQpLCAodmFsdWUpKSA6IDApCiAjZGVmaW5lIHNtdV9w
cmludF9jbGtfbGV2ZWxzKHNtdSwgY2xrX3R5cGUsIGJ1ZikgXAogCSgoc211KS0+cHB0X2Z1bmNz
LT5wcmludF9jbGtfbGV2ZWxzID8gKHNtdSktPnBwdF9mdW5jcy0+cHJpbnRfY2xrX2xldmVscygo
c211KSwgKGNsa190eXBlKSwgKGJ1ZikpIDogMCkKLSNkZWZpbmUgc211X2ZvcmNlX2Nsa19sZXZl
bHMoc211LCBjbGtfdHlwZSwgbGV2ZWwpIFwKLQkoKHNtdSktPnBwdF9mdW5jcy0+Zm9yY2VfY2xr
X2xldmVscyA/IChzbXUpLT5wcHRfZnVuY3MtPmZvcmNlX2Nsa19sZXZlbHMoKHNtdSksIChjbGtf
dHlwZSksIChsZXZlbCkpIDogMCkKICNkZWZpbmUgc211X2dldF9vZF9wZXJjZW50YWdlKHNtdSwg
dHlwZSkgXAogCSgoc211KS0+cHB0X2Z1bmNzLT5nZXRfb2RfcGVyY2VudGFnZSA/IChzbXUpLT5w
cHRfZnVuY3MtPmdldF9vZF9wZXJjZW50YWdlKChzbXUpLCAodHlwZSkpIDogMCkKICNkZWZpbmUg
c211X3NldF9vZF9wZXJjZW50YWdlKHNtdSwgdHlwZSwgdmFsdWUpIFwKQEAgLTgzMyw1ICs4MzEs
OCBAQCBjb25zdCBjaGFyICpzbXVfZ2V0X21lc3NhZ2VfbmFtZShzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwgZW51bSBzbXVfbWVzc2FnZV90eXBlCiBjb25zdCBjaGFyICpzbXVfZ2V0X2ZlYXR1cmVf
bmFtZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfZmVhdHVyZV9tYXNrIGZlYXR1
cmUpOwogc2l6ZV90IHNtdV9zeXNfZ2V0X3BwX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgY2hhciAqYnVmKTsKIGludCBzbXVfc3lzX3NldF9wcF9mZWF0dXJlX21hc2soc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQ2NF90IG5ld19tYXNrKTsKK2ludCBzbXVfZm9yY2Vf
Y2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCSBlbnVtIHNtdV9jbGtfdHlw
ZSBjbGtfdHlwZSwKKwkJCSB1aW50MzJfdCBtYXNrKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggODk5YmY5NmIyM2UxLi43OGQ3N2E2
M2UwODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9w
cHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKQEAg
LTEyNzQsMTQgKzEyNzQsOCBAQCBzdGF0aWMgaW50IHZlZ2EyMF9mb3JjZV9jbGtfbGV2ZWxzKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LAogCXN0cnVjdCB2ZWdhMjBfZHBtX3RhYmxlICpkcG1fdGFi
bGU7CiAJc3RydWN0IHZlZ2EyMF9zaW5nbGVfZHBtX3RhYmxlICpzaW5nbGVfZHBtX3RhYmxlOwog
CXVpbnQzMl90IHNvZnRfbWluX2xldmVsLCBzb2Z0X21heF9sZXZlbCwgaGFyZF9taW5fbGV2ZWw7
Ci0Jc3RydWN0IHNtdV9kcG1fY29udGV4dCAqc211X2RwbSA9ICZzbXUtPnNtdV9kcG07CiAJaW50
IHJldCA9IDA7CiAKLQlpZiAoc211X2RwbS0+ZHBtX2xldmVsICE9IEFNRF9EUE1fRk9SQ0VEX0xF
VkVMX01BTlVBTCkgewotCQlwcl9pbmZvKCJmb3JjZSBjbG9jayBsZXZlbCBpcyBmb3IgZHBtIG1h
bnVhbCBtb2RlIG9ubHkuXG4iKTsKLQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQotCiAJbXV0ZXhfbG9j
aygmKHNtdS0+bXV0ZXgpKTsKIAogCXNvZnRfbWluX2xldmVsID0gbWFzayA/IChmZnMobWFzaykg
LSAxKSA6IDA7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
