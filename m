Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529B35721
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 08:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9086A894E7;
	Wed,  5 Jun 2019 06:44:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760054.outbound.protection.outlook.com [40.107.76.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF310894E7
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 06:44:58 +0000 (UTC)
Received: from MN2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:208:a8::41)
 by SN6PR12MB2671.namprd12.prod.outlook.com (2603:10b6:805:6f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17; Wed, 5 Jun
 2019 06:44:57 +0000
Received: from CO1NAM03FT060.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by MN2PR12CA0028.outlook.office365.com
 (2603:10b6:208:a8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.18 via Frontend
 Transport; Wed, 5 Jun 2019 06:44:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT060.mail.protection.outlook.com (10.152.81.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Wed, 5 Jun 2019 06:44:56 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 5 Jun 2019
 01:44:40 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload issue
Date: Wed, 5 Jun 2019 14:44:36 +0800
Message-ID: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(2906002)(2616005)(126002)(53936002)(4326008)(476003)(336012)(51416003)(7696005)(86362001)(6666004)(356004)(5660300002)(6916009)(186003)(2351001)(486006)(36756003)(68736007)(426003)(77096007)(478600001)(47776003)(72206003)(14444005)(305945005)(26005)(48376002)(70586007)(70206006)(81166006)(81156014)(50226002)(8936002)(16586007)(53416004)(316002)(50466002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2671; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e198ae03-6be3-4868-f9e4-08d6e98152b6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2671; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2671:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2671DA8D848E93173B8EAD3784160@SN6PR12MB2671.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: S6sWMPUj+98d1749n6mgnX8L27lZoFMIZVKQxu8+aor3f/ZZPHK4rGElXdV327tpR0ZHrlaRTuCWqjG6ERlxc/YP7pf1DBzlmIVTqfyit+5B9B/tZBuGjuzW4NdcMKRiWc7opibhvAyU+nDZbDCIerRXQR1JpxxAFboPYCiEO3Oib4GyXFNzwkuEZ1R2RLyq9bhyHkct6vkBg6MG2/7DOsyN15Rb7eCMqHViiycOx2iLk29LjuY+TH2fw6IYj1KoBEhKfHmb2r4yL4Brdu9ZGY0dGYhI4o9FhScwA3EKngg6gfLnrac5NssaeY0uJNbs+7QSOSyN1IP3p9wKBRmYcBi/PumqcpmUE8kUL1ZxPp8zpOkbsbyiZTnWh8glx6JU+pc6Uh+6FPRKCKe4imPGVOEJ2wCSxZWzkwf/5faf4mQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 06:44:56.5178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e198ae03-6be3-4868-f9e4-08d6e98152b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2671
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nftPA7wO7BcgVTRI3z6QO3xLfT7Jmeie89R6pR2Nb5w=;
 b=iCxSJk06KeIdLYp67K0500faSTeZR5GEeIHasFToeZieLZtRWnte5sFktb0OzflHZKwVK8KCo6MW7jSp/U5qFrNKeGLyTi1GKDMDWnCqCZtGM9NbRpRQKAompR7P8mUN6wmWQBldVL2Dna8/uhRdbYn6fm4yHOzKNKCZE8DH//Y=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

bmVlZCB0byBjbGVhciBibyBnbG9iIGFuZCBtZW0gZ2xvYiBkdXJpbmcgdGhlaXIgcmVsZWFzZQpv
dGhlcndpc2UgdGhlaXIgbWVtYmVyIHZhbHVlIHdvdWxkIGJlIHdyb25nbHkgdXNlZCBpbiB0aGUK
bmV4dCBnbG9iIGluaXQgc3RhZ2UgYW5kIGxlYWQgdG8gd2lsZCBwb2ludGVyIGFjY2VzcyBwcm9i
bGVtczoKCjEpIGtvYmouc3RhdGVfaW5pdGlhbGl6ZWQgaXMgMQoyKSB0dG1fYm9fZ2xvYi5ib19j
b3VudCBpc24ndCBjbGVhcmVkIGFuZCByZWZlcmVuY2VkIHZpYSBpdAogICBvbiBtZW1iZXIgInN3
YXBfbHJ1IiB3b3VsZCBoaXQgb3V0IG9mIGJvdW5kIGFycmF5IGFjY2Vzc2luZwogICBidWcKClNp
Z25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbWVt
b3J5LmMgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwppbmRleCBjN2RlNjY3Li42NDM0ZWFjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMK
QEAgLTE2MDQsNiArMTYwNCw4IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19nbG9iYWxfa29ial9yZWxl
YXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQogCQljb250YWluZXJfb2Yoa29iaiwgc3RydWN0IHR0
bV9ib19nbG9iYWwsIGtvYmopOwogCiAJX19mcmVlX3BhZ2UoZ2xvYi0+ZHVtbXlfcmVhZF9wYWdl
KTsKKworCW1lbXNldChnbG9iLCAwLCBzaXplb2YoKmdsb2IpKTsKIH0KIAogc3RhdGljIHZvaWQg
dHRtX2JvX2dsb2JhbF9yZWxlYXNlKHZvaWQpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9tZW1vcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21lbW9yeS5jCmluZGV4
IDg2MTc5NTguLjcxMjhiYmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21l
bW9yeS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21lbW9yeS5jCkBAIC0yMjksOSAr
MjI5LDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3lzZnNfb3BzIHR0bV9tZW1fZ2xvYmFsX29w
cyA9IHsKIAkuc3RvcmUgPSAmdHRtX21lbV9nbG9iYWxfc3RvcmUsCiB9OwogCit2b2lkIHR0bV9t
ZW1fZ2xvYl9rb2JqX3JlbGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopCit7CisJc3RydWN0IHR0
bV9tZW1fZ2xvYmFsICpnbG9iID0gY29udGFpbmVyX29mKGtvYmosIHN0cnVjdCB0dG1fbWVtX2ds
b2JhbCwga29iaik7CisKKwltZW1zZXQoZ2xvYiwgMCwgc2l6ZW9mKCpnbG9iKSk7Cit9CisKIHN0
YXRpYyBzdHJ1Y3Qga29ial90eXBlIHR0bV9tZW1fZ2xvYl9rb2JqX3R5cGUgPSB7CiAJLnN5c2Zz
X29wcyA9ICZ0dG1fbWVtX2dsb2JhbF9vcHMsCiAJLmRlZmF1bHRfYXR0cnMgPSB0dG1fbWVtX2ds
b2JhbF9hdHRycywKKwkucmVsZWFzZSA9IHR0bV9tZW1fZ2xvYl9rb2JqX3JlbGVhc2UsCiB9Owog
CiBzdGF0aWMgYm9vbCB0dG1fem9uZXNfYWJvdmVfc3dhcF90YXJnZXQoc3RydWN0IHR0bV9tZW1f
Z2xvYmFsICpnbG9iLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
