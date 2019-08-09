Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046388508
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770346EEC1;
	Fri,  9 Aug 2019 21:38:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58436EEBB
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJVr7nKB+WQr1Aginlt9z4//Vs8IQSo+PSkbpe4Z4LvmZyDUciyi1WXSQ9DdUuttOdwhHuu6k2ZyPgi4x/PbXSsWJ27gBgl2yQZCV5XsYMjbwRLivbEVcytJd5DiKt7JumvubTf/zgRd/3hzrHREbLIXaomVVWqA2JooQr41UfkEnIdfjEbEH5wrWYOsWQGO8EdZ0vYVOPvoWBIeWmo2lxk+NGhtNnXvEqQCDSlY0MSpStTPcV3dM1LLggz/SMR6+K94xXE8y9eml6ibyghVZVFx9MvtKnDn87Zblrl6FR+z2SFK9NM6KTTvWvt/uoA9S3hnCdFBOxJZ9sYelH6cbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPKIhchRWJW2BDpuDqu6MfbJ0JumasT5P5HuDVs8cC8=;
 b=nmXkfSp+mq/aOKNUkHgoPJZq4Kr2XQ8gDsfeASh1XpNBWTRLonp3CYc7HJipOWy/Ysfr2oIjZgmHkiMoAwEeV40e+EheQ1IkAWishBK0ciEVem2mGBh1SjgDwErmWsDDIwwrmxQgljkhlRTiladJoF6qJ1c2Hg8ZIHqebuXZMv1ejmzpi9+IEyYvd1QeUN9iRyx4ECWs0b85UviAoR3qSu15AgfiK09NRjWj6mnwwB695PMxiB7UitOYTTikWPXr62v21dbaNi1FciYNr4m0Vs7pZ+wv7D/IK3Ou+jd6nz8jV0cZVXdsSR5NZsMWXROHQINSe6sxAORf0wcY7q+psw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) by DM5PR12MB1274.namprd12.prod.outlook.com
 (2603:10b6:3:78::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Fri, 9 Aug
 2019 21:38:44 +0000
Received: from DM3NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by BN6PR1201CA0005.outlook.office365.com
 (2603:10b6:405:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT003.mail.protection.outlook.com (10.152.82.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:43 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:39 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 31/49] drm/amd/display: Remove 4:2:2 DSC support
Date: Fri, 9 Aug 2019 17:37:24 -0400
Message-ID: <20190809213742.30301-32-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(189003)(199004)(36756003)(50226002)(1076003)(70586007)(2616005)(54906003)(26005)(86362001)(126002)(11346002)(6666004)(486006)(476003)(356004)(70206006)(49486002)(8676002)(5660300002)(446003)(305945005)(14444005)(316002)(81156014)(2351001)(81166006)(76176011)(478600001)(8936002)(186003)(51416003)(426003)(2870700001)(50466002)(4326008)(47776003)(6916009)(336012)(2876002)(48376002)(2906002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1274; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 268ef64f-65b4-4e68-8c61-08d71d11f3a9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1274; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1274:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12745FA7C1ECB1132EBFF16D82D60@DM5PR12MB1274.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: M3rxFoT8tu1zheu1Rg1+KKGdPR3vWCnEWa+oQjmrguPbwq5OPQ6omiRsR95Z+KMUUPj71BTjNwe9X2St5tQuQ0nWxqpR4sZMHyPlbns5JsxWthLAb0dzASkHS++ylZ3AJJ22ATjMBJfANydLXrquAPmBL7moLqpSAcOaONQsBtYGU/oWnKtoct+bZkM7XPixC5lel/9XwzdJNsobyrE5Fyag9/kGigK8InXrMcgXGY3ShgmwNtYIRs75oVG7LwGshjk7iZKWzkJuvznvAa/JjKTBqLLn773NqgfPSk3b7RiDkAOIW/SJaKJ3TjfcTEbKsW3viQ2fIyGRE6R4ro2msSWY/37ZCyzxN3QwbnxZTUMPTYazyzABytrMTlfUzL+XLXzDrql33XTD9Zem8OrlyNghSgfh3wNDGRn3wPAONBU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:43.4838 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 268ef64f-65b4-4e68-8c61-08d71d11f3a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPKIhchRWJW2BDpuDqu6MfbJ0JumasT5P5HuDVs8cC8=;
 b=V21XZha1rnyDW4Ka6KYIeoLmWzHdDD3/c9iJIPRu5BWTyYkCOMSaPEnMfLG82zcJxvqeho0mQslz8TVhl+ZRS3y8vDtLOt+W9kx6sqEubHFv2qrFuueZFoFX/T5kgGYLy8pQaALYkyl7TVjwc0pnjkgzkAVs0Q/CBTo1BKNnNek=
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
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KSWYgRFND
IGlzIGF2YWlsYWJsZSwgYSBoaWdoZXIgcGljdHVyZSBxdWFsaXR5IGlzIGFjaGlldmVkIGJ5IHVz
aW5nCkRTQyB3aXRoIDQ6NDo0IGZvcm1hdC4gVXNpbmcgNDoyOjIgaW5zdGVhZCBkb2VzIG5vdCBv
ZmZlciBhbnkgYmVuZWZpdAphbmQgd291bGQgb25seSBpbnRyb2R1Y2UgbG9zcyBvZiBxdWFsaXR5
LiBSZW1vdmluZyBpdCByZWR1Y2VzCm1haW50ZW5hbmNlIGFuZCB0ZXN0aW5nIGVmZm9ydC4KClNp
Z25lZC1vZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVu
Zy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9kc2MuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfZHNjLmMKaW5kZXggZTRkMTg0Y2RlYTgyLi4xNDI3MGE5OGM5NmQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKQEAgLTExOCw4
ICsxMTgsOCBAQCBzdGF0aWMgdm9pZCBkc2MyX2dldF9lbmNfY2FwcyhzdHJ1Y3QgZHNjX2VuY19j
YXBzICpkc2NfZW5jX2NhcHMsIGludCBwaXhlbF9jbG9jawogCiAJZHNjX2VuY19jYXBzLT5jb2xv
cl9mb3JtYXRzLmJpdHMuUkdCID0gMTsKIAlkc2NfZW5jX2NhcHMtPmNvbG9yX2Zvcm1hdHMuYml0
cy5ZQ0JDUl80NDQgPSAxOwotCWRzY19lbmNfY2Fwcy0+Y29sb3JfZm9ybWF0cy5iaXRzLllDQkNS
X1NJTVBMRV80MjIgPSAxOwotCWRzY19lbmNfY2Fwcy0+Y29sb3JfZm9ybWF0cy5iaXRzLllDQkNS
X05BVElWRV80MjIgPSAxOworCWRzY19lbmNfY2Fwcy0+Y29sb3JfZm9ybWF0cy5iaXRzLllDQkNS
X1NJTVBMRV80MjIgPSAwOworCWRzY19lbmNfY2Fwcy0+Y29sb3JfZm9ybWF0cy5iaXRzLllDQkNS
X05BVElWRV80MjIgPSAwOwogCWRzY19lbmNfY2Fwcy0+Y29sb3JfZm9ybWF0cy5iaXRzLllDQkNS
X05BVElWRV80MjAgPSAxOwogCiAJZHNjX2VuY19jYXBzLT5jb2xvcl9kZXB0aC5iaXRzLkNPTE9S
X0RFUFRIXzhfQlBDID0gMTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
