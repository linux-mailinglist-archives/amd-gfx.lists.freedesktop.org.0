Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A90D0D2C
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 12:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15016E957;
	Wed,  9 Oct 2019 10:51:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720056.outbound.protection.outlook.com [40.107.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F378F6E957
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 10:51:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOVP86u7Zf21IFENpDRWxe4DoE364tM97Sr75QhLwegM2l1QNJlakW7CPWV72C7+FmY9NoPdQbaAgQ65esZHTEi1AbmYbN3tv6pfjI/eQ4WuWw+gFokwt2oBkNLnITFPpc4Hvn8xl5bOacteH3WVGUTZC3qJWtmfRiug5kkxitWTnEh76C4GnPMMlftCzf63A9lxMUUHkhKcLR8yr37tcfhRImS7CFEPYt4+wzb+J1cZaGukxD9olJjUPteRHVBuP68W9dqWiFVNnJCGCK3UqbYgyGvNY+fWRW5rxAIH7ItYx9lVH9X8XibmgHr9ORfbVQlqMbm+pltH15DLzHBH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axpxbO/pLZgpD+8gfMJ0VqqLSywOtDtdbXYgr1gboXY=;
 b=ZypJbPjoJP7Prbn9ZdiMkWyXrEn7Ch8PwGjIQAGlZnSmgSN/PdpXbT/oz0lx/JDprxBkWl6gSFPZKPIHuo3+2D+bn3LLmT+kQ75sSdbaOeF96t4HgQ0fa671KvWczjHJITOAb/Lj+nXPksVPuFWtPHa8xZHdxhdYG24+ZUelwp9oXjsI7eLupe3xMdT/QiHbJjRh7zwjIGEBVn0r4u0ocZUTu0pC1dG2Y9N78HrgTCwZkFsMHDvEAMvtraaV3jbu4HgaJBUnbtyNIZO1P1SIJnB75UM+qgns6VOFdzeUjPUY27v1IASo05QCyEnxnHuvIC+6QsvCR35fH1LYEHYMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0010.namprd12.prod.outlook.com (2603:10b6:5:1c0::23)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 10:51:52 +0000
Received: from BY2NAM03FT055.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by DM6PR12CA0010.outlook.office365.com
 (2603:10b6:5:1c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 10:51:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT055.mail.protection.outlook.com (10.152.85.245) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 10:51:52 +0000
Received: from emily-build-machine.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 9 Oct 2019 05:51:51 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] SWDEV-206718 drm/amdgpu: Fix tdr3 could hang with slow
 compute issue
Date: Wed, 9 Oct 2019 18:51:46 +0800
Message-ID: <1570618306-11560-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(428003)(199004)(189003)(478600001)(70586007)(6916009)(86362001)(2351001)(70206006)(5660300002)(305945005)(4326008)(47776003)(53416004)(6666004)(48376002)(316002)(336012)(8936002)(50226002)(81166006)(126002)(476003)(486006)(426003)(356004)(26005)(50466002)(8676002)(2616005)(81156014)(16586007)(2906002)(186003)(36756003)(7696005)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4064; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5b2e308-06f3-4ebc-d2c7-08d74ca6b174
X-MS-TrafficTypeDiagnostic: MN2PR12MB4064:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4064430394479B5C6287FB1F8F950@MN2PR12MB4064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6owdqMQHKg19p2RQgazzylv0UV5CSEGeVZ73m37ZeIe9JwND5oWP9omOIR2iZ29/t1f9050th8+o9G3odE/fS3ltk3EyGoKuENFv1pOxNzfxl+ZTo0f2tWXOd2xwFLjNhlfH+e0tVrw/RisEJa5kAjW2NTkzffVHB7CYykvmTqTpnTFUF8b5tMqRMfYvnX4WKeE9/vtYMuQgcadr3hIv6FGIxG4Iy1HpdAK0bseNevpZeAZSNutvBeKaHOnITn44Htokig0hKWOE9rUVURLN2QPEcIEHjjQ9eLU+NXXnEvDYajXWzUYASyrlPMsBtWXMVRjetmlNW+BGrtSRAit5PRAdOQzdapZl9uEAF2opyXVrQfXXe0AKs9qwubjI+DZcpBicMZeEzwI298qZpVHto2voqunAoVpopTjo0cFWpsU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 10:51:52.0128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b2e308-06f3-4ebc-d2c7-08d74ca6b174
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axpxbO/pLZgpD+8gfMJ0VqqLSywOtDtdbXYgr1gboXY=;
 b=Aw/wC4no29d8Cz6v7H5OdZRMLSXfgMAcuckq83iDGH2p0XlZgbm0IJIA5JTvk9pC8XJYgaeh4EAl1FKpm6SNrKCF+d6bt9VleuCk70p45l98EyMCkcc/gCg+oqxulW6TtYJ20jU1rYmPAU3NCUPaXzieAl6zXnq55GjlZAOagbU=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBpbmRleCBpcyAxLCBuZWVkIHRvIHNldCBjb21wdXRlIHJpbmcgdGltZW91dCBmb3Igc3Jp
b3YgYW5kIHBhc3N0aHJvdWdoLgoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVu
Z0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyB8IDUgKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICB8
IDYgKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNTNj
ZTIyNy4uMmY1YTAxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYwpAQCAtMjY2NCw4ICsyNjY0LDExIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9nZXRf
am9iX3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCSAqIFRo
ZXJlIGlzIG9ubHkgb25lIHZhbHVlIHNwZWNpZmllZCBhbmQKIAkJICogaXQgc2hvdWxkIGFwcGx5
IHRvIGFsbCBub24tY29tcHV0ZSBqb2JzLgogCQkgKi8KLQkJaWYgKGluZGV4ID09IDEpCisJCWlm
IChpbmRleCA9PSAxKSB7CiAJCQlhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1l
b3V0ID0gYWRldi0+Z2Z4X3RpbWVvdXQ7CisJCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8
IGFtZGdwdV9wYXNzdGhyb3VnaChhZGV2KSkKKwkJCQlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBh
ZGV2LT5nZnhfdGltZW91dDsKKwkJfQogCX0KIAogCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggYTg4ZWE3NC4uMzExYWJjOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMjUwLDkgKzI1MCwxMSBAQCBtb2R1
bGVfcGFyYW1fbmFtZWQobXNpLCBhbWRncHVfbXNpLCBpbnQsIDA0NDQpOwogICogQnkgZGVmYXVs
dCh3aXRoIG5vIGxvY2t1cF90aW1lb3V0IHNldHRpbmdzKSwgdGhlIHRpbWVvdXQgZm9yIGFsbCBu
b24tY29tcHV0ZShHRlgsIFNETUEgYW5kIFZpZGVvKQogICogam9icyBpcyAxMDAwMC4gQW5kIHRo
ZXJlIGlzIG5vIHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLgogICovCi1NT0RVTEVf
UEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0IGluIG1zIChkZWZh
dWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgaW5maW5pdHkgdGltZW91dCBmb3Ig
Y29tcHV0ZSBqb2JzLiIKK01PRFVMRV9QQVJNX0RFU0MobG9ja3VwX3RpbWVvdXQsICJHUFUgbG9j
a3VwIHRpbWVvdXQgaW4gbXMgKGRlZmF1bHQ6IGZvciBiYXJlIG1ldGFsIDEwMDAwIGZvciBub24t
Y29tcHV0ZSBqb2JzIGFuZCBpbmZpbml0eSB0aW1lb3V0IGZvciBjb21wdXRlIGpvYnM7ICIKKwkJ
ImZvciBwYXNzdGhyb3VnaCBvciBzcmlvdiwgMTAwMDAgZm9yIGFsbCBqb2JzLiIKIAkJIiAwOiBr
ZWVwIGRlZmF1bHQgdmFsdWUuIG5lZ2F0aXZlOiBpbmZpbml0eSB0aW1lb3V0KSwgIgotCQkiZm9y
bWF0IGlzIFtOb24tQ29tcHV0ZV0gb3IgW0dGWCxDb21wdXRlLFNETUEsVmlkZW9dIik7CisJCSJm
b3JtYXQ6IGZvciBiYXJlIG1ldGFsIFtOb24tQ29tcHV0ZV0gb3IgW0dGWCxDb21wdXRlLFNETUEs
VmlkZW9dOyAiCisJCSJmb3IgcGFzc3Rocm91Z2ggb3Igc3Jpb3YgW2FsbCBqb2JzXSBvciBbR0ZY
LENvbXB1dGUsU0RNQSxWaWRlb10uIik7CiBtb2R1bGVfcGFyYW1fc3RyaW5nKGxvY2t1cF90aW1l
b3V0LCBhbWRncHVfbG9ja3VwX3RpbWVvdXQsIHNpemVvZihhbWRncHVfbG9ja3VwX3RpbWVvdXQp
LCAwNDQ0KTsKIAogLyoqCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
