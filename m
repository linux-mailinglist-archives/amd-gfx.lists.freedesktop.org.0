Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BE2068E
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 14:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C60893ED;
	Thu, 16 May 2019 12:02:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740053.outbound.protection.outlook.com [40.107.74.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E647893ED
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 12:02:48 +0000 (UTC)
Received: from MWHPR12CA0047.namprd12.prod.outlook.com (2603:10b6:301:2::33)
 by BN6PR12MB1268.namprd12.prod.outlook.com (2603:10b6:404:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.25; Thu, 16 May
 2019 12:02:46 +0000
Received: from BY2NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by MWHPR12CA0047.outlook.office365.com
 (2603:10b6:301:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Thu, 16 May 2019 12:02:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT042.mail.protection.outlook.com (10.152.85.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 16 May 2019 12:02:46 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 16 May 2019 07:02:34 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
Date: Thu, 16 May 2019 20:02:30 +0800
Message-ID: <1558008150-20674-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(428003)(199004)(189003)(36756003)(5660300002)(51416003)(426003)(7696005)(16586007)(48376002)(2616005)(81156014)(126002)(77096007)(53416004)(336012)(476003)(72206003)(8676002)(54906003)(53936002)(81166006)(316002)(50466002)(186003)(356004)(305945005)(47776003)(70206006)(8936002)(4326008)(68736007)(2906002)(2351001)(486006)(478600001)(50226002)(26005)(70586007)(6666004)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cbeaa93-3a4a-4de4-c34b-08d6d9f668de
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR12MB1268; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1268:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126847CA0009BC29CDAC94ACE50A0@BN6PR12MB1268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0039C6E5C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OJ4ufOFy+rxfkBs9ntjEngPn6fr3hh5jATbwXo5kwyOpqPfPkC37nCHPF3BRv8fc7uBFA9XfjPAww5ipHEzhx6Eh6eIJUeUR5bh2iqp/3xtiXvN4RfLJxHw7lc/cJKtfTDUvrOSFGrPCZ1cjDGXPg+6WU0hKTq/BaYppYbfSax1kD29Z2KveWc959hxUJJiUJ5QM+6lZlkvylPBe1qR6tU8e7tqo7om8f0sQ0lOfTY7+Fk3rWIeTrxheU8jiYwlDLPgmdwtqn5GwaS2wejAtDYQhmAALOHYPcx9jsxQ6F/au8sfn63gN9DrJEPDWuc1u475F5fW/ZuYheIDXVIeoTju0h+KWNpE3BGKlyqIncHA8ma3KBrH8tqa/22UFJg7GL8bxmUCMUIiHEk63nPHHwKPfw0ykC/7mM4Dg6lU/W9w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2019 12:02:46.2794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbeaa93-3a4a-4de4-c34b-08d6d9f668de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lozQ+InWtJY5h4A14Hn2w/YbgNeJCIPkapBu8mFT3oM=;
 b=05XtYTokKLuaDo+YqYZDjKFWEuoNrOqg8Q18kLc4lfPCz17wUC8+DMt30B79SfSK44EJVFaG3ZC97U7tIVCQInZltk5bqw6AU8nWzb/r0YTQxE1vIhBq7aQtToyVqAbHK3hzPGbCi5/iUGw+kf2EQIlxHLrK1gQ3eFhLiTg5JAw=
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
Cc: Trigger Huang <Trigger.Huang@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIFZlZ2ExMCBTUi1JT1YsIHZyYW1fd2lkdGggY2FuJ3QgYmUgcmVhZCBmcm9tIEFUT00gYXMK
UkFWRU4sIGFuZCBERiByZWxhdGVkIHJlZ2lzdGVycyBpcyBub3QgcmVhZGFibGUsIHNlZW1zIGhh
cmRjb3JkCmlzIHRoZSBvbmx5IHdheSB0byBzZXQgdGhlIGNvcnJlY3QgdnJhbV93aWR0aAoKU2ln
bmVkLW9mZi1ieTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggYzIyMTU3
MC4uYTQxNzc2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC04NDgs
NiArODQ4LDEzIEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfbWNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAkJYWRldi0+Z21jLnZyYW1fd2lkdGggPSBudW1jaGFuICogY2hhbnNpemU7
CiAJfQogCisJLyogRm9yIFZlZ2ExMCBTUi1JT1YsIHZyYW1fd2lkdGggY2FuJ3QgYmUgcmVhZCBm
cm9tIEFUT00gYXMgUkFWRU4sCisJICogYW5kIERGIHJlbGF0ZWQgcmVnaXN0ZXJzIGlzIG5vdCBy
ZWFkYWJsZSwgc2VlbXMgaGFyZGNvcmQgaXMgdGhlCisJICogb25seSB3YXkgdG8gc2V0IHRoZSBj
b3JyZWN0IHZyYW1fd2lkdGggKi8KKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIChhZGV2
LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMTApKSB7CisJCWFkZXYtPmdtYy52cmFtX3dpZHRoID0g
MjA0ODsKKwl9CisKIAkvKiBzaXplIGluIE1CIG9uIHNpICovCiAJYWRldi0+Z21jLm1jX3ZyYW1f
c2l6ZSA9CiAJCWFkZXYtPm5iaW9fZnVuY3MtPmdldF9tZW1zaXplKGFkZXYpICogMTAyNFVMTCAq
IDEwMjRVTEw7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
