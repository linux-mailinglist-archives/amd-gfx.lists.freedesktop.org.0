Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA2A20C9
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC6C6E141;
	Thu, 29 Aug 2019 16:24:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740074.outbound.protection.outlook.com [40.107.74.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F296E141
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPGV9edz4485N9VQvggczMBQuWbwc2hIsKgv+U4ryhbPY5zkOqiGjoGa546LybcqwxQUbUX0U+yjOn6gQ2DkrkGCfVADTXon5gnRu3DMODnKzC6g9jEwDXtXlxPJiMMREKQHpUQ44ZC9GGvOz7SYQnj5UOrprWw6QOOI4clTBsmMVoFe7Du0F2/S/rLs1KcJY0i7NPyhx8PIJUn1tfaJcA3jD6jspjgTAZTkmR743YqEsD6h06N66O44xV946CXir5TvDe7tKEIpzzwJ8qfjtOL6SmLT8i+aCSCO4D8fTZwpl/GHUkXjSVGjCNkG9MPiPH7t4PSke1qxalHvqzAnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QWSBETvtPzJ2fdg4hR88tJmFajH1MK2ipV9eyvBKPU=;
 b=JUU0DpPcssN4t5CVKXqizEdsdfxyDOdLFN4vbyuGfmao81e2DL7vRqlERLw+UqcOIe17ZF7lbEsTYUPrHdJl2UoIPNgaJB/x1AZC+Ee+JPXJbbufW051vgvCl4V5nnUmLNSD8QXTM7w20sjFEbPzqwJhkBs6aMuhjXH6IOBlpLEM8w+o6oS8J/WuCoOfO9knEtQ6lYg+X1QvQyl0EJ7eRw0ckMm4NdCgtwqLY9F28/3iOQyHFnplfpTTo5Cu9v9T3/t6bYYhEvsQyV0gaOQRxG32o1FuNoGn5xNTx3z0/eHHsbyQA7q/RWRlB3uB86wsWOoPS48Y1S4fa2OYzVVH3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (2603:10b6:403:2::19)
 by BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Thu, 29 Aug
 2019 16:24:05 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.17 via Frontend
 Transport; Thu, 29 Aug 2019 16:24:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:24:04 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/20] drm/amd/display: Create dpcd and i2c packing functions
Date: Thu, 29 Aug 2019 12:22:47 -0400
Message-ID: <20190829162253.10195-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(6916009)(4326008)(126002)(5660300002)(2351001)(426003)(81156014)(48376002)(81166006)(11346002)(16586007)(36756003)(305945005)(50466002)(8676002)(476003)(478600001)(2616005)(76176011)(336012)(2906002)(86362001)(26005)(7696005)(50226002)(53936002)(47776003)(356004)(1076003)(486006)(53416004)(446003)(316002)(186003)(8936002)(14444005)(70586007)(70206006)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8e66a19-64b6-4d59-8bf3-08d72c9d4f61
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265899AB0A21511943DDE86F9A20@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: v+Ciirlz1DMUboAw0a0VA7KzQygk4sFqISZ4zVwBtoUFMt/SJJ6SVfEa7BUEZXZOEmvx26l8OG77xMsJk2kp9I1l0L3ON5U8ER+IYsx6BoH5LrA4FUmt1XJkEQoSi/v0B3LAUD051kQUaz29TLvSZ2Mp4oF7UPFHEACxssDC5BUDwcuxm1luIh5MXo+xKnmCdoe4SzvrUae+MCL+aws4lPpXfYaC5bAJFnWQRkAvO2M5n4yZJGCamaSr+6CyQNexGegKxQYa6VVVmDacbMubMIvW19MFFoogY1vtL2LJTgXO1D0hj+reMTZN3TR81mzoGHKQAnU40D/o094xWdnIKd3nrY4Rn6CTCWCx6laD59r5VVAmzsjHuyq6HUE4aLQwGhDmwGmYeTNltn/Y6wjFy5ki76uyt8ptopyrPhrgh6Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:24:04.8073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e66a19-64b6-4d59-8bf3-08d72c9d4f61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QWSBETvtPzJ2fdg4hR88tJmFajH1MK2ipV9eyvBKPU=;
 b=Jpj62zTML0lV2/6Jpdhw4iZCtAeBNZYSWJOiN/uVsn2L0BWvGsgrpCEvih1lsViOMgYc5YUKj6hjGO15LlI5WPl7RO8c/nfafODFpLxsNbYG7qIuKnr8ebNM4DzynNmho1OPWh1SSSJ2FCaQHyRfzS2xnGIrR8wc4WPz+DjvHys=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UgbmVlZCB0byByZWFkIGFuZCB3cml0ZSBzcGVjaWZpYyBpMmMgYW5kIGRwY2QgbWVz
