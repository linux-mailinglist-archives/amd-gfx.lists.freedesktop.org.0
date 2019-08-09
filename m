Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A177884F8
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FEC6EEB4;
	Fri,  9 Aug 2019 21:38:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C9B6EEAE
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUgsv60zqVSfsHz6BQdTurxABCqfK3t7MmBtmpbJAq5jJTNxoR2o3DnV28uD2YQG+vG0TyuPGl/NFfhJN68dVz88yWI5nDdsXF16QjpB0ZKZMKjb6irPTYGx6dKH1TRi5/vjeR+bNwtQbBf4H7Jbq4bk2litp0ntIVUF097CVQo3Xu+3UazBS2npvc6g7rGHSqxZItCk4dFA8+7vGrC9inH3ustZMAisgQeGVJqNCy+jXPxjw2pV7WT3RkRZ8aqoio1ezBBn4EncFF4CFxCXCBkGKLoQ6bVynHA1CBXbTo98Df1BvtdXEo5F6uubUzntwB8kN5vbo/V/T/xyBcSI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kjgvo8NystD6EsnBj7FNwH44VXz98lR1HFMElZaUuWc=;
 b=GTYbfpD3hvWp0eUI3qtTnEwz3wkyn95+hthCdRlVoCVDbE2tqRNCRBUqjdou4KdYUSw3NXpVmwuZBWLH90EiXiEp7hj8lTXF3X1dIKZRYHe5vLVXHImVhtVCvYTdrZrc1fHNjEgs16mbxQKCrwuee5dsrYf6aikzXM3BnFj0sTC4Wpl1hJp/HMA4zSsYV+lBYybash3eNAH1CXsZqmS2wTo40LtgMmG8Zk0XtCmdWW1V1yKZMdpBOyL020R5AWeMLY2t2niih0s0KlPsTM6+gsIMPyTG8n5AGTXqbNrok+yAv8hvxbXEcaMub+dLcbkh3wVU1LqTqC7fygV/mooUuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by CY4PR12MB1272.namprd12.prod.outlook.com
 (2603:10b6:903:3e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12; Fri, 9 Aug
 2019 21:38:34 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:34 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:23 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/49] drm/amd/display: clean up DML for DCN2x
