Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8E92705
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03CA6E174;
	Mon, 19 Aug 2019 14:36:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFAB6E177
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX4DVtx4g6UUntgEAnI29IH1J9aukREWtYz2qo5EEjoQw7dDCiQPN/NVJhj8opeG+9BW/MFu6EyniBRybDRN37j7pl9voCXA1IZbkyfklq+PD4VnfleDyqm/OFCTulmwB81o0/hUUu8vEeh3sKiuqI8Y0OMHJrxC3Krj1dX7F2A3bkTZkPG/F7g6+KsDqysvqz7GQhMFaHeBh96dI4BIzQLBptczquPNQU+iDF4vk+8wV7cDav8r7S+9yUliWKY3m2cUN+9Hn5cUWiXsrkgDH0mWzStdj4Oozr0rSOq5lOeP8LtNnguXvLP/n7iChlndzMuv58U6JSy9ixjMHoGS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8a62/bKZkW6eGEPl3PwcBE5hCgny9ZqIqW+HhONVRRI=;
 b=MAFuKQ4mZeVr3koVOOMJyDZQCpzAjB/E8uRC2kHNFThA6XLLk4t3rdvZBIJ5yS9HI7MRHCBxQ4El4/juI4OCw8XKN2PNZ0RVXdtPqlJ7vfhApLB3+4tI34G90m+d+copYdeEdT3OOgJqQSIfAzmxzcBVhKDp7bmwjqiRQyfCCtgCzRLaaCRjxgQA+O7yanSeWJkC9RV4MkkRwpzBPOJjnEA17U57vPdfdPmK6aVuvBRXa1JwRt08TO4QXOeiJ4QVnke7XmibbBKQN4YjC9D8aY+mf9kSA2/Rzv3HddzqLnX51OOhkkU95dl+kibktQmq0HsJ2MiKcQka1Rru0NUVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0005.namprd12.prod.outlook.com (2603:10b6:4:1::15) by
 BN6PR12MB1266.namprd12.prod.outlook.com (2603:10b6:404:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:57 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM5PR12CA0005.outlook.office365.com
 (2603:10b6:4:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:56 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/36] drm/amd/display: fix dcn20 odm dpp programming
Date: Mon, 19 Aug 2019 10:35:01 -0400
Message-ID: <20190819143515.21653-23-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(50226002)(26005)(47776003)(36756003)(476003)(2351001)(14444005)(53936002)(53416004)(478600001)(4326008)(50466002)(1076003)(8676002)(81166006)(81156014)(316002)(16586007)(305945005)(8936002)(48376002)(51416003)(76176011)(7696005)(486006)(6916009)(86362001)(6666004)(426003)(446003)(336012)(5660300002)(2616005)(186003)(70586007)(70206006)(126002)(2906002)(356004)(11346002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1266; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e65c7c1c-161b-4eb4-05d8-08d724b28bfa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1266; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126683EE688E1E9D9C6A457DF9A80@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:370;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iwpO0ZeocjTdcowb2bIQnPM8pHDlysQuiR8yQEed5+rQzBDtcGdcUz00Z/+1UHTVQn2+PsAwxMemhZM3kG8sJqwclRjhZDIDoamA3FHxWe+NL4TgFGxi/EqXjoD7iiUL5yxcO5PTteb8XQz0USeRo6mIDuG8EgnWKYVd58FmVuPHOHFhX/QnaU5/8AFrMXLC2LpNZ73KlI4/CQN7kVUupgnyrQli44znWDsNZRWwvEF+8HsuXXz7NWjdBGCOs8OQng3K7buR68uehvlSC56VEluLCYW9cnVQDfhQQEcLUO7A+FBiBhAwO8TU4UMHL8d1MHCxYCN2DASek4iv1mIYD3VF6hp4SJpWUYenUuGCzrSaaKeItWDhhgM+b9xaGdWecx5Jo+DZc0dVfJnt0OajcVml9GdDz+mv7pQ5Ra1GUhc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:56.5730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65c7c1c-161b-4eb4-05d8-08d724b28bfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8a62/bKZkW6eGEPl3PwcBE5hCgny9ZqIqW+HhONVRRI=;
 b=Xa+b5TKHgmk97P0kGR9BlwIFg7KcZO8Os3qgwnJpQJw02u8zLyy1BmYCzkacFTJYJmH7GCxvOMR4gHJsoqcaSqeXVe8bbLcSThM9qy/mMKUUoTpHYoaDH3yLrH7MdXkc/9M6k9NBUVDkurDYWH6c8RASxWMBFzZ22XykSszOzNI=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCmRj
bjIwIHJlcXVpcmVzIHNwZWNpYWwgY2FzaW5nIGZvciBvZG0uClRoaXMgY2hhbmdlIHRyZWF0cyBv
ZG0gYXMgYWx0ZXJuYXRpdmUgdG8gbXBjIHRyZWUgb24gZGNuMjAuCgpUaGlzIGlzIHBsYW5uZWQg
dG8gYmUgZml4ZWQgaW4gYSBmdXR1cmUgcmVmYWN0b3IKClNpZ25lZC1vZmYtYnk6IERteXRybyBM
YWt0eXVzaGtpbiA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFy
bGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFr
aGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGMuYyAgICAgICAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIHwgNyArKysrKystCiAyIGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IGUwOWM2Mzk2ODVmYy4uYWM1NTY0NDI0N2NhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTIwMjMsNiArMjAyMyw3
IEBAIHN0YXRpYyB2b2lkIGNvbW1pdF9wbGFuZXNfZm9yX3N0cmVhbShzdHJ1Y3QgZGMgKmRjLAog
CQlzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4ID0gJmNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhb
al07CiAKIAkJaWYgKCFwaXBlX2N0eC0+dG9wX3BpcGUgJiYKKwkJCSFwaXBlX2N0eC0+cHJldl9v
ZG1fcGlwZSAmJgogCQkJcGlwZV9jdHgtPnN0cmVhbSAmJgogCQkJcGlwZV9jdHgtPnN0cmVhbSA9
PSBzdHJlYW0pIHsKIAkJCXN0cnVjdCBkY19zdHJlYW1fc3RhdHVzICpzdHJlYW1fc3RhdHVzID0g
TlVMTDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMKaW5kZXggMzFhOTg1ODU4YmFlLi45OTczM2UxYTg5NTggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xMDU4
LDggKzEwNTgsMTMgQEAgc3RhdGljIHZvaWQgZGNuMjBfcHJvZ3JhbV9hbGxfcGlwZV9pbl90cmVl
KAogCWlmIChwaXBlX2N0eC0+cGxhbmVfc3RhdGUgIT0gTlVMTCkKIAkJZGNuMjBfcHJvZ3JhbV9w
aXBlKGRjLCBwaXBlX2N0eCwgY29udGV4dCk7CiAKLQlpZiAocGlwZV9jdHgtPmJvdHRvbV9waXBl
ICE9IE5VTEwgJiYgcGlwZV9jdHgtPmJvdHRvbV9waXBlICE9IHBpcGVfY3R4KQorCWlmIChwaXBl
X2N0eC0+Ym90dG9tX3BpcGUgIT0gTlVMTCkgeworCQlBU1NFUlQocGlwZV9jdHgtPmJvdHRvbV9w
aXBlICE9IHBpcGVfY3R4KTsKIAkJZGNuMjBfcHJvZ3JhbV9hbGxfcGlwZV9pbl90cmVlKGRjLCBw
aXBlX2N0eC0+Ym90dG9tX3BpcGUsIGNvbnRleHQpOworCX0gZWxzZSBpZiAocGlwZV9jdHgtPm5l
eHRfb2RtX3BpcGUgIT0gTlVMTCkgeworCQlBU1NFUlQocGlwZV9jdHgtPm5leHRfb2RtX3BpcGUg
IT0gcGlwZV9jdHgpOworCQlkY24yMF9wcm9ncmFtX2FsbF9waXBlX2luX3RyZWUoZGMsIHBpcGVf
Y3R4LT5uZXh0X29kbV9waXBlLCBjb250ZXh0KTsKKwl9CiB9CiAKIHZvaWQgZGNuMjBfcGlwZV9j
b250cm9sX2xvY2tfZ2xvYmFsKAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
