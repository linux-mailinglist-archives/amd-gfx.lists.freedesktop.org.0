Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F91B182
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 09:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB6A89733;
	Mon, 13 May 2019 07:53:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F82789733
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 07:53:15 +0000 (UTC)
Received: from BN8PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:60::36)
 by DM5PR1201MB0057.namprd12.prod.outlook.com (2603:10b6:4:54::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.25; Mon, 13 May
 2019 07:53:14 +0000
Received: from CO1NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN8PR12CA0023.outlook.office365.com
 (2603:10b6:408:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.22 via Frontend
 Transport; Mon, 13 May 2019 07:53:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT041.mail.protection.outlook.com (10.152.81.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 07:53:13 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 13 May 2019
 02:53:11 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/powerplay: drop redundant smu call
Date: Mon, 13 May 2019 15:53:01 +0800
Message-ID: <20190513075302.10731-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513075302.10731-1-evan.quan@amd.com>
References: <20190513075302.10731-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(446003)(6666004)(336012)(51416003)(7696005)(76176011)(356004)(426003)(48376002)(50466002)(186003)(70206006)(70586007)(86362001)(53936002)(316002)(5660300002)(50226002)(8936002)(81166006)(81156014)(8676002)(1076003)(4744005)(2616005)(11346002)(476003)(126002)(2351001)(53416004)(4326008)(44832011)(6916009)(486006)(36756003)(2906002)(68736007)(47776003)(478600001)(2870700001)(77096007)(305945005)(26005)(72206003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0057; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66bf189f-d290-4433-5a5d-08d6d7780d22
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0057; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0057:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0057ECA3683A38EAE168852FE40F0@DM5PR1201MB0057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jeq+iAfINbgOQVRf6ngOc0dgHumu5i9XmiTpropbfzba2s7Qez3Df7Be8+BUYadJ2r3Xz3RIf4mlrF3X3FlpyLcmTQWcchNebtynW+tBDM/d5QG49rziyhvm0x6wyrLAhPxDNyOt4LyDk+0C6F6wJpTE0gSYyXDATzTtjc7N4faTlL71vgScAcn9SCve0W933ALQlPQQ8R/BQ+sfca7EAkUJTeWoc+gnG+fqMy3XS/gTxpWzfGEkfxrjAQq5OXgqVLHOZSZLX34LfIGLoQkhpuKrQ2KlkXgO/V6HQq9oxa7II+SZo/2lW6ao9OOgnxL8vb/dsq1ScxKWF/F9iXEZXNIFJP5P+jWNrlBJcNtu3lrI+sYw8eZvJv28ZLYmAzt7AgVnN8mMk3RheT5Il9SQ7KuTQpUyEZ2gsGPHtRl3CcI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 07:53:13.2153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bf189f-d290-4433-5a5d-08d6d7780d22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0057
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNr4/ROMKKYNf0OJ7fEHVq+ECWcHWFbGbFD2YwL/Py8=;
 b=HoIsAYX+LsDOtiCQXpVDIpY8u8ukuF+KZSWQm/R9nqfno/HazDb8TuYhz8e/q1TEDsEB7ICh1ijeUehSEWRtUQymIY3MP3iLcy8lvTUDiRjY/0SqxSEarlplDKfcDyAk97dBWGlqB5VTYRCTaL7eJr2b4MpE63KeGFtPiLrIInw=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c211X2dldF9jbGtfaW5mb19mcm9tX3ZiaW9zKCkgd2FzIGNhbGxlZCByZXBlYXRlZGx5LiBJdApz
ZWVtcyBhIG1lcmdlIGVycm9yLgoKQ2hhbmdlLUlkOiBJY2UyMmExNzFjYmI5NzZkMGFlYmQ2NjA5
MzQ0YTEwYjAwOGQxOGYxNApTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQg
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGVkODg0MDAyNmU1OS4uYjExOWEyNzZhOTc3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC02MzYs
MTAgKzYzNiw2IEBAIHN0YXRpYyBpbnQgc211X3NtY190YWJsZV9od19pbml0KHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LAogCQkgKiBjaGVjayBpZiB0aGUgZm9ybWF0X3JldmlzaW9uIGluIHZiaW9z
IGlzIHVwIHRvIHBwdGFibGUgaGVhZGVyCiAJCSAqIHZlcnNpb24sIGFuZCB0aGUgc3RydWN0dXJl
IHNpemUgaXMgbm90IDAuCiAJCSAqLwotCQlyZXQgPSBzbXVfZ2V0X2Nsa19pbmZvX2Zyb21fdmJp
b3Moc211KTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiByZXQ7Ci0KIAkJcmV0ID0gc211X2NoZWNr
X3BwdGFibGUoc211KTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7Ci0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
