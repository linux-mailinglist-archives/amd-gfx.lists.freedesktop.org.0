Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCD926E6
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD10A6E156;
	Mon, 19 Aug 2019 14:35:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128A66E156
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRR+SFEi48ewChbdXBGoFbeH4SqARNjI/1QANLyWGIG9VjQGOVZ1H6mstSa3dxGynByrHg8Uf8aTxshG5zIJDzHfjLGkfs6u9nqBodraLGDIVUqG7+PMYA48cr02Qh4Z/YnKKGFXLEb8Dbt3FkEt9OHwueO+rRHiSpaSVIHuMV6xl7A00tVRa7LkbQ1a7aNP9IfZtYvLecqjCEe0KBZaxKbZ4iKMbYZMd41phdD1/FuA2d5wWwqND6+CP+JZoyqQOBN0P5q0TJn1LksX1yn9MAMCwdGwZwKUpE8d0bIJ2eTZTjhkxAI4C9R7I+Ba6+0FvdGaCtkEDX6t4Njf8WXpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SAz8YSBQQsNaj2BhnRXiVzieEeM0bAmN467KaXuvTA=;
 b=JTl7oER3JKOT4zuUW+5Q71M4+hEC99nsKaX3DHBESq7IWX9o2nakqIcVaQQT2OZIXzhktghbbs0aO3laXn+wG3WVEpB5ideViD+hdDaL6xNmyCx+xrEyvbIe5gN7Z1JKQGrNT41YdiLm/Yd/bNsAZCpjxq8S8ldMjeNOxxNtQqwjfvoTbUJJA1i8kl9PQlij+qzyIW1HGskB2Ssx1l/zGwkkz8fVXAVlflU2PANhEPil/KYsS2UD9WDxb+ud+m9nMAQsYyMx4k0CEtMPGCy2uzoSh6ZYZSfsiSDKT8k8fYZOnIbYD8KzpygzwP7I/LcclHwHOjrjVYwp7vQ5tuKFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 14:35:49 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:48 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:42 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/36] drm/amd/display: Zero-out dsc init regs
