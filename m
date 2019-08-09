Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F9A88503
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496B76EEC0;
	Fri,  9 Aug 2019 21:38:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE326EEB0
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiAgAs9+8yzAgvGGxTFdSy+QFIQI58Vja2vmtlQd92kYRO9ZlWTEDqShmqoUOEv6lD3jh3ajTLHkW2hZqbaLzihNnuZkeiWdxjBlJ3cq/hrlFEGKmfxLhTOhkcmgagTKfkKBqtT4zIvDkGbgNCgYCNp8Ah0cpQ0TMyIE5zXSQFodi1H99JgSbzmiXawTuxR+u8dB53FNMctk0nK9ChShERcEieFYD1Y2WOJEa4sJjLbzlAH82WO9sqtsWOouuEMaxLN34XdbyVuS6qVDnA8d5CP41w3tMTT7iflDZh/8HSVc4slAxz3v5p6Q+APyJImTX9hMQfa4OZbEBK8WyyEc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S60NF9vs2FTPzuj8XdLIWTvjKD1KkIqUGRUzaaPVR0=;
 b=Ty5mEsIBGnZzBwUD2Tfp1OJ46GKtkG5gpDa5qTOkitwST09zwbPFufcFCAWxi41jY2pMnyAKFY8jr4+u0fD0mfmUV99PQ3470Y05/AOcpV6JI7PcBaBHL9matB3mg8eDv9QDdI1xbZbgEmRNIfZbIQmVm+oxnipixX3KqGSYsVzUZh1wriqczPKC4dR1sSDE+196MF0CrIGTOIXSVQEyHQ4GQp+n4oIDXmBQy6Rm0gc03VFivbJ3V8jyjHHYpSCbHixRB4kdxrkAcqhKyjg2bKM85VilDRnUU8YkaND2KpqW7HgutxALzyzQA/WyjFMeDa+eoIjUslhPg6/yiP2Meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by DM6PR12MB2716.namprd12.prod.outlook.com
 (2603:10b6:5:49::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.13; Fri, 9 Aug
 2019 21:38:33 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:32 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:23 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/49] drm/amd/display: fix dcn-specific clk_mgr init_clocks
