Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2767732B9
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427896E5D1;
	Wed, 24 Jul 2019 15:28:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679786E5D1
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdveXHR7ArfYFW+hXEJOOthwMNB4VSi+fVjMaQAz1gtK2tEpP8lkC2VxumTwOts6ADqssBxYyJCE/SnJNzPYBfO4wD5uxZUip8pqjIFaAerdPSbaYnW7GlpbYCJpy+Zgcma/YvHcIRc7SazhXBc8ABEQY89N8pI6B5+cPibl9dZ5EkZvZq2fRAJm+wALEgvNWYJU+qgyeCcaLLTNz6P2qR6CMFOW3ZwsII8fjBJv+nKz/OdOLh+HUjz20k+SWWDchpy58KjYrPkJmKpN+JKMQYkcvYO11o+aaflTNqyo3wD3W6SkVTzneC0HOE9d+QgJ/Swtq58OBScABlmPbgREXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg97qGd1FcYj12F8xft0i+PhKL27inHYuCokqKyYiZo=;
 b=LexF5JeX9gv9U6wouBLSPMDPIzFuBnTpc4VPV4LwK6+fZpuMUEg5KNzK4fe2PvR+zmRyKo5ZDZK/BwtZQJpxJFy0aU4QmFJvOSyoVyPtmUCXd4+B3y2SlzllvsFcArHc/P8QA4rSFnFU2pzxkKXhqUACYlpme2gwW5q3jWj4Qvn0JCRGllWkJH7k6jZL6IFjSB7GsBvc+XSh23w6svBh0RakRLs3ybeWWRyr6ab5hA5CsGoprfT9PuxOX1X5DX/QwtGF/XDJfyt0lYy8iedIJgSp4qMss6DeLEL84WSo40XoZVJfhiFQ705MucJPB5sGk2yR+fSM4WpeL+NZbxRbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0059.namprd12.prod.outlook.com (2603:10b6:0:56::27) by
 CY4PR1201MB2487.namprd12.prod.outlook.com (2603:10b6:903:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Wed, 24 Jul
 2019 15:28:34 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by DM3PR12CA0059.outlook.office365.com
 (2603:10b6:0:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Wed, 24 Jul 2019 15:28:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 24 Jul 2019 15:28:33 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 10:28:32 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 4/4] drm/amd/display: enable S/G for RAVEN chip
Date: Wed, 24 Jul 2019 11:27:46 -0400
Message-ID: <1563982066-21793-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(478600001)(70586007)(305945005)(446003)(54906003)(11346002)(51416003)(476003)(2616005)(70206006)(44832011)(126002)(48376002)(16586007)(336012)(426003)(316002)(26005)(50466002)(76176011)(486006)(186003)(8676002)(6916009)(36756003)(2906002)(47776003)(86362001)(7696005)(14444005)(2351001)(50226002)(5660300002)(356004)(6666004)(53936002)(8936002)(81166006)(4326008)(68736007)(81156014)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2487; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208a5671-8c94-4778-819f-08d7104b9715
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB2487; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2487:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2487E64FB7B7719E9ADD98FEEAC60@CY4PR1201MB2487.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: k+WoXdbhNwTe70e0pyETgWKBf0vWxvWkY9RpzXNXRFsvYV3Dk26sunXLGFW/QoqfwmuE3ypkG9R5ckV/E9ollpuCGJBmnphxgpbtcOzw2H86OhYyZR62gpm51Vfb3O/0lwcIuXmyZMU3mxgdmQV5MBpqj3SwJv71HSgge7GxO9vWCMGVQF0rJFTevAaMjvsWVA+Xc+oJ5xEumgyGQ9SYOSdpIOLfNZAqoKBncd2ri79nljlfo/CMIA4SdwK7x+yuPcx3zgduOs5rWNSXIgO68e6y6RsZgZSAhr7PTRh/iFRMVIVgIEQG+pE1eV54WnzRmbTaZbaMYFP4Gr0WY+s+We56u8r8ELNT22mh7TisdIFeNiN8adb/eI7FQBhfXVnZbVHY5NeTv5ecfRCVdahFmfeOy1Sy6fJXnIJSiCgolDw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 15:28:33.8624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 208a5671-8c94-4778-819f-08d7104b9715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg97qGd1FcYj12F8xft0i+PhKL27inHYuCokqKyYiZo=;
 b=c99tJxygivSeoY4q0qmuvBZkmZ8wN/WQGhArkpwDFXCoJjIZ3/Z+/An3Rwz76qRytOW5G/gYjob/ZFUAPyBk16e925kfwhO5UKh17AzCYArQ15vKUF7FRwd52rdk+kADh8FqhCEoFO10LmymErZQkG2+iW9TJA4yLiwmmZGDrDU=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KCmVuYWJsZXMgZ3B1X3ZtX3N1cHBv
cnQgaW4gZG0gYW5kIGFkZHMgQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFzIHN1cHBvcnRlZCBkb21h
aW4KCnYyOgpNb3ZlIEJPIHBsYWNlbWVudCBsb2dpYyBpbnRvIGFtZGdwdV9kaXNwbGF5X3N1cHBv
cnRlZF9kb21haW5zCgp2MzoKVXNlIGFtZGdwdV9ib192YWxpZGF0ZV91c3djIGluIGFtZGdwdV9k
aXNwbGF5X3N1cHBvcnRlZF9kb21haW5zLgoKdjQ6IHYyK3YzIG1vdmVkIHRvIHN0YW5kYWxvbmUg
cGF0Y2guCgpDaGFuZ2UtSWQ6IElmMzQzMDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVjNjQ0NTAy
YjIwClNpZ25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgICAgICAgfCAyICst
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKaW5kZXggY2FjOTk3NS4u
NzMwNDVhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5j
CkBAIC01MDUsNyArNTA1LDcgQEAgdWludDMyX3QgYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2Rv
bWFpbnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJICogQVBVcy4gU28gZm9yY2UgdGhl
IEJPIHBsYWNlbWVudCB0byBWUkFNIGluIGNhc2UgdGhpcyBhcmNoaXRlY3R1cmUKIAkgKiB3aWxs
IG5vdCBhbGxvdyBVU1dDIG1hcHBpbmdzLgogCSAqLwotCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0g
Q0hJUF9DQVJSSVpPICYmIGFkZXYtPmFzaWNfdHlwZSA8IENISVBfUkFWRU4gJiYKKwlpZiAoYWRl
di0+YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9S
QVZFTiAmJgogCSAgICBhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUgJiYgYW1kZ3B1X2JvX3N1cHBv
cnRfdXN3YygwKSAmJgogCSAgICBhbWRncHVfZGV2aWNlX2FzaWNfaGFzX2RjX3N1cHBvcnQoYWRl
di0+YXNpY190eXBlKSkKIAkJZG9tYWluIHw9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4
IDQ5MjI1ODkuLmYwMzg3Y2UxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTY4Niw3ICs2ODYsNyBAQCBzdGF0aWMgaW50IGFt
ZGdwdV9kbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCSAqLwogCWlmIChhZGV2
LT5mbGFncyAmIEFNRF9JU19BUFUgJiYKIAkgICAgYWRldi0+YXNpY190eXBlID49IENISVBfQ0FS
UklaTyAmJgotCSAgICBhZGV2LT5hc2ljX3R5cGUgPCBDSElQX1JBVkVOKQorCSAgICBhZGV2LT5h
c2ljX3R5cGUgPD0gQ0hJUF9SQVZFTikKIAkJaW5pdF9kYXRhLmZsYWdzLmdwdV92bV9zdXBwb3J0
ID0gdHJ1ZTsKIAogCWlmIChhbWRncHVfZGNfZmVhdHVyZV9tYXNrICYgRENfRkJDX01BU0spCi0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