Date: Fri, 9 Aug 2019 17:37:12 -0400
Message-ID: <20190809213742.30301-20-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(2980300002)(428003)(189003)(199004)(426003)(26005)(8936002)(81156014)(86362001)(126002)(11346002)(8676002)(53936002)(50466002)(5660300002)(186003)(305945005)(4326008)(76176011)(14444005)(446003)(81166006)(70586007)(48376002)(49486002)(2870700001)(316002)(2906002)(47776003)(476003)(2351001)(51416003)(2616005)(356004)(54906003)(36756003)(6666004)(336012)(50226002)(2876002)(6916009)(486006)(1076003)(70206006)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f971ca36-600d-4915-d443-08d71d11ee24
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127298D33B9339B95581A16482D60@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: l9m3FWRdEQr8MjaCUBmgyt5JZw5DahxkHVIpO4EnVFLecGxtt5dMOOYbVG2CNITbMbI385hgafu/lMyerwtwNowNNXdttAeDr9wn+VXPAQO/nSXyfXuCyGTtdV0nWiWBGo3iXioi9WKHFKo5FncSp+OS7hOKtSly6+48yDDKhOTAi8nGiRP3s9uywQwzFyiz8TEaLHGqCZ2B5dISNe1z1mFmhhmnuFpXsnJTQAyKkVbR7p23G+p38LX9Bg8y0SQZcugK+7xVi39xTdczmP7RNSzuhenf2f5cx1y7NfiX4mlPclptDH8xmskIXMInTBFdtjJQ2Q9+/UrSuWYqteJ3bscv0mDe2VRutjo68R2zs5f45001/66fesCGo5iMvi+bCbiKkerlQXWPrVHLiDNUPh+qzvQDACBp2YSPQ3iVzUI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:34.2304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f971ca36-600d-4915-d443-08d71d11ee24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kjgvo8NystD6EsnBj7FNwH44VXz98lR1HFMElZaUuWc=;
 b=FriAPLAC1bznzTcJOACreFhxw3yeqiixl2PyHnordZ97s/wBrUqxbvDmvaSg+5CzH0uS/zv4Cv82JY4VXStIMy/EROZIvkseMrA5yKbNjhipbQ+HPQR5gVPQyg9iS2H+DTnt5tIlp+rBp7eHCZpPiqvkBL+v+QLwcC6AHqSVP94=
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
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KUHJldmlvdXMgImxlc3Mgcmlz
a3kiIGltcGxlbWVuYXRpb24gb2YgMyB0aWVyZWQgZmFsbGJhY2sgaXMgbm8gbG9uZ2VyIG5lY2Vz
c2FyeSBzaW5jZQpETUx2MiBoYXMgZ29uZSB0aHJvdWdoIHByb3BlciB2YWxpZGF0aW9uLiAgdjIg
Y2FuIG5vdyBiZSB1c2VkIGFzIHRoZSBkZWZhdWx0IGFuZCAxCmxldmVsIG9mIGZhbGxiYWNrIGNh
biBiZSByZW1vdmVkCgpbaG93XQpyZW1vdmUgcHJldmlvdXMgd29ya2Fyb3VuZCBpbXBsZW1lbmF0
aW9uCgpTaWduZWQtb2ZmLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBOaWNob2xhcyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+CkFja2Vk
LWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgfCAgMSAtCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAxOSArKystLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGMuaAppbmRleCA5ODI0ZjU1ODlhMGIuLjJkM2NhYTkxZDgyNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTEyMSw3ICsxMjEsNiBAQCBzdHJ1Y3QgZGNf
Y2FwcyB7CiBzdHJ1Y3QgZGNfYnVnX3dhIHsKIAlib29sIG5vX2Nvbm5lY3RfcGh5X2NvbmZpZzsK
IAlib29sIGRlZGNuMjBfMzA1X3dhOwotCXN0cnVjdCBkaXNwbGF5X21vZGVfbGliIGFsdGVybmF0
ZV9kbWw7CiAJYm9vbCBza2lwX2Nsb2NrX3VwZGF0ZTsKIH07CiAjZW5kaWYKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5k
ZXggOTMwYWQ1NGUwZmY2Li4wMmE3NjMzMjEyNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0yNjEwLDcgKzI2
MTAsNyBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRjLCBzdHJ1
Y3QgZGNfc3RhdGUgKmNvbnRleHQsCiAJCWdvdG8gcmVzdG9yZV9kbWxfc3RhdGU7CiAJfQogCi0J
Ly8gRmFsbGJhY2sgIzE6IFRyeSB0byBvbmx5IHN1cHBvcnQgRzYgdGVtcGVyYXR1cmUgcmVhZCBs
YXRlbmN5CisJLy8gRmFsbGJhY2s6IFRyeSB0byBvbmx5IHN1cHBvcnQgRzYgdGVtcGVyYXR1cmUg
cmVhZCBsYXRlbmN5CiAJY29udGV4dC0+YndfY3R4LmRtbC5zb2MuZHJhbV9jbG9ja19jaGFuZ2Vf
bGF0ZW5jeV91cyA9IGNvbnRleHQtPmJ3X2N0eC5kbWwuc29jLmR1bW15X3BzdGF0ZV9sYXRlbmN5
X3VzOwogCiAJdm9sdGFnZV9zdXBwb3J0ZWQgPSBkY24yMF92YWxpZGF0ZV9iYW5kd2lkdGhfaW50
ZXJuYWwoZGMsIGNvbnRleHQsIGZhbHNlKTsKQEAgLTI2MjEsMTkgKzI2MjEsNyBAQCBib29sIGRj
bjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNfc3RhdGUgKmNv
bnRleHQsCiAJCWdvdG8gcmVzdG9yZV9kbWxfc3RhdGU7CiAJfQogCi0JLy8gRmFsbGJhY2sgIzI6
IFJldHJ5IHdpdGggIm5ldyIgRENOMjAgdG8gc3VwcG9ydCBHNiB0ZW1wZXJhdHVyZSByZWFkIGxh
dGVuY3kKLQltZW1jcHkgKCZjb250ZXh0LT5id19jdHguZG1sLCAmZGMtPndvcmtfYXJvdW5kcy5h
bHRlcm5hdGVfZG1sLCBzaXplb2YgKHN0cnVjdCBkaXNwbGF5X21vZGVfbGliKSk7Ci0JY29udGV4
dC0+YndfY3R4LmRtbC5zb2MuZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV91cyA9IGNvbnRleHQt
PmJ3X2N0eC5kbWwuc29jLmR1bW15X3BzdGF0ZV9sYXRlbmN5X3VzOwotCi0Jdm9sdGFnZV9zdXBw
b3J0ZWQgPSBkY24yMF92YWxpZGF0ZV9iYW5kd2lkdGhfaW50ZXJuYWwoZGMsIGNvbnRleHQsIGZh
bHNlKTsKLQlkdW1teV9wc3RhdGVfc3VwcG9ydGVkID0gY29udGV4dC0+YndfY3R4LmJ3LmRjbi5j
bGsucF9zdGF0ZV9jaGFuZ2Vfc3VwcG9ydDsKLQotCWlmICh2b2x0YWdlX3N1cHBvcnRlZCAmJiBk
dW1teV9wc3RhdGVfc3VwcG9ydGVkKSB7Ci0JCWNvbnRleHQtPmJ3X2N0eC5idy5kY24uY2xrLnBf
c3RhdGVfY2hhbmdlX3N1cHBvcnQgPSBmYWxzZTsKLQkJZ290byByZXN0b3JlX2RtbF9zdGF0ZTsK
LQl9Ci0KLQkvLyBFUlJPUjogZmFsbGJhY2sgIzIgaXMgc3VwcG9zZWQgdG8gYWx3YXlzIHdvcmsu
CisJLy8gRVJST1I6IGZhbGxiYWNrIGlzIHN1cHBvc2VkIHRvIGFsd2F5cyB3b3JrLgogCUFTU0VS
VChmYWxzZSk7CiAKIHJlc3RvcmVfZG1sX3N0YXRlOgpAQCAtMzIzOCw4ICszMjI2LDcgQEAgc3Rh
dGljIGJvb2wgY29uc3RydWN0KAogCQlnb3RvIGNyZWF0ZV9mYWlsOwogCX0KIAotCWRtbF9pbml0
X2luc3RhbmNlKCZkYy0+ZG1sLCAmZGNuMl8wX3NvYywgJmRjbjJfMF9pcCwgRE1MX1BST0pFQ1Rf
TkFWSTEwKTsKLQlkbWxfaW5pdF9pbnN0YW5jZSgmZGMtPndvcmtfYXJvdW5kcy5hbHRlcm5hdGVf
ZG1sLCAmZGNuMl8wX3NvYywgJmRjbjJfMF9pcCwgRE1MX1BST0pFQ1RfTkFWSTEwdjIpOworCWRt
bF9pbml0X2luc3RhbmNlKCZkYy0+ZG1sLCAmZGNuMl8wX3NvYywgJmRjbjJfMF9pcCwgRE1MX1BS
T0pFQ1RfTkFWSTEwdjIpOwogCiAJaWYgKCFkYy0+ZGVidWcuZGlzYWJsZV9wcGxpYl93bV9yYW5n
ZSkgewogCQlzdHJ1Y3QgcHBfc211X3dtX3JhbmdlX3NldHMgcmFuZ2VzID0gezB9OwotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
