Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCA69DE6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0443789D86;
	Mon, 15 Jul 2019 21:22:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780088.outbound.protection.outlook.com [40.107.78.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9731F89D63
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJWGU2NpQGrfXDdrNzM+cZMrRFONJBh9Gi/UElz/MPTZHvJr/G6LXwTp2oHqCf29vrmM639gKzGMDvCUYHx9CVbC2PRKLbTN/uUZvnJKwudITgCU4tgqLhIvYdI/EW0V/6/AGISfkL+W/AlmyYkSo9ltUSRtDv97m+qN72PZ/7nqmIzx3OyOqjpwy99XsQKVKHodV/eyXDee25RMXFv2LkGbDSpXlmtBwqu5hAlBesRrXBzgMr12RDMuQP1S7SBNobsdKCVmLOXEgiTfwGkKoRXfEuCiv9TBFq7G/+m9juP1KRizvcBYWPDgDFu2RxPUMqUACiysH2nY0ekZB9wYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+1F+04obgMDAUS2VTdersVcjeG1/jino5TK/iRWkXc=;
 b=ETbkVCnrRFlFJuXoCrKifKG/ZwUxpQk4Wh7V0RSz/9r43cHz+h7jj8ydDA0Ae7zTnQazfhtMGf8C13rvRUabsW8wJjdtyO+iHvkh96XnIr1aUstw1q3H1Ez/WeVfgfpalivVua908g5YY+batg2XKgcBwEJBASuon4IOnC/jxjLJVxKpyAfy+lYMjs7ygA06j9u4iEPqBirnd3x2cfS0QVZCvoFloej3SRRpBSZ6QNSvIWy59AB3Mf9WAqjb8ioVDDEYus4fXQQJ22O9B1XpdQdieRXqmp+0MEqecBes1ndLKmQg2iZ8BktMFy9ziVwWwhT1OUyktB7qevQ7FepY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0103.namprd12.prod.outlook.com (2603:10b6:0:55::23) by
 BY5PR12MB3921.namprd12.prod.outlook.com (2603:10b6:a03:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:06 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0103.outlook.office365.com
 (2603:10b6:0:55::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:05 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:43 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 86/87] drm/amd/display: handle active dongle port type is DP++
 or DP case
Date: Mon, 15 Jul 2019 17:20:48 -0400
Message-ID: <20190715212049.4584-87-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(199004)(189003)(2906002)(48376002)(5660300002)(6916009)(126002)(53936002)(49486002)(446003)(81166006)(50226002)(50466002)(70206006)(81156014)(4326008)(70586007)(11346002)(476003)(2616005)(2870700001)(426003)(47776003)(26005)(8936002)(8676002)(316002)(356004)(186003)(14444005)(51416003)(2351001)(336012)(86362001)(305945005)(54906003)(1076003)(486006)(2876002)(76176011)(36756003)(478600001)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aacea067-8dd9-4f3d-baa1-08d7096a7cc5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3921; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3921:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3921C21DC8A75FAB8EF68D7782CF0@BY5PR12MB3921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ADZcgV4y0xSkSzJh+sFuEXZVU7mus+j3sTV0MG19nEP/ZAmfV8QrYodjbRtcnE/XPAYzTp9wRLtQWHTWNnKglCPGaZyLTGOhjiBavOzTfz3IcPb8MZYLM1ncQ7rzFK7Smr6HTyPjjxHd0WB0L+PGXauzw/dQcLwr8u/xCoNjRBGN2nafnc24b2g7BLZB5X7Hf1fqMbydbUi1Uat3K4rOVqtSqaChfLSqCje8KhhOdMxtXvABBtorf0/Z+XkueYaVJVzhii8n5Y5auCUL3gCQDei+HnmGIogQ6p/0/s9eefSlFh26L2V7HsNGGRyurGCR7rfb5T/kzQ6HObP0QgnMRtC87QAKXKZhDooZoVVPHu4bmhhNKFyEtqzhMZKGBnn3WtoYkMNDDqtqK53PcOLQj9zXd4NEJq2NZa90dP8NwnE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:05.8739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aacea067-8dd9-4f3d-baa1-08d7096a7cc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+1F+04obgMDAUS2VTdersVcjeG1/jino5TK/iRWkXc=;
 b=IFf2cflfjmzdU5DgToU8+QX8K0CaTcXJ40Mfpnd7GDD5bi3a0IXb6aWrkC3uA70LjfCj/aIFsoN6Cjr5ZT3ZRHZs6niQTZVA4mqOpW/Ozi2Q/4RsRYJYNVT6Y9BERmXUo0EBGB0HwVM/O8tT4rNh5Q3+7ESiy+/HCjggZe6E/P0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Dale Zhao <dale.zhao@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGFsZSBaaGFvIDxkYWxlLnpoYW9AYW1kLmNvbT4KCltXaHldOgpTb21lIGFjdGl2ZSBk
b25nbGVzIGhhdmUgRFArKyBwb3J0IGFuZCBEUCBwb3J0IGF0IHRoZSBzYW1lIHRpbWUuIEN1cnJl
bnQKY29kZSBkb2Vzbid0IGNvdmVyIERQKysgY2FzZSBhbmQgcHJvY2Vzc2VzIGFzIGRlZmF1bHQg
RFZJIGNhc2UsIGluIHdoaWNoCmF1ZGlvIGlzIGRpc2FibGVkLiBCZWNhdXNlIG9mIGR1YWwgbW9k
ZSwgRFAgY2FzZSBpcyBhbHNvIHRyZWF0IGFzIERWSSBjYXNlCmZvciB0aGUgb3RoZXIgcG9ydC4K
CltIb3ddOgpBY2NvcmRpbmcgRFAgMS40IHNwZWMsIGFkZCBEUCsrIHByb2NlZHVyZSBzaW1pbGFy
IHdpdGggSERNSSBjYXNlLiBBbHNvCmFkZCBOb25lIGRvbmdsZSB0eXBlIGZvciBEUCBjYXNlLgoK
Q2hhbmdlLUlkOiBJMTVjMDIyNTYzMjZkMzE5YmE2NmMxYmJhNDRkOGU2NjkzNTNhZmFjZQpTaWdu
ZWQtb2ZmLWJ5OiBEYWxlIFpoYW8gPGRhbGUuemhhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogV2Vu
amluZyBMaXUgPHdlbmppbmcubGl1QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtf
ZHAuYyAgfCAzMCArKysrKysrKysrKystLS0tLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9p
bmNsdWRlL2RwY2RfZGVmcy5oICAgfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY29yZS9kY19saW5rX2RwLmMKaW5kZXggYjUxMmZlY2FlMDYxLi4wOGJkOWM5NmI5YjAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtf
ZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2Rw
LmMKQEAgLTIzOTgsOCArMjM5OCw4IEBAIHN0YXRpYyB2b2lkIGdldF9hY3RpdmVfY29udmVydGVy
X2luZm8oCiAJY2FzZSBET1dOU1RSRUFNX1ZHQToKIAkJbGluay0+ZHBjZF9jYXBzLmRvbmdsZV90
eXBlID0gRElTUExBWV9ET05HTEVfRFBfVkdBX0NPTlZFUlRFUjsKIAkJYnJlYWs7Ci0JY2FzZSBE
T1dOU1RSRUFNX0RWSV9IRE1JOgotCQkvKiBBdCB0aGlzIHBvaW50IHdlIGRvbid0IGtub3cgaXMg
aXQgRFZJIG9yIEhETUksCisJY2FzZSBET1dOU1RSRUFNX0RWSV9IRE1JX0RQX1BMVVNfUExVUzoK
KwkJLyogQXQgdGhpcyBwb2ludCB3ZSBkb24ndCBrbm93IGlzIGl0IERWSSBvciBIRE1JIG9yIERQ
KyssCiAJCSAqIGFzc3VtZSBEVkkuKi8KIAkJbGluay0+ZHBjZF9jYXBzLmRvbmdsZV90eXBlID0g
RElTUExBWV9ET05HTEVfRFBfRFZJX0NPTlZFUlRFUjsKIAkJYnJlYWs7CkBAIC0yNDE2LDYgKzI0
MTYsMTAgQEAgc3RhdGljIHZvaWQgZ2V0X2FjdGl2ZV9jb252ZXJ0ZXJfaW5mbygKIAkJCQlkZXRf
Y2Fwcywgc2l6ZW9mKGRldF9jYXBzKSk7CiAKIAkJc3dpdGNoIChwb3J0X2NhcHMtPmJpdHMuRFdO
X1NUUk1fUE9SVFhfVFlQRSkgeworCQkvKkhhbmRsZSBEUCBjYXNlIGFzIERPTkdMRV9OT05FKi8K
KwkJY2FzZSBET1dOX1NUUkVBTV9ERVRBSUxFRF9EUDoKKwkJCWxpbmstPmRwY2RfY2Fwcy5kb25n
bGVfdHlwZSA9IERJU1BMQVlfRE9OR0xFX05PTkU7CisJCQlicmVhazsKIAkJY2FzZSBET1dOX1NU
UkVBTV9ERVRBSUxFRF9WR0E6CiAJCQlsaW5rLT5kcGNkX2NhcHMuZG9uZ2xlX3R5cGUgPQogCQkJ
CURJU1BMQVlfRE9OR0xFX0RQX1ZHQV9DT05WRVJURVI7CkBAIC0yNDI1LDYgKzI0MjksOCBAQCBz
dGF0aWMgdm9pZCBnZXRfYWN0aXZlX2NvbnZlcnRlcl9pbmZvKAogCQkJCURJU1BMQVlfRE9OR0xF
X0RQX0RWSV9DT05WRVJURVI7CiAJCQlicmVhazsKIAkJY2FzZSBET1dOX1NUUkVBTV9ERVRBSUxF
RF9IRE1JOgorCQljYXNlIERPV05fU1RSRUFNX0RFVEFJTEVEX0RQX1BMVVNfUExVUzoKKwkJCS8q
SGFuZGxlIERQKysgYWN0aXZlIGNvbnZlcnRlciBjYXNlLCBwcm9jZXNzIERQKysgY2FzZSBhcyBI
RE1JIGNhc2UgYWNjb3JkaW5nIERQMS40IHNwZWMqLwogCQkJbGluay0+ZHBjZF9jYXBzLmRvbmds
ZV90eXBlID0KIAkJCQlESVNQTEFZX0RPTkdMRV9EUF9IRE1JX0NPTlZFUlRFUjsKIApAQCAtMjQ0
MCwxNCArMjQ0NiwxOCBAQCBzdGF0aWMgdm9pZCBnZXRfYWN0aXZlX2NvbnZlcnRlcl9pbmZvKAog
CiAJCQkJbGluay0+ZHBjZF9jYXBzLmRvbmdsZV9jYXBzLmlzX2RwX2hkbWlfczNkX2NvbnZlcnRl
ciA9CiAJCQkJCWhkbWlfY2Fwcy5iaXRzLkZSQU1FX1NFUV9UT19GUkFNRV9QQUNLOwotCQkJCWxp
bmstPmRwY2RfY2Fwcy5kb25nbGVfY2Fwcy5pc19kcF9oZG1pX3ljYmNyNDIyX3Bhc3NfdGhyb3Vn
aCA9Ci0JCQkJCWhkbWlfY2Fwcy5iaXRzLllDckNyNDIyX1BBU1NfVEhST1VHSDsKLQkJCQlsaW5r
LT5kcGNkX2NhcHMuZG9uZ2xlX2NhcHMuaXNfZHBfaGRtaV95Y2JjcjQyMF9wYXNzX3Rocm91Z2gg
PQotCQkJCQloZG1pX2NhcHMuYml0cy5ZQ3JDcjQyMF9QQVNTX1RIUk9VR0g7Ci0JCQkJbGluay0+
ZHBjZF9jYXBzLmRvbmdsZV9jYXBzLmlzX2RwX2hkbWlfeWNiY3I0MjJfY29udmVydGVyID0KLQkJ
CQkJaGRtaV9jYXBzLmJpdHMuWUNyQ3I0MjJfQ09OVkVSU0lPTjsKLQkJCQlsaW5rLT5kcGNkX2Nh
cHMuZG9uZ2xlX2NhcHMuaXNfZHBfaGRtaV95Y2JjcjQyMF9jb252ZXJ0ZXIgPQotCQkJCQloZG1p
X2NhcHMuYml0cy5ZQ3JDcjQyMF9DT05WRVJTSU9OOworCQkJCS8qWUNCQ1IgY2FwYWJpbGl0eSBv
bmx5IGZvciBIRE1JIGNhc2UqLworCQkJCWlmIChwb3J0X2NhcHMtPmJpdHMuRFdOX1NUUk1fUE9S
VFhfVFlQRQorCQkJCQkJPT0gRE9XTl9TVFJFQU1fREVUQUlMRURfSERNSSkgeworCQkJCQlsaW5r
LT5kcGNkX2NhcHMuZG9uZ2xlX2NhcHMuaXNfZHBfaGRtaV95Y2JjcjQyMl9wYXNzX3Rocm91Z2gg
PQorCQkJCQkJCWhkbWlfY2Fwcy5iaXRzLllDckNyNDIyX1BBU1NfVEhST1VHSDsKKwkJCQkJbGlu
ay0+ZHBjZF9jYXBzLmRvbmdsZV9jYXBzLmlzX2RwX2hkbWlfeWNiY3I0MjBfcGFzc190aHJvdWdo
ID0KKwkJCQkJCQloZG1pX2NhcHMuYml0cy5ZQ3JDcjQyMF9QQVNTX1RIUk9VR0g7CisJCQkJCWxp
bmstPmRwY2RfY2Fwcy5kb25nbGVfY2Fwcy5pc19kcF9oZG1pX3ljYmNyNDIyX2NvbnZlcnRlciA9
CisJCQkJCQkJaGRtaV9jYXBzLmJpdHMuWUNyQ3I0MjJfQ09OVkVSU0lPTjsKKwkJCQkJbGluay0+
ZHBjZF9jYXBzLmRvbmdsZV9jYXBzLmlzX2RwX2hkbWlfeWNiY3I0MjBfY29udmVydGVyID0KKwkJ
CQkJCQloZG1pX2NhcHMuYml0cy5ZQ3JDcjQyMF9DT05WRVJTSU9OOworCQkJCX0KIAogCQkJCWxp
bmstPmRwY2RfY2Fwcy5kb25nbGVfY2Fwcy5kcF9oZG1pX21heF9icGMgPQogCQkJCQl0cmFuc2xh
dGVfZHBjZF9tYXhfYnBjKApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2luY2x1ZGUvZHBjZF9kZWZzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVk
ZS9kcGNkX2RlZnMuaAppbmRleCAxYzY2MTY2ZDBhOTQuLjJjOTBkMWI0NmM4YiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZHBjZF9kZWZzLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZHBjZF9kZWZzLmgKQEAgLTQzLDcg
KzQzLDcgQEAgZW51bSBkcGNkX3JldmlzaW9uIHsKIGVudW0gZHBjZF9kb3duc3RyZWFtX3BvcnRf
dHlwZSB7CiAJRE9XTlNUUkVBTV9EUCA9IDAsCiAJRE9XTlNUUkVBTV9WR0EsCi0JRE9XTlNUUkVB
TV9EVklfSERNSSwKKwlET1dOU1RSRUFNX0RWSV9IRE1JX0RQX1BMVVNfUExVUywvKiBEVkksIEhE
TUksIERQKysgKi8KIAlET1dOU1RSRUFNX05PTkREQyAvKiBoYXMgbm8gRURJRCAoVFYsQ1YpICov
CiB9OwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
