Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71298884F5
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22906EEB7;
	Fri,  9 Aug 2019 21:38:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730061.outbound.protection.outlook.com [40.107.73.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6B66EEB1
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI4FyXUQQFABVpN8cG06vmrpUucL3IFAij/ZVdRubIIwpJJhV4qRNXQL6soZuCURDmq8EztWA3iAL8IvDcIEFa77elx1KUROzmVfJnwvHj6Jh0s/JVLDGlGHMUHC2YSNI5NzdTml1E6GKij0rKID8yaMsN52NJk5GqOrDlsItP5VfjtiHxBql7dswvlr5v2tSeuazQrCz15ESomJ+SNtxgYcJWrDOYFpIyinsiA/x+UMDXJ6UesIVtbC1Rc6cKeYXgsWX4lmEgediPSZ3OwtoUKp1fzSOnP7bKnHFyfePcykiZH9POENwoLmKq+n/h+I5HnUza3yKFjQ9P2L5X44FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WV/Kb+BDBKbISniJg8+RMLrEa/0Nfw1qGFcWEvUCXc=;
 b=Tu607VTFsUgLcvEwYL6jyQdT47CGQd9Qd3BFfm1uNrgMwNwuIMXnob7HyqiHGdnesOPaisMpsr9rw3yS6VBQSmdjf9yPpmHlFBwfisnCe+QFNI+ZoWOJWdZ0tFjpSKupC0dDHb2oE1YhYNb5Q7efko6XrEuO1qDNW4FNzKIh6P+sVE0VVWNcHuhCOPyGZ0yccyEOoIZ3EcWT7+z15mAh9KtFbH9WuXKQXUf2dMPyE/42/GTGTyb5uv+Bj6ecCFe7HeJLsMlGCwtY10tireKfUPCt1LHdKzaA0zKRXgmPIKDM92kE1Nbj5XHAAbuz9Js6sByo+rIWaWKc1xXO2bGBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:910:16::29) by MWHPR12MB1278.namprd12.prod.outlook.com
 (2603:10b6:300:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:30 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by CY4PR1201CA0019.outlook.office365.com
 (2603:10b6:910:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:30 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:21 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/49] drm/amd/display: wait for pending complete when
 enabling a plane
Date: Fri, 9 Aug 2019 17:37:07 -0400
Message-ID: <20190809213742.30301-15-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(51416003)(446003)(2870700001)(48376002)(11346002)(8936002)(4326008)(426003)(486006)(50466002)(86362001)(2906002)(50226002)(36756003)(53936002)(336012)(14444005)(2351001)(305945005)(6916009)(54906003)(186003)(76176011)(316002)(2876002)(356004)(5660300002)(1076003)(81166006)(81156014)(8676002)(126002)(6666004)(478600001)(476003)(26005)(70206006)(70586007)(47776003)(49486002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efdcb8a5-da48-4a2a-92ae-08d71d11ebf0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1278567FB67D20763084AF2582D60@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UvDbiBYv22naRfmFIlwZsjcRne0huJM/D2jnNYYEkmCfFJh/IsuybOHSHnnvxHuLCA8tuJBc3KWegWLCWx/mZK0a+s4NeqA48zkPPPPIN9X6lJLToF36dtPnbBCX0sftfzLJxlqVIjxrwG6MGYOr61Qfu+gVIkA08HBuR6wPaQGY/cD8pxRaEvF3bc3lR1O4yNKJSuG3ekDHppzigcfEYJ8P3Aqd5Ntx/QAuV9j75onkJGsye7kCpi5qXWREkNL8TcW6DDii9jWN1V9pa+CFZhXW/x3Ixeupm3gINOd2rS/3rFQvKK8PGnOEhWwJJDm4QNb1itTBWPgGzhSbQrHZzMESLwstxibm2Yz7weyPpRcPZQEhYKZXdNVqCj7iQxhgvZ6Ka+qCfPA12WUiQW4Q6R48m0ukFBik6hEm+xydAUU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:30.5225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efdcb8a5-da48-4a2a-92ae-08d71d11ebf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WV/Kb+BDBKbISniJg8+RMLrEa/0Nfw1qGFcWEvUCXc=;
 b=kDggvsFyZUkkiaDB9ISM+Q+q+M4uv0Awk0yG7Q7qt9U/9i3Tc3XW15gxb7PnQtHOTB9L/AI2JIZxtJEUC6tMc40FuYM8R4yUcaT1BBoVZV7TGtxW866oLO7ejgdrh8lP+TfAQ3Sw1nV+2vqAaa4JuYc/tOOeRUeeP+MtUztjAFU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KV2hlbiBwbGFuZXMgYXJlIGVu
YWJsZWQsIHRoZXkgbXVzdCBiZSBlbmFibGVkIHVzaW5nIFZTWU5DIHVwZGF0ZSAobm90IGltbWVk
aWF0ZSkuCkhvd2V2ZXIsIGJlZm9yZSB0aGUgVlVQREFURSBvY2N1cnMsIERNIG1heSBjYWxsIHdp
dGggYW4gImltbWVkaWF0ZSIgZmxpcCB3aGljaCBpcyBhZGRyZXNzCm9ubHkuICBUaGlzIG9wZXJh
dGlvbiB3b3VsZCBub3JtYWxseSBiZSBva2F5LCBidXQgaWYgdGhlIGxvY2tpbmcgZm9yIGltbWVk
aWF0ZSBmbGlwIGhhcHBlbnMKdG8gb2NjdXIgYmVmb3JlIHRoZSBWVVBEQVRFIGFzc29jaWF0ZWQg
d2l0aCB0aGUgaW5pdGlhbCBwbGFuZSBlbmFibGVtZW50LCBpdCB3aWxsIGNhdXNlIEhXCnRvIGhh
bmcuCgpbaG93XQpIV1NTIHNob3VsZCBlbmZvcmNlIHBsYW5lIGVuYWJsZSBpbiBIVyB0byBiZSBz
eW5jaHJvbm91cyB3aXRoIHRoZSBjYWxsIHRoYXQgZW5hYmxlcyB0aGUgcGxhbmUuCgpTaWduZWQt
b2ZmLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFcmljIFlhbmcg
PGVyaWMueWFuZzJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyAgICB8IDIw
ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfaHdzZXEuYwppbmRleCBmYjdjZGUzM2M4OGIuLmMxMWRlNmYwZmU1YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMK
QEAgLTEzNTMsMTMgKzEzNTMsMTUgQEAgc3RhdGljIHZvaWQgZGNuMjBfYXBwbHlfY3R4X2Zvcl9z
dXJmYWNlKAogCQlpbnQgbnVtX3BsYW5lcywKIAkJc3RydWN0IGRjX3N0YXRlICpjb250ZXh0KQog
ewotCisJY29uc3QgdW5zaWduZWQgaW50IFRJTUVPVVRfRk9SX1BJUEVfRU5BQkxFX01TID0gMTAw
OwogCWludCBpOwogCXN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZzsKIAlib29sIHJlbW92ZWRf
cGlwZVs2XSA9IHsgZmFsc2UgfTsKIAlib29sIGludGVyZGVwZW5kZW50X3VwZGF0ZSA9IGZhbHNl
OwogCXN0cnVjdCBwaXBlX2N0eCAqdG9wX3BpcGVfdG9fcHJvZ3JhbSA9CiAJCQlmaW5kX3RvcF9w
aXBlX2Zvcl9zdHJlYW0oZGMsIGNvbnRleHQsIHN0cmVhbSk7CisJc3RydWN0IHBpcGVfY3R4ICpw
cmV2X3RvcF9waXBlX3RvX3Byb2dyYW0gPQorCQkJZmluZF90b3BfcGlwZV9mb3Jfc3RyZWFtKGRj
LCBkYy0+Y3VycmVudF9zdGF0ZSwgc3RyZWFtKTsKIAlEQ19MT0dHRVJfSU5JVChkYy0+Y3R4LT5s
b2dnZXIpOwogCiAJaWYgKCF0b3BfcGlwZV90b19wcm9ncmFtKQpAQCAtMTQ1Myw2ICsxNDU1LDIy
IEBAIHN0YXRpYyB2b2lkIGRjbjIwX2FwcGx5X2N0eF9mb3Jfc3VyZmFjZSgKIAlmb3IgKGkgPSAw
OyBpIDwgZGMtPnJlc19wb29sLT5waXBlX2NvdW50OyBpKyspCiAJCWlmIChyZW1vdmVkX3BpcGVb
aV0pCiAJCQlkY24yMF9kaXNhYmxlX3BsYW5lKGRjLCAmZGMtPmN1cnJlbnRfc3RhdGUtPnJlc19j
dHgucGlwZV9jdHhbaV0pOworCisJLyoKKwkgKiBJZiB3ZSBhcmUgZW5hYmxpbmcgYSBwaXBlLCB3
ZSBuZWVkIHRvIHdhaXQgZm9yIHBlbmRpbmcgY2xlYXIgYXMgdGhpcyBpcyBhIGNyaXRpY2FsCisJ
ICogcGFydCBvZiB0aGUgZW5hYmxlIG9wZXJhdGlvbiBvdGhlcndpc2UsIERNIG1heSByZXF1ZXN0
IGFuIGltbWVkaWF0ZSBmbGlwIHdoaWNoCisJICogd2lsbCBjYXVzZSBIVyB0byBwZXJmb3JtIGFu
ICJpbW1lZGlhdGUgZW5hYmxlIiAoYXMgb3Bwb3NlZCB0byAidnN5bmMgZW5hYmxlIikgd2hpY2gK
KwkgKiBpcyB1bnN1cHBvcnRlZCBvbiBEQ04uCisJICovCisJaSA9IDA7CisJaWYgKG51bV9wbGFu
ZXMgPiAwICYmIHRvcF9waXBlX3RvX3Byb2dyYW0gJiYKKwkJCShwcmV2X3RvcF9waXBlX3RvX3By
b2dyYW0gPT0gTlVMTCB8fCBwcmV2X3RvcF9waXBlX3RvX3Byb2dyYW0tPnBsYW5lX3N0YXRlID09
IE5VTEwpKSB7CisJCXdoaWxlIChpIDwgVElNRU9VVF9GT1JfUElQRV9FTkFCTEVfTVMgJiYKKwkJ
CQl0b3BfcGlwZV90b19wcm9ncmFtLT5wbGFuZV9yZXMuaHVicC0+ZnVuY3MtPmh1YnBfaXNfZmxp
cF9wZW5kaW5nKHRvcF9waXBlX3RvX3Byb2dyYW0tPnBsYW5lX3Jlcy5odWJwKSkgeworCQkJaSAr
PSAxOworCQkJbXNsZWVwKDEpOworCQl9CisJfQogfQogCiAKLS0gCjIuMjIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