c2FnZXMuCgpbSG93XQpDcmVhdGVkIHN0YXRpYyBmdW5jdGlvbnMgZm9yIHBhY2tpbmcgdGhlIGRw
Y2QgYW5kIGkyYyBtZXNzYWdlcyBmb3IgaGRjcC4KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0
IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYyAgICB8IDQwICsrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5j
CmluZGV4IDAwNGI2ZThlOWVkNS4uOWQxMWQ3Njk1NTA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5jCkBAIC0yNiw2
ICsyNiw0MSBAQAogI2luY2x1ZGUgImFtZGdwdV9kbV9oZGNwLmgiCiAjaW5jbHVkZSAiYW1kZ3B1
LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X2RtLmgiCisjaW5jbHVkZSAiZG1faGVscGVycy5oIgorCiti
b29sIGxwX3dyaXRlX2kyYyh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIGNvbnN0IHVp
bnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCit7CisKKwlzdHJ1Y3QgZGNfbGluayAqbGluayA9
IGhhbmRsZTsKKwlzdHJ1Y3QgaTJjX3BheWxvYWQgaTJjX3BheWxvYWRzW10gPSB7e3RydWUsIGFk
ZHJlc3MsIHNpemUsICh2b2lkICopZGF0YX0gfTsKKwlzdHJ1Y3QgaTJjX2NvbW1hbmQgY21kID0g
e2kyY19wYXlsb2FkcywgMSwgSTJDX0NPTU1BTkRfRU5HSU5FX0hXLCBsaW5rLT5kYy0+Y2Fwcy5p
MmNfc3BlZWRfaW5fa2h6fTsKKworCXJldHVybiBkbV9oZWxwZXJzX3N1Ym1pdF9pMmMobGluay0+
Y3R4LCBsaW5rLCAmY21kKTsKK30KKworYm9vbCBscF9yZWFkX2kyYyh2b2lkICpoYW5kbGUsIHVp
bnQzMl90IGFkZHJlc3MsIHVpbnQ4X3Qgb2Zmc2V0LCB1aW50OF90ICpkYXRhLCB1aW50MzJfdCBz
aXplKQoreworCXN0cnVjdCBkY19saW5rICpsaW5rID0gaGFuZGxlOworCisJc3RydWN0IGkyY19w
YXlsb2FkIGkyY19wYXlsb2Fkc1tdID0ge3t0cnVlLCBhZGRyZXNzLCAxLCAmb2Zmc2V0fSwge2Zh
bHNlLCBhZGRyZXNzLCBzaXplLCBkYXRhfSB9OworCXN0cnVjdCBpMmNfY29tbWFuZCBjbWQgPSB7
aTJjX3BheWxvYWRzLCAyLCBJMkNfQ09NTUFORF9FTkdJTkVfSFcsIGxpbmstPmRjLT5jYXBzLmky
Y19zcGVlZF9pbl9raHp9OworCisJcmV0dXJuIGRtX2hlbHBlcnNfc3VibWl0X2kyYyhsaW5rLT5j
dHgsIGxpbmssICZjbWQpOworfQorCitib29sIGxwX3dyaXRlX2RwY2Qodm9pZCAqaGFuZGxlLCB1
aW50MzJfdCBhZGRyZXNzLCBjb25zdCB1aW50OF90ICpkYXRhLCB1aW50MzJfdCBzaXplKQorewor
CXN0cnVjdCBkY19saW5rICpsaW5rID0gaGFuZGxlOworCisJcmV0dXJuIGRtX2hlbHBlcnNfZHBf
d3JpdGVfZHBjZChsaW5rLT5jdHgsIGxpbmssIGFkZHJlc3MsIGRhdGEsIHNpemUpOworfQorCiti
b29sIGxwX3JlYWRfZHBjZCh2b2lkICpoYW5kbGUsIHVpbnQzMl90IGFkZHJlc3MsIHVpbnQ4X3Qg
KmRhdGEsIHVpbnQzMl90IHNpemUpCit7CisJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBoYW5kbGU7
CisKKwlyZXR1cm4gZG1faGVscGVyc19kcF9yZWFkX2RwY2QobGluay0+Y3R4LCBsaW5rLCBhZGRy
ZXNzLCBkYXRhLCBzaXplKTsKK30KIAogc3RhdGljIHZvaWQgcHJvY2Vzc19vdXRwdXQoc3RydWN0
IGhkY3Bfd29ya3F1ZXVlICpoZGNwX3dvcmspCiB7CkBAIC0yMjAsNyArMjU1LDEwIEBAIHN0cnVj
dCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF9jcmVhdGVfd29ya3F1ZXVlKHZvaWQgKnBzcF9jb250ZXh0
LCBzdHJ1Y3QgY3BfcHNwICpjCiAKIAkJaGRjcF93b3JrW2ldLmhkY3AuY29uZmlnLnBzcC5oYW5k
bGUgPSAgcHNwX2NvbnRleHQ7CiAJCWhkY3Bfd29ya1tpXS5oZGNwLmNvbmZpZy5kZGMuaGFuZGxl
ID0gZGNfZ2V0X2xpbmtfYXRfaW5kZXgoZGMsIGkpOwotCisJCWhkY3Bfd29ya1tpXS5oZGNwLmNv
bmZpZy5kZGMuZnVuY3Mud3JpdGVfaTJjID0gbHBfd3JpdGVfaTJjOworCQloZGNwX3dvcmtbaV0u
aGRjcC5jb25maWcuZGRjLmZ1bmNzLnJlYWRfaTJjID0gbHBfcmVhZF9pMmM7CisJCWhkY3Bfd29y
a1tpXS5oZGNwLmNvbmZpZy5kZGMuZnVuY3Mud3JpdGVfZHBjZCA9IGxwX3dyaXRlX2RwY2Q7CisJ
CWhkY3Bfd29ya1tpXS5oZGNwLmNvbmZpZy5kZGMuZnVuY3MucmVhZF9kcGNkID0gbHBfcmVhZF9k
cGNkOwogCX0KIAogCWNwX3BzcC0+ZnVuY3MudXBkYXRlX3N0cmVhbV9jb25maWcgPSB1cGRhdGVf
Y29uZmlnOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
