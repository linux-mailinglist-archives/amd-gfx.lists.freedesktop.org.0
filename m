Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111FDB745
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA406EAD5;
	Thu, 17 Oct 2019 19:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730060.outbound.protection.outlook.com [40.107.73.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BA16EABF
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvUD7hKufMBezyRHoKd67EMIIld+NEvKOkGFu/Ix4a/i2Pn3I/iYeS6gvfDtvkBgeA4IjVJ38wUjodjEReWEe7YlfMVAdde2QnOwMhUVTJxtMVxBddGk7kIzTTwWVIQ6KjMwIAGRAE3zMmB7wVZMVB9y+gp7vztREm5PUAyr92rRQOudB6h6Off39xrYzom6K1/tiRr7+N3+tp5A7dpdg67QUr1CeDOWXgmi6Z3vhUezNvTaBLvxXw91DdEd12PRR97GRLdpH81hvvbiMDaMoOPfWqucTJ0v8aLnclHHEFg2gH7VptmRmsCiQQ0hDMdgUXdmwUt3vgNxxdE0e8shfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5r1tlsoDz9funNxkN8RvoDSD9My25uFM3BHyJd/M/Y=;
 b=FM0MJKWic/niDvWjVBX6O4XlRQvN/R5mJL0eT8hA+SnrwsNlbdXtJ3LA9KJkCJXofkaMj/qbiZQAjfJWmAXmCMDosoKrZnwA2LvcPU3CgMt/S/OHybsaRwg51YOlIV2oAc1g22OY+cmzaNjEOadI7Q6ly1+cnfliSDDZUlTCmudI5OG95EN4DPaR53E7NMWecwZO2EXDcZYmefRNNiDL1p7IRNCyWF+Iq5fpkPIJ+kJbSVHzE3YckNvJmSWrdmofFIjHz/hKzSErMdMVmWfyVsT51kObjapisJ329Hcg5+561MkOi+3wnFfM8S2J4dQabAs8sMUv7WwrY3BC/vqvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by BYAPR12MB3591.namprd12.prod.outlook.com (2603:10b6:a03:dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23; Thu, 17 Oct
 2019 19:15:52 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:52 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:48 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:48 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 28/37] drm/amd/display: move wm ranges reporting to end of
 init hw
Date: Thu, 17 Oct 2019 15:13:20 -0400
Message-ID: <20191017191329.11857-29-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(428003)(199004)(189003)(81156014)(478600001)(50466002)(8936002)(50226002)(5660300002)(54906003)(186003)(26005)(14444005)(8676002)(81166006)(70206006)(6916009)(86362001)(36756003)(70586007)(305945005)(1076003)(486006)(6666004)(336012)(476003)(356004)(2616005)(126002)(47776003)(51416003)(11346002)(446003)(2876002)(2351001)(48376002)(316002)(4326008)(2870700001)(426003)(76176011)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3591; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d450978d-0705-4f90-6612-08d753366d46
X-MS-TrafficTypeDiagnostic: BYAPR12MB3591:
X-Microsoft-Antispam-PRVS: <BYAPR12MB35918982D82A22B036E4AB90826D0@BYAPR12MB3591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYALxCYlN8ZsgQJNN/rvP5AJbXdAzaizcL3880armlJWunRtuU3XK88UUrU63vo5EUkr3XKqSlLacbjHwUNznB1rA7fuUjnzj77rHHYTyZk5CQQvf4Qayyc+JqItzih13oJrmUeJu2xNaGoiyuRFTdqevL/lDi+XVVsLa8K471PGxFe5Q67YGa+cW1Oetkmi0yDhLVxWmlKWlTuD3O26KQ4Z//iKduJlkw0vHWBkPY7SdCg23qbHdQO+uUzcrxSIkP0bBqAwWlt2VleSnjZT0BpT99NlTkRI6IK17zD/M5nJSxT1lI4pXeISZIA9UZNMB9SfZHAzyLDDgVQKO4fJxQ15Lxl+tkB5TmltdmFKICYZKE4sDwKcieqyuFklTGqlf6DyXJ+IdaGpH+PIufHMkQvmIr7/czmlMgVJy9pMd/Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:52.1593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d450978d-0705-4f90-6612-08d753366d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3591
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5r1tlsoDz9funNxkN8RvoDSD9My25uFM3BHyJd/M/Y=;
 b=FJQqfe2JUA911SkleTGFjpmKmMALjMN6tZLWF8wMCbhbnPXx3CF6ldk+OWb8glX39LfzzFtfwIeV+z7Zro+UrIqVzJGciLKlxFZB0yW3lG6RgKWq41dFfqdJJXox7z4bXH2BF2BzxWt7p5WFfRWki5NFSn1ca28d1ClmvRMtaFo=
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
Cc: Leo Li <sunpeng.li@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpTTVUgZG9lcyBub3Qg
a2VlcCB0aGUgd20gdGFibGUgYWNyb3NzIFMzLCBTNCwgbmVlZCB0byByZS1zZW5kCnRoZSB0YWJs
ZS4gQWxzbyBkZWZlciBzZW5kaW5nIHRoZSBjYWJsZSB0byBhZnRlciBEQ04gYmF2ZSBpbml0aWFs
aXplZAoKW0hvd10KU2VuZCB0YWJsZSBhdCBlbmQgb2YgaW5pdCBodwoKU2lnbmVkLW9mZi1ieTog
RXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBZb25ncWlhbmcgU3Vu
IDx5b25ncWlhbmcuc3VuQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1k
LmNvbT4KLS0tCiAuLi4vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyLmMg
fCAxNDkgKysrKysrKysrLS0tLS0tLS0tCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBf
aHdfc2VxdWVuY2VyLmMgfCAgIDQgKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3
L2Nsa19tZ3IuaCAgIHwgICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKSwg
NzMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jCmluZGV4IGU4YjhlZTRmMWIxZS4uZjY0
ZDIyMWFkNmYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xr
X21nci9kY24yMS9ybl9jbGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jCkBAIC0zOTYsMTIgKzM5Niw4NyBAQCB2b2lk
IHJuX2luaXRfY2xvY2tzKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyKQogCWNsa19tZ3ItPmNsa3Mu
cHdyX3N0YXRlID0gRENOX1BXUl9TVEFURV9VTktOT1dOOwogfQogCit2b2lkIGJ1aWxkX3dhdGVy
bWFya19yYW5nZXMoc3RydWN0IGNsa19id19wYXJhbXMgKmJ3X3BhcmFtcywgc3RydWN0IHBwX3Nt
dV93bV9yYW5nZV9zZXRzICpyYW5nZXMpCit7CisJaW50IGksIG51bV92YWxpZF9zZXRzOworCisJ
bnVtX3ZhbGlkX3NldHMgPSAwOworCisJZm9yIChpID0gMDsgaSA8IFdNX1NFVF9DT1VOVDsgaSsr
KSB7CisJCS8qIHNraXAgZW1wdHkgZW50cmllcywgdGhlIHNtdSBhcnJheSBoYXMgbm8gaG9sZXMq
LworCQlpZiAoIWJ3X3BhcmFtcy0+d21fdGFibGUuZW50cmllc1tpXS52YWxpZCkKKwkJCWNvbnRp
bnVlOworCisJCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLndtX2luc3Qg
PSBid19wYXJhbXMtPndtX3RhYmxlLmVudHJpZXNbaV0ud21faW5zdDsKKwkJcmFuZ2VzLT5yZWFk
ZXJfd21fc2V0c1tudW1fdmFsaWRfc2V0c10ud21fdHlwZSA9IGJ3X3BhcmFtcy0+d21fdGFibGUu
ZW50cmllc1tpXS53bV90eXBlOzsKKwkJLyogV2Ugd2lsbCBub3Qgc2VsZWN0IFdNIGJhc2VkIG9u
IGRjZmNsaywgc28gbGVhdmUgaXQgYXMgdW5jb25zdHJhaW5lZCAqLworCQlyYW5nZXMtPnJlYWRl
cl93bV9zZXRzW251bV92YWxpZF9zZXRzXS5taW5fZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9T
RVRfUkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUlOOworCQlyYW5nZXMtPnJlYWRlcl93bV9zZXRz
W251bV92YWxpZF9zZXRzXS5tYXhfZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9TRVRfUkFOR0Vf
Q0xLX1VOQ09OU1RSQUlORURfTUFYOworCQkvKiBmY2xrIHdpbCBiZSB1c2VkIHRvIHNlbGVjdCBX
TSovCisKKwkJaWYgKHJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLndtX3R5
cGUgPT0gV01fVFlQRV9QU1RBVEVfQ0hHKSB7CisJCQlpZiAoaSA9PSAwKQorCQkJCXJhbmdlcy0+
cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1pbl9maWxsX2Nsa19taHogPSAwOworCQkJ
ZWxzZSB7CisJCQkJLyogYWRkIDEgdG8gbWFrZSBpdCBub24tb3ZlcmxhcHBpbmcgd2l0aCBuZXh0
IGx2bCAqLworCQkJCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1pbl9m
aWxsX2Nsa19taHogPSBid19wYXJhbXMtPmNsa190YWJsZS5lbnRyaWVzW2kgLSAxXS5mY2xrX21o
eiArIDE7CisJCQl9CisJCQlyYW5nZXMtPnJlYWRlcl93bV9zZXRzW251bV92YWxpZF9zZXRzXS5t
YXhfZmlsbF9jbGtfbWh6ID0gYndfcGFyYW1zLT5jbGtfdGFibGUuZW50cmllc1tpXS5mY2xrX21o
ejsKKworCQl9IGVsc2UgeworCQkJLyogdW5jb25zdHJhaW5lZCBmb3IgbWVtb3J5IHJldHJhaW5p
bmcgKi8KKwkJCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1pbl9maWxs
X2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01JTjsKKwkJ
CXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1heF9maWxsX2Nsa19taHog
PSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01BWDsKKworCQkJLyogTW9k
aWZ5IHByZXZpb3VzIHdhdGVybWFyayByYW5nZSB0byBjb3ZlciB1cCB0byBtYXggKi8KKwkJCXJh
bmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHMgLSAxXS5tYXhfZmlsbF9jbGtfbWh6
ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJBSU5FRF9NQVg7CisJCX0KKwkJbnVt
X3ZhbGlkX3NldHMrKzsKKwl9CisKKwlBU1NFUlQobnVtX3ZhbGlkX3NldHMgIT0gMCk7IC8qIE11
c3QgaGF2ZSBhdCBsZWFzdCBvbmUgc2V0IG9mIHZhbGlkIHdhdGVybWFya3MgKi8KKwlyYW5nZXMt
Pm51bV9yZWFkZXJfd21fc2V0cyA9IG51bV92YWxpZF9zZXRzOworCisJLyogbW9kaWZ5IHRoZSBt
aW4gYW5kIG1heCB0byBtYWtlIHN1cmUgd2UgY292ZXIgdGhlIHdob2xlIHJhbmdlKi8KKwlyYW5n
ZXMtPnJlYWRlcl93bV9zZXRzWzBdLm1pbl9kcmFpbl9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9S
QU5HRV9DTEtfVU5DT05TVFJBSU5FRF9NSU47CisJcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1swXS5t
aW5fZmlsbF9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJBSU5FRF9N
SU47CisJcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1tyYW5nZXMtPm51bV9yZWFkZXJfd21fc2V0cyAt
IDFdLm1heF9kcmFpbl9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJB
SU5FRF9NQVg7CisJcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1tyYW5nZXMtPm51bV9yZWFkZXJfd21f
c2V0cyAtIDFdLm1heF9maWxsX2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNP
TlNUUkFJTkVEX01BWDsKKworCS8qIFRoaXMgaXMgZm9yIHdyaXRlYmFjayBvbmx5LCBkb2VzIG5v
dCBtYXR0ZXIgY3VycmVudGx5IGFzIG5vIHdyaXRlYmFjayBzdXBwb3J0Ki8KKwlyYW5nZXMtPm51
bV93cml0ZXJfd21fc2V0cyA9IDE7CisJcmFuZ2VzLT53cml0ZXJfd21fc2V0c1swXS53bV9pbnN0
ID0gV01fQTsKKwlyYW5nZXMtPndyaXRlcl93bV9zZXRzWzBdLm1pbl9maWxsX2Nsa19taHogPSBQ
UF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01JTjsKKwlyYW5nZXMtPndyaXRl
cl93bV9zZXRzWzBdLm1heF9maWxsX2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19V
TkNPTlNUUkFJTkVEX01BWDsKKwlyYW5nZXMtPndyaXRlcl93bV9zZXRzWzBdLm1pbl9kcmFpbl9j
bGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJBSU5FRF9NSU47CisJcmFu
Z2VzLT53cml0ZXJfd21fc2V0c1swXS5tYXhfZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9TRVRf
UkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUFYOworCit9CisKK3N0YXRpYyB2b2lkIHJuX25vdGlm
eV93bV9yYW5nZXMoc3RydWN0IGNsa19tZ3IgKmNsa19tZ3JfYmFzZSkKK3sKKwlzdHJ1Y3QgZGNf
ZGVidWdfb3B0aW9ucyAqZGVidWcgPSAmY2xrX21ncl9iYXNlLT5jdHgtPmRjLT5kZWJ1ZzsKKwlz
dHJ1Y3QgcHBfc211X3dtX3JhbmdlX3NldHMgcmFuZ2VzID0gezB9OworCXN0cnVjdCBjbGtfbWdy
X2ludGVybmFsICpjbGtfbWdyID0gVE9fQ0xLX01HUl9JTlRFUk5BTChjbGtfbWdyX2Jhc2UpOwor
CXN0cnVjdCBwcF9zbXVfZnVuY3MgKnBwX3NtdSA9IGNsa19tZ3ItPnBwX3NtdTsKKworCWlmICgh
ZGVidWctPmRpc2FibGVfcHBsaWJfd21fcmFuZ2UpIHsKKwkJYnVpbGRfd2F0ZXJtYXJrX3Jhbmdl
cyhjbGtfbWdyX2Jhc2UtPmJ3X3BhcmFtcywgJnJhbmdlcyk7CisKKwkJLyogTm90aWZ5IFBQIExp
Yi9TTVUgd2hpY2ggV2F0ZXJtYXJrcyB0byB1c2UgZm9yIHdoaWNoIGNsb2NrIHJhbmdlcyAqLwor
CQlpZiAocHBfc211ICYmIHBwX3NtdS0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcykKKwkJCXBwX3Nt
dS0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcygmcHBfc211LT5ybl9mdW5jcy5wcF9zbXUsICZyYW5n
ZXMpOworCX0KKworfQorCiBzdGF0aWMgc3RydWN0IGNsa19tZ3JfZnVuY3MgZGNuMjFfZnVuY3Mg
PSB7CiAJLmdldF9kcF9yZWZfY2xrX2ZyZXF1ZW5jeSA9IGRjZTEyX2dldF9kcF9yZWZfZnJlcV9r
aHosCiAJLnVwZGF0ZV9jbG9ja3MgPSBybl91cGRhdGVfY2xvY2tzLAogCS5pbml0X2Nsb2NrcyA9
IHJuX2luaXRfY2xvY2tzLAogCS5lbmFibGVfcG1lX3dhID0gcm5fZW5hYmxlX3BtZV93YSwKLQkv
KiAuZHVtcF9jbGtfcmVnaXN0ZXJzID0gcm5fZHVtcF9jbGtfcmVnaXN0ZXJzICovCisJLyogLmR1
bXBfY2xrX3JlZ2lzdGVycyA9IHJuX2R1bXBfY2xrX3JlZ2lzdGVycywgKi8KKwkubm90aWZ5X3dt
X3JhbmdlcyA9IHJuX25vdGlmeV93bV9yYW5nZXMKIH07CiAKIHN0cnVjdCBjbGtfYndfcGFyYW1z
IHJuX2J3X3BhcmFtcyA9IHsKQEAgLTQ3Miw2MyArNTQ3LDYgQEAgc3RydWN0IGNsa19id19wYXJh
bXMgcm5fYndfcGFyYW1zID0gewogCX0KIH07CiAKLXN0YXRpYyB2b2lkIHJuX2J1aWxkX3dhdGVy
bWFya19yYW5nZXMoc3RydWN0IGNsa19id19wYXJhbXMgKmJ3X3BhcmFtcywgc3RydWN0IHBwX3Nt
dV93bV9yYW5nZV9zZXRzICpyYW5nZXMpCi17Ci0JaW50IGksIG51bV92YWxpZF9zZXRzOwotCi0J
bnVtX3ZhbGlkX3NldHMgPSAwOwotCi0JZm9yIChpID0gMDsgaSA8IFdNX1NFVF9DT1VOVDsgaSsr
KSB7Ci0JCS8qIHNraXAgZW1wdHkgZW50cmllcywgdGhlIHNtdSBhcnJheSBoYXMgbm8gaG9sZXMq
LwotCQlpZiAoIWJ3X3BhcmFtcy0+d21fdGFibGUuZW50cmllc1tpXS52YWxpZCkKLQkJCWNvbnRp
bnVlOwotCi0JCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLndtX2luc3Qg
PSBid19wYXJhbXMtPndtX3RhYmxlLmVudHJpZXNbaV0ud21faW5zdDsKLQkJcmFuZ2VzLT5yZWFk
ZXJfd21fc2V0c1tudW1fdmFsaWRfc2V0c10ud21fdHlwZSA9IGJ3X3BhcmFtcy0+d21fdGFibGUu
ZW50cmllc1tpXS53bV90eXBlOzsKLQkJLyogV2Ugd2lsbCBub3Qgc2VsZWN0IFdNIGJhc2VkIG9u
IGRjZmNsaywgc28gbGVhdmUgaXQgYXMgdW5jb25zdHJhaW5lZCAqLwotCQlyYW5nZXMtPnJlYWRl
cl93bV9zZXRzW251bV92YWxpZF9zZXRzXS5taW5fZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9T
RVRfUkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUlOOwotCQlyYW5nZXMtPnJlYWRlcl93bV9zZXRz
W251bV92YWxpZF9zZXRzXS5tYXhfZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9TRVRfUkFOR0Vf
Q0xLX1VOQ09OU1RSQUlORURfTUFYOwotCQkvKiBmY2xrIHdpbCBiZSB1c2VkIHRvIHNlbGVjdCBX
TSovCi0KLQkJaWYgKHJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLndtX3R5
cGUgPT0gV01fVFlQRV9QU1RBVEVfQ0hHKSB7Ci0JCQlpZiAoaSA9PSAwKQotCQkJCXJhbmdlcy0+
cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1pbl9maWxsX2Nsa19taHogPSAwOwotCQkJ
ZWxzZSB7Ci0JCQkJLyogYWRkIDEgdG8gbWFrZSBpdCBub24tb3ZlcmxhcHBpbmcgd2l0aCBuZXh0
IGx2bCAqLwotCQkJCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1pbl9m
aWxsX2Nsa19taHogPSBid19wYXJhbXMtPmNsa190YWJsZS5lbnRyaWVzW2kgLSAxXS5mY2xrX21o
eiArIDE7Ci0JCQl9Ci0JCQlyYW5nZXMtPnJlYWRlcl93bV9zZXRzW251bV92YWxpZF9zZXRzXS5t
YXhfZmlsbF9jbGtfbWh6ID0gYndfcGFyYW1zLT5jbGtfdGFibGUuZW50cmllc1tpXS5mY2xrX21o
ejsKLQotCQl9IGVsc2UgewotCQkJLyogdW5jb25zdHJhaW5lZCBmb3IgbWVtb3J5IHJldHJhaW5p
bmcgKi8KLQkJCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1pbl9maWxs
X2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01JTjsKLQkJ
CXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHNdLm1heF9maWxsX2Nsa19taHog
PSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01BWDsKLQotCQkJLyogTW9k
aWZ5IHByZXZpb3VzIHdhdGVybWFyayByYW5nZSB0byBjb3ZlciB1cCB0byBtYXggKi8KLQkJCXJh
bmdlcy0+cmVhZGVyX3dtX3NldHNbbnVtX3ZhbGlkX3NldHMgLSAxXS5tYXhfZmlsbF9jbGtfbWh6
ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJBSU5FRF9NQVg7Ci0JCX0KLQkJbnVt
X3ZhbGlkX3NldHMrKzsKLQl9Ci0KLQlBU1NFUlQobnVtX3ZhbGlkX3NldHMgIT0gMCk7IC8qIE11
c3QgaGF2ZSBhdCBsZWFzdCBvbmUgc2V0IG9mIHZhbGlkIHdhdGVybWFya3MgKi8KLQlyYW5nZXMt
Pm51bV9yZWFkZXJfd21fc2V0cyA9IG51bV92YWxpZF9zZXRzOwotCi0JLyogbW9kaWZ5IHRoZSBt
aW4gYW5kIG1heCB0byBtYWtlIHN1cmUgd2UgY292ZXIgdGhlIHdob2xlIHJhbmdlKi8KLQlyYW5n
ZXMtPnJlYWRlcl93bV9zZXRzWzBdLm1pbl9kcmFpbl9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9S
QU5HRV9DTEtfVU5DT05TVFJBSU5FRF9NSU47Ci0JcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1swXS5t
aW5fZmlsbF9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJBSU5FRF9N
SU47Ci0JcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1tyYW5nZXMtPm51bV9yZWFkZXJfd21fc2V0cyAt
IDFdLm1heF9kcmFpbl9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJB
SU5FRF9NQVg7Ci0JcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1tyYW5nZXMtPm51bV9yZWFkZXJfd21f
c2V0cyAtIDFdLm1heF9maWxsX2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNP
TlNUUkFJTkVEX01BWDsKLQotCS8qIFRoaXMgaXMgZm9yIHdyaXRlYmFjayBvbmx5LCBkb2VzIG5v
dCBtYXR0ZXIgY3VycmVudGx5IGFzIG5vIHdyaXRlYmFjayBzdXBwb3J0Ki8KLQlyYW5nZXMtPm51
bV93cml0ZXJfd21fc2V0cyA9IDE7Ci0JcmFuZ2VzLT53cml0ZXJfd21fc2V0c1swXS53bV9pbnN0
ID0gV01fQTsKLQlyYW5nZXMtPndyaXRlcl93bV9zZXRzWzBdLm1pbl9maWxsX2Nsa19taHogPSBQ
UF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01JTjsKLQlyYW5nZXMtPndyaXRl
cl93bV9zZXRzWzBdLm1heF9maWxsX2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19V
TkNPTlNUUkFJTkVEX01BWDsKLQlyYW5nZXMtPndyaXRlcl93bV9zZXRzWzBdLm1pbl9kcmFpbl9j
bGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05TVFJBSU5FRF9NSU47Ci0JcmFu
Z2VzLT53cml0ZXJfd21fc2V0c1swXS5tYXhfZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9TRVRf
UkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUFYOwotCi19Ci0KIHN0YXRpYyB1bnNpZ25lZCBpbnQg
ZmluZF9kY2ZjbGtfZm9yX3ZvbHRhZ2Uoc3RydWN0IGRwbV9jbG9ja3MgKmNsb2NrX3RhYmxlLCB1
bnNpZ25lZCBpbnQgdm9sdGFnZSkKIHsKIAlpbnQgaTsKQEAgLTY2MSwyMSArNjc5LDYgQEAgdm9p
ZCBybl9jbGtfbWdyX2NvbnN0cnVjdCgKIAkJcm5fY2xrX21ncl9oZWxwZXJfcG9wdWxhdGVfYndf
cGFyYW1zKGNsa19tZ3ItPmJhc2UuYndfcGFyYW1zLCAmY2xvY2tfdGFibGUsICZjdHgtPmFzaWNf
aWQpOwogCX0KIAotCS8qCi0JICogTm90aWZ5IFNNVSB3aGljaCBzZXQgb2YgV00gc2hvdWxkIGJl
IHNlbGVjdGVkIGZvciBkaWZmZXJlbnQgcmFuZ2VzIG9mIGZjbGsKLQkgKiBPbiBSZW5vaXIgdGhl
cmUgaXMgYSBtYXhpbXVtdW0gb2YgNCBERiBwc3RhdGVzIHN1cHBvcnRlZCwgY291bGQgYmUgbGVz
cwotCSAqIGRlcGVuZGluZyBvbiBERFIgc3BlZWQgYW5kIGZ1c2VkIG1heGltdW0gZmNsay4KLQkg
Ki8KLQlpZiAoIWRlYnVnLT5kaXNhYmxlX3BwbGliX3dtX3JhbmdlKSB7Ci0JCXN0cnVjdCBwcF9z
bXVfd21fcmFuZ2Vfc2V0cyByYW5nZXMgPSB7MH07Ci0KLQkJcm5fYnVpbGRfd2F0ZXJtYXJrX3Jh
bmdlcyhjbGtfbWdyLT5iYXNlLmJ3X3BhcmFtcywgJnJhbmdlcyk7Ci0KLQkJLyogTm90aWZ5IFBQ
IExpYi9TTVUgd2hpY2ggV2F0ZXJtYXJrcyB0byB1c2UgZm9yIHdoaWNoIGNsb2NrIHJhbmdlcyAq
LwotCQlpZiAocHBfc211ICYmIHBwX3NtdS0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcykKLQkJCXBw
X3NtdS0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcygmcHBfc211LT5ybl9mdW5jcy5wcF9zbXUsICZy
YW5nZXMpOwotCX0KLQogCWlmICghSVNfRlBHQV9NQVhJTVVTX0RDKGN0eC0+ZGNlX2Vudmlyb25t
ZW50KSAmJiBjbGtfbWdyLT5zbXVfdmVyID49IDB4MDAzNzE1MDApIHsKIAkJLyogZW5hYmxlIHBv
d2VyZmVhdHVyZXMgd2hlbiBkaXNwbGF5Y291bnQgZ29lcyB0byAwICovCiAJCXJuX3ZiaW9zX3Nt
dV9lbmFibGVfNDhtaHpfdG1kcF9yZWZjbGtfcHdyZHduKGNsa19tZ3IsICFkZWJ1Zy0+ZGlzYWJs
ZV80OG1oel9wd3Jkd24pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCmluZGV4IGRmMWJlOGFkYTY2ZC4uZWI5
MTQzMjYyMWFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBAIC0xMzA0LDYgKzEzMDQsMTAgQEAgc3Rh
dGljIHZvaWQgZGNuMTBfaW5pdF9odyhzdHJ1Y3QgZGMgKmRjKQogCX0KIAogCWRjLT5od3NzLmVu
YWJsZV9wb3dlcl9nYXRpbmdfcGxhbmUoZGMtPmh3c2VxLCB0cnVlKTsKKworCWlmIChkYy0+Y2xr
X21nci0+ZnVuY3MtPm5vdGlmeV93bV9yYW5nZXMpCisJCWRjLT5jbGtfbWdyLT5mdW5jcy0+bm90
aWZ5X3dtX3JhbmdlcyhkYy0+Y2xrX21ncik7CisKIH0KIAogc3RhdGljIHZvaWQgZGNuMTBfcmVz
ZXRfaHdfY3R4X3dyYXAoCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvaW5jL2h3L2Nsa19tZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMv
aHcvY2xrX21nci5oCmluZGV4IGRhNDM1MjNhN2JmZS4uNGUxOGU3N2RjZjQyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3IuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3IuaApAQCAtMTgzLDYg
KzE4Myw3IEBAIHN0cnVjdCBjbGtfbWdyX2Z1bmNzIHsKIAogCWJvb2wgKCphcmVfY2xvY2tfc3Rh
dGVzX2VxdWFsKSAoc3RydWN0IGRjX2Nsb2NrcyAqYSwKIAkJCXN0cnVjdCBkY19jbG9ja3MgKmIp
OworCXZvaWQgKCpub3RpZnlfd21fcmFuZ2VzKShzdHJ1Y3QgY2xrX21nciAqY2xrX21ncik7CiB9
OwogCiBzdHJ1Y3QgY2xrX21nciB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
