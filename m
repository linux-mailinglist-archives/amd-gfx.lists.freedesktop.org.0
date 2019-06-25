Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391652510
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 09:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BEF6E06F;
	Tue, 25 Jun 2019 07:43:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820071.outbound.protection.outlook.com [40.107.82.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B596E06F
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 07:43:30 +0000 (UTC)
Received: from DM3PR12CA0072.namprd12.prod.outlook.com (2603:10b6:0:57::16) by
 BN6PR12MB1875.namprd12.prod.outlook.com (2603:10b6:404:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Tue, 25 Jun
 2019 07:43:28 +0000
Received: from DM3NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by DM3PR12CA0072.outlook.office365.com
 (2603:10b6:0:57::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16 via Frontend
 Transport; Tue, 25 Jun 2019 07:43:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT051.mail.protection.outlook.com (10.152.83.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Tue, 25 Jun 2019 07:43:27 +0000
Received: from prike.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Tue, 25 Jun
 2019 02:43:26 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/powerplay:clean up the residual mutex for
 smu_hw_init
Date: Tue, 25 Jun 2019 15:43:15 +0800
Message-ID: <1561448595-32319-1-git-send-email-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(86362001)(4744005)(2351001)(36756003)(53936002)(6666004)(356004)(7736002)(305945005)(54906003)(2906002)(6916009)(336012)(186003)(14444005)(70586007)(68736007)(70206006)(50226002)(48376002)(486006)(126002)(2616005)(50466002)(8936002)(316002)(476003)(26005)(81156014)(81166006)(77096007)(426003)(8676002)(16586007)(16526019)(53416004)(3846002)(72206003)(6116002)(5660300002)(47776003)(51416003)(7696005)(478600001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1875; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b368673e-c1bf-4f1f-d671-08d6f940cfcd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR12MB1875; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1875:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1875D550428BCA9E59945988FBE30@BN6PR12MB1875.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0079056367
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iFRTF0q8pGoYOU/UIng0RCAnmPv5NyX25bGdQsa3YByTJDDV45ehFIgBO91q5vhp1pB4cSl42j6PMslbFCEA5Vp2RJhvvnKoaL0Uy/iCCsW2InCoMGbLtWOg1SOSqdaOnRGcvFOsIodPt800trVWegcqwPCIyCRvCiZKpcuLOLQRrJhRekgunqTx9BmLW/g/a8flop+6fSP/NGpJ9si1n3Exk2rT5iTb/9oWqZxJBv/mNic3ufgaapsfuZX2QA/QfkXr7JEJNnzxEb6dQ3nmDfvXofPg4oyJ5NVGncwzUgOG7vgx0xy3yGJN92GSD1vKum5Olpx/egRI6VL/n2kxj53fGPgmT32VzQ36O+WQsJcTJg9K8a7XwFwoHnSwxm7GACmkm3ETAFdXh/qIECHD2NzuU7gu/RWTw2BOJ3bTWJE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2019 07:43:27.7889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b368673e-c1bf-4f1f-d671-08d6f940cfcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1875
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBYwioMCoucB5qAwnl0cckGAYq+sdxStN9WXTfXC39A=;
 b=Nk465Fe5ybEeNGUqYTgnB+F9pJRPxVdEpJa/PfvrBeM9Y0vx/2aT/6P+c5M5Q90v0Ke7pfgbpVEpLktqtBZUdyDZ/HPFQUNeyTqoGGhNQaSao08TsI5UkRee+oVxSVdPm53hAeScpwrP70SkXKiQusYSMZeRFA8o5jH7fnkNgtM=
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
Cc: Prike Liang <Prike.Liang@amd.com>, Evan.Quan@amd.com, Ray.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG11dGV4IGZvciBwcm9jdGluZyBTTVUgZHVyaW5nIGh3X2luaXQgd2FzIHJlbW92ZWQgYXMg
c3lzdGVtCndpbGwgYmUgZGVhZGxvY2sgd2hlbiBzbXVfcG9wdWxhdGVfdW1kX3N0YXRlX2NsayB0
cnkgZ2V0IFNNVSBtdXRleC4KVGhlcmVmb3JlIG5lZWQgcmVtb3ZlIHRoZSByZXNpZHVhbCBtdXRl
eCBmcm9tIGZhaWxlZCBwYXRoLgoKQ2hhbmdlLUlkOiBJZDgwMTljMDFiOTQ5NmMwNjdlZmRhNDgx
N2E0Njk4M2U0ZGEzYjZlNApTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMg
fCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGY2MWVjYmYuLmZlODNjNWUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTEwNDQsNyArMTA0NCw2
IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCXJldHVybiAwOwogCiBm
YWlsZWQ6Ci0JbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsKIAlyZXR1cm4gcmV0OwogfQogCi0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
