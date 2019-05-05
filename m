Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB811403F
	for <lists+amd-gfx@lfdr.de>; Sun,  5 May 2019 16:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE6E892BE;
	Sun,  5 May 2019 14:24:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780080.outbound.protection.outlook.com [40.107.78.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DE1892BE
 for <amd-gfx@lists.freedesktop.org>; Sun,  5 May 2019 14:24:02 +0000 (UTC)
Received: from MWHPR1201CA0021.namprd12.prod.outlook.com (10.174.253.31) by
 BN6PR12MB1140.namprd12.prod.outlook.com (10.168.225.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Sun, 5 May 2019 14:24:01 +0000
Received: from DM3NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MWHPR1201CA0021.outlook.office365.com
 (2603:10b6:301:4a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Sun, 5 May 2019 14:24:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT013.mail.protection.outlook.com (10.152.82.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Sun, 5 May 2019 14:23:59 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Sun, 5 May 2019
 09:23:58 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: treat negative lockup timeout as 'infinite
 timeout'
Date: Sun, 5 May 2019 22:23:53 +0800
Message-ID: <20190505142353.30369-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(36756003)(81166006)(81156014)(8676002)(2351001)(8936002)(6666004)(356004)(305945005)(44832011)(86362001)(5660300002)(77096007)(47776003)(126002)(70206006)(2616005)(72206003)(486006)(50226002)(478600001)(476003)(70586007)(2870700001)(186003)(50466002)(1076003)(7696005)(51416003)(4326008)(68736007)(53936002)(426003)(48376002)(6916009)(53416004)(316002)(54906003)(26005)(2906002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1140; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70b508e4-29a4-42c0-efe0-08d6d165510b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR12MB1140; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1140:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1140CF8D7C7CA5C606769F58E4370@BN6PR12MB1140.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00286C0CA6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: emSd4qZ2qIBmVQSMgAyf4JfBJQHXcxJkifu0fWex/VamtZHspe9kk1dlnQVG2CLcbajaNzFMQ0YBkSOrrhUKa/2imrkZwyVWQd+iCBURtTTPdE8yj3FnvNnnkzd5QSeJeJVuUrdQjrILOD5Ulu8TcWtFnkH4PqE9jNKfr2KR0kXBe30Ufe2JPfwEwxUyxr1O6/7v5eHTgNkxowZb3Cc2yawfEddmbg4pav3r4XLAmVkfZ3hGWzOQmHvnjYTKqe21UI9R7vR70vzGVlMCE/kbu1w6MbLQDPgrOJ7+GhOAwATBtllAEAKkQe53BuscdV6sMFz+FrP50xtgvMNxaGCu2q7RA1V98V9sYRHZ8bx1KEBND620woXnb0siL1y1VovdLvXZxhbVNMKFtEvHjXiBEToUr94zZugd9GAU4I6sBZY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2019 14:23:59.9841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b508e4-29a4-42c0-efe0-08d6d165510b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1140
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTRD8a82F0stq+rk4uPKMCTApgHVsn4C7o/axsyb9KU=;
 b=QsnJLt7A9MgUYKlqNTSnlut+MzA/XSxjlEkhY9MY6m/BxL5C9irBFHqUGNA3I5V81o9jO/5xs9VieexuYKE2Q91xMrMeXqfoo7dVlUZKKyWKsxjJvWvduie/HLzhzT/nIDytGQNw6UGDvgLVySfhFGjLjAGiQAPh74rmCot4fZw=
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
Cc: Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmVnYXRpdmUgbG9ja3VwIHRpbWVvdXQgaXMgdmFsaWQgYW5kIHdpbGwgYmUgdHJlYXRlZCBhcwon
aW5maW5pdGUgdGltZW91dCcuCgpDaGFuZ2UtSWQ6IEkwZDgzODc5NTZhOWM3NDQwNzNjMDI4MWVm
MmUxYTU0N2Q0ZjE2ZGVjClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTQgKysr
KysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA1YjAzZTE3
ZTZlMDYuLjRkNmRmZjY4NTVmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYwpAQCAtMjMzLDEzICsyMzMsMTQgQEAgbW9kdWxlX3BhcmFtX25hbWVkKG1zaSwgYW1kZ3B1
X21zaSwgaW50LCAwNDQ0KTsKICAqIFNldCBHUFUgc2NoZWR1bGVyIHRpbWVvdXQgdmFsdWUgaW4g
bXMuCiAgKgogICogVGhlIGZvcm1hdCBjYW4gYmUgW05vbi1Db21wdXRlXSBvciBbR0ZYLENvbXB1
dGUsU0RNQSxWaWRlb10uIFRoYXQgaXMgdGhlcmUgY2FuIGJlIG9uZSBvcgotICogbXVsdGlwbGUg
dmFsdWVzIHNwZWNpZmllZC4gMCBhbmQgbmVnYXRpdmUgdmFsdWVzIGFyZSBpbnZhbGlkYXRlZC4g
VGhleSB3aWxsIGJlIGFkanVzdGVkCi0gKiB0byBkZWZhdWx0IHRpbWVvdXQuCisgKiBtdWx0aXBs
ZSB2YWx1ZXMgc3BlY2lmaWVkLgogICogIC0gV2l0aCBvbmUgdmFsdWUgc3BlY2lmaWVkLCB0aGUg
c2V0dGluZyB3aWxsIGFwcGx5IHRvIGFsbCBub24tY29tcHV0ZSBqb2JzLgogICogIC0gV2l0aCBt
dWx0aXBsZSB2YWx1ZXMgc3BlY2lmaWVkLCB0aGUgZmlyc3Qgb25lIHdpbGwgYmUgZm9yIEdGWC4g
VGhlIHNlY29uZCBvbmUgaXMgZm9yIENvbXB1dGUuCiAgKiAgICBBbmQgdGhlIHRoaXJkIGFuZCBm
b3VydGggb25lcyBhcmUgZm9yIFNETUEgYW5kIFZpZGVvLgogICogQnkgZGVmYXVsdCh3aXRoIG5v
IGxvY2t1cF90aW1lb3V0IHNldHRpbmdzKSwgdGhlIHRpbWVvdXQgZm9yIGFsbCBub24tY29tcHV0
ZShHRlgsIFNETUEgYW5kIFZpZGVvKQogICogam9icyBpcyAxMDAwMC4gQW5kIHRoZXJlIGlzIG5v
IHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLgorICogVmFsdWUgMCBpcyBpbnZhbGlk
YXRlZCwgd2lsbCBiZSBhZGp1c3RlZCB0byBkZWZhdWx0IHRpbWVvdXQgc2V0dGluZ3MuCisgKiBO
ZWdhdGl2ZSB2YWx1ZXMgbWVhbiAnaW5maW5pdGUgdGltZW91dCcgKE1BWF9KSUZGWV9PRkZTRVQp
LgogICovCiBNT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1l
b3V0IGluIG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgbm8gdGlt
ZW91dCBmb3IgY29tcHV0ZSBqb2JzKSwgIgogCQkiZm9ybWF0IGlzIFtOb24tQ29tcHV0ZV0gb3Ig
W0dGWCxDb21wdXRlLFNETUEsVmlkZW9dIik7CkBAIC0xMjQ4LDExICsxMjQ5LDE2IEBAIGludCBh
bWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKIAotCQkJLyogSW52YWxpZGF0
ZSAwIGFuZCBuZWdhdGl2ZSB2YWx1ZXMgKi8KLQkJCWlmICh0aW1lb3V0IDw9IDApIHsKKwkJCS8q
CisJCQkgKiBWYWx1ZSAwIHdpbGwgYmUgYWRqdXN0ZWQgdG8gZGVmYXVsdCB0aW1lb3V0IHNldHRp
bmdzLgorCQkJICogTmVnYXRpdmUgdmFsdWVzIG1lYW4gJ2luZmluaXRlIHRpbWVvdXQnIChNQVhf
SklGRllfT0ZGU0VUKS4KKwkJCSAqLworCQkJaWYgKCF0aW1lb3V0KSB7CiAJCQkJaW5kZXgrKzsK
IAkJCQljb250aW51ZTsKIAkJCX0KKwkJCWlmICh0aW1lb3V0IDwgMCkKKwkJCQl0aW1lb3V0ID0g
TUFYX0pJRkZZX09GRlNFVDsKIAogCQkJc3dpdGNoIChpbmRleCsrKSB7CiAJCQljYXNlIDA6Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