Date: Fri, 9 Aug 2019 17:37:10 -0400
Message-ID: <20190809213742.30301-18-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(428003)(189003)(199004)(51416003)(49486002)(2876002)(76176011)(36756003)(50466002)(4326008)(2906002)(48376002)(305945005)(336012)(6666004)(356004)(14444005)(53936002)(426003)(2351001)(50226002)(316002)(2870700001)(54906003)(86362001)(8676002)(6916009)(5660300002)(81166006)(186003)(26005)(70586007)(11346002)(70206006)(446003)(47776003)(8936002)(486006)(81156014)(478600001)(126002)(476003)(2616005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2716; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e55f46f-b319-454d-0224-08d71d11ed53
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2716; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2716:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27161929FE8B71BD87F30F5482D60@DM6PR12MB2716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vsz9xaQOxkiTqBX9gi0Vd8dZp0u9A5LJAqB6U21vcfy1vdrfsxlKye7YTiDF7x7mxkPFChktI1wEL+L80cAJBFdETJeGAVOCpan7l/sNrgP+Op7wQEEMCvTlVmGoQLy7UWy3gYkYJurRk2bkNZNa4+kMXvGMHcf6rhbeYnRqV5RNpGkBs7oZVSxOYgkL2OngnLbZ8ZfdgvIGX5QggcyrHznKJmok5cVFZHRaaRy1q+vBtuljHhWyF4THzFOGOhz+ks3CID1H27+WjqAWH2LJIGUeF1Uvb+5IYRxF1KJAHNuPRR8uG3fPBDSCYzaRN/OhccuGbMEAzOad96vlbg8rwghefb4ZbKk3V9WBfbuXf+55V28fILaTAqjaLyNZBMwIKP0QC217lONi2T4VGuPOpTLtFhOlkySBld4r6UlbJG8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:32.8603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e55f46f-b319-454d-0224-08d71d11ed53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1S60NF9vs2FTPzuj8XdLIWTvjKD1KkIqUGRUzaaPVR0=;
 b=NS+0iFRUKLDV6NAexTL511buPxkQwASlkW6I0XwVIqPh3U6ES8bOZ63xmLGaWGhKWibX7kXaY8WdvTOAhujfmMRg7mfr6Pi84tLjKpLDO45LZOvImf77e/dezYBvzVBe71+l6D58qdaoqc4r0/e2NKULyPyXHB2S6kYHlECI2gE=
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Martin Leung <martin.leung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KCltXaHldCnVuZGVyZmxv
dyBzZWVuIG9uIGNlcnRhaW4gbW9uaXRvciBzZXR1cHMgY2F1c2VkIGJ5IG1ha2luZyBkY254eF9p
bml0X2h3CmdlbmVyaWMKCltIb3ddCmJ5IG1vdmluZyBkY24yMF9pbml0X2h3IGludG8gZGNuMTAs
IHdlIGFkZGVkIGEgZGNuLXNwZWNpZmljIGNsa19tZ3IKaW5pdCAoZGMtPmNsa19tZ3ItPmZ1bmNz
LT5pbml0X2Nsb2NrcygpKS4gVGh1cywgcHV0IG9sZCBjbGtfbWdyCm1lbXNldCBpbiBhbiBlbHNl
IHN0YXRlbWVudCBzbyBib3RoIG1lbXNldHMgZG9uJ3QgZ2V0IHNldAoKU2lnbmVkLW9mZi1ieTog
TWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkg
S29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMTAv
cnYxX2Nsa19tZ3IuYyB8IDYgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMTAvcnYxX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjEwL3J2MV9jbGtfbWdyLmMKaW5kZXggYWU2
MmU2YTg3MmQxLi4wZjI2OWFkZDY1M2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjEwL3J2MV9jbGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMTAvcnYxX2Nsa19tZ3IuYwpAQCAtMzEsNiAr
MzEsMTEgQEAKICNpbmNsdWRlICJydjFfY2xrX21ncl92Ymlvc19zbXUuaCIKICNpbmNsdWRlICJy
djFfY2xrX21ncl9jbGsuaCIKIAordm9pZCBydjFfaW5pdF9jbG9ja3Moc3RydWN0IGNsa19tZ3Ig
KmNsa19tZ3IpCit7CisJbWVtc2V0KCYoY2xrX21nci0+Y2xrcyksIDAsIHNpemVvZihzdHJ1Y3Qg
ZGNfY2xvY2tzKSk7Cit9CisKIHN0YXRpYyBpbnQgcnYxX2RldGVybWluZV9kcHBjbGtfdGhyZXNo
b2xkKHN0cnVjdCBjbGtfbWdyX2ludGVybmFsICpjbGtfbWdyLCBzdHJ1Y3QgZGNfY2xvY2tzICpu
ZXdfY2xvY2tzKQogewogCWJvb2wgcmVxdWVzdF9kcHBfZGl2ID0gbmV3X2Nsb2Nrcy0+ZGlzcGNs
a19raHogPiBuZXdfY2xvY2tzLT5kcHBjbGtfa2h6OwpAQCAtMjI5LDYgKzIzNCw3IEBAIHN0YXRp
YyB2b2lkIHJ2MV9lbmFibGVfcG1lX3dhKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyX2Jhc2UpCiB9
CiAKIHN0YXRpYyBzdHJ1Y3QgY2xrX21ncl9mdW5jcyBydjFfY2xrX2Z1bmNzID0geworCS5pbml0
X2Nsb2NrcyA9IHJ2MV9pbml0X2Nsb2NrcywKIAkuZ2V0X2RwX3JlZl9jbGtfZnJlcXVlbmN5ID0g
ZGNlMTJfZ2V0X2RwX3JlZl9mcmVxX2toeiwKIAkudXBkYXRlX2Nsb2NrcyA9IHJ2MV91cGRhdGVf
Y2xvY2tzLAogCS5lbmFibGVfcG1lX3dhID0gcnYxX2VuYWJsZV9wbWVfd2EsCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2Vy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVu
Y2VyLmMKaW5kZXggMWJmYzc2Y2JkZGI4Li42NGE1Njg5YjMwYjEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2Vy
LmMKQEAgLTEyOTAsOCArMTI5MCw2IEBAIHN0YXRpYyB2b2lkIGRjbjEwX2luaXRfaHcoc3RydWN0
IGRjICpkYykKIAl9CiAKIAlkYy0+aHdzcy5lbmFibGVfcG93ZXJfZ2F0aW5nX3BsYW5lKGRjLT5o
d3NlcSwgdHJ1ZSk7Ci0KLQltZW1zZXQoJmRjLT5jbGtfbWdyLT5jbGtzLCAwLCBzaXplb2YoZGMt
PmNsa19tZ3ItPmNsa3MpKTsKIH0KIAogc3RhdGljIHZvaWQgZGNuMTBfcmVzZXRfaHdfY3R4X3dy
YXAoCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
