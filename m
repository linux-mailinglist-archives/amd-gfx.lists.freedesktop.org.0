Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AAB10175
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7532889227;
	Tue, 30 Apr 2019 21:09:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C6D89225
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:53 +0000 (UTC)
Received: from SN1PR12CA0068.namprd12.prod.outlook.com (2603:10b6:802:20::39)
 by DM6PR12MB3753.namprd12.prod.outlook.com (2603:10b6:5:1c3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 21:09:52 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by SN1PR12CA0068.outlook.office365.com
 (2603:10b6:802:20::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:51 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/20] drm/amd/display: Handle get crtc position error
Date: Tue, 30 Apr 2019 17:09:05 -0400
Message-ID: <20190430210938.32335-8-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(2616005)(70586007)(186003)(77096007)(26005)(336012)(5660300002)(305945005)(47776003)(1076003)(8676002)(50226002)(8936002)(486006)(81166006)(81156014)(6916009)(446003)(11346002)(126002)(476003)(426003)(6666004)(356004)(68736007)(16586007)(86362001)(2906002)(316002)(51416003)(4326008)(76176011)(53936002)(70206006)(72206003)(14444005)(478600001)(50466002)(36756003)(2351001)(53416004)(7696005)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3753; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 753e8153-ca89-4a7d-5acd-08d6cdb02fc0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB3753; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3753:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3753691DBDBA5A5195064EAAF93A0@DM6PR12MB3753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8sekUyX6XEQdFhZ8m5Iibh8gZfn/405nBL0+vX0zuXAkSvOqepFZPjFVFCAhJod1CorTbxr5kUUcnUZ6oteNj6IeYOt0ueJM0u2LD36RFOO3p+3BSS6FJBhVmehREMoQ6fajvQ1btU7XB94/1yHY9+xnvPjB5dOLUrnd5tXQj4/fLkaZB+jpJ1KsgIYbLEx34ri6Cz+VuniH0dlLKg6lcullPX5clnwoU4CZVxC+LrDyVIZ5W6mQtBAojy1MnjEQti8PN3znZ60hQbnACFsh3uI4UP1RlflKo0GDnWZMxytVKZ+GyVVpIpjU8hW6zxkkZsm+6TX84qTdinD96uVK8HrwtzQ8pdBaIKhIVb/CgWGXNYNp+Ici5ogcUz78YGc2ztx+Z2+3MeGNI3eQnzey8mambm8Zq7jaLW0FlCk3qfg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:51.6855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 753e8153-ca89-4a7d-5acd-08d6cdb02fc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3753
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJjgEnTY6vAv/F7hfO5OP6VsDlxDI1OcHgSRNDGXigo=;
 b=xWcHG7RQSybfSuCnasaR9wdHtClANUnutacVP2S5c5FtFo0VjDgaCkBg104zSs0yUtQrBE1rNenzjFWW9Gi8JQR7oAlrhareAKgj0f18xsoca76QVy08QM+EwL+fZEHHmyv2YiQviNLNF/a7epK+gaZSguvfTwNXlTlL356m3jM=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKW1doeV0KZGNfc3Ry
ZWFtX2dldF9jcnRjX3Bvc2l0aW9uIGNhbiByZXR1cm4gZmFsc2UuClRoaXMgd2FzIHVuaGFuZGxl
ZCBpbiBkZWxheV9jdXJzb3JfdW50aWxfdnVwZGF0ZQoKW0hvd10KSWYgZGNfc3RyZWFtX2dldF9j
cnRjX3Bvc2l0aW9uIHJldHVybnMgZmFsc2UsIHNvbWV0aGluZwppcyB3ZWlyZC4gIERvbid0IGRl
bGF5LgoKQ2hhbmdlLUlkOiBJZDBmYzYxNzkyYWFhMjQ4NTk0ZGViNDZkOTk4NGJjYjNmYjc4NTU5
YwpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBTdW4gcGVuZyBMaSA8U3VucGVuZy5MaUBhbWQuY29tPgpBY2tlZC1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgfCAzICsrLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKaW5kZXggZjdhMjkzOTAyMjM0Li5l
MTA0NzlkNThjMTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX3N0cmVhbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX3N0cmVhbS5jCkBAIC0yMTEsNyArMjExLDggQEAgc3RhdGljIHZvaWQgZGVsYXlfY3Vyc29y
X3VudGlsX3Z1cGRhdGUoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwgc3RydWN0IGRjICpkYykK
IAkJCUFTSUNfUkVWX0lTX1JBVkVOKHN0cmVhbS0+Y3R4LT5hc2ljX2lkLmh3X2ludGVybmFsX3Jl
dikpIHsKIAogCQl2dXBkYXRlX2xpbmUgPSBnZXRfdnVwZGF0ZV9vZmZzZXRfZnJvbV92c3luYyhw
aXBlX2N0eCk7Ci0JCWRjX3N0cmVhbV9nZXRfY3J0Y19wb3NpdGlvbihkYywgJnN0cmVhbSwgMSwg
JnZwb3MsICZudnBvcyk7CisJCWlmICghZGNfc3RyZWFtX2dldF9jcnRjX3Bvc2l0aW9uKGRjLCAm
c3RyZWFtLCAxLCAmdnBvcywgJm52cG9zKSkKKwkJCXJldHVybjsKIAogCQlpZiAodnBvcyA+PSB2
dXBkYXRlX2xpbmUpCiAJCQlyZXR1cm47Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