Date: Mon, 19 Aug 2019 10:34:49 -0400
Message-ID: <20190819143515.21653-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(86362001)(70206006)(486006)(478600001)(70586007)(316002)(53936002)(50226002)(36756003)(53416004)(50466002)(48376002)(16586007)(8936002)(126002)(356004)(476003)(6916009)(11346002)(2616005)(4326008)(426003)(26005)(5660300002)(305945005)(81166006)(81156014)(336012)(76176011)(446003)(186003)(8676002)(7696005)(51416003)(1076003)(2351001)(2906002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 626e0eb1-ab34-40bb-65cf-08d724b28758
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1279A70E7270F7AB2FF7337DF9A80@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +erAoJcVFcRMd3zgF4v1U7ZHj1o4qqMC1zxDxv/e3tgt4GmQQqMKDSWPScbo/ktah2QRDvRi4Fvph+yRLE7i9ltuK781+uf1JXfQaLoPczScLJfwcLxY0AffARd7TcoFHT1SIErzUwnVE99oa/K8DJhMndnfNioV+89QIMjwTmL3pfrXkw0wGaQ1T16jsPZwNN2gEik9FSG4gBXML3jA7kahn1dqFasZmdwtWEhM4ha+vXOxf0Cy/V9tbfACKKoT5c+hFxAFBWogPasp7qN3VRCuNbjWV2pouW0NoHbdsY/GX7w6SiVtCAqAxmSAk6mFHAC7fZO+DOQnLQ7oDd0h95TiajhQuKRJaIRldqHr+gPJc5fh8Hs2Rgys2gz3/AHz/5L8JfFvuw37O/63QLKRboZTjsYIQ6xNNJHT2A/zYqY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:48.8099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 626e0eb1-ab34-40bb-65cf-08d724b28758
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SAz8YSBQQsNaj2BhnRXiVzieEeM0bAmN467KaXuvTA=;
 b=TfPkGah+xEGJnT/I4U0H/L5hKsUyR9KbXJ+ubl1WpQyqHmqcnzQ07GzUS/IGy/xRr910eiahb4Ni/R9lMBmwsG7E3vggb8+i0o/ADdYBBdk714eTHu8XGUEPxPStHhisHlAEzAicVFg2itYF2m9mewpWcW9PnGsnKiKbbnTeDTo=
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
Cc: Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KQmVmb3Jl
IGEgc3RhdGljYWxseSBhbGxvY2F0ZWQgUFBTIGRhdGEgc3RydWN0dXJlLCB0aGF0IGRpZApnZXQg
emVyb2VkLW91dCBhdCBzdGFydHVwLCBoYWQgYmVlbiByZS11c2VkIGZvciBtYWtpbmcgcGFja2Vk
IFBQUwpTRFAuIFdpdGggUzMgZml4LCB1c2luZyBhIG5vbi1pbml0aWFsaXplZCBQUFMgZGF0YSBz
dHJ1Y3R1cmUgd2FzCmludHJvZHVjZWQsIHdoaWxlIHdyb25nbHkgYXNzdW1pbmcgaXQnZCBnZXQg
aW5pdGlhbGl6ZWQgYmVmb3JlIGl0J3MKcG9wdWxhdGVkLiBBcyBhIGNvbnNlcXVlbmNlICd2YnJf
ZW5hYmxlJyBhbmQgcGVyaGFwcyBzb21lIG90aGVyCmZpZWxkcyBhcmUgbGVmdCB1bmluaXRpYWxp
emVkIHdoZW4gbWFraW5nIHBhY2tlZCBQUFMgU0RQLiBUaGlzIGNhbgphZmZlY3QgJ3NpbXBsZV80
MjInIGFzIHdlbGwgYmVjYXVzZSBvZiB0aGUgd2F5IFBQUyBTRFAgcGFja2luZyBpcwpkb25lICh0
aGUgZmllbGRzIGFyZSBub3QgbWFza2VkIGZpcnN0LCBvbmx5IHNoaWZ0ZWQpLiBUaGUgYmVoYXZp
b3IKd2lsbCBiZSBkaWZmZXJlbnQsIGRlcGVuZGluZyBvbiB0aGUgY29udGVudCBvZiB1bmluaXRp
YWxpemVkIGRhdGEuCgpbaG93XQpaZXJvLW91dCBQUFMgZGF0YSBzdHJ1Y3R1cmUgYXQgaW5pdGlh
bGl6YXRpb24gdGltZSBiZWZvcmUgaXQncwpwb3B1bGF0ZWQKCkZpeGVzOiAgM2I4NzM3OGM2MDRl
OTI5MDE1Mzg1ZTVjYzc2ZDBiYmQ1NWMwNTM0NwoJZHJtL2FtZC9kaXNwbGF5OiBTZXQgRFNDIGJl
Zm9yZSBESUcgZnJvbnQtZW5kIGlzIGNvbm5lY3RlZCB0byBpdHMgYmFjay1lbmQKClNpZ25lZC1v
ZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQg
TGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9kc2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9kc2MuYwppbmRleCAzNzljOWU0YWM2M2IuLmM0Zjg2MWU2YmQ1MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYwpAQCAtNDQ3
LDYgKzQ0Nyw4IEBAIHN0YXRpYyB2b2lkIGRzY19pbml0X3JlZ192YWx1ZXMoc3RydWN0IGRzY19y
ZWdfdmFsdWVzICpyZWdfdmFscykKIHsKIAlpbnQgaTsKIAorCW1lbXNldChyZWdfdmFscywgMCwg
c2l6ZW9mKHN0cnVjdCBkc2NfcmVnX3ZhbHVlcykpOworCiAJLyogTm9uLVBQUyB2YWx1ZXMgKi8K
IAlyZWdfdmFscy0+ZHNjX2Nsb2NrX2VuYWJsZSAgICAgICAgICAgID0gMTsKIAlyZWdfdmFscy0+
ZHNjX2Nsb2NrX2dhdGluZ19kaXNhYmxlICAgID0gMDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
