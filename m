Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F86DB744
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B0F6EAD4;
	Thu, 17 Oct 2019 19:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7026EAD1
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUriRhOjH7qiAcs/qBMLliJ72YPQJxReMfiHlzW6xauONu1CPNcZYPDWwxge692RZTJfkQJkjVefL4JNJ1y+i64kcKJyfEmAuw7ZwOlVip+G3N1Ppa0nedgVuNYLNSUkGHCcZf7TKLsy75HIJrrf5EsRW0rEGG+BauniIRBUl+4KlQq+oyr/SJsC89enNKFVNqQHLWO7p+laPpmaVlVoKKNksxvQ66ZdxXgoRulBjR+aC2Gqw0fhIGmkTp/+glwlQqjHCZS1ZRpNZTkffl92PcI0Rx3/nFsrOlgRl8fgRmAUlKBmtqMap+6zsjvLpeDtgLkbqHQYHWLVaknCe6O1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2T8082Z1QaEs4to6X0Jx3IW0uA3H9uRF41WW8vCeBc=;
 b=QyifsZOAXGwVLx4VcpKKIsXRjxer69Caft/175F+0LzAW+qM+aLz9k8+ADH6lvCt5i0R1nSIWowpPRmu0BdnYJ1YiwKWfta5XgZRqOLOqw7lzleTesPYiMdq4Swhg6cpqoKlfjvTTVL5JLinltwhgJwy5sg/4fTIxbVWPMi6jTQKxbgf0wsF8dWqq2jwAnY31Uix9pwfLzIEWtMuirG4+/57DkQNlHetuumJX+/dm7pX0Rgw6DIHEGmWInMOL9s7mXs4ua9rQtfc0YFzj5E/NSug3+1t11kv4LUbN/QMs2ABaxxleUCMGY+EUKGy4/6doZquetgyAFbpP2Tp3R+biA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:405:4c::32) by BN8PR12MB3298.namprd12.prod.outlook.com
 (2603:10b6:408:69::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Thu, 17 Oct
 2019 19:15:55 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR1201CA0022.outlook.office365.com
 (2603:10b6:405:4c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:55 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:54 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:54 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 36/37] drm/amd/display: fix hubbub deadline programing
Date: Thu, 17 Oct 2019 15:13:28 -0400
Message-ID: <20191017191329.11857-37-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(428003)(199004)(189003)(126002)(6916009)(47776003)(478600001)(70206006)(50226002)(48376002)(76176011)(2351001)(70586007)(486006)(2906002)(336012)(2870700001)(476003)(26005)(2876002)(426003)(11346002)(446003)(2616005)(54906003)(186003)(316002)(4326008)(305945005)(81166006)(51416003)(50466002)(86362001)(81156014)(1076003)(8936002)(8676002)(6666004)(356004)(5660300002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3298; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e46321c-27fa-4c4b-a35f-08d753366f3d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3298:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3298096332265063B6D56DB9826D0@BN8PR12MB3298.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRQ3kSjpWIjHmf16hr/ogKjT0qcZI32s8GxOl8j+LlD8DC4977QNTbLS7TygWBI7YApDxx8SMEhzSck5N/qeib5RYHnsmjzZvh8CAiSOJklE3LmpAd8KegdfazejuMQlyLsjdFdWPGINvJ5sNmdTatlFbXII9GRnYKRcBAC3Afq9zbnwHbkhp+u/lDGseIogTu6CuxyHshQU9R+mJd9A+7ZKNsRJ8JOv6vGgwN9O3zZW6bNXQgYbrrPYghnVxZ4zA9u59OoL0REqQU4TIonscUuUfYxFlYIha4A48DqyF4WANGsUVkz9TMEZ1XatjLJwQueDr2SvddCgxzGvpbpQRXVyXPG2rtLN0RPgDJZlSWwmt40ehY6McVG4zQ89Q4O+EJN4dFx1XHyghEoIAu3CmXqtdDVaFG5aKluOwRvcpaI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:55.4553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e46321c-27fa-4c4b-a35f-08d753366f3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3298
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2T8082Z1QaEs4to6X0Jx3IW0uA3H9uRF41WW8vCeBc=;
 b=rROytVpVJkRuJpgoY1WjQNdD6lvsqqweSpSn5xtksZMMNb7ORPYSfcTw7DeO1f9tKdRl+DEzZWzAfxIkRlRFTV8WWno+lSK6CyzUeBX/Vqxf64LvvuY6vrgTf+gCfwLRfrarWBSBWSDWYzZwqipd2gQjUUNHp0hgEI7tCspX3/c=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpGaXggdGhlIHByb2dy
YW1taW5nIG9mIERDSFVCQlVCX0FSQl9SRUZDWUNfUEVSX1RSSVBfVE9fTUVNT1JZX0EuCldhcyBu
b3QgZmlsbGVkIGluLgoKU2lnbmVkLW9mZi1ieTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBh
bWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAxICsKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggM2NkYjYx
NzUwNTcwLi41ZTM3MzhlOTZmZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0yNjM0LDYgKzI2MzQsNyBAQCBz
dGF0aWMgdm9pZCBkY24yMF9jYWxjdWxhdGVfd20oCiAjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FN
RF9EQ19EQ04yXzEpCiAJY29udGV4dC0+YndfY3R4LmJ3LmRjbi53YXRlcm1hcmtzLmIuZnJhY191
cmdfYndfbm9tID0gZ2V0X2ZyYWN0aW9uX29mX3VyZ2VudF9iYW5kd2lkdGgoJmNvbnRleHQtPmJ3
X2N0eC5kbWwsIHBpcGVzLCBwaXBlX2NudCkgKiAxMDAwOwogCWNvbnRleHQtPmJ3X2N0eC5idy5k
Y24ud2F0ZXJtYXJrcy5iLmZyYWNfdXJnX2J3X2ZsaXAgPSBnZXRfZnJhY3Rpb25fb2ZfdXJnZW50
X2JhbmR3aWR0aF9pbW1fZmxpcCgmY29udGV4dC0+YndfY3R4LmRtbCwgcGlwZXMsIHBpcGVfY250
KSAqIDEwMDA7CisJY29udGV4dC0+YndfY3R4LmJ3LmRjbi53YXRlcm1hcmtzLmIudXJnZW50X2xh
dGVuY3lfbnMgPSBnZXRfdXJnZW50X2xhdGVuY3koJmNvbnRleHQtPmJ3X2N0eC5kbWwsIHBpcGVz
LCBwaXBlX2NudCkgKiAxMDAwOwogI2VuZGlmCiAKIAlpZiAodmxldmVsIDwgMikgewpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2Uu
YwppbmRleCA4OGY4OWQwNzMwNjEuLjEyYTY1NzY5MmQ2ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKQEAgLTEwMDks
NiArMTAwOSw3IEBAIHN0YXRpYyB2b2lkIGNhbGN1bGF0ZV93bV9zZXRfZm9yX3ZsZXZlbCgKICNp
ZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMSkKIAl3bV9zZXQtPmZyYWNfdXJnX2J3
X25vbSA9IGdldF9mcmFjdGlvbl9vZl91cmdlbnRfYmFuZHdpZHRoKGRtbCwgcGlwZXMsIHBpcGVf
Y250KSAqIDEwMDA7CiAJd21fc2V0LT5mcmFjX3VyZ19id19mbGlwID0gZ2V0X2ZyYWN0aW9uX29m
X3VyZ2VudF9iYW5kd2lkdGhfaW1tX2ZsaXAoZG1sLCBwaXBlcywgcGlwZV9jbnQpICogMTAwMDsK
Kwl3bV9zZXQtPnVyZ2VudF9sYXRlbmN5X25zID0gZ2V0X3VyZ2VudF9sYXRlbmN5KGRtbCwgcGlw
ZXMsIHBpcGVfY250KSAqIDEwMDA7CiAjZW5kaWYKIAlkbWwtPnNvYy5kcmFtX2Nsb2NrX2NoYW5n
ZV9sYXRlbmN5X3VzID0gZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV9jYWNoZWQ7CiAKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
