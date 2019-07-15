Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9518E69DD6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCF589D39;
	Mon, 15 Jul 2019 21:22:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6815489D00
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jk0VdLO+tf8ImhVsbLIkW9JWn1nv8Wyfye+PXgb/+jq1+iRxnYZXMnEUmZUsOoDJa7ufz31O8r4mrjZbHhMsOR7KzPPuU46HELFQpYX1Ydeyl7f4hy3GdgE9efz0hzBo9w0WwxbEF8WF/5k357qsda1dDKdMLdaYJeqqKtmpDJBT6Bc7K9CNq4uubZiYE/+ZSIzOPOgOw2a/favRlHY7aLTTqISCRunyIdI5mciKDK9SdBq/NGvtuycAxQwaJjLwad8smnGm8/ykDEmEdBNKGZ1NFtEwr57z0T+m6uoAOU75+/dOfiywtB4yduWgUyFtFntrXULnt16q5EsaakIQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubURP80SAlcmK2QmUDuvza0zkUF7OQqM4C8w8tNK0DQ=;
 b=CYHqHjGaBWhr6E+/YkOvOwYRzB5ca0ha25QqIzWjJMywc5LMNmcEzrajhSLHSuFiuuPdeYsLvxV9JNr238lC980l+90NusFp8XH7VgsfDG99e8WrQM9LSnWankJ2e+kLpb2gQ7UZlji9wV2enMiRv2OecPsZTNji091eRyrm+dSDVPf8aB9f/4bdOC9EXHE5vF4ZUMlJXbkHYIjkys6iBky6gq4emV7W5ASAwGpuBt9Da9MIhfJiGF1+9ZggAvol4DsiCA3d2Qf8P5j7evanPH+aOkBb5FUyjpI5BTJTcWBKidAd4dNmzs3nO+ZIFx88JOjsjMKDdMGOi8yY0E9epQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:58 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:58 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:38 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 72/87] drm/amd/display: Fix dc_create failure handling and 666
 color depths
Date: Mon, 15 Jul 2019 17:20:34 -0400
Message-ID: <20190715212049.4584-73-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(446003)(68736007)(356004)(6666004)(76176011)(6916009)(70586007)(70206006)(51416003)(26005)(486006)(336012)(36756003)(47776003)(126002)(86362001)(476003)(2616005)(11346002)(2906002)(49486002)(2870700001)(426003)(53936002)(305945005)(50226002)(4326008)(1076003)(2876002)(54906003)(478600001)(186003)(8676002)(2351001)(81166006)(316002)(50466002)(48376002)(81156014)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3936; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c54d3b39-837b-401c-2aab-08d7096a7829
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3936; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39365317250C7637296D4F6082CF0@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: d8gm9psXXO7YwcoM5A9ArIZyd4XbfK6byZqTQFGDcSbjJR0KGqOn4iJKsjF2nzYZr/iUDo6hzS1lhXRy8ef7B2ot8t018zxXtcDGeMiwuZg9ul+WDtN/Uyt6ya3gKx38j6TVYo/AkY9HTUaVk1nqupnw89WxuzOy+xBmFacc/8WktdludCnwxE2zjznMGoOvOrl1Wg7RR5pkwCokSYwK8qszSsWQenimbIium9RojRPMg8VRq30uMRkR99xyuiL7kgWCxOxgK3ir99ubJOSkXLOhS2YNCLVYX1yhOmpB1rg/GkVdf3QDGu1rLeSvpvpXb62GKDuiytOk0d7idCKGUcocDMjsSQSHHa8nRCsJ4miV2I5huWQ+IQ0iN1gXGiFwhKQ8C/WSgMco++LD6KG4vaDMok0pLpnsTnDPBftgcKI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:58.1407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54d3b39-837b-401c-2aab-08d7096a7829
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubURP80SAlcmK2QmUDuvza0zkUF7OQqM4C8w8tNK0DQ=;
 b=bf0xZhKLfbRIQHMIbXQQwMhK67qnwW9syFcPJ/fwdViCZAOqbYo7vivki2HKKgRXr/nY2TajFs5t/un2rLwwhAKrdOK5EhUIZo9TRFzYGcS+uDB97/i2dvaHE1v0D4Z6o9NA7uqpG453LRQehGoyenNm9fXEN+h2NB4xeqXq5sk=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Julian Parkin <julian.parkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKW1doeV0KSXQgaXMg
