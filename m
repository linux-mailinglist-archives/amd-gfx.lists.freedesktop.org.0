Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2C37F06
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2222989852;
	Thu,  6 Jun 2019 20:55:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710066.outbound.protection.outlook.com [40.107.71.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA78C89852
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:16 +0000 (UTC)
Received: from CY4PR12CA0041.namprd12.prod.outlook.com (2603:10b6:903:129::27)
 by MWHPR1201MB0063.namprd12.prod.outlook.com (2603:10b6:301:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 20:55:15 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by CY4PR12CA0041.outlook.office365.com
 (2603:10b6:903:129::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:14 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:04 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/24] drm/amd/display: add some math functions for
 dcn_calc_math
Date: Thu, 6 Jun 2019 16:54:41 -0400
Message-ID: <20190606205501.16505-5-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(356004)(68736007)(77096007)(26005)(426003)(6666004)(50226002)(5660300002)(186003)(316002)(86362001)(4326008)(1076003)(70206006)(336012)(70586007)(16586007)(2351001)(47776003)(126002)(48376002)(36756003)(7696005)(81166006)(81156014)(53936002)(8936002)(8676002)(478600001)(486006)(6916009)(2906002)(51416003)(476003)(11346002)(76176011)(305945005)(53416004)(50466002)(2616005)(446003)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0063; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af237fa0-d795-4fa7-daa1-08d6eac14652
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0063; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0063:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB006348F660DB65E0451357DBF9170@MWHPR1201MB0063.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:72;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y/v1LnTDq6ei/peqSbmS5zdxHQzSc9wRhy2gcVPhmauwK6g2qVkbsc7XRSvmVP71ZAyUmjw9LpRN4s7YwKnNvSSRD232nXHshLdRzFZ64kKppvCc2C683hmCWojO/7skHuqJNxg0QZWb979BLpAE46NzgKSsQl/zGRK01jJPsQLDTEt7i8BQlP5pz5Poj3zwBVAFAXw5HaZM9yBxn/jCMgJEWYJkYFv8V/0HDo8QQd5t+CSVOnSeMeuq7jHt7oIDXCaZdQ/swhskvvJjbBAem3hf0GH7BOh1r8FTFAjFEn4UPujeDKBN0t+OlPg3pNOD7mV5vX+tVQb8lD+b4PgCMywVVbrr8rHzRkbd3JfY4+tUXK/Tun+FKRho/mq0gMu+3heD4z4hotD7OhXTVxakQjLP4sNyLFq/ND8RD/0pdDg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:14.7575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af237fa0-d795-4fa7-daa1-08d6eac14652
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0063
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7MWIiq2J6v6frkjfZ+ifV8Yz9v9M76fHVJcXHEqxms=;
 b=eg1RERelgZU4MD225W6pSJKJUiyzhigQzguHwzzijjcM4wEIXPpKZpJX+UU93Fc2jRF2QNolU1GlETpzVk9ANqMB8hQkNjJJ1/KVIAl7kW7uHanJvYIzT+9IstYk4QrhnceZ8NM9xetORgwuTDKAgx6bjV/RAfqNaFqaDqmSxX8=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCkltcGxlbWVudCBmbG9v
ciwgY2VpbCwgYW5kIGZhYnMKClNpZ25lZC1vZmYtYnk6IENoYXJsZW5lIExpdSA8Y2hhcmxlbmUu
bGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQu
Y29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+Ci0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY19tYXRoLmMgIHwg
MjAgKysrKysrKysrKysrKysrKysrKwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25f
Y2FsY19tYXRoLmggIHwgIDMgKysrCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kbWxfaW5s
aW5lX2RlZnMuaCAgfCAgOCArKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rj
bl9jYWxjX21hdGguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25f
Y2FsY19tYXRoLmMKaW5kZXggNzYwMGE0YTRhYmM3Li4wN2QxOGU3OGRlNDkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY19tYXRoLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjX21hdGguYwpA
QCAtNzMsNiArNzMsMTcgQEAgZmxvYXQgZGNuX2J3X2Zsb29yMihjb25zdCBmbG9hdCBhcmcsIGNv
bnN0IGZsb2F0IHNpZ25pZmljYW5jZSkKIAkJcmV0dXJuIDA7CiAJcmV0dXJuICgoaW50KSAoYXJn
IC8gc2lnbmlmaWNhbmNlKSkgKiBzaWduaWZpY2FuY2U7CiB9CitmbG9hdCBkY25fYndfZmxvb3Io
Y29uc3QgZmxvYXQgYXJnKQoreworCXJldHVybiAoKGludCkgKGFyZykpOworfQorCitmbG9hdCBk
Y25fYndfY2VpbChjb25zdCBmbG9hdCBhcmcpCit7CisJZmxvYXQgZmxyID0gZGNuX2J3X2Zsb29y
MihhcmcsIDEpOworCisJcmV0dXJuIGZsciArIDAuMDAwMDEgPj0gYXJnID8gYXJnIDogZmxyICsg
MTsKK30KIAogZmxvYXQgZGNuX2J3X2NlaWwyKGNvbnN0IGZsb2F0IGFyZywgY29uc3QgZmxvYXQg
c2lnbmlmaWNhbmNlKQogewpAQCAtMTA5LDYgKzEyMCwxNSBAQCBmbG9hdCBkY25fYndfcG93KGZs
b2F0IGEsIGZsb2F0IGV4cCkKIAl9CiB9CiAKK2RvdWJsZSBkY25fYndfZmFicyhkb3VibGUgYSkK
K3sKKwlpZiAoYSA+IDApCisJCXJldHVybiAoYSk7CisJZWxzZQorCQlyZXR1cm4gKC1hKTsKK30K
KworCiBmbG9hdCBkY25fYndfbG9nKGZsb2F0IGEsIGZsb2F0IGIpCiB7CiAJaW50ICogY29uc3Qg
ZXhwX3B0ciA9IChpbnQgKikoJmEpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjX21hdGguaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jYWxjcy9kY25fY2FsY19tYXRoLmgKaW5kZXggZjQ2YWIwZTI0Y2ExLi40NWEwN2Vl
ZmZiYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9k
Y25fY2FsY19tYXRoLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNz
L2Rjbl9jYWxjX21hdGguaApAQCAtMzEsMTAgKzMxLDEzIEBAIGZsb2F0IGRjbl9id19taW4yKGNv
bnN0IGZsb2F0IGFyZzEsIGNvbnN0IGZsb2F0IGFyZzIpOwogdW5zaWduZWQgaW50IGRjbl9id19t
YXgoY29uc3QgdW5zaWduZWQgaW50IGFyZzEsIGNvbnN0IHVuc2lnbmVkIGludCBhcmcyKTsKIGZs
b2F0IGRjbl9id19tYXgyKGNvbnN0IGZsb2F0IGFyZzEsIGNvbnN0IGZsb2F0IGFyZzIpOwogZmxv
YXQgZGNuX2J3X2Zsb29yMihjb25zdCBmbG9hdCBhcmcsIGNvbnN0IGZsb2F0IHNpZ25pZmljYW5j
ZSk7CitmbG9hdCBkY25fYndfZmxvb3IoY29uc3QgZmxvYXQgYXJnKTsKIGZsb2F0IGRjbl9id19j
ZWlsMihjb25zdCBmbG9hdCBhcmcsIGNvbnN0IGZsb2F0IHNpZ25pZmljYW5jZSk7CitmbG9hdCBk
Y25fYndfY2VpbChjb25zdCBmbG9hdCBhcmcpOwogZmxvYXQgZGNuX2J3X21heDMoZmxvYXQgdjEs
IGZsb2F0IHYyLCBmbG9hdCB2Myk7CiBmbG9hdCBkY25fYndfbWF4NShmbG9hdCB2MSwgZmxvYXQg
djIsIGZsb2F0IHYzLCBmbG9hdCB2NCwgZmxvYXQgdjUpOwogZmxvYXQgZGNuX2J3X3BvdyhmbG9h
dCBhLCBmbG9hdCBleHApOwogZmxvYXQgZGNuX2J3X2xvZyhmbG9hdCBhLCBmbG9hdCBiKTsKK2Rv
dWJsZSBkY25fYndfZmFicyhkb3VibGUgYSk7CiAKICNlbmRpZiAvKiBfRENOX0NBTENfTUFUSF9I
XyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kbWxf
aW5saW5lX2RlZnMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZG1sX2lu
bGluZV9kZWZzLmgKaW5kZXggZThjZTA4NTY3Y2Q4Li5lY2ExNDBkYTEzZDggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZG1sX2lubGluZV9kZWZzLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kbWxfaW5saW5lX2RlZnMuaApA
QCAtMTI5LDQgKzEyOSwxMiBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBkbWxfcm91bmRf
dG9fbXVsdGlwbGUodW5zaWduZWQgaW50IG51bSwKIAllbHNlCiAJCXJldHVybiAobnVtIC0gcmVt
YWluZGVyKTsKIH0KK3N0YXRpYyBpbmxpbmUgZG91YmxlIGRtbF9hYnMoZG91YmxlIGEpCit7CisJ
aWYgKGEgPiAwKQorCQlyZXR1cm4gYTsKKwllbHNlCisJCXJldHVybiAoYSooLTEpKTsKK30KKwog
I2VuZGlmCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
