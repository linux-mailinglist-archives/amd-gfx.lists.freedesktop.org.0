Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E2A5FB7F
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8326A6E370;
	Thu,  4 Jul 2019 16:06:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A76E38A
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:24 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by CY4PR12MB1845.namprd12.prod.outlook.com (2603:10b6:903:126::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 4 Jul
 2019 16:06:20 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:19 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:06:00 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/17] drm/amdgpu: add AMDGPU_HW_IP_VCN_JPEG_ENC to ctx
Date: Thu, 4 Jul 2019 12:04:28 -0400
Message-ID: <20190704160429.14758-16-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(199004)(189003)(478600001)(336012)(72206003)(81166006)(81156014)(8676002)(76176011)(77096007)(26005)(16526019)(186003)(8936002)(4326008)(2876002)(2906002)(70206006)(5660300002)(70586007)(53936002)(3846002)(6116002)(68736007)(7736002)(6666004)(50226002)(486006)(1076003)(305945005)(126002)(476003)(356004)(86362001)(11346002)(2616005)(446003)(50466002)(426003)(48376002)(36756003)(316002)(51416003)(7696005)(16586007)(6916009)(47776003)(53416004)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1845; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68c24dbd-5823-4c1b-f5bd-08d700998d82
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR12MB1845; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1845:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1845C8D6BF3850DFE8AD140987FA0@CY4PR12MB1845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DZpsgWJgWAktqxO21BjFZvQ1bVDVqywtJkWlcbG5DausIv3BlbB28SUexay9Zc9bgr31EnohG/+7fmeostAQP5H7uWBHn2uvd0vG5xqRXpDhidstDcNTZNb6c2DiyBJvyf0TuOvppj2FClUJzEyYEyuJHL1Giryqp+QuHfQHsq9Z3BWbQOhQfWPnootNKWfDZBmlAL1UsZsJ1pvKhueGOAaYpoNTbkaMrTJZpNgE6+SEh+r02VXklZBHa3+JuwcpteKsfLVJ7pb0mqdoBP5fGsGvDhHYA0KUabJ5PbJxTND8aDSyJuYMaUqa3A3YvaMbrApWQObja4AuyjKvvyy7UjvYwyKrhpRxW4vICrxHMRBx+f0b3cnDS0MRilOuINvg+ZrtJXlV8TRgjr3wTc+LKnw1f7ediSE+GMDIlLMS5hQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:19.8739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c24dbd-5823-4c1b-f5bd-08d700998d82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HAxgMUMK1nJVp4i73YLaFs9I4Ne6qnWDrpDNXN/9bQ=;
 b=sZsbr4GnQFC4LfDTHXTqkQ1xFnJ1RX/jleC8ey/xJX6BZR0PNdgvJvpCVGNjJ9yIkMlQijk183dwa71k3AraPdrMLepNP2ILhjRY7ZW1aDDjLAmGO3DCiV1cPbhV9y1BtspDWq3zKDkD87jwdtj8rxRYqQDfO+JSgD3ESqQpxDQ=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBBTURHUFVfSFdf
SVBfVkNOX0pQRUdfRU5DIHR5cGUgdG8gY3R4CgpTaWduZWQtb2ZmLWJ5OiBCb3l1YW4gWmhhbmcg
PGJveXVhbi56aGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jdHguYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKaW5kZXggZTdiZTAwNzU3NzZhLi40MGU4
Mjc4NWI2NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
dHguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKQEAgLTQy
LDYgKzQyLDcgQEAgY29uc3QgdW5zaWduZWQgaW50IGFtZGdwdV9jdHhfbnVtX2VudGl0aWVzW0FN
REdQVV9IV19JUF9OVU1dID0gewogCVtBTURHUFVfSFdfSVBfVkNOX0RFQ10JPQkxLAogCVtBTURH
UFVfSFdfSVBfVkNOX0VOQ10JPQkxLAogCVtBTURHUFVfSFdfSVBfVkNOX0pQRUddCT0JMSwKKwlb
QU1ER1BVX0hXX0lQX1ZDTl9KUEVHX0VOQ10JPQkxLAogfTsKIAogc3RhdGljIGludCBhbWRncHV0
X2N0eF90b3RhbF9udW1fZW50aXRpZXModm9pZCkKQEAgLTE2OSw2ICsxNzAsMTAgQEAgc3RhdGlj
IGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQlyaW5n
c1swXSA9ICZhZGV2LT52Y24ucmluZ19qcGVnOwogCQkJbnVtX3JpbmdzID0gMTsKIAkJCWJyZWFr
OworCQljYXNlIEFNREdQVV9IV19JUF9WQ05fSlBFR19FTkM6CisJCQlyaW5nc1swXSA9ICZhZGV2
LT52Y24ucmluZ19qcGVnX2VuYzsKKwkJCW51bV9yaW5ncyA9IDE7CisJCQlicmVhazsKIAkJfQog
CiAJCWZvciAoaiA9IDA7IGogPCBudW1fcmluZ3M7ICsraikgewotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