cG9zc2libGUgKGJ1dCB2ZXJ5IHVubGlrZWx5KSB0aGF0IGNvbnN0cnVjdGluZyBkYyBmYWlscwpi
ZWZvcmUgY3VycmVudF9zdGF0ZSBpcyBjcmVhdGVkLgoKV2Ugc3VwcG9ydCA2NjYgY29sb3IgZGVw
dGggaW4gc29tZSBzY2VuYXJpb3MsIGJ1dCB0aGlzCmlzbid0IGhhbmRsZWQgaW4gZ2V0X25vcm1f
cGl4X2Nsay4gSXQgdXNlcyBleGFjdGx5IHRoZQpzYW1lIHBpeGVsIGNsb2NrIGFzIHRoZSA4ODgg
Y2FzZS4KCltIb3ddCkNoZWNrIGZvciBub24gbnVsbCBjdXJyZW50X3N0YXRlIGJlZm9yZSBkZXN0
cnVjdGluZy4KCkFkZCBjYXNlIGZvciA2NjYgY29sb3IgZGVwdGggdG8gZ2V0X25vcm1fcGl4X2Ns
ayB0bwphdm9pZCBhc3NlcnRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gUGFya2luIDxqdWxp
YW4ucGFya2luQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxp
dUBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyAgICAgICAgICB8IDYgKysrKy0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jIHwgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCA2M2QwZjEzODZmNGUuLmM0
NDVkZTRkMjcyZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBA
IC01MDAsOCArNTAwLDEwIEBAIHZvaWQgZGNfc3RyZWFtX3NldF9zdGF0aWNfc2NyZWVuX2V2ZW50
cyhzdHJ1Y3QgZGMgKmRjLAogCiBzdGF0aWMgdm9pZCBkZXN0cnVjdChzdHJ1Y3QgZGMgKmRjKQog
ewotCWRjX3JlbGVhc2Vfc3RhdGUoZGMtPmN1cnJlbnRfc3RhdGUpOwotCWRjLT5jdXJyZW50X3N0
YXRlID0gTlVMTDsKKwlpZiAoZGMtPmN1cnJlbnRfc3RhdGUpIHsKKwkJZGNfcmVsZWFzZV9zdGF0
ZShkYy0+Y3VycmVudF9zdGF0ZSk7CisJCWRjLT5jdXJyZW50X3N0YXRlID0gTlVMTDsKKwl9CiAK
IAlkZXN0cm95X2xpbmtzKGRjKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKaW5kZXggMzFhNDljNTljMjc4Li5jNWE3NDA4MjFjMGUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291
cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3Vy
Y2UuYwpAQCAtMTg1Miw2ICsxODUyLDcgQEAgc3RhdGljIGludCBnZXRfbm9ybV9waXhfY2xrKGNv
bnN0IHN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5nKQogCQlwaXhfY2xrIC89IDI7CiAJaWYg
KHRpbWluZy0+cGl4ZWxfZW5jb2RpbmcgIT0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjIpIHsKIAkJ
c3dpdGNoICh0aW1pbmctPmRpc3BsYXlfY29sb3JfZGVwdGgpIHsKKwkJY2FzZSBDT0xPUl9ERVBU
SF82NjY6CiAJCWNhc2UgQ09MT1JfREVQVEhfODg4OgogCQkJbm9ybWFsaXplZF9waXhfY2xrID0g
cGl4X2NsazsKIAkJCWJyZWFrOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
