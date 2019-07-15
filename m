Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9C69DBC
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3F489C61;
	Mon, 15 Jul 2019 21:21:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710041.outbound.protection.outlook.com [40.107.71.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0489C6C
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iujMLeorWqa+q73gQONzWjTtWGwx39VYcwZZK1TmUYoCZ9nHE9HD9IiLfKV7NKakcf+bp+ARxZnCHw4xmI2kGTpkKH3WATFQitT1CirGxXzhHM7KAIAVlTHKlQZcXv4V7XMo2mENYWgb8HXKCPXxs46mx+Hv0/JOgZGiXGzC6phgr6DBgWInl2y47NgQlFrF59/q7xtuZ+fpP0fCpFzvZvn5MprUszgC+b5f7auwaodnvx24g79zV0D4/8G412XAQhRyD9akSy0skU9LveZjJDytk4l/5zmCcT4tqjMxWiAMGJRLcopSqz2Bh3vcnAyWMETenk/7aEsLJnyfFzllpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULkzoi81+cJWhFAjteCyFrkuPA/UfwePBqAURnlEKzw=;
 b=m0h49N1YgeyxHM6SPN79eYS2/oaDvfkyMD7aGZLqUWl3VY1GHRcOdG8rcW1oL9R6r5vgjPl5pHnvMy8EPDwR4xS4LIzRQd3JXTtZTPZkTa6lCtRW+H5gBdYa0uMC0oS84pBWSTWOHSmDl0eSPsru1s7zCAXQIEINwdOlrOeiMKWP/EUgOPF4FP8poKlA2HG7TX281HFZLDDwyRTbJPrzbrkAl/n2QYEl9MWNe2GmB17nso00GuA7r3Icg2l1WmAh5twSCOA13AQVI66+2pmpyMsl/Wu8jt5EMFKf5i6FsKkU3IWIiN0xVJnJkOsY4eSbFMZE92JHNdx+JqPHIkdrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0007.namprd12.prod.outlook.com (2603:10b6:4:1::17) by
 MWHPR12MB1936.namprd12.prod.outlook.com (2603:10b6:300:114::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:41 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM5PR12CA0007.outlook.office365.com
 (2603:10b6:4:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:40 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:26 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 44/87] drm/amd/display: Change min_h_sync_width from 8 to 4
Date: Mon, 15 Jul 2019 17:20:06 -0400
Message-ID: <20190715212049.4584-45-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(52084003)(189003)(199004)(356004)(6666004)(2870700001)(5660300002)(2351001)(50466002)(48376002)(70206006)(426003)(70586007)(76176011)(486006)(51416003)(446003)(26005)(6916009)(11346002)(476003)(14444005)(316002)(336012)(8936002)(126002)(2616005)(50226002)(54906003)(81156014)(81166006)(86362001)(186003)(2876002)(4326008)(478600001)(68736007)(49486002)(8676002)(53936002)(36756003)(305945005)(1076003)(47776003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1936; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2ef21a2-2939-4627-f543-08d7096a6ded
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1936; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1936:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1936615AB2E0C163220C990A82CF0@MWHPR12MB1936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: G4Oj8X7Mmm5puS7ph/sNg0oU/Z5h8/phoVhKUtTuegKvCG3tYHdviBGoDtjXNtW+5XNscbNzolJFiqhmqgK2Z9IRGEbH8nm+NZs6Wn7lUweL8LUxbJlwIvyM06TmrfEK6NeRN4ScdYH7wlUXZSmYZaRqNgHi5EvJNFgQqaMWkyjDDAxA8d1Ii2magZbiAErbmx57dqmoYqnpud1AKEoG6p9eRD6NuEUzbPf6mAxtIXPcS6fvp6ebCbPR8bJx2WdSBWaAITF+Ovi+P133u5jWt9/+bCyjRUtF5R0wy0YIlIg5+U5h6FUJhlH3Gqlep3zo4kFJ0kNuxQWT0NYStFwDvwVYnywdzgT+fn/P0eYGwP1EF19nlwdjRqRbPzSAzOhA8EStdiRBHzQj1mgznw1DubFb8gTfeUy4lvIq09nes/g=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:40.9687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ef21a2-2939-4627-f543-08d7096a6ded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULkzoi81+cJWhFAjteCyFrkuPA/UfwePBqAURnlEKzw=;
 b=XfHYVpQ3rUE13Ywltgyx+9PvSfG4SQhxJWoz5IPg3AMr1xdjIdc3c2/NRuhSbfC40lTV5ypPFPtxcmBaeTqlKjAu/ua/3w0KNS8PHCSGa8ERiItUezDUBtS15Taj7fRhclHyDBLZihEKNwcz0DY+HahL4HSmvh95V9PI9fE9H3c=
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
Cc: Leo Li <sunpeng.li@amd.com>, Joshua Aberback <Joshua.Aberback@amd.com>,
 Aric Cyr <Aric.Cyr@amd.com>, Fatemeh Darbehani <fatemeh.darbehani@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRmF0ZW1laCBEYXJiZWhhbmkgPGZhdGVtZWguZGFyYmVoYW5pQGFtZC5jb20+CgpbV2h5
XQpTb21lIGRpc3BsYXkncyBoc3luYyB3aWR0aCBpcyBsb3dlciB0aGFuIHRoZSBtaW5pbXVtIGRj
bjIwIGlzIHNldAp0byBzdXBwb3J0IHJpZ2h0IG5vdy4gVGhpcyB3aWxsIGNhdXNlIG9wdGMxX3Zh
bGlkYXRlX3RpbWluZyB0byBmYWlsIHdoaWNoCmV2ZW50dWFsbHkgd2lsbCByZXN1bHQgaW4gd3Jv
bmcgc2V0IG1vZGUuIFRoaXMgd2FzIHNldCB0byA4IGFzIHBlcgpIVyB0ZWFtJ3MgcmVxdWVzdCBm
b3Igbm8gdmFsaWQgcmVhc29uLgoKW0hvd10KQ2hhbmdpbmcgbWluX2hfc3luY193aWR0aCB0byA0
IHdpbGwgbGV0IHVzIHZhbGlkYXRlIHRpbWluZyBmb3IKcHJlZmZlcmVkIG1vZGUgYW5kIGxpZ2h0
IHVwIHRoZSBoZWFkc2V0LiBUaGlzIGNoYW5nZSB3YXMgbWFkZQp0byBWZWdhIDEwIGJlZm9yZSBm
b3IgYSBzaW1pbGFyIGlzc3VlLgoKU2lnbmVkLW9mZi1ieTogRmF0ZW1laCBEYXJiZWhhbmkgPGZh
dGVtZWguZGFyYmVoYW5pQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKb3NodWEgQWJlcmJhY2sgPEpv
c2h1YS5BYmVyYmFja0BhbWQuY29tPgpBY2tlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5j
b20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX29wdGMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMKaW5kZXggMjZhNjZjY2Y2ZTcy
Li4xYWU5NzM5NjJkNTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9vcHRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX29wdGMuYwpAQCAtNTM1LDcgKzUzNSw3IEBAIHZvaWQgZGNuMjBfdGltaW5n
X2dlbmVyYXRvcl9pbml0KHN0cnVjdCBvcHRjICpvcHRjMSkKIAlvcHRjMS0+bWluX2hfYmxhbmsg
PSAzMjsKIAlvcHRjMS0+bWluX3ZfYmxhbmsgPSAzOwogCW9wdGMxLT5taW5fdl9ibGFua19pbnRl
cmxhY2UgPSA1OwotCW9wdGMxLT5taW5faF9zeW5jX3dpZHRoID0gODsKKwlvcHRjMS0+bWluX2hf
c3luY193aWR0aCA9IDQ7Ly8JTWluaW11bSBIU1lOQyA9IDggcGl4ZWxzIGFza2VkIEJ5IEhXIGlu
IHRoZSBmaXJzdCBwbGFjZSBmb3Igbm8gYWN0dWFsIHJlYXNvbi4gT2N1bHVzIFJpZnQgUyB3aWxs
IG5vdCBsaWdodCB1cCB3aXRoIDggYXMgaXQncyBoc3luY1dpZHRoIGlzIDYuIENoYW5naW5nIGl0
IHRvIDQgdG8gZml4IHRoYXQgaXNzdWUuCiAJb3B0YzEtPm1pbl92X3N5bmNfd2lkdGggPSAxOwog
CW9wdGMxLT5jb21iX29wcF9pZCA9IDB4ZjsKIH0KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
