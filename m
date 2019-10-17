Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1522DB746
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F33B6EA2A;
	Thu, 17 Oct 2019 19:16:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358F56EABF
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2y5HM2NHtN8Hp5YOEawrRH+GkSqm80knghHpsbg+o6H0GunSTx7QKVTmTOUvhEE9E3m3wqUpOCVKg+IO2Kx2O+FGytfDkD0WedpAsi2x/kNO4nV/naAmG7szlaXaSuAsrkwZx0T+g9EeXrr42W6JC5UwpY7yZU7cVZDixlThHiCFyFAtTUeifR9oWXDX4/yV2wFOaucQdzjPePbrgI0p3I4hSyFJUYH0XpSHqIko9M/MLRWs0ebEdJGh0Hzj6n0P1SqNd1ljAGJb2QgSn9fHfJFXm5XTryH7I2L3bDjjdPdFrM1d5asAw42kuafZ3UEOqooWgELc+kvtCdgcJjWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB2gJWesY/ujqGOTgO9LHvkFJXDU43ZpwOcGkXAACII=;
 b=bx5F06ZmGWjn10pdD61q6zVFLkESuY/SNj4hzasuQ0s/UgyyFRxpPQLvua929QJ1VK+q5F87h8MRKmwI88F7RuqKB/2rx7Hkk+vdjy41BNZ0TJPr908Q3e0uEkIyYl+k1cHJfQ0PHrEBnfowUtSnAaz2z35c+mC361leGaDhRnZTsXZgSph/ZRgLtx+AWHFzdimy1Sdi6WPz4QfxSwAcLx7jVuxFPRLkv76GBq5TRZpuiTzWsB9LHC5axihXhNtQqMOhEW3B54sn4JaDCTjsv7S43by8GEnPq4QpKzcNxgR7+YK1a0Vvjl55AAFfX6udgA3fI8qxsp8zynED0wc13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:405:4c::23) by SN1PR12MB2413.namprd12.prod.outlook.com
 (2603:10b6:802:26::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Thu, 17 Oct
 2019 19:15:55 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by BN6PR1201CA0013.outlook.office365.com
 (2603:10b6:405:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:54 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:53 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:53 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 34/37] drm/amd/display: Do not call update bounding box on dc
 create
Date: Thu, 17 Oct 2019 15:13:26 -0400
Message-ID: <20191017191329.11857-35-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(428003)(199004)(189003)(126002)(486006)(14444005)(47776003)(336012)(1076003)(36756003)(2616005)(426003)(11346002)(446003)(2351001)(476003)(305945005)(54906003)(48376002)(15650500001)(2876002)(478600001)(2906002)(2870700001)(86362001)(50466002)(6666004)(6916009)(4326008)(50226002)(51416003)(81166006)(8676002)(81156014)(70206006)(186003)(8936002)(5660300002)(76176011)(70586007)(316002)(356004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2413; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55ffd8a0-0e18-43c3-776a-08d753366ec4
X-MS-TrafficTypeDiagnostic: SN1PR12MB2413:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2413F27189C5B0318CCD331C826D0@SN1PR12MB2413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8R8jdYaj4TB/svSXF+7lXSY1cyDv4C2I816v6fDzvwEdYqaEx9ZIcJjke+Bi2uXaibR2Ae2CgpXIGgkNXLeZkIpb1NcfIj5taSC+dfxarkDNoqh/gHMb4CL4KdrDaYD7jHtEgXoocAR9vl9RKJ8TldsLtM17liB/utXAJ/1UlABter9Iur8zFSJYtPdHDvDx9H0KGTMX2wTCdASZRuqIH5w04xQdSATrFPpOiyfU4ZZN/ih0FrD0vlMQzK62NxQxUQXSLDHJwYIv6kB/Y13diTZgJEpQ1GXLCgs03a5/ta1RrO8I3DGTmO9QUL/P/jgKhixN4y0ym3CZT3/APMN0knlrbGNOLHdaJG/6brHJb4PKv/pqBpYUaQ5LMrL4tzgDmXfjPnUihpOZ45gJB6ueAIkTucsJxyxm5B+SQa2lHJc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:54.6602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ffd8a0-0e18-43c3-776a-08d753366ec4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2413
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB2gJWesY/ujqGOTgO9LHvkFJXDU43ZpwOcGkXAACII=;
 b=tii85uz7hUMoT8KvXsrQmKvnG9AgWtlV84vXDRqBbN5afPKI20DiQVHjxcsbKDFUlTq3E+ZkMlk6pibqMFQ8veI5EGyDmKBVw1sxE03E+Hq2yz5ePlpvSmZax1zK7IJAIa4XX1akA2NpRVDbfpxbmCthYyb9aMQBG2FGRSmITIk=
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
 Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3VuZyBMZWUgPHN1bmcubGVlQGFtZC5jb20+CgpbV2h5XQpJbiBIeWJyaWQgR3JhcGhp
Y3MsIGRjbjJfMV9zb2Mgc3RydWN0IHN0YXlzIGFsaXZlIHRocm91Z2ggUG5QLgpUaGlzIGNhdXNl
cyBhbiBpc3N1ZSBvbiBkYyBpbml0IHdoZXJlIGRjbjJfMV9zb2Mgd2hpY2ggaGFzIGJlZW4KdXBk
YXRlZCBieSB1cGRhdGVfYndfYm91bmRpbmdfYm94IGdldHMgcHV0IGludG8gZG1sLT5zb2MuCkFz
IHVwZGF0ZV9id19ib3VuZGluZ19ib3ggaXMgY3VycmVudGx5IGluY29ycmVjdCBmb3IgZGNuMi4x
LAp0aGlzIG1ha2VzIGRtbCBjYWxjdWxhdGlvbnMgZmFpbCBkdWUgdG8gaW5jb3JyZWN0IHBhcmFt
ZXRlcnMsCmxlYWRpbmcgdG8gYSBjcmFzaCBvbiBQblAuCgpbSG93XQpDb21tZW50IG91dCB1cGRh
dGVfYndfYm91bmRpbmdfYm94IGNhbGwgZm9yIG5vdy4KClNpZ25lZC1vZmYtYnk6IFN1bmcgTGVl
IDxzdW5nLmxlZUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlhbmcyQGFt
ZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYyB8IDggKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3Vy
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJj
ZS5jCmluZGV4IGYxNjVmN2U1OGRhOS4uODhmODlkMDczMDYxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYwpAQCAtMTMz
Niw2ICsxMzM2LDEyIEBAIHN0cnVjdCBkaXNwbGF5X3N0cmVhbV9jb21wcmVzc29yICpkY24yMV9k
c2NfY3JlYXRlKAogCiBzdGF0aWMgdm9pZCB1cGRhdGVfYndfYm91bmRpbmdfYm94KHN0cnVjdCBk
YyAqZGMsIHN0cnVjdCBjbGtfYndfcGFyYW1zICpid19wYXJhbXMpCiB7CisJLyoKKwlUT0RPOiBG
aXggdGhpcyBmdW5jdGlvbiB0byBjYWxjdWFsdGUgY29ycmVjdCB2YWx1ZXMuCisJVGhlcmUgYXJl
IGtub3duIGlzc3VlcyB3aXRoIHRoaXMgZnVuY3Rpb24gY3VycmVudGx5CisJdGhhdCB3aWxsIG5l
ZWQgdG8gYmUgaW52ZXN0aWdhdGVkLiBVc2UgaGFyZGNvZGVkIGtub3duIGdvb2QgdmFsdWVzIGZv
ciBub3cuCisKKwogCXN0cnVjdCBkY24yMV9yZXNvdXJjZV9wb29sICpwb29sID0gVE9fRENOMjFf
UkVTX1BPT0woZGMtPnJlc19wb29sKTsKIAlzdHJ1Y3QgY2xrX2xpbWl0X3RhYmxlICpjbGtfdGFi
bGUgPSAmYndfcGFyYW1zLT5jbGtfdGFibGU7CiAJaW50IGk7CkBAIC0xMzUwLDExICsxMzU2LDEx
IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9id19ib3VuZGluZ19ib3goc3RydWN0IGRjICpkYywgc3Ry
dWN0IGNsa19id19wYXJhbXMgKmJ3X3BhcmFtCiAJCWRjbjJfMV9zb2MuY2xvY2tfbGltaXRzW2ld
LmRjZmNsa19taHogPSBjbGtfdGFibGUtPmVudHJpZXNbaV0uZGNmY2xrX21oejsKIAkJZGNuMl8x
X3NvYy5jbG9ja19saW1pdHNbaV0uZmFicmljY2xrX21oeiA9IGNsa190YWJsZS0+ZW50cmllc1tp
XS5mY2xrX21oejsKIAkJZGNuMl8xX3NvYy5jbG9ja19saW1pdHNbaV0uc29jY2xrX21oeiA9IGNs
a190YWJsZS0+ZW50cmllc1tpXS5zb2NjbGtfbWh6OwotCQkvKiBUaGlzIGlzIHByb2JhYmx5IHdy
b25nLCBUT0RPOiBmaW5kIGNvcnJlY3QgY2FsY3VsYXRpb24gKi8KIAkJZGNuMl8xX3NvYy5jbG9j
a19saW1pdHNbaV0uZHJhbV9zcGVlZF9tdHMgPSBjbGtfdGFibGUtPmVudHJpZXNbaV0ubWVtY2xr
X21oeiAqIDE2IC8gMTAwMDsKIAl9CiAJZGNuMl8xX3NvYy5jbG9ja19saW1pdHNbaV0gPSBkY24y
XzFfc29jLmNsb2NrX2xpbWl0c1tpIC0gaV07CiAJZGNuMl8xX3NvYy5udW1fc3RhdGVzID0gaTsK
KwkqLwogfQogCiAvKiBUZW1wb3JhcnkgUGxhY2UgaG9sZGVyIHVudGlsIHdlIGNhbiBnZXQgdGhl
bSBmcm9tIGZ1c2UgKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
