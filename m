Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281269DC4
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DCB89C9C;
	Mon, 15 Jul 2019 21:21:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730052.outbound.protection.outlook.com [40.107.73.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED7389C53
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKacsZBiOYHtYqzdgMWRFjwVtT6GB9zxu2Gt7XVSZvpOP/Pi2BcBK17hLo4CrPKVrPSEcf995gvijjXOxaXK4GmnVyEyUBQ4kGIX/9lDOAZLAW8Y0qOTf1Dvg7YdID824IW8yGRtwKVKXyposVJbkXIFQ/RjUM2/uDHtzvV8epUaJ0nxLUHcg3nFfS45h0yNla4Xk6CfIQ3R2jW+hQFJoZ+Apfxp8JelRhDbt9/dMsl8mdqs6JJXWQuz9VURdIcdw5IDvEmVFlwIL55mSu8zVcPjZ1g2zqeuAuZ9EbYlVJ5+9iLLgs7FSrbmcvUyHnbtIowmQyvTlYef52aDDtpoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJbKIJ8Upgb1EmPphJKWfoxC256zrXrCwVPVIkhm5a4=;
 b=NBdFdj5ZddXAu0jM8VRdA7JSvi4cmDjgPGyRue5xN5Y4l/xKOao5gU7y/RPaqjOaVmE7rjnhOikid35Ix6khVpsx7OGEvpq+Hcq2HWO8o23nNXjk7CqDsDXUF1Xa87QIB9qh4r4/i0iQHrrM6c8tkyM8sOHcy+3+hPcTFzi/wSBvpVqRMOiNN47R1VyoWz7UUJz9v2X1LdJ4xRhvn6OZ7j5QQ69tB7PbNYKKcV9inBoSjlOO4fRc1NYq/wM7nkKM6kgWQ+WW7jXZ+jMOydQR//txoby4Q5iIHY5ItB2kiNI6PNb3TqhZrc/5XLsq+w6EmSPddIrf14UeKlU7pQRAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 DM5PR12MB1929.namprd12.prod.outlook.com (2603:10b6:3:106::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:21:37 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:23 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 37/87] drm/amd/display: Power-gate all DSCs at driver init time
Date: Mon, 15 Jul 2019 17:19:59 -0400
Message-ID: <20190715212049.4584-38-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(336012)(305945005)(2870700001)(446003)(6666004)(356004)(6916009)(2906002)(186003)(4326008)(36756003)(26005)(53936002)(68736007)(48376002)(47776003)(5660300002)(2876002)(49486002)(486006)(1076003)(76176011)(478600001)(81166006)(81156014)(8936002)(50466002)(86362001)(51416003)(2351001)(426003)(11346002)(70206006)(54906003)(70586007)(476003)(50226002)(2616005)(126002)(316002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1929; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2617740e-21b0-42de-3ea7-08d7096a6bb7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1929; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1929:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1929E2337B31B0B6442518FC82CF0@DM5PR12MB1929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tQebXaL2kzsC6EQ7YSdM7+/BSJ7AS+i/d+aCOg+ur4kHnWWdvMLczJBfzTgtQfMRZYyldmEKmJNYZZD5tzQEm/TXdwgmHGVL8pDRCRiaNs6NFrFpz6buZZ2sy4i7/smLdt6nFc38cd7wvwiQWqPo5gNLe1qcbJbI1jv25o3sqIK6A8zYFBaIBVsNDhVkVgl3b/eXiBz71VqNv6SEVKrwHt20M713MTaZn+3sRLBYqnblyIJiz3QamCK8MtCtU/4LUkdvW2T9Xgb54wC1XDrsNtQa6m97kaF4myv60fURNNLknkd1WaDpOs6cH5hJcLxc/VuCZlQBTJmSZxj5BThp2eYUR9GQjh+TZzLk4wUx9vLwrivd1cCEU2VIx4UT3BXM7H5CoIWqJxMd9VrHL3WlkOFlUnL9awsHI2RyDpqGaRQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:37.2625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2617740e-21b0-42de-3ea7-08d7096a6bb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJbKIJ8Upgb1EmPphJKWfoxC256zrXrCwVPVIkhm5a4=;
 b=w7f/ABJwkftk+faTv2xuD8KYLL709MvcE11HlFAsW/vQrGIK9/YKMKZF45+/WH8dCytXZ7jDDBc126NicFSCJIsSMN4/ThV9MwchK21OAccwGCrhqoBDFAzuVZYWUIlKEe7FQxNrBQa7SF0/xNvfBd9uqghzwtFBOmNWl30KylI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Nevenko Stupar <Nevenko.Stupar@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KRFNDIHNo
b3VsZCBiZSBwb3dlcmVkLW9uIG9ubHkgb24gYXMtbmVlZGVkIGJhc2lzLCBpLmUuIGlmIHRoZSBt
b2RlCnJlcXVpcmVzIGl0CgpbaG93XQpMb29wIG92ZXIgYWxsIHRoZSBEU0NzIGF0IGRyaXZlciBp
bml0IHRpbWUgYW5kIHBvd2VyLWdhdGUgZWFjaAoKU2lnbmVkLW9mZi1ieTogTmlrb2xhIENvcm5p
aiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgpSZXZpZXdlZC1ieTogTmV2ZW5rbyBTdHVwYXIgPE5l
dmVua28uU3R1cGFyQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggZGI1
N2MyYTk5YTE1Li5hOTE4ZjI3NzBjMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC01OTksNiArNTk5LDEwIEBAIHN0YXRp
YyB2b2lkIGRjbjIwX2luaXRfaHcoc3RydWN0IGRjICpkYykKIAkJfQogCX0KIAorCS8qIFBvd2Vy
IGdhdGUgRFNDcyAqLworCWZvciAoaSA9IDA7IGkgPCByZXNfcG9vbC0+cmVzX2NhcC0+bnVtX2Rz
YzsgaSsrKQorCQlkY24yMF9kc2NfcGdfY29udHJvbChod3MsIHJlc19wb29sLT5kc2NzW2ldLT5p
bnN0LCBmYWxzZSk7CisKIAkvKiBCbGFuayBwaXhlbCBkYXRhIHdpdGggT1BQIERQRyAqLwogCWZv
ciAoaSA9IDA7IGkgPCBkYy0+cmVzX3Bvb2wtPnRpbWluZ19nZW5lcmF0b3JfY291bnQ7IGkrKykg
ewogCQlzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcgPSBkYy0+cmVzX3Bvb2wtPnRpbWluZ19n
ZW5lcmF0b3JzW2ldOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
