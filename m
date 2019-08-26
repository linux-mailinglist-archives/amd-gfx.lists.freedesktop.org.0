Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833999C813
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E536A6E171;
	Mon, 26 Aug 2019 03:55:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730069.outbound.protection.outlook.com [40.107.73.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF866E171
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpKFxyvz4fFVdW4DGW2YSCSyChgELvfP0mpvf7W661pHHoMYMSYSpa2MzjPmH/OuB0B0ARjqYOX3FGJjkIYGJ8gk5IkcR1ZJ30h7ePlyVxhRBRXccsPod1DOfYpeqQELu5uoTZGbcXGqDhIoKHxRkLNmaY1n5atUvRllF2mdRuQ5mUHrEzsb/jNHr0Cyd5N86fO7EQJXd9h86sR20A2GWgW+6gwI97VFI9fUGmZDALSVUcMsZfv8JC4NJnA5ov5VY6PLveKSASPB1DDsLX6b5y1WuEV6AA5/9yi/Iddrt+QxRHrxFKzhcYlgqZMxXCvrPZwZXAD8WAHvG+Ip1hXtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icYf+kfthBfc7wW0zbb9BuUlxH5Bt7cfTS03YQZjrO4=;
 b=S8KX6Z+DnawWTCtAQ4joa0IC+scs1JTgFXyQfnZoRLAy/LHkInDr1lcdCHH4FirDlBwTWc+jjjGorgf3ZYSKiA4jfdii+VUPrqgfxjid+OLSmio928DrbZGYCIgufhxrUT9V1bGcIomZ0isA5UyurjfetztDm62BWFsQHFFtswvTTd/BXQ+6Zp0S988cMskrgCQ881ocGRpCe0cHmw17//v+3ELmjxKi3pnFpKZ2KFBJkZVzIQx1i1BQkWGokGF1pbBzahbCTqIw0lrvUop5qqXXlcef6NVW4m1d005lQm0BI0xzLW3PkuR3eFlQ9vrpQzd+jlHufLcLyOvBKTAv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:405:4c::30) by CY4PR12MB1528.namprd12.prod.outlook.com
 (2603:10b6:910:6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Mon, 26 Aug
 2019 03:55:31 +0000
Received: from DM3NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN6PR1201CA0020.outlook.office365.com
 (2603:10b6:405:4c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT063.mail.protection.outlook.com (10.152.83.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:31 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:29 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 5/8] drm/amdgpu: update nbio v7_4 ip header files
Date: Mon, 26 Aug 2019 11:54:57 +0800
Message-ID: <1566791700-1912-6-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(446003)(336012)(5660300002)(47776003)(70586007)(81166006)(81156014)(126002)(8676002)(86362001)(48376002)(50466002)(53416004)(305945005)(6636002)(486006)(478600001)(186003)(11346002)(8936002)(70206006)(2906002)(50226002)(76176011)(16586007)(476003)(2616005)(7696005)(51416003)(110136005)(316002)(53936002)(26005)(36756003)(14444005)(426003)(6666004)(356004)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1528; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 233f375d-51df-45b6-3513-08d729d93d82
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1528; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1528:
X-Microsoft-Antispam-PRVS: <CY4PR12MB152849BFCC885EE80F53328CFCA10@CY4PR12MB1528.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XEoY2cvnLgAqqalRVc/cPbfCCenv8+AqTdA+Oqjy9EMsAwYkIpQLrcQjQ/Ryab8XNgTkb2gfJZQ6NOvMb8VntHXAimqUmMDD/tjsD5ikuV7Q+mTuPtyt9ti9TaCFdaaTtKWYO12qj4cHojSIQDvZNzyXz1EfeCgiX8SXDj0vVaDsHXo1zzzkQD2/vXDu1/3O+DdgCNZH2if6HWYuEAfzOTGyqjbdV6JBRnjw/i378QBvLzgYa2aoTPprjWS1BnTxcI6r5nRoDgUot7Qdh6tv/oeKr4cNA5OWL7/HnK8Rp7ZN24DV3lAkwfcRCAQMyZlC4a1C2JawjeinSxxJvvZB9tWAThJxKoNZt4tB8j/x/LdmGsaqJtdLDTK4TagSHAwNcI+PdCxP5LiekTULgcxtX7+D0WfrqPPKNeZLPympX9Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:31.1663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233f375d-51df-45b6-3513-08d729d93d82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1528
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icYf+kfthBfc7wW0zbb9BuUlxH5Bt7cfTS03YQZjrO4=;
 b=L4ETWC1BpKHBAKVtyezhxU6cfgg8eMngWIy17omuKWZVB57xyUyMz8e879dQZ2XxahIEHX42YUK7PrUgiLOVCAjsWQXmZAnQfNVfZxd9S89ehwcGwB9DpiQ9K2MDdnRN5/dzbpMmSRzE5TDq3wP0Kgq2VYc6vIRJlfe0LC3m6ig=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIG1tQklGX0lOVFJfQ05UTCBhbmQgaXRzIHNoaWZ0IG1hc2suCgpTaWduZWQtb2ZmLWJ5OiBI
YXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzRfb2Zmc2V0LmggIHwgNCArKy0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfNF9zaF9tYXNrLmgg
fCA2ICsrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25i
aW8vbmJpb183XzRfb2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19y
ZWcvbmJpby9uYmlvXzdfNF9vZmZzZXQuaAppbmRleCA5OTRlNzk2Li5jZTU4MzBlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfNF9v
ZmZzZXQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9u
YmlvXzdfNF9vZmZzZXQuaApAQCAtMjc5Myw4ICsyNzkzLDggQEAKICNkZWZpbmUgbW1CSUZfRE9P
UkJFTExfSU5UX0NOVExfQkFTRV9JRFggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyCiAjZGVmaW5lIG1tQklGX0ZCX0VOICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMHgwMGZmCiAjZGVmaW5lIG1tQklGX0ZCX0VOX0JBU0VfSURY
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMgotI2RlZmluZSBtbUJJRl9CVVNZX0RFTEFZX0NOVFIgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDB4MDEwMAotI2RlZmluZSBtbUJJRl9CVVNZX0RFTEFZX0NOVFJfQkFTRV9JRFgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDIKKyNkZWZpbmUgbW1CSUZfSU5UUl9DTlRMICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
eDAxMDAKKyNkZWZpbmUgbW1CSUZfSU5UUl9DTlRMX0JBU0VfSURYICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyCiAj
ZGVmaW5lIG1tQklGX01TVF9UUkFOU19QRU5ESU5HX1ZGICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTA5CiAjZGVm
aW5lIG1tQklGX01TVF9UUkFOU19QRU5ESU5HX1ZGX0JBU0VfSURYICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMgogI2RlZmluZSBtbUJJ
Rl9TTFZfVFJBTlNfUEVORElOR19WRiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDEwYQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzRfc2hfbWFzay5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzRfc2hf
bWFzay5oCmluZGV4IGQ0NjdiOTMuLmY5ODI5ZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9uYmlvL25iaW9fN180X3NoX21hc2suaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfNF9zaF9tYXNrLmgK
QEAgLTIwNDIwLDkgKzIwNDIwLDkgQEAKICNkZWZpbmUgQklGX0ZCX0VOX19GQl9XUklURV9FTl9f
U0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMHgxCiAjZGVmaW5lIEJJRl9GQl9FTl9fRkJfUkVBRF9FTl9N
QVNLICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDFMCiAjZGVmaW5lIEJJRl9GQl9FTl9fRkJf
V1JJVEVfRU5fTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDJMCi0vL0JJRl9CVVNZX0RF
TEFZX0NOVFIKLSNkZWZpbmUgQklGX0JVU1lfREVMQVlfQ05UUl9fREVMQVlfQ05UX19TSElGVCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHgwCi0jZGVmaW5lIEJJRl9CVVNZX0RFTEFZX0NOVFJfX0RFTEFZX0NOVF9NQVNLICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4MDAwMDAwM0ZMCisvL0JJRl9JTlRSX0NOVEwKKyNkZWZpbmUgQklGX0lOVFJfQ05U
TF9fUkFTX0lOVFJfVkVDX1NFTF9fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwCisjZGVmaW5lIEJJRl9JTlRSX0NO
VExfX1JBU19JTlRSX1ZFQ19TRUxfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDFMCiAvL0JJRl9NU1Rf
VFJBTlNfUEVORElOR19WRgogI2RlZmluZSBCSUZfTVNUX1RSQU5TX1BFTkRJTkdfVkZfX0JJRl9N
U1RfVFJBTlNfUEVORElOR19fU0hJRlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAweDAKICNkZWZpbmUgQklGX01TVF9UUkFOU19QRU5ESU5HX1ZGX19CSUZf
TVNUX1RSQU5TX1BFTkRJTkdfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMHg3RkZGRkZGRkwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
